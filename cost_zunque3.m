%三分类准确率
clear all;
clc;
file = textread('cmc.txt','%s','delimiter','\n','whitespace','');
[m,n]=size(file);
for i=1:m
    words=strread(file{i},'%s','delimiter',', ');
    words=words';
    X{i}=words;
end
X=X';%转置
[M,N]=size(X);
[m,n]=size(X{1});
decision=attribute(X,n);
class=unique(decision);
Pro=probality(decision);
% if(Pro(1)>Pro(2))
%   T_class=class(2);%关注的类，少类
%   F_class=class(1);%多类  
% else
%   T_class=class(1);  
%   F_class=class(2);
% end
T_class=class(2);
%%%%%%%%%%%%%%%%%%%%%%十折交叉验证
[train_data1,test_data1,train_data2,test_data2,train_data3,test_data3,train_data4,test_data4,train_data5,test_data5,train_data6,test_data6,train_data7,test_data7,train_data8,test_data8,train_data9,test_data9,train_data10,test_data10]=tenflod(X,10);
[M,N]=size(test_data1);
[m,n]=size(test_data1{1});
for i=1:M
    for j=1:n-1
      new_test_data1{i,1}{1,j}=test_data1{i,1}{1,j};
    end
end
[out]=my_bayes(train_data1,new_test_data1);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data1{i,1}{1,n};
    if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision1=tp/(tp+fp);
recall1=tp/(tp+fn)
r1=tn/(tn+fp);
G1=sqrt(recall1*r1)
F11=2*tp/(2*tp+fp+fn)
accuracy1=p1/M%第一次
[M,N]=size(test_data2);
[m,n]=size(test_data2{1});
for i=1:M
    for j=1:n-1
      new_test_data2{i,1}{1,j}=test_data2{i,1}{1,j};
    end
end
[out]=my_bayes(train_data2,new_test_data2);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data2{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision2=tp/(tp+fp);
recall2=tp/(tp+fn);
r1=tn/(tn+fp);
G2=sqrt(recall2*r1);
F12=2*tp/(2*tp+fp+fn);
accuracy2=p1/M%第二次
[M,N]=size(test_data3);
[m,n]=size(test_data3{1});
for i=1:M
    for j=1:n-1
      new_test_data3{i,1}{1,j}=test_data3{i,1}{1,j};
    end
end
[out]=my_bayes(train_data3,new_test_data3);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data3{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision3=tp/(tp+fp);
recall3=tp/(tp+fn);
r1=tn/(tn+fp);
G3=sqrt(recall3*r1);
F13=2*tp/(2*tp+fp+fn);
accuracy3=p1/M%第三次
[M,N]=size(test_data4);
[m,n]=size(test_data4{1});
for i=1:M
    for j=1:n-1
      new_test_data4{i,1}{1,j}=test_data4{i,1}{1,j};
    end
end
[out]=my_bayes(train_data4,new_test_data4);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data4{i,1}{1,n};
    if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision4=tp/(tp+fp);
recall4=tp/(tp+fn);
r1=tn/(tn+fp);
G4=sqrt(recall4*r1);
F14=2*tp/(2*tp+fp+fn);
accuracy4=p1/M%第四次
[M,N]=size(test_data5);
[m,n]=size(test_data5{1});
for i=1:M
    for j=1:n-1
      new_test_data5{i,1}{1,j}=test_data5{i,1}{1,j};
    end
end
[out]=my_bayes(train_data5,new_test_data5);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data5{i,1}{1,n};
    if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision5=tp/(tp+fp);
recall5=tp/(tp+fn);
r1=tn/(tn+fp);
G5=sqrt(recall5*r1);
F15=2*tp/(2*tp+fp+fn);
accuracy5=p1/M%第五次
[M,N]=size(test_data6);
[m,n]=size(test_data6{1});
for i=1:M
    for j=1:n-1
      new_test_data6{i,1}{1,j}=test_data6{i,1}{1,j};
    end
end
[out]=my_bayes(train_data6,new_test_data6);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data6{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision6=tp/(tp+fp);
recall6=tp/(tp+fn);
r1=tn/(tn+fp);
G6=sqrt(recall6*r1);
F16=2*tp/(2*tp+fp+fn);
accuracy6=p1/M%第六次
[M,N]=size(test_data7);
[m,n]=size(test_data7{1});
for i=1:M
    for j=1:n-1
      new_test_data7{i,1}{1,j}=test_data7{i,1}{1,j};
    end
end
[out]=my_bayes(train_data7,new_test_data7);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data7{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision7=tp/(tp+fp);
recall7=tp/(tp+fn);
r1=tn/(tn+fp);
G7=sqrt(recall7*r1);
F17=2*tp/(2*tp+fp+fn);
accuracy7=p1/M%第七次
[M,N]=size(test_data8);
[m,n]=size(test_data8{1});
for i=1:M
    for j=1:n-1
      new_test_data8{i,1}{1,j}=test_data8{i,1}{1,j};
    end
end
[out]=my_bayes(train_data8,new_test_data8);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data8{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision8=tp/(tp+fp);
recall8=tp/(tp+fn);
r1=tn/(tn+fp);
G8=sqrt(recall8*r1);
F18=2*tp/(2*tp+fp+fn);
accuracy8=p1/M%第八次
[M,N]=size(test_data9);
[m,n]=size(test_data9{1});
for i=1:M
    for j=1:n-1
      new_test_data9{i,1}{1,j}=test_data9{i,1}{1,j};
    end
end
[out]=my_bayes(train_data9,new_test_data9);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data9{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision9=tp/(tp+fp);
recall9=tp/(tp+fn);
r1=tn/(tn+fp);
G9=sqrt(recall9*r1);
F19=2*tp/(2*tp+fp+fn);
accuracy9=p1/M%第九次
[M,N]=size(test_data10);
[m,n]=size(test_data10{1});
for i=1:M
    for j=1:n-1
      new_test_data10{i,1}{1,j}=test_data10{i,1}{1,j};
    end
end
[out]=my_bayes(train_data10,new_test_data10);
p1=0;tp=0;fn=0;fp=0;tn=0;
for i=1:M
    a1=out(i);
    b1=test_data10{i,1}{1,n};
     if(strcmp(b1,T_class)&&strcmp(a1,T_class))
        tp=tp+1;
    end
    if(strcmp(b1,T_class)&&(~strcmp(a1,T_class)))
        fn=fn+1;
    end
    if((~strcmp(b1,T_class))&&strcmp(a1,T_class))
        fp=fp+1;
    end
    if((~strcmp(b1,T_class))&&(~strcmp(a1,T_class)))
        tn=tn+1;
    end
    if(strcmp(a1,b1))
        p1=p1+1;
    end
end
precision10=tp/(tp+fp);
recall10=tp/(tp+fn);
r1=tn/(tn+fp);
G10=sqrt(recall10*r1);
F110=2*tp/(2*tp+fp+fn);
accuracy10=p1/M;%第十次
precison=(precision1+precision2+precision3+precision4+precision5+precision6+precision7+precision8+precision9+precision10)/10
recall=(recall1+recall2+recall3+recall4+recall5+recall6+recall7+recall8+recall9+recall10)/10
F1=(F11+F12+F13+F14+F15+F16+F17+F18+F19+F110)/10
G=(G1+G2+G3+G4+G5+G6+G7+G8+G9+G10)/10
accuracy=(accuracy1+accuracy2+accuracy3+accuracy4+accuracy5+accuracy6+accuracy7+accuracy8+accuracy9+accuracy10)/10

