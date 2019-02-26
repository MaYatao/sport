create   table  tb_player      --创建球员信息总表
   ( 
    pid  int   primary key  identity(1,1),   --球员id ，主键自增
    pname   varchar(50)     not null,        --球员姓名
    height    int,                           --身高
    weight   int,                            --体重
    age   int,                               --年龄
    role   varchar(10),                      --位置
    scene      int   ,                       --比赛场次
    win       int,                           --胜场
    fail     int,                            --负场
    achievement   int ,                      --评分
    shooting_percentage   numeric(10,2),     --投篮命中率 ，numeric(10,2)结果保留两位小数
    shooting 	  numeric(10,2),             --投篮命中
    shoot_number	 numeric(10,2),          -- 投篮出手
    three_point_percentage	 numeric(10,2),  --三分命中率
    three_point_hits	 numeric(10,2),      --三分命中
    three_point_number  numeric(10,2),       --三分出手
    free_throw_percentage	 numeric(10,2),  --罚球命中率	
    penalty_shot_hit   numeric(10,2),        --罚球命中
    penalty_shot_number	   numeric(10,2),    --罚球命中  
    backboard	    numeric(10,2),           --篮板
    front_court_rebound numeric(10,2),       -- 篮板前场
    defensive_rebounds numeric(10,2),        -- 篮板后场
    assists 	 numeric(10,2),              --助攻
    steal  	 numeric(10,2),                  --抢断
    block_shots	numeric(10,2),               -- 盖帽
    fault numeric(10,2),                     --失误
    foul numeric(10,2),                      --犯规
    average_score numeric(10,2)              --平均得分
   )