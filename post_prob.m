%%%%%%%%%%%%%%%%%
function [post_pro,post_name]=post_prob(E,D)
%E为目标属性，D为决策属性，post_pro计算目标属性对应于决策属性的后验概率
%post_name为所求的后验概率变量名称
[M,N]=size(D);
decision=unique(D);%决策属性种类
attri=unique(E); %条件属性种类
[m1,n1]=size(decision);
[m2,n2]=size(attri);
temp=cat(2,E,D); %连接条件属性和决策属性
post_pro=zeros(m1,m2); %后验概率初始化
for i=1:M
    for j=1:m2
        for k=1:m1
            post_name{k,j}=cat(2,{attri{j}},{decision{k}});
   if(isequal(temp(i,:),post_name{k,j}))
                post_pro(k,j)=post_pro(k,j)+1; %条件属性后验概率（频数）
            end
        end
    end
end
for i=1:m1
    post_pro(i,:)=(post_pro(i,:)+1.0)/(sum(post_pro(i,:))+m2);%求得条件属性后验概率
end
