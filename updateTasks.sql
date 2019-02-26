create trigger   recordInsert　　on   tb_record   after insert   as    --比赛结果插入后更新总积分
DECLARE   @Pid int                       --球员id
DECLARE   @result  char(2)               -- 比赛结果
DECLARE   @shooting  float               --投篮命中
DECLARE   @shoot_number float            --投篮数
DECLARE   @three_point_hits  float       --三分命中数
DECLARE   @three_point_number float      --三分出手数
DECLARE   @penalty_shot_hit float        --罚球命中数
DECLARE   @penalty_shot_number float     --罚球出手数
DECLARE   @front_court_rebound float     --前篮板
DECLARE   @defensive_rebounds float      --后篮板
DECLARE   @assists float                 --助攻
DECLARE   @steal float                   --抢断
DECLARE   @block_shots float             --盖帽
DECLARE   @fault float                   --失误数
DECLARE   @foul float                    --犯规数
DECLARE   @score float                   --得分
DECLARE   @achievement   int            --总评分
DECLARE  @scene  int                    --总场数
DECLARE  @win int                         --胜场
DECLARE  @fail  float                       --负场
DECLARE  @free_throw_percentage float       --平均罚球命中率	
DECLARE  @average_penalty_shot_hit  float    --平均罚球命中
DECLARE  @average_penalty_shot_number float  --平均罚球命中  
DECLARE  @shooting_percentage    float       --平均投篮命中率
DECLARE  @average_shooting   float           --平均投篮命中
DECLARE  @average_shoot_number  float        -- 平均投篮出手
DECLARE  @three_point_percentage float       --三分命中率
DECLARE  @average_three_point_hits float     --平均三分命中
DECLARE  @average_three_point_number float   --平均三分出手
DECLARE  @backboard float                    --平均篮板
DECLARE  @average_front_court_rebound   float -- 篮板前场
DECLARE  @average_defensive_rebounds float  -- 篮板后场
DECLARE  @average_assists  float            --平均助攻
DECLARE  @average_steal  float              --平均抢断
DECLARE  @average_block_shots  float        --平均盖帽
DECLARE  @average_fault float               --平均失误
DECLARE  @average_foul  float               --平均犯规
DECLARE  @average_score  float              --平均得分

select  @Pid = pid    from  inserted
select  @result = result   from  inserted
select  @shooting =shooting   from  inserted
select  @shoot_number = shoot_number    from  inserted
select  @three_point_hits = three_point_hits   from  inserted
select  @three_point_number = three_point_number    from  inserted
select  @front_court_rebound = front_court_rebound   from  inserted
select  @defensive_rebounds = defensive_rebounds    from  inserted
select  @penalty_shot_hit = penalty_shot_hit    from  inserted
select  @penalty_shot_number =penalty_shot_number    from  inserted
select  @assists = assists    from  inserted
select  @steal = steal    from  inserted
select  @block_shots = block_shots    from  inserted
select  @fault = fault    from  inserted
select  @foul = foul    from  inserted
select  @score = score   from  inserted
select  @achievement = total_achievement    from  inserted

select  @scene  = scene   from  tb_player  where  pid=@Pid
select  @win  = win   from  tb_player  where  pid=@Pid
select  @fail  = fail   from  tb_player  where  pid=@Pid
    if  @result ='胜'
      set  @win=@win+1
   if  @result ='负'
      set  @fail=@fail+1
   set  @average_penalty_shot_hit =  ((select   penalty_shot_hit  from  tb_player   where  pid=@Pid)*@scene+@penalty_shot_hit)/(@scene+1)
   set  @average_penalty_shot_number =  ((select  penalty_shot_number  from  tb_player where  pid=@Pid)*@scene+@penalty_shot_number)/(@scene+1)
   set  @average_shooting =  ((select   shooting  from  tb_player   where  pid=@Pid )*@scene+@shooting)/(@scene+1)
   set  @average_shoot_number =  ((select   shoot_number  from  tb_player   where  pid=@Pid)*@scene+@penalty_shot_number)/(@scene+1)
   set  @average_three_point_hits =  ((select   three_point_hits  from  tb_player   where  pid=@Pid)*@scene+@three_point_hits)/(@scene+1)
   set  @average_three_point_number =  ((select   three_point_number  from  tb_player   where  pid=@Pid)*@scene+@three_point_number)/(@scene+1)
   set  @average_front_court_rebound  =  ((select  front_court_rebound  from  tb_player   where  pid=@Pid)*@scene+@front_court_rebound)/(@scene+1)
   set  @average_defensive_rebounds =  ((select   defensive_rebounds from  tb_player   where  pid=@Pid)*@scene+@defensive_rebounds)/(@scene+1)
   set  @average_assists =  ((select   assists from  tb_player   where  pid=@Pid)*@scene+@assists)/(@scene+1)
   set  @average_steal=  ((select    steal  from  tb_player   where  pid=@Pid)*@scene+@steal)/(@scene+1)
   set  @average_fault =  ((select   fault from  tb_player   where  pid=@Pid)*@scene+@fault)/(@scene+1)		
   set  @average_foul =  ((select   foul from  tb_player   where  pid=@Pid )*@scene+@foul)/(@scene+1)
   set  @average_block_shots =  ((select   block_shots from  tb_player   where  pid=@Pid)*@scene+@block_shots)/(@scene+1)
   set  @average_score =  ((select   average_score from  tb_player where  pid=@Pid )*@scene+@score )/(@scene+1)

UPDATE  tb_player
   SET 
     scene= @scene,win =@win   ,fail = @fail ,achievement = @achievement   ,shooting_percentage = @shooting_percentage
      ,shooting = @average_shooting  ,shoot_number = @average_shoot_number  ,three_point_percentage = @three_point_percentage
      ,three_point_hits = @average_three_point_hits  ,three_point_number =  @average_three_point_number  ,free_throw_percentage = @free_throw_percentage
      ,penalty_shot_hit = @average_penalty_shot_hit,penalty_shot_number = @average_penalty_shot_number    ,backboard = @backboard
      ,front_court_rebound = @average_front_court_rebound ,defensive_rebounds = @average_defensive_rebounds
      ,assists = @average_assists  ,block_shots = @average_block_shots , steal = @average_steal   ,fault = @average_fault
      ,foul = @average_foul   ,average_score = @average_score
 WHERE    pid=@Pid

