%% This Function is made by Yan Ma (40024856)
function train(C, gamma)
% Summary: Training the data, including reading iamges, PCA dimensionality
% reduction£¬multi-SVM training and save the data:
%
%   W -- PCA  transformation matrix, save as Mat/PCA.mat;
%
%   Save the dimensions of the scaling, the lower boundary information to
%   Mat/scaling. Mat;
%
%   Save the information of SVM training as Mat/multiSVMTrain.mat

%% Start Training
global imgRow;
global imgCol;

display(' ');
display(' ');
display('Start Training...');

%% Reading Faces
nPerson=8;
nFacesPerPerson = 5;
display('Reading Faces...');
[imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson);
display('..............................');


nFaces=size(FaceContainer,1);%Samples(faces) size

%% PCA Dimensionality Reduction
display('PCA Dimensionality Reduction...');
[pcaFaces, W] = fastPCA(FaceContainer, 20);% fastPCA

%% Visualize Eigenfaces
visualize_pc(W);
display('..............................');

X = pcaFaces;

%% Scaling Data
display('Scaling...');
[X,A0,B0] = scaling(X);
save('Mat/scaling.mat', 'A0', 'B0');

%% Save Scaled Data as trainData.mat
TrainData = X;
trainLabel = faceLabel;
W = W;
save('Mat/trainData.mat', 'TrainData', 'trainLabel','W');

display('..............................');

%% Multi-SVM Training
for iPerson = 1:nPerson
    nSplPerClass(iPerson) = sum( (trainLabel == iPerson) );
end

multiSVMStruct = multiSVMTrain(TrainData, nSplPerClass, nPerson, C, gamma);
display('Saving Training Data...');
save('Mat/multiSVMTrain.mat', 'multiSVMStruct');
display('..............................');
display('Training End');