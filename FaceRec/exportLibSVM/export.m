function export(strMat, strLibSVM)
% Output as the LibSVM file format
%
% Input：strMat --- Original file path，'.mat' file，default is '../Mat/trainData.mat' including TrainData and label trainLabel.
%       strLibSVM --- Object file path，'.txt'file，default is
%       'trainData.txt'.

if nargin < 1
    strMat = '/Users/mayan/Documents/MATLAB/YanMa/FaceRec/Mat/trainData.mat';
    strLibSVM = '/Users/mayan/Documents/MATLAB/YanMa/FaceRec/exportLibSVM/trainData.txt';
elseif nargin < 2
    strLibSVM = 'trainData.txt';
end

[fid, fMsg ] = fopen(strLibSVM, 'w'); % 建立目标输出文件
if fid == -1
    disp(fMsg );
    return
end

strNewLine = [13 10]; % 换行
strBlank = ' ';
    
load(strMat)

[nSamp, nDim] = size( TrainData );


for iSamp = 1:nSamp
    fwrite(fid, num2str(trainLabel(iSamp)), 'char');
    
    for iDim = 1:nDim
        fwrite(fid, strBlank, 'char');
        fwrite(fid, [num2str(iDim) ':'], 'char');
        fwrite(fid, num2str(TrainData(iSamp, iDim)), 'char');        
    end
    
    fwrite(fid, strNewLine, 'char');
end



fclose(fid);

