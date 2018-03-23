function nClass = classify(newFacePath)
% Summary this function is for the calssification

display(' ');
display(' ');
display('Start Recognition...');

%% Reading the Traning Result
display('Loading parameters...');
load('Mat/PCA.mat');
load('Mat/scaling.mat');
load('Mat/trainData.mat');
load('Mat/multiSVMTrain.mat');
display('..............................');

%% Reading a Test Data
xNewFace = ReadAFace(newFacePath); 
xNewFace = double(xNewFace);
% TestFace = (TestFace-repmat(meanVec, m, 1))*V; 
xNewFace = (xNewFace-repmat(meanVec, 1, 1))*V; % PCA Dimensionality Reduction
xNewFace = scaling(xNewFace,1,A0,B0);


display('Recognizing...');
nClass = multiSVMClassify(xNewFace);
display('..............................');
display(['End Recognizition£¬This is class£º' num2str(nClass), '¡£']);

