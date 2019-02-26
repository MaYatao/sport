create   table  tb_record                    --创建比赛记录表
   ( 
    rid  int   primary key  identity(1,1),    --比赛id，主键自增
    pid     int   not  null,                  --球员id  
	mid  int  not null     ,                  --匹配记录id  
    result      char(2) not null ,            --比赛结果,胜或负
	achievement   int  ,                      -- 此场评分
    total_achievement   int   ,               --总评分
    shooting_percentage   numeric(10,2),      --投篮命中率
    shooting 	  int,                        --投篮命中
    shoot_number	int,                      -- 投篮出手
    three_point_percentage	 numeric(10,2),   --三分命中
    three_point_hits	 int ,                --三分命中
    three_point_number  int,                  --三分出手
    free_throw_percentage	numeric(10,2),    --罚球命中率	
    penalty_shot_hit   int,                   --罚球命中
    penalty_shot_number	   int,               --罚球命中  
    backboard	    int,                      --篮板  	
    front_court_rebound int,                  -- 篮板前场
    defensive_rebounds int,                   -- 篮板后场
    assists 	 int,                         --助攻
    steal  	 int,                             --抢断
    block_shots	 int,                         -- 盖帽
    fault int,                                --失误
    foul int,                                 --犯规
    score  int,                               --得分
    time    datetime DEFAULT (GETDATE())  ,   -- 比赛时间，默认时间为当前时间    
    foreign  key( mid ) references tb_match( mid ),  --匹配记录id  添加外键
    foreign  key( pid )references tb_player(pid)     --球员id 添加外键

   )