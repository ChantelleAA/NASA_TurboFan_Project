function RUL = GetRUL(OriginalData)
    index = unique(OriginalData(:,1));    % get list of unique units in the data
    UnitNum = size(index,1);    % get the total number of units in the data
    for i=1:UnitNum % iterate over the number of units in the data
        mid = find(OriginalData(:,1)==i);    % obtain the index of all rows in the data whose unit or first column is equal to the uniot number represented in the counter for the loop.
        ObsNum(i,1) = size(mid,1); % obtain the number of observations corresponidng to the unit number.
    % by the end of the for loop, obsum will be a row vector with unit
    % number number of values, and with those values being the number of
    % observations for each unit number.
    end
    num = 0;
    for i = 1:UnitNum % looping over the number of units in the data.
        for j = 1:ObsNum(i) % looping over the number of obsevrations in a unit
            RUL(num+j,1) = ObsNum(i)+1-j;   % Get RUL of each observation
        end
        num = num+ObsNum(i);
    end
end