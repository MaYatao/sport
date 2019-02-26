create trigger   recordInsert����on   tb_record   after insert   as    --����������������ܻ���
DECLARE   @Pid int                       --��Աid
DECLARE   @result  char(2)               -- �������
DECLARE   @shooting  float               --Ͷ������
DECLARE   @shoot_number float            --Ͷ����
DECLARE   @three_point_hits  float       --����������
DECLARE   @three_point_number float      --���ֳ�����
DECLARE   @penalty_shot_hit float        --����������
DECLARE   @penalty_shot_number float     --���������
DECLARE   @front_court_rebound float     --ǰ����
DECLARE   @defensive_rebounds float      --������
DECLARE   @assists float                 --����
DECLARE   @steal float                   --����
DECLARE   @block_shots float             --��ñ
DECLARE   @fault float                   --ʧ����
DECLARE   @foul float                    --������
DECLARE   @score float                   --�÷�
DECLARE   @achievement   int            --������
DECLARE  @scene  int                    --�ܳ���
DECLARE  @win int                         --ʤ��
DECLARE  @fail  float                       --����
DECLARE  @free_throw_percentage float       --ƽ������������	
DECLARE  @average_penalty_shot_hit  float    --ƽ����������
DECLARE  @average_penalty_shot_number float  --ƽ����������  
DECLARE  @shooting_percentage    float       --ƽ��Ͷ��������
DECLARE  @average_shooting   float           --ƽ��Ͷ������
DECLARE  @average_shoot_number  float        -- ƽ��Ͷ������
DECLARE  @three_point_percentage float       --����������
DECLARE  @average_three_point_hits float     --ƽ����������
DECLARE  @average_three_point_number float   --ƽ�����ֳ���
DECLARE  @backboard float                    --ƽ������
DECLARE  @average_front_court_rebound   float -- ����ǰ��
DECLARE  @average_defensive_rebounds float  -- �����
DECLARE  @average_assists  float            --ƽ������
DECLARE  @average_steal  float              --ƽ������
DECLARE  @average_block_shots  float        --ƽ����ñ
DECLARE  @average_fault float               --ƽ��ʧ��
DECLARE  @average_foul  float               --ƽ������
DECLARE  @average_score  float              --ƽ���÷�

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
    if  @result ='ʤ'
      set  @win=@win+1
   if  @result ='��'
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

