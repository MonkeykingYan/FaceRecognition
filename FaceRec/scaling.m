function [SVFM, lowVec, upVec] = scaling(VecFeaMat, bTest, lRealBVec, uRealBVec)
% Input:  VecFeaMat --- m*n matrix，each row is eigenvector
%         bTest ---  =1：scaling for test data，and you need give lRealBVec and uRealBVec
%                    =0：Default UpperBound and LowerBound
%         lRealBVec --- n Dimension vector，The actual lower limit information of each dimension obtained from the training sample scaling
%         uRealBVec --- n Dimension vector，The actual upper limit information of each dimension obtained from the training sample scaling
%
% output: SVFM --- Scaled Matrix
%         upVec --- UpperBound
%         lowVec --- LowerBound
if nargin < 2
    bTest = 0;
end

%% Scaling Range [-1, 1]
lTargB = -1;
uTargB = 1;


[m n] = size(VecFeaMat);

SVFM = zeros(m, n);

%% Normalization
if bTest
    if nargin < 4
        error('To do scaling on testset, param lRealB and uRealB are needed.');
    end
    
    if nargout > 1
        error('When do scaling on testset, only one output is supported.');
    end

    for iCol = 1:n
        if uRealBVec(iCol) == lRealBVec(iCol)
            SVFM(:, iCol) = uRealBVec(iCol);
            SVFM(:, iCol) = 0;
        else
            SVFM(:, iCol) = lTargB  +  ( VecFeaMat(:, iCol) - lRealBVec(iCol) ) / ( uRealBVec(iCol)-lRealBVec(iCol) ) * (uTargB-lTargB); % 测试数据的scaling
        end
    end
else
    upVec = zeros(1, n);
    lowVec = zeros(1, n);


    for iCol = 1:n
        lowVec(iCol) = min( VecFeaMat(:, iCol) );
        upVec(iCol) = max( VecFeaMat(:, iCol) );
        if upVec(iCol) == lowVec(iCol)
            SVFM(:, iCol) = upVec(iCol);
            SVFM(:, iCol) = 0;
        else
            SVFM(:, iCol) = lTargB  +  ( VecFeaMat(:, iCol) - lowVec(iCol) ) / ( upVec(iCol)-lowVec(iCol) ) * (uTargB-lTargB); % 训练数据的scaling
        end
    end
end