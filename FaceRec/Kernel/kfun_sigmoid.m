function K = kfun_sigmoid(U,V,P1,P2)
% Sigmoid kernel function
K = tanh(P1*(U*V')+P2);