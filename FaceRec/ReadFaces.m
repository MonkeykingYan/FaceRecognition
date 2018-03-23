function [imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson, nPerson, bTest)
%% Read ORL face database and find the first 5 to train.
%
%  Input: nFacesPerPerson - how many train face for ecah person. default = 5
%        nPerson - how many person we want to tell. default = 40
%        bTest - bool¡£default is 0£¬reading training data£»if is 1£¬reading
%        test data.
%
%  Output£ºFaceContainer - £¨nPerson * nFacesPerPerson£©* 10304 matrix, each row is a person

%% Default Value
if nargin==0 
    nFacesPerPerson=5;%training data is the first 5 person. 
    nPerson=8;%default is the 40 people
    bTest = 0;
elseif nargin < 3
    bTest = 0;
end

%% Get Size
img=imread('Data/ORL/S1/1.pgm');
[imgRow,imgCol]=size(img);

%% Initial the matrix
FaceContainer = zeros(nFacesPerPerson*nPerson, imgRow*imgCol);
faceLabel = zeros(nFacesPerPerson*nPerson, 1);

%% Reading the data from the ORL
for i=1:nPerson
    i1=mod(i,10);
    i0=char(i/10);
    strPath='Data/ORL/S';
    if( i0~=0 )
        strPath=strcat(strPath,'0'+i0);
    end
    strPath=strcat(strPath,'0'+i1);
    strPath=strcat(strPath,'/');
    tempStrPath=strPath;
    for j=1:nFacesPerPerson
        strPath=tempStrPath;
        
        if bTest == 0 % Reading training data
            strPath = strcat(strPath, '0'+j);
        else
            strPath = strcat(strPath, num2str(5+j));
        end
        
        strPath=strcat(strPath,'.pgm');
        img=imread(strPath);
       
        % for every person we have to save it in a row
        FaceContainer((i-1)*nFacesPerPerson+j, :) = img(:)';
        faceLabel((i-1)*nFacesPerPerson+j) = i;
    end % j
end % i

% save it into a matrix.
save('Mat/FaceMat.mat', 'FaceContainer');




