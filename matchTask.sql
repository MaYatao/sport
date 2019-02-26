CREATE PROCEDURE  matchTask  @Pid int
 AS
DECLARE   @role  varchar(10)  --位置id
DECLARE   @achievement  int   --积分 id
DECLARE   @a_sf int             --小前锋id
DECLARE   @a_pf int             --大前锋id
DECLARE   @a_c int              --中锋id
DECLARE   @a_sg  int            --得分后卫id
DECLARE   @a_pg  int            --控球后卫id
DECLARE   @b_sf int             --小前锋id
DECLARE   @b_pf int             --大前锋id
DECLARE   @b_c int              --中锋id
DECLARE   @b_sg  int            --得分后卫id
DECLARE   @b_pg  int            --控球后卫id
SELECT  @role  =role    FROM  tb_player   where    pid= @Pid  
SELECT  @achievement  =  achievement   FROM  tb_player   where    pid =@Pid 
 if @role=null
   print '请先选择位置'   
 if @role='中锋' 
    set  @a_c= @Pid 
	select  TOP  1  @a_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	select TOP  1  @a_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50 order by NEWID()  
	select TOP  1 @a_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	 select TOP  1 @b_sg= pid   FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()    
if @role='小前锋' 
    set  @a_sf= @Pid 
	select  TOP  1  @a_c= pid     FROM tb_player   where    role = '中锋'  and   achievement between  @achievement-50 and   @achievement+50   order by NEWID()
	select TOP  1  @a_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50 order  by NEWID()
	select TOP  1 @a_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()    
	 select TOP  1 @b_sg= pid   FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
 if @role='大前锋' 
    set  @a_pf= @Pid 
	select  TOP  1  @a_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	select TOP  1  @a_c= pid    FROM tb_player   where    role= '中锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID() 
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50 order by NEWID()
	select TOP  1 @a_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	 select TOP  1 @b_sg= pid   FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
 if @role='控球后卫' 
    set  @a_pg= @Pid 
	select  TOP  1  @a_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	select TOP  1  @a_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50 order by NEWID()
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50 order by NEWID() 
	select TOP  1 @a_c= pid    FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID() 
     select TOP  1 @b_sg= pid   FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
 if @role='得分后卫' 
         set  @a_sg= @Pid 
	  select  TOP  1  @a_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @a_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @a_c= pid     FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @a_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_sg= pid   FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = '小前锋'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1 @b_pf= pid    FROM tb_player   where    role= '大前锋'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()

	  --当A队队员与B队队员重复时，B队重新重新查找
	  while  @a_sg=@b_sg
	      select TOP  1 @b_sg= pid   FROM tb_player   where    role= '得分后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_pf=@b_pf
	      select TOP  1 @b_pf= pid   FROM tb_player   where    role= '大前锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_pg=@b_pg
	      select TOP  1 @b_pg= pid   FROM tb_player   where    role= '控球后卫'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_sf=@b_sf
	      select TOP  1 @b_sf= pid   FROM tb_player   where    role= '小前锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_c=@b_c
	      select TOP  1 @b_c= pid   FROM tb_player   where    role= '中锋'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()

    insert  into  tb_match(a_c,a_sf,a_sg,a_pg,a_pf,b_c,b_sf,b_sg,b_pg,b_pf )  values(@a_c,@a_sf,@a_sg,@a_pg,@a_pf,@b_c,@b_sf,@b_sg,@b_pg,@b_pf)











	exec   matchTask  @Pid=9

	exec   matchTask  @Pid=164

	select  * from    tb_match  
	
	 	
