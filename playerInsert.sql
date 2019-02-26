create trigger playerInsert　　on tb_player  after insert   as    --球员信息插入后计算积分
DECLARE @Pid  int                  --球员id
DECLARE @average_score   float     --平均得分
DECLARE @assists float             --助攻
DECLARE @backboard float           --篮板数
DECLARE @steal  float              --抢断数
DECLARE @block_shots float         --盖帽数
DECLARE @shooting  float           --投篮命中
DECLARE @shoot_number  float       --投篮数 
DECLARE @fault float               --失误数
DECLARE @scene  float              --总场数
DECLARE @fail  float               --败场
DECLARE @win  float                --胜场
DECLARE @achievement float         --平均评分
DECLARE @efficiency float          --效率值
SELECT @Pid  =@@IDENTITY           --获取自增的id
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
set @efficiency=(@average_score + @assists+@backboard+@steal+@block_shots-@shoot_number+@shooting-@fault) /@scene   --计算效率值
if  @efficiency<20    --小于20，评分不格外加分
    set @achievement=@win*25   
else   --大于20，评分格外加分
    set @achievement=@win*25+@efficiency*5
update    tb_player   set  achievement =  @achievement  where  pid=@Pid