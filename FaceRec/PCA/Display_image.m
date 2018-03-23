function displayImage(v,row,col)
% display vector v as row*col
%
% Input：v --- The image(a row)
%      row
%      col

[m n] = size(v);


if m ~= 1
   error('v必须为行向量');
end;
if  row*col ~= n
   error('图像尺寸与输入向量 v 的维数不符');
end;

% Original image I
I=zeros(row,col);
I(:)=v(:);


figure;
imshow(I, []);

