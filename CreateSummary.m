% Function to create a data summary table given an array of data.

function dataSummary = CreateSummary(data, varN)
    nobs = length(data(:,1)); % number of observations (n)
    nvar = length(data(1,:)); % number of variables (p)
        
    for i = 1:nvar
        Count(i)    = nnz(~isnan(data(:,i))); % number of nonzero values in each col of the dataset
        Mean(i)     = mean(data(:,i)); % mean of value column
        SD(i)       = std(data(:,i)); % standard deviation of each column
        Min(i)      = min(data(:,i)); % minimum value of each column
        P25(i)      = prctile(data(:,i), 25); % value at the 25th percentile of column
        P50(i)      = prctile(data(:,i), 50); % median of column
        P75(i)      = prctile(data(:,i), 75); % value at the 75th percentile of column
        Max(i)      = max(data(:,i)); % maximum value of each column
    end
    
    dataSummary = table(Count', Mean', SD', Min', P25', P50', P75', Max', 'VariableNames', {'Count', 'Mean', 'SD', 'Min', 'P25', 'P50', 'P75', 'Max'}, ...
        'RowNames',varN);
end