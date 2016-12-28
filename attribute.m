%%%%%%%%%%%%%%%%%%%%%各子程序
function y=attribute(X,n)
%功能为提取出原数据集X中的第n个属性所对应的一列值
[M,N]=size(X);
for i=1:M
    temp{i}=X{i}{n}; %将指定列值以temp暂量保存
end
y=temp';%转置
