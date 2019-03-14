function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function evaluated at z
%  g = SIGMOIDGRADIENT(z) computes the gradient of the sigmoid function evaluated at z. 
% g = 1.0 ./ (1.0 + exp(-z));
% g = sigmoid(z) .* (1 - sigmoid(z));

g = zeros(size(z));
   g = (1 ./ (1 + exp( -z))) .* (1 - (1 ./ (1 + exp( -z))));

%   g(z > 0) = 1;
end
