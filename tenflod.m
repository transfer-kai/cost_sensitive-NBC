% 十折交叉验证
function [train_data1,test_data1,train_data2,test_data2,train_data3,test_data3,train_data4,test_data4,train_data5,test_data5,train_data6,test_data6,train_data7,test_data7,train_data8,test_data8,train_data9,test_data9,train_data10,test_data10]=tenflod(X,k)
[m,n]=size(X);
for i=1:m
 x=X{i,1};
 for j=1
 y(i,j)=x(j);
 end
end
Indices = crossvalind('Kfold',y,k);
test1 = (Indices == 1);
train1=~test1;
train_data1=X(train1,:);
test_data1=X(test1,:);
test2 = (Indices == 2);
train2=~test2;
train_data2=X(train2,:);
test_data2=X(test2,:);
test3 = (Indices == 3);
train3=~test3;
train_data3=X(train3,:);
test_data3=X(test3,:);
test4 = (Indices == 4);
train4=~test4;
train_data4=X(train4,:);
test_data4=X(test4,:);
test5 = (Indices == 5);
train5=~test5;
train_data5=X(train5,:);
test_data5=X(test5,:);
test6 = (Indices == 6);
train6=~test6;
train_data6=X(train6,:);
test_data6=X(test6,:);
test7 = (Indices == 7);
train7=~test7;
train_data7=X(train7,:);
test_data7=X(test7,:);
test8 = (Indices == 8);
train8=~test8;
train_data8=X(train8,:);
test_data8=X(test8,:);
test9 = (Indices == 9);
train9=~test9;
train_data9=X(train9,:);
test_data9=X(test9,:);
test10 = (Indices == 10);
train10=~test10;
train_data10=X(train10,:);
test_data10=X(test10,:);






