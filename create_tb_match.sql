create   table  tb_match      --����ƥ���¼��
   ( 
    mid  int   primary key  identity(1,1),          --ƥ���¼id����������
    a_sf   int       not null,                      --A����ԱСǰ��id
    a_pf  int        not null,                      --A����Ա��ǰ��id
    a_c   int        not null,                      --A����Ա�з�id
    a_sg  int        not null,                      --A����Ա�÷ֺ���id
	a_pg  int        not null,                      --A����Ա�������id
	b_sf   int       not null,                      --B����ԱСǰ��id
    b_pf  int        not null,                      --B����Ա��ǰ��id
    b_c   int        not null,                      --��Ա�з�id
    b_sg  int        not null,                      --B����Ա�÷ֺ���id
	b_pg  int        not null,                      --B����Ա�������id
    time    smalldatetime   DEFAULT (GETDATE())     -- ƥ��ʱ��


   )