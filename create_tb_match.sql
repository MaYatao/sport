create   table  tb_match      --创建匹配记录表
   ( 
    mid  int   primary key  identity(1,1),          --匹配记录id，主键自增
    a_sf   int       not null,                      --A队球员小前锋id
    a_pf  int        not null,                      --A队球员大前锋id
    a_c   int        not null,                      --A队球员中锋id
    a_sg  int        not null,                      --A队球员得分后卫id
	a_pg  int        not null,                      --A队球员控球后卫id
	b_sf   int       not null,                      --B队球员小前锋id
    b_pf  int        not null,                      --B队球员大前锋id
    b_c   int        not null,                      --球员中锋id
    b_sg  int        not null,                      --B队球员得分后卫id
	b_pg  int        not null,                      --B队球员控球后卫id
    time    smalldatetime   DEFAULT (GETDATE())     -- 匹配时间


   )