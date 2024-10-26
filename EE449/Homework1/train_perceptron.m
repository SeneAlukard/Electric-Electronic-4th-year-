function [w, bias] = train_perceptron(data, prediction, bias, eta, max_iter)

  prediction 

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
  w = rand(size(data, 1), 1) * 0.01

  y = zeros(size(data , 2), 1);

  eta = 0.45;

  for epoch = 1:max_iter
    for i = 1:4
      y = w' * data(:,i)

      y = double(y > 0)

      e = prediction(i) - y

      w = w + eta * e * data(:, i)

    end

    m = [0; 0; 0; 0];

    for k = 1:4
      m(k) = w'  * data(:, k);
    end

    m = double(m > 0);
    err = prediction - m; 
    if err == 0
      break;
    end

  end

end
