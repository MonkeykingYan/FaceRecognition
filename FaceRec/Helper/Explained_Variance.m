clear all;
close all;
clc;

load('/Users/mayan/Documents/MATLAB/YanMa/FaceRec/Mat/FaceMat.mat')
A= FaceContainer;
[B,C,D_all] = princomp(A);

for(i = 1:25)
    y(i) = (D_all(i)*100)/sum(D_all);
    y_all(i) = sum(y(1:i));
end

bar(y,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
hold on;
plot(1:25,y_all,'b');
xlabel('K');
ylabel('Explained Variance(%)');
title('How to chose K value')

