function [J grad] = nnCostFunction_5layers(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size1, hidden_layer_size2, hidden_layer_size3,...
                                   num_labels, ...
                                   X, y, lambda)
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector nn_params and need to be converted back into the weight matrices. 

Theta1 = reshape(nn_params(1:hidden_layer_size1 * (input_layer_size + 1)), ...
                 hidden_layer_size1, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size1 * (input_layer_size + 1))):( (hidden_layer_size1 * (input_layer_size + 1))) + (hidden_layer_size2 * (hidden_layer_size1 + 1))), ...
                 hidden_layer_size2, (hidden_layer_size1 + 1));
             
Theta3 = reshape(nn_params((1 + (hidden_layer_size1 * (input_layer_size + 1))) + (hidden_layer_size2 * (hidden_layer_size1 + 1)):( (hidden_layer_size1 * (input_layer_size + 1))) + (hidden_layer_size2 * (hidden_layer_size1 + 1)) + (hidden_layer_size3 * (hidden_layer_size2 + 1))), ...
                 hidden_layer_size3, (hidden_layer_size2 + 1));
             
Theta4 = reshape(nn_params((1 + (hidden_layer_size1 * (input_layer_size + 1))) + (hidden_layer_size2 * (hidden_layer_size1 + 1)) + (hidden_layer_size3 * (hidden_layer_size2 + 1)):end), ...
                 num_labels, (hidden_layer_size3 + 1));

% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
Theta3_grad = zeros(size(Theta3));
Theta4_grad = zeros(size(Theta4));

X = [ones(m, 1) X];
Z2 = X * Theta1';
A1 = sigmoid(X * Theta1');

A1 = [ones(m, 1) A1];
Z3 = A1 * Theta2';
A2 = sigmoid(A1 * Theta2');

A2 = [ones(m, 1) A2];
Z4 = A2 * Theta3';
A3 = sigmoid(A2 * Theta3');

A3 = [ones(m, 1) A3];
A4 = sigmoid(A3 * Theta4');

for k = 1:num_labels
    J =  J + (1 / m ) * ( -(y == k)' * log(A4(:,k)) - (1 - (y == k)') * log(1 - A4(:,k)));
 %     J = J + (1 / (2 * m)) * sum(sum(((A4 - X(:,2:end)) .^ 2)));
end

J = J + (lambda / ( 2 * m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));

A5 = A4;
for k = 1:num_labels
	d5(:,k) = A5(:,k) - (y == k);
end

d4 = d5 * Theta4(:,2:end) .* sigmoidGradient(Z4);

D3 = zeros(size(Theta3,1), size(Theta3,2));
D4 = zeros(size(Theta4,1), size(Theta4,2));
D4 = D4 + d5' * A3;
D3 = D3 + d4' * A2;

Theta3_grad = (1 / m) * D3;
Theta4_grad = (1 / m) * D4;

d3 = d4 * Theta3(:,2:end) .* sigmoidGradient(Z3);
d2 = d3 * Theta2(:,2:end) .* sigmoidGradient(Z2);
D1 = zeros(size(Theta1,1), size(Theta1,2));
D2 = zeros(size(Theta2,1), size(Theta2,2));
D2 = D2 + d3' * A1;
D1 = D1 + d2' * X;
Theta1_grad = (1 / m) * D1;
Theta2_grad = (1 / m) * D2;

grad = [Theta1_grad(:) ; Theta2_grad(:) ; Theta3_grad(:) ; Theta4_grad(:)];

end
