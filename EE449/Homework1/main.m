and = [0; 0; 0; 1];
or = [0; 1; 1; 1];

x1 = [0 , 0]';
x2 = [0 , 1]';
x3 = [1 , 0]';
x4 = [1 , 1]';



bias = ones(1, 4);

data = [x1 , x2, x3, x4];

[w, bias] = train_perceptron(data, or, bias);

prediction = test(data, bias, w); 
