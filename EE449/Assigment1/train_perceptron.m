function [w, bias] = train_perceptron(data, prediction, bias, eta, max_iter)

  if nargin < 5
    max_iter = 100000;
  end

  if nargin < 4
    eta = 1;
  end

  if nargin < 3
    bias = rand(1, size(data, 2));
  end

  data = [bias; data];

  w = rand(size(data)) * 0.01;

  y = zeros(size(data , 2));

  for epoch = 1:max_iter

    for i = 1:10
      for j = 1:10

        y = w(:, j)' * data(:,  i);

        y_pred = double(y > 0);

        e = prediction(j, i) - y_pred;

        w(:, j) = w(:, j) + eta * e * data(:, i);
      end
    end

  end
  %fn end
end
