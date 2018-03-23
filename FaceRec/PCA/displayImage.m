function displayImage(v,row,col)
% display vector v as row*col
%
% Input£ºv --- The image(a row)
%      row
%      col

[m n] = size(v);


if m ~= 1
   error('v must be a vector');
end;
if  row*col ~= n
   error('The image size is icorrect');
end;

% Original image I
I=zeros(row,col);
I(:)=v(:);


figure;
imagesc(I);
colormap(gray);
axis image;

