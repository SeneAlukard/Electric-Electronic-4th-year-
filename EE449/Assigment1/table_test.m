function T = table_test(data)
    if nargin < 1
        data = rand(10); % Generate random data if no input is given
    end

    rowNames = arrayfun(@(x) sprintf('NN for Number  "%d" ', x), 0:9, 'UniformOutput', false);
    colNames = arrayfun(@(x) sprintf('Number "%d" ', x), 0:9, 'UniformOutput', false);
    T = array2table(data, 'RowNames', rowNames, 'VariableNames', colNames);
end

