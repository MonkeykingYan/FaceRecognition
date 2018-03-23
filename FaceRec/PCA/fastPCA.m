function [pcaA V] = fastPCA( A, k )
% fast PCA
%
% Input£ºA --- Sample Matrix, for each row is a sample
%        k --- the dimension we want to reduce to
%
% Output£ºpcaA 
%         V

[r c] = size(A);

%%  Means
meanVec = mean(A);

%% covMatT
Z = (A-repmat(meanVec, r, 1));
covMatT = Z * Z';

%% Top k eigenvalues of covMatT 
[V D] = eigs(covMatT, k);

%% Eigenvectors of (covMatT)'
V = Z' * V;

%% Normalizing
for i=1:k
    V(:,i)=V(:,i)/norm(V(:,i));
end

%% The projection to k dimensional space
pcaA = Z * V;

%% Saving
save('Mat/PCA.mat', 'V', 'meanVec');