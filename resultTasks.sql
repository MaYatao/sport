CREATE PROCEDURE  resultTasks @Pid int ,@Mid int ,@result  char(2)  ,   @shooting  float ,@shoot_number float,  
 @three_point_hits  float   ,@three_point_number float          ,@penalty_shot_hit float  
   ,@penalty_shot_number float  ,@front_court_rebound float  		  ,@defensive_rebounds float,@assists float,@steal float
   ,@block_shots float,@fault float,@foul float,@score float      AS
DECLARE  @achievement  int
DECLARE  @total_achievement int
DECLARE  @shooting_percentage  float
DECLARE  @three_point_percentage float
DECLARE  @free_throw_percentage float
DECLARE   @backboard float
DECLARE   @a_achievement  int
DECLARE   @b_achievement  int
DECLARE   @scene  int
DECLARE   @Ea float
DECLARE   @Eb  float
DECLARE   @efficiency  float
  set @shooting_percentage= @shooting/@shoot_number
  set @backboard=@front_court_rebound+@defensive_rebounds
  set  @free_throw_percentage=@penalty_shot_hit/@three_point_number
  set  @three_point_percentage=@three_point_hits/@three_point_number
  select  @total_achievement  = achievement from  tb_player  where  pid  =@Pid
  set  @scene =1
  set @efficiency=(@score + @assists+@backboard+@steal+@block_shots-@shoot_number+@shooting-@fault) /@scene
     if  @efficiency>=20
         if  @result ='Ê¤'
	       set   @achievement=25 +5	  
         if  @result ='¸º'
	       set  @achievement=5-25
    else  if  @efficiency<20
        if  @result ='Ê¤'
		 print 'a2'
	       set   @achievement=25 
        if  @result ='¸º'
	       set  @achievement=5-25

		set    @total_achievement  =@total_achievement+@achievement
 INSERT INTO tb_record(pid  ,result  ,achievement  ,total_achievement   ,shooting_percentage  ,shooting  ,shoot_number  ,three_point_percentage
           ,three_point_hits ,three_point_number  ,free_throw_percentage ,penalty_shot_hit ,penalty_shot_number ,backboard
           ,front_court_rebound ,defensive_rebounds ,assists ,steal ,block_shots ,fault,foul ,score  ,mid)
     VALUES  (@pid ,@result ,@achievement  ,@total_achievement ,@shooting_percentage ,@shooting ,@shoot_number,@three_point_percentage
           ,@three_point_hits  ,@three_point_number ,@free_throw_percentage ,@penalty_shot_hit ,@penalty_shot_number
           ,@backboard   ,@front_court_rebound ,@defensive_rebounds ,@assists ,@steal ,@block_shots  ,@fault  ,@foul
           ,@score    ,@mid)


		 
 


 