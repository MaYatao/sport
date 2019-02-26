create   table  tb_player      --������Ա��Ϣ�ܱ�
   ( 
    pid  int   primary key  identity(1,1),   --��Աid ����������
    pname   varchar(50)     not null,        --��Ա����
    height    int,                           --���
    weight   int,                            --����
    age   int,                               --����
    role   varchar(10),                      --λ��
    scene      int   ,                       --��������
    win       int,                           --ʤ��
    fail     int,                            --����
    achievement   int ,                      --����
    shooting_percentage   numeric(10,2),     --Ͷ�������� ��numeric(10,2)���������λС��
    shooting 	  numeric(10,2),             --Ͷ������
    shoot_number	 numeric(10,2),          -- Ͷ������
    three_point_percentage	 numeric(10,2),  --����������
    three_point_hits	 numeric(10,2),      --��������
    three_point_number  numeric(10,2),       --���ֳ���
    free_throw_percentage	 numeric(10,2),  --����������	
    penalty_shot_hit   numeric(10,2),        --��������
    penalty_shot_number	   numeric(10,2),    --��������  
    backboard	    numeric(10,2),           --����
    front_court_rebound numeric(10,2),       -- ����ǰ��
    defensive_rebounds numeric(10,2),        -- �����
    assists 	 numeric(10,2),              --����
    steal  	 numeric(10,2),                  --����
    block_shots	numeric(10,2),               -- ��ñ
    fault numeric(10,2),                     --ʧ��
    foul numeric(10,2),                      --����
    average_score numeric(10,2)              --ƽ���÷�
   )