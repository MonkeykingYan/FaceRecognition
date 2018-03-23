function multiSVMStruct = multiSVMTrain(TrainData, nSampPerClass, nClass, C, gamma)
% Input:--TrainData: Each Row is a Training Sample
%     --nClass: how many classes
%     --nSampPerClass:nClass*1 dimension vector£¬represent how many samples
%     in each classes.
%     --C: Parameters in Soft 
%     --Gamma: Parameters in RBF Kernel Function
%
% OutPut:--multiSVMStruct: A struct including c(c-1)/2 classifiers

%% Default Parameters
if nargin < 4
    C = Inf;
    gamma = 1;
elseif nargin < 5
    gamma = 1;
end

%% Start Training and Construct c*(c-1)/2 classifier
for ii=1:(nClass-1)
    for jj=(ii+1):nClass
        clear X;
        clear Y;
        startPosII = sum( nSampPerClass(1:ii-1) ) + 1;
        endPosII = startPosII + nSampPerClass(ii) - 1;
        X(1:nSampPerClass(ii), :) = TrainData(startPosII:endPosII, :);
            
        startPosJJ = sum( nSampPerClass(1:jj-1) ) + 1;
        endPosJJ = startPosJJ + nSampPerClass(jj) - 1;
        X(nSampPerClass(ii)+1:nSampPerClass(ii)+nSampPerClass(jj), :) = TrainData(startPosJJ:endPosJJ, :);
        
        
        % Set the label for the binary classifier
        Y = ones(nSampPerClass(ii) + nSampPerClass(jj), 1);
        Y(nSampPerClass(ii)+1:nSampPerClass(ii)+nSampPerClass(jj)) = 0;
        
        CASVMStruct{ii}{jj}= svmtrain( X, Y, 'Kernel_Function', @(X,Y) kfun_rbf(X,Y,gamma), 'boxconstraint', C );
     end
end

%% The Learning Result
multiSVMStruct.nClass = nClass;
multiSVMStruct.CASVMStruct = CASVMStruct;

%% Save Parameters
save('Mat/params.mat', 'C', 'gamma');



