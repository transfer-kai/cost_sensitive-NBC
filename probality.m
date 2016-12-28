%%%%%%%%%%%%%%%%%%%
function y=probality(E) %计算该属性类的概率
[M,N]=size(E);
class=unique(E);%求该决策属性的类别
[m,n]=size(class);
p=zeros(m,1);%先验概率p初始化
for i=1:M
    for j=1:m
        if(isequal(E{i},class{j}))
            p(j)=p(j)+1; %求各个样本的先验概率（频数）
        end
    end
end
y=(p+1.0)/(M+m);%得各样本概率 
