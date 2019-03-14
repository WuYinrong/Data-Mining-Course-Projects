function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector nn_params and need to be converted back into the weight matrices. 

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

X = [ones(m, 1) X];
Z2 = X * Theta1';
A1 = sigmoid(X * Theta1');
A1 = [ones(m, 1) A1];
A2 = sigmoid(A1 * Theta2');

for k = 1:num_labels
      J =  J + (1 / m ) * ( -(y == k)' * log(A2(:,k)) - (1 - (y == k)') * log(1 - A2(:,k)));
%     J = J + (1 / (2 * m)) * sum(sum(((A2 - X(:,2:end)) .^ 2)));
end

J = J + (lambda / ( 2 * m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));

A3 = A2;
for k = 1:num_labels
	d3(:,k) = A3(:,k) - (y == k);
end

d2 = d3 * Theta2(:,2:end) .* sigmoidGradient(Z2);

D1 = zeros(size(Theta1,1), size(Theta1,2));
D2 = zeros(size(Theta2,1), size(Theta2,2));
D2 = D2 + d3' * A1;
D1 = D1 + d2' * X;

Theta1_grad = (1 / m) * D1;
Theta2_grad = (1 / m) * D2;

temp1 = (lambda / m) * Theta1;
temp1(:,1) = zeros(size(temp1,1),1);
Theta1_grad = Theta1_grad + temp1;
temp2 = (lambda / m) * Theta2;
temp2(:,1) = zeros(size(temp2,1),1);
Theta2_grad = Theta2_grad + temp2;

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
