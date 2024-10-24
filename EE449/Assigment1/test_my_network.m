function m_test = test_my_network(data, bias, network)

data = [bias; data];

m_test = ones(10,1);

for i = 1:10  
    for j = 1:10  
        
        m_test(j, i) = network(:, j)' * data(:, i); 
    end
end

m_test = m_test > 0;

%fn end
end

