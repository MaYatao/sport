CREATE PROCEDURE  matchTask  @Pid int
 AS
DECLARE   @role  varchar(10)  --λ��id
DECLARE   @achievement  int   --���� id
DECLARE   @a_sf int             --Сǰ��id
DECLARE   @a_pf int             --��ǰ��id
DECLARE   @a_c int              --�з�id
DECLARE   @a_sg  int            --�÷ֺ���id
DECLARE   @a_pg  int            --�������id
DECLARE   @b_sf int             --Сǰ��id
DECLARE   @b_pf int             --��ǰ��id
DECLARE   @b_c int              --�з�id
DECLARE   @b_sg  int            --�÷ֺ���id
DECLARE   @b_pg  int            --�������id
SELECT  @role  =role    FROM  tb_player   where    pid= @Pid  
SELECT  @achievement  =  achievement   FROM  tb_player   where    pid =@Pid 
 if @role=null
   print '����ѡ��λ��'   
 if @role='�з�' 
    set  @a_c= @Pid 
	select  TOP  1  @a_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	select TOP  1  @a_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50 order by NEWID()  
	select TOP  1 @a_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	 select TOP  1 @b_sg= pid   FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()    
if @role='Сǰ��' 
    set  @a_sf= @Pid 
	select  TOP  1  @a_c= pid     FROM tb_player   where    role = '�з�'  and   achievement between  @achievement-50 and   @achievement+50   order by NEWID()
	select TOP  1  @a_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50 order  by NEWID()
	select TOP  1 @a_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()    
	 select TOP  1 @b_sg= pid   FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
 if @role='��ǰ��' 
    set  @a_pf= @Pid 
	select  TOP  1  @a_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	select TOP  1  @a_c= pid    FROM tb_player   where    role= '�з�'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID() 
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50 order by NEWID()
	select TOP  1 @a_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	 select TOP  1 @b_sg= pid   FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
 if @role='�������' 
    set  @a_pg= @Pid 
	select  TOP  1  @a_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	select TOP  1  @a_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50 order by NEWID()
	select TOP  1 @a_sg= pid     FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50 order by NEWID() 
	select TOP  1 @a_c= pid    FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID() 
     select TOP  1 @b_sg= pid   FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @b_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
 if @role='�÷ֺ���' 
         set  @a_sg= @Pid 
	  select  TOP  1  @a_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1  @a_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @a_c= pid     FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @a_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_sg= pid   FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()	
	  select  TOP 1 @b_sf= pid     FROM tb_player   where    role = 'Сǰ��'  and   achievement between  @achievement-50 and   @achievement+50    order by NEWID()
	  select TOP  1 @b_pf= pid    FROM tb_player   where    role= '��ǰ��'  and   achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_c= pid     FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
	  select TOP  1 @b_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()

	  --��A�Ӷ�Ա��B�Ӷ�Ա�ظ�ʱ��B���������²���
	  while  @a_sg=@b_sg
	      select TOP  1 @b_sg= pid   FROM tb_player   where    role= '�÷ֺ���'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_pf=@b_pf
	      select TOP  1 @b_pf= pid   FROM tb_player   where    role= '��ǰ��'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_pg=@b_pg
	      select TOP  1 @b_pg= pid   FROM tb_player   where    role= '�������'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_sf=@b_sf
	      select TOP  1 @b_sf= pid   FROM tb_player   where    role= 'Сǰ��'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()
      while  @a_c=@b_c
	      select TOP  1 @b_c= pid   FROM tb_player   where    role= '�з�'  and  achievement between  @achievement-50 and   @achievement+50  order by NEWID()

    insert  into  tb_match(a_c,a_sf,a_sg,a_pg,a_pf,b_c,b_sf,b_sg,b_pg,b_pf )  values(@a_c,@a_sf,@a_sg,@a_pg,@a_pf,@b_c,@b_sf,@b_sg,@b_pg,@b_pf)











	exec   matchTask  @Pid=9

	exec   matchTask  @Pid=164

	select  * from    tb_match  
	
	 	
