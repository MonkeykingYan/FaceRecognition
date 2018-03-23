function face=ReadAFace(dir)
%% Read just one person
% 
% Input:    --dir: The image path.
% 
% Output:   --face: A vecoter of pixel of the image.

%%
img=imread(dir);
[imgRow,imgCol]=size(img);
face=zeros(1, imgRow*imgCol);

face = img(:)';
