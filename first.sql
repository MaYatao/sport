CREATE PROCEDURE  checkTasks @Pid int    --������Ա����ָ��
 AS 
DECLARE @Ͷ��ָ�� int
DECLARE @����ָ��  int
DECLARE @����ָ�� int
DECLARE @����ָ�� int
DECLARE @����ָ�� int
DECLARE @���� int
DECLARE @��ñ int
DECLARE @c int      --�з�ָ��
DECLARE @sf int     --  Сǰ��ָ��
DECLARE @sg  int    --�÷ֺ���ָ��
DECLARE @pg int     --�������ָ��
DECLARE @pf  int    --��ǰ��ָ��
	if  (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid) <0.4
     set @Ͷ��ָ��=1
   if  0.4<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)  and (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)< 0.449
     set @Ͷ��ָ��=2
   if  0.449<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)< 0.469
     set @Ͷ��ָ��=3
   if 0.469<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)< 0.5
     set @Ͷ��ָ��=4
   if 0.5<(SELECT  shooting_percentage  FROM tb_player  where  pid=@Pid)
     set @Ͷ��ָ��=5

   if  (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid) <0.15
     set @����ָ��=1
   if  0.15< (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid ) and  (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid ) <0.206
     set @����ָ��=2
   if  0.206<(SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid)and (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid) <0.226
     set @����ָ��=3
   if 0.226<(SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid)<0.30
     set @����ָ��=4
   if 0.30<(SELECT  three_point_percentage  FROM tb_player  where  pid=@Pid)
     set @����ָ��=5
	  
	  if  (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid) <0.6
       set @����ָ��=1
   if  0.6<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid) and (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)< 0.75
     set @����ָ��=2
   if  0.75<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)  and (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)< 0.78
     set @����ָ��=3
   if 0.78<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)  and (SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)<0.82
     set @����ָ��=4
   if 0.82<(SELECT  free_throw_percentage  FROM tb_player  where  pid=@Pid)
     set @����ָ��=5

	  if  (SELECT  assists  FROM  tb_player  where  pid=@Pid) <1
     set @����ָ��=1
   if  1<(SELECT  assists  FROM tb_player  where  pid=@Pid)  and (SELECT  assists  FROM tb_player  where  pid=@Pid)<1.5
     set @����ָ��=2
   if  1.5<(SELECT  assists FROM tb_player  where  pid=@Pid) and (SELECT  assists  FROM tb_player  where  pid=@Pid)<1.8
     set @����ָ��=3
   if 1.8<(SELECT  assists  FROM tb_player  where  pid=@Pid) and (SELECT  assists  FROM tb_player  where  pid=@Pid)<2.5
     set @����ָ��=4
   if 2.5<(SELECT  assists FROM tb_player  where  pid=@Pid)
     set @����ָ��=5

	  if  (SELECT  backboard FROM tb_player  where  pid=@Pid) <1.5
     set  @����ָ��=1
   if  1.5<(SELECT  backboard  FROM tb_player  where  pid=@Pid) and (SELECT  backboard  FROM tb_player  where  pid=@Pid)<3
     set  @����ָ��=2
   if  3<(SELECT  backboard  FROM tb_player  where  pid=@Pid) and (SELECT  backboard  FROM tb_player  where  pid=@Pid)<3.5
     set  @����ָ��=3
   if 3.5<(SELECT  backboard  FROM tb_player  where  pid=@Pid) and (SELECT  backboard  FROM tb_player  where  pid=@Pid)<4.8
     set  @����ָ��=4
   if 4.8<(SELECT  backboard  FROM tb_player  where  pid=@Pid)
     set  @����ָ��=5

	  if  (SELECT  steal  FROM tb_player  where  pid=@Pid) < 0.3
        set @����=1
      if  0.3<(SELECT  steal  FROM tb_player  where  pid=@Pid) and (SELECT  steal  FROM tb_player  where  pid=@Pid)< 0.5
        set @����=2
   if  0.5<(SELECT  steal FROM tb_player  where  pid=@Pid) and (SELECT  steal  FROM tb_player  where  pid=@Pid)< 0.7
     set @����=3
   if 0.7<(SELECT  steal FROM tb_player  where  pid=@Pid) and (SELECT  steal  FROM tb_player  where  pid=@Pid) < 1
     set @����=4
   if 1<(SELECT  steal  FROM tb_player  where  pid=@Pid)
     set @����=5
	 
	  if  (SELECT  block_shots  FROM tb_player  where  pid=@Pid)< 0.2
     set @��ñ=1
   if  0.2<(SELECT  block_shots FROM tb_player  where  pid=@Pid) and (SELECT  block_shots  FROM tb_player  where  pid=@Pid)< 0.4
     set @��ñ=2
   if  0.4<(SELECT  block_shots  FROM tb_player  where  pid=@Pid) and (SELECT  block_shots  FROM tb_player  where  pid=@Pid) < 0.6
     set @��ñ=3
   if 0.6<(SELECT  block_shots  FROM tb_player  where  pid=@Pid) and (SELECT  block_shots  FROM tb_player  where  pid=@Pid)< 1
     set @��ñ=4
   if 1<(SELECT  block_shots  FROM tb_player  where  pid=@Pid)
     set @��ñ=5
  
   set @c = @Ͷ��ָ��*1+ @����ָ��*1+ @����ָ��*1+@����ָ��*5+ @����ָ��*1 + @����*1 +@��ñ* 5
  set @sf  = @Ͷ��ָ��*4+ @����ָ��*4+ @����ָ��*3+@����ָ��*3+ @����ָ��*3 + @����*5+ @��ñ* 3
  set @pf = @Ͷ��ָ��*2+ @����ָ��*2+ @����ָ��*2+@����ָ��*4+ @����ָ��*2 + @����*2 +@��ñ* 4

  set @sg  = @Ͷ��ָ��*5+ @����ָ��*5+ @����ָ��*5+@����ָ��*2+ @����ָ��*4 + @����*3+ @��ñ* 2
  set @pg = @Ͷ��ָ��*3+ @����ָ��*3+ @����ָ��*4+@����ָ��*1+ @����ָ��*5 + @����*4 +@��ñ* 1

  if (select count(*)  from    position   where  pid=@Pid) =1
    update   position  set c=@c,  sf=@sf  ,sg=@sg, pg=@pg,pf=@pg   where pid=@Pid
   else  
      insert  into  position (c,sf,sg,pg,pf,pid)  values(@c,@sf,@sg,@pg,@pf,@Pid) 
 



 


