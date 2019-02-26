CREATE PROCEDURE  checkTasks @Pid int    --计算球员各项指数
 AS 
DECLARE @投篮指数 int
DECLARE @三分指数  int
DECLARE @罚球指数 int
DECLARE @助攻指数 int
DECLARE @篮板指数 int
DECLARE @抢断 int
DECLARE @盖帽 int
DECLARE @c int      --中锋指数
DECLARE @sf int     --  小前锋指数
DECLARE @sg  int    --得分后卫指数
DECLARE @pg int     --控球后卫指数
DECLARE @pf  int    --大前锋指数
	if  (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid) <0.4
     set @投篮指数=1
   if  0.4<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)  and (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)< 0.449
     set @投篮指数=2
   if  0.449<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)< 0.469
     set @投篮指数=3
   if 0.469<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)< 0.5
     set @投篮指数=4
   if 0.5<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)
     set @投篮指数=5

   if  (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid) <0.15
     set @三分指数=1
   if  0.15< (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid ) and  (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid ) <0.206
     set @三分指数=2
   if  0.206<(SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid)and (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid) <0.226
     set @三分指数=3
   if 0.226<(SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid)<0.30
     set @三分指数=4
   if 0.30<(SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid)
     set @三分指数=5
	  
	  if  (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid) <0.6
       set @罚球指数=1
   if  0.6<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)< 0.75
     set @罚球指数=2
   if  0.75<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)  and (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)< 0.78
     set @罚球指数=3
   if 0.78<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)  and (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)<0.82
     set @罚球指数=4
   if 0.82<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)
     set @罚球指数=5

	  if  (SELECT  assists  FROM  tb_player  where  pid=@Pid) <1
     set @助攻指数=1
   if  1<(SELECT  assists  FROM tb_player  where  pid=@Pid)  and (SELECT  assists  FROM tb_player  where  pid=@Pid)<1.5
     set @助攻指数=2
   if  1.5<(SELECT  assists FROM tb_player  where  pid=@Pid) and (SELECT  assists  FROM tb_player  where  pid=@Pid)<1.8
     set @助攻指数=3
   if 1.8<(SELECT  assists  FROM tb_player  where  pid=@Pid) and (SELECT  assists  FROM tb_player  where  pid=@Pid)<2.5
     set @助攻指数=4
   if 2.5<(SELECT  assists FROM tb_player  where  pid=@Pid)
     set @助攻指数=5

	  if  (SELECT  backboard FROM tb_player  where  pid=@Pid) <1.5
     set  @篮板指数=1
   if  1.5<(SELECT  backboard  FROM tb_player  where  pid=@Pid) and (SELECT  backboard  FROM tb_player  where  pid=@Pid)<3
     set  @篮板指数=2
   if  3<(SELECT  backboard  FROM tb_player  where  pid=@Pid) and (SELECT  backboard  FROM tb_player  where  pid=@Pid)<3.5
     set  @篮板指数=3
   if 3.5<(SELECT  backboard  FROM tb_player  where  pid=@Pid) and (SELECT  backboard  FROM tb_player  where  pid=@Pid)<4.8
     set  @篮板指数=4
   if 4.8<(SELECT  backboard  FROM tb_player  where  pid=@Pid)
     set  @篮板指数=5

	  if  (SELECT  steal  FROM tb_player  where  pid=@Pid) < 0.3
        set @抢断=1
      if  0.3<(SELECT  steal  FROM tb_player  where  pid=@Pid) and (SELECT  steal  FROM tb_player  where  pid=@Pid)< 0.5
        set @抢断=2
   if  0.5<(SELECT  steal FROM tb_player  where  pid=@Pid) and (SELECT  steal  FROM tb_player  where  pid=@Pid)< 0.7
     set @抢断=3
   if 0.7<(SELECT  steal FROM tb_player  where  pid=@Pid) and (SELECT  steal  FROM tb_player  where  pid=@Pid) < 1
     set @抢断=4
   if 1<(SELECT  steal  FROM tb_player  where  pid=@Pid)
     set @抢断=5
	 
	  if  (SELECT  block_shots  FROM tb_player  where  pid=@Pid)< 0.2
     set @盖帽=1
   if  0.2<(SELECT  block_shots FROM tb_player  where  pid=@Pid) and (SELECT  block_shots  FROM tb_player  where  pid=@Pid)< 0.4
     set @盖帽=2
   if  0.4<(SELECT  block_shots  FROM tb_player  where  pid=@Pid) and (SELECT  block_shots  FROM tb_player  where  pid=@Pid) < 0.6
     set @盖帽=3
   if 0.6<(SELECT  block_shots  FROM tb_player  where  pid=@Pid) and (SELECT  block_shots  FROM tb_player  where  pid=@Pid)< 1
     set @盖帽=4
   if 1<(SELECT  block_shots  FROM tb_player  where  pid=@Pid)
     set @盖帽=5
  
   set @c = @投篮指数*1+ @三分指数*1+ @罚球指数*1+@篮板指数*5+ @助攻指数*1 + @抢断*1 +@盖帽* 5
  set @sf  = @投篮指数*4+ @三分指数*4+ @罚球指数*3+@篮板指数*3+ @助攻指数*3 + @抢断*5+ @盖帽* 3
  set @pf = @投篮指数*2+ @三分指数*2+ @罚球指数*2+@篮板指数*4+ @助攻指数*2 + @抢断*2 +@盖帽* 4

  set @sg  = @投篮指数*5+ @三分指数*5+ @罚球指数*5+@篮板指数*2+ @助攻指数*4 + @抢断*3+ @盖帽* 2
  set @pg = @投篮指数*3+ @三分指数*3+ @罚球指数*4+@篮板指数*1+ @助攻指数*5 + @抢断*4 +@盖帽* 1

  if (select count(*)  from    position   where  pid=@Pid) =1
    update   position  set c=@c,  sf=@sf  ,sg=@sg, pg=@pg,pf=@pg   where pid=@Pid
   else  
      insert  into  position (c,sf,sg,pg,pf,pid)  values(@c,@sf,@sg,@pg,@pf,@Pid) 
 



 


