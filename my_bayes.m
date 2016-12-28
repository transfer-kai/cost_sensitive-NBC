%@author:zhangkai
%@date:2016-12-28
function [out]=my_bayes(X,Y)
% X为原数据集,Y是要预测的数据，out是返回预测的结果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%训练部分
[M,N]=size(X);
[m,n]=size(X{1});
decision=attribute(X,n); %提取决策属性
Pro=probality(decision);%计算决策属性个分量概率
for i=1:n-1
    [post_pro{i},post_name{i}]=post_prob(attribute(X,i),decision); %求各条件属性后验概率
end

%%%%%%%%%%%%%%%%%%%%%%%%预测部分
uniq_decis=unique(decision); %求决策属性的类别
P_X=ones(size(uniq_decis,1),1); %初始化决策属性后验概率
[M,N]=size(Y);
k=1;
for i=1:M
    for j=1:n-1
        [~,loc]=ismember(attribute({Y{i}},j),unique(attribute(X,j)));%决策属性计算后验概率
        if(loc>0)
        P_X=post_pro{j}(:,loc).*P_X;%各条件属性后验概率之积（贝叶斯公式）
        end
    end
     P_X=P_X.*Pro;
   
%      代价敏感学习%Ctf:predicting t actually is f;  Cft>=Ctf.
        Ctf=1;Cft=6;Ctt=0;Cff=0;
     if(Pro(1)<Pro(2))
         LT=P_X(2)*Ctf+P_X(1)*Ctt;
         LF=P_X(1)*Cft+P_X(2)*Cff;
         if(LT>LF)
             I=2;
         else
             I=1;
         end
     else
         LT=P_X(1)*Ctf+P_X(1)*Ctt;
         LF=P_X(2)*Cft+P_X(2)*Cff;
         if(LT>LF)
             I=1;
         else
             I=2;
         end
     end
%     [MAX,I]=max(P_X);%寻找最大值
    out{k}=uniq_decis{I};%哪一类决策属性后验概率最大，则次样本属于那一类
    k=k+1;
    P_X=ones(size(uniq_decis,1),1);%再次初始化决策属性后验概率P_X，以便为下一样本计算作准备
end
 %输出结果（转置形式）
out=out';