function K = kfun_rbf(U, V, gamma)
% rbf kernel function

[m1 n1] = size(U);
[m2 n2] = size(V);

K = zeros(m1, m2);

for ii = 1:m1
    for jj = 1:m2
        K(ii, jj) = exp( -gamma * norm(U(ii, :)-V(jj, :))^2 );
    end
end