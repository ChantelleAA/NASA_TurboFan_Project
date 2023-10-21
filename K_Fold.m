function Treated_Data = K_Fold(Original_Train, Original_Train_RUL, k)
    
    % Assuming the unit values are in the first column of Original_Train
    unique_units = unique(Original_Train(:, 1));  % Get unique unit values
    
    % Create indices for k-fold cross-validation based on unique units
    unit_indices = crossvalind('Kfold', length(unique_units), k);
    
    for i = 1:k
        % Get unit indices for the current fold
        current_units = unique_units(unit_indices == i);
    
        % Extract rows from Original_Train where the unit values match current_units
        unit_rows = ismember(Original_Train(:, 1), current_units);
        
        [Train,C,S] = zscore(Original_Train(unit_rows, 2:end));  % Exclude the first column
        Train_RUL = Original_Train_RUL(unit_rows);
        Validation = normalize(Original_Train(~unit_rows, 2:end), "center", C, "scale", S);

        Treated_Data = [Train Train_RUL Validation];
    end

end

% how to modify the function so it considers the first column of the training data which has unit values that repeat for all observations belonging to the same unit, so that k-fold cross validation is done based on the number of unique unit values instead of the number of unique observations in the training set