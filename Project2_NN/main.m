X = eye(16);
% X = X(3:5,:);
y = [1:16]';
% y = [3:5]';

input_layer_size  = 16;  % 16 Input Digits
hidden_layer_size = 4;   % 4 hidden units
num_labels = 16;    % Output layer size, from 0 to 15;
m = size(X, 1);     % Number of the input instances.

Theta1 = zeros(4,17); % 16 Input Digits and 4 hidden units
Theta2 = zeros(16,5); % 4 hidden units and 16 output units.
nn_params = [Theta1(:) ; Theta2(:)];

% Different initial weights
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
lambda = 0;
J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);
               
fprintf('\n J is %f',J); 

%% ===============  ===============
% Training the weights.
options = optimset('MaxIter', 50); %  Would change the MaxIter to a larger number.
lambda = 0;

costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

%% ===============  ===============\
nn_params = [Theta1(:) ; Theta2(:)];
J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
fprintf('\n J is %f \n',J); 
% pred = predict(Theta1, Theta2, X);

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[dum, p] = max(h2, [], 2); p = p - 1; y = y - 1; 

% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);









