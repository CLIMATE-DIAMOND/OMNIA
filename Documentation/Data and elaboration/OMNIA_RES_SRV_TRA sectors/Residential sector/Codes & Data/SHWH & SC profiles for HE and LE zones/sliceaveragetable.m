function newTable = sliceaveragetable(inputTable,regionAcronyms)


%This matlab function script that takes tables that include 24 hour temporal data 
% horizontally and separate the data in 5 time slices of 5, 4, 5 and 5 hours respectively and 
% find the average of the value in each timeslice. then create new tables that instead of the 
% 24 hour temporal data have just 5 data points one for each time slice.

    
    % % Get the variable names from the input table
    % varNames = inputTable.Properties.VariableNames;
    regionAcronyms = regionAcronyms(:);
    % Preallocate a matrix for the new data
    newData = zeros(height(inputTable), 5);
    
    % Loop over each row in the table
    for i = 1:height(inputTable)
        rowData = (inputTable(i, :)); % Convert row to array
        
        % Define time slices
        slice1 = rowData(1:5);   % First 5 hours
        slice2 = rowData(6:9);   % Next 4 hours
        slice3 = rowData(10:14); % Next 5 hours
        slice4 = rowData(15:19); % Next 5 hours
        slice5 = rowData(20:24); % Last 5 hours
        
        % Compute the average of each time slice
        newData(i, 1) = sum(slice1);
        newData(i, 2) = sum(slice2);
        newData(i, 3) = sum(slice3);
        newData(i, 4) = sum(slice4);
        newData(i, 5) = sum(slice5);
    end

    % Create the table with data
newTable = array2table(newData, 'VariableNames', {'Slice1', 'Slice2', 'Slice3', 'Slice4', 'Slice5'});

% Add row names using the acronyms of the regions
newTable.Properties.RowNames = regionAcronyms;
    
    % % Create a new table with the averaged data
    % newTable = newData; %array2table(newData, array2str(regions), {'Slice1', 'Slice2', 'Slice3', 'Slice4', 'Slice5'});
    % 
    % % Add row names if the original table has row names
    % if ~isempty(inputTable.Properties.RowNames)
    %     newTable.Properties.RowNames = inputTable.Properties.RowNames;
    % end
end
