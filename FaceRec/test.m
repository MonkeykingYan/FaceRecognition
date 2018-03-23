%% This function is made by YanMa (40024856)
function test()
% Test all the test data recognition rate
%
% Output£ºaccuracy 

%% Start Testing
display(' ');
display(' ');
display('Start Testing...');

%% Reading Test Data
nFacesPerPerson = 5;
nPerson = 8;
bTest = 1;

display('Reading Test Data...');
[imgRow,imgCol,TestFace,testLabel] = ReadFaces(nFacesPerPerson, nPerson, bTest);
display('..............................');

%% Reading Parameters

display('Loading Trained Parameters...');
load('Mat/PCA.mat');
load('Mat/scaling.mat');
load('Mat/trainData.mat');
load('Mat/multiSVMTrain.mat');
display('..............................');

%%  PCA Dimensionality Reduction
display('PCA Dimensionality Reduction...');
[m n] = size(TestFace);
TestFace = (TestFace-repmat(meanVec, m, 1))*V;
TestFace = scaling(TestFace,1,A0,B0);
display('..............................');

%% Multi-SVM Classification
display('Classifying...');
classes = multiSVMClassify(TestFace);
display('..............................');

%% Calculate Accuracy 
nError = sum(classes ~= testLabel);
accuracy = 1 - nError/length(testLabel);
display(['For ',num2str(nFacesPerPerson*nPerson),' size test data, the accuracy is: ', num2str(accuracy*100), '%']);