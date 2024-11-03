%desired values 1x1707, 1707 number
xtest_target = load("dzip.mat");
test_target = xtest_target.dzip;

%drawings 256x1707   16x16 in total 1707 drawing
xtest_input = load("azip.mat");
test_input = xtest_input.azip;


%test desired value 1x2707
xtrain_target = load("dtest.mat");
train_target = xtrain_target.dtest;

%test drawing value 256x2707
xtrain_input = load("testzip.mat");
train_input = xtrain_input.testzip;

net = feedforwardnet([20, 10]);

net = configure(net, train_input, train_target);

[net, tr] = train(net, train_input, train_target);


output = net(test_input);
errors = test_target - output;


performance = perform(net, test_target, output);







