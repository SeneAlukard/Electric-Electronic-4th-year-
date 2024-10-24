function prediction = test(data,  bias, network)


  data = [bias; data];

  prediction = data(:, 1);

  for i = 1:4
    prediction(i , 1) = network' * data(:,i);

  end

  prediction = double(prediction > 0);

end
