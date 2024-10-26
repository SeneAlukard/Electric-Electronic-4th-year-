addpath('./');

unprocessed_data = cell(1, 10);

for output_number = 1:10
  unprocessed_data{output_number} = zeros(7,5);
end

%  Creating 0 in Matrix 
unprocessed_data{1}(2:6,2:2:4) = 1;
unprocessed_data{1}(2:4:6, 3) = 1;

%   Creating 1 in Matrix
unprocessed_data{2}(2:6,3) = 1;
unprocessed_data{2}(3, 2) = 1;
%unprocessed_data{2}(3:6:9) = 1;

%   Creating 2 in Matrix
unprocessed_data{3}(2:2:6,2:4) = 1;
unprocessed_data{3}(2:3,4) = 1;
unprocessed_data{3}(4:6,2) = 1;

%   Creating 3 in Matrix
unprocessed_data{4}(2:2:6, 2:4) = 1;
unprocessed_data{4}(2:6,4) = 1;

%   Creating 4 in Matrix
unprocessed_data{5}(2:4, 2) = 1;
unprocessed_data{5}(2:6, 4) = 1;
unprocessed_data{5}(18) = 1;

%   Creating 5 in Matrix
unprocessed_data{6}(2:2:6, 2:4) = 1;
unprocessed_data{6}(3,2) = 1;
unprocessed_data{6}(5,4) = 1;

%   Creating 6 in Matrix
unprocessed_data{7}(2:6,2) = 1;
unprocessed_data{7}(4:6,2:2:4) = 1;
unprocessed_data{7}(2:2:6,2:4) = 1;

%   Creating 7 in Matrix
unprocessed_data{8}(2,2:4) = 1;
unprocessed_data{8}(2:6,4) = 1;

%   Creating 8 in Matrix
unprocessed_data{9}(2:6,2:2:4) = 1;
unprocessed_data{9}(2:2:6,2:4) = 1;

%   Creating 9 in Matrix
unprocessed_data{10} = unprocessed_data{9};
unprocessed_data{10}(12) = 0;

%imshow, Showing created matrices in a fancy way
for i = 1:10
  imshow(unprocessed_data{i}, 'InitialMagnification', 'fit');
  pause(0.5)
end

unprocessed_noisy_data = unprocessed_data;


for output_number = 1:10
  %making noisy_data
  unprocessed_noisy_data{output_number}(3, 2) = 1;
  unprocessed_noisy_data{output_number}(4, 3) = 0;
  unprocessed_noisy_data{output_number}(5, 4) = 0;

  %imshsow, Showing created noisy matrices in a fancy way
  imshow(unprocessed_noisy_data{output_number}, 'InitialMagnification', 'fit');
  pause(0.5)
end

%creating fixed matrix to optimize
processed_data = zeros(35,10);

processed_data = zeros(35,10);
for output_number = 1:10
  processed_data(:,output_number) = unprocessed_data{output_number}(:);
end

for output_number = 1:10
  processed_noisy_data(:, output_number) = unprocessed_noisy_data{output_number}(:);
end

test = eye(10);

x = processed_data;
b = ones(1, 10);

[w, bias] = train_perceptron(processed_data, test);


m_test = test_my_network(processed_data, bias, w);

noisy_test = test_my_network(processed_noisy_data, bias, w);

noisy_T = table_test(noisy_test);

T = table_test(m_test);

disp(T);

disp("Noisy Test");

disp(noisy_T);
