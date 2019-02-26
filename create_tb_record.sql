create   table  tb_record                    --����������¼��
   ( 
    rid  int   primary key  identity(1,1),    --����id����������
    pid     int   not  null,                  --��Աid  
	mid  int  not null     ,                  --ƥ���¼id  
    result      char(2) not null ,            --�������,ʤ��
	achievement   int  ,                      -- �˳�����
    total_achievement   int   ,               --������
    shooting_percentage   numeric(10,2),      --Ͷ��������
    shooting 	  int,                        --Ͷ������
    shoot_number	int,                      -- Ͷ������
    three_point_percentage	 numeric(10,2),   --��������
    three_point_hits	 int ,                --��������
    three_point_number  int,                  --���ֳ���
    free_throw_percentage	numeric(10,2),    --����������	
    penalty_shot_hit   int,                   --��������
    penalty_shot_number	   int,               --��������  
    backboard	    int,                      --����  	
    front_court_rebound int,                  -- ����ǰ��
    defensive_rebounds int,                   -- �����
    assists 	 int,                         --����
    steal  	 int,                             --����
    block_shots	 int,                         -- ��ñ
    fault int,                                --ʧ��
    foul int,                                 --����
    score  int,                               --�÷�
    time    datetime DEFAULT (GETDATE())  ,   -- ����ʱ�䣬Ĭ��ʱ��Ϊ��ǰʱ��    
    foreign  key( mid ) references tb_match( mid ),  --ƥ���¼id  ������
    foreign  key( pid )references tb_player(pid)     --��Աid ������

   )