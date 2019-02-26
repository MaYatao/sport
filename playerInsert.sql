create trigger playerInsert����on tb_player  after insert   as    --��Ա��Ϣ�����������
DECLARE @Pid  int                  --��Աid
DECLARE @average_score   float     --ƽ���÷�
DECLARE @assists float             --����
DECLARE @backboard float           --������
DECLARE @steal  float              --������
DECLARE @block_shots float         --��ñ��
DECLARE @shooting  float           --Ͷ������
DECLARE @shoot_number  float       --Ͷ���� 
DECLARE @fault float               --ʧ����
DECLARE @scene  float              --�ܳ���
DECLARE @fail  float               --�ܳ�
DECLARE @win  float                --ʤ��
DECLARE @achievement float         --ƽ������
DECLARE @efficiency float          --Ч��ֵ
SELECT @Pid  =@@IDENTITY           --��ȡ������id
SELECT @fail  =    fail   FROM  tb_player   where    pid= @Pid  
SELECT @win  =   win   FROM tb_player   where    pid=@Pid 
SELECT @average_score  =      average_score   FROM tb_player   where    pid= @Pid  
SELECT @assists  =      assists    FROM tb_player   where    pid= @Pid  
SELECT @backboard   =      backboard    FROM tb_player   where    pid= @Pid  
SELECT @steal  =      steal   FROM tb_player   where    pid= @Pid  
SELECT @block_shots  =      block_shots   FROM tb_player   where    pid= @Pid  
SELECT @shoot_number  =      shoot_number    FROM tb_player   where    pid= @Pid  
SELECT @shooting  =      shooting    FROM tb_player   where    pid= @Pid  
SELECT @fault   =      fault    FROM tb_player   where    pid= @Pid  
SELECT @scene  =      scene     FROM tb_player   where    pid= @Pid  
set @efficiency=(@average_score + @assists+@backboard+@steal+@block_shots-@shoot_number+@shooting-@fault) /@scene   --����Ч��ֵ
if  @efficiency<20    --С��20�����ֲ�����ӷ�
    set @achievement=@win*25   
else   --����20�����ָ���ӷ�
    set @achievement=@win*25+@efficiency*5
update    tb_player   set  achievement =  @achievement  where  pid=@Pid