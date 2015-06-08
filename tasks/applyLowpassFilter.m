function data = applyLowpassFilter(filterWidth, data)
    coefs = gausswin(filterWidth)/sum(gausswin(filterWidth));
    
    for i=1:length(data)
        dataArray = cell2mat(data(i));
        filteredDataArray = filter(coefs, 1, dataArray);
        %data(i) = mat2cell(filteredDataArray); % decprecated syntax
        data(i) = {filteredDataArray};
    end
end
    