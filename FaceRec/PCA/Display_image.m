function displayImage(v,row,col)
% display vector v as row*col
%
% Input��v --- The image(a row)
%      row
%      col

[m n] = size(v);


if m ~= 1
   error('v����Ϊ������');
end;
if  row*col ~= n
   error('ͼ��ߴ����������� v ��ά������');
end;

% Original image I
I=zeros(row,col);
I(:)=v(:);


figure;
imshow(I, []);

