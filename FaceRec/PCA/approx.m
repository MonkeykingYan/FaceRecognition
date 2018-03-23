function [ xApprox ] = approx( x, k )
% Rebuilt the image as k dimensional
%
% Input��x --- Original Size Samples
%       k --- K dimension as rebuilt
%
% Output��xApprox --- approx sample

%%
load Mat/PCA.mat

nLen = length(x);

xApprox=zeros(1, nLen);

for ii = 1:k
    xApprox=xApprox+(x*V(:,ii))*V(:,ii)';
end