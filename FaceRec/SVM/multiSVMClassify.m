function class = multiSVMClassify(TestFace, multiSVMStruct)
% This is a multi-classification function, using bottom up decision tree
% strategy.
% input:--TestFace: m*n dimension matrix;
%       --multiSVMStruct: The result of multiSVMTrain function£¬read from
%       Mat/multiSVMTrain.mat.
%
% Output: --class: m*1 vector, the test faces belong to which class


%% Reading Test Data
if nargin < 2
    t = dir('Mat/multiSVMTrain.mat');
    if length(t) == 0
        error('Cannot find the result, please training 1st');
    end
    load('Mat/multiSVMTrain.mat');
end

nClass = multiSVMStruct.nClass; % Read classes
CASVMStruct = multiSVMStruct.CASVMStruct; % Read classifiers

%% %%%%%%%%%%%%%%%%%%%%%%% Voting Strategy %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = size(TestFace, 1);
Voting = zeros(m, nClass); % m test samples£¬nPerson 'judge' for each samples.

for iIndex = 1:nClass-1
    for jIndex = iIndex+1:nClass
        classes = svmclassify(CASVMStruct{iIndex}{jIndex}, TestFace);

        % Voting
        Voting(:, iIndex) = Voting(:, iIndex) + (classes == 1);
        Voting(:, jIndex) = Voting(:, jIndex) + (classes == 0);
                
    end % for jClass
end % for iClass



%% final decision by voting result
[vecMaxVal, class] = max( Voting, [], 2 );
%display(sprintf('TestFace is class :%d',class));
