
create   table  position                    --������Աλ��ָ����
   ( 
    poid  int   primary key  identity(1,1),    --ָ��id����������
    pid     int   not  null,                   --��Աid  
	c       int   not  null,                   --��Ա�з�ָ�� 
	sf      int   not  null,                   --��ԱСǰ���ָ�� 
	sg      int   not  null,                   --��Ա�÷ֺ���ָ�� 
	pf      int   not  null,                   --��Ա��ǰ��ָ��  
	pg      int   not  null,                   --��Ա�������ָ��   
      
    foreign  key( pid )references tb_player(pid)     --��Աid ���Ϊ���

   )