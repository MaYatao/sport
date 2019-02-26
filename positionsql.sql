
create   table  position                    --创建球员位置指数表
   ( 
    poid  int   primary key  identity(1,1),    --指数id，主键自增
    pid     int   not  null,                   --球员id  
	c       int   not  null,                   --球员中锋指数 
	sf      int   not  null,                   --球员小前锋锋指数 
	sg      int   not  null,                   --球员得分后卫指数 
	pf      int   not  null,                   --球员大前锋指数  
	pg      int   not  null,                   --球员控球后卫指数   
      
    foreign  key( pid )references tb_player(pid)     --球员id 添加为外键

   )