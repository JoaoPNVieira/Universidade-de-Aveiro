clear; clc;

% Define the total number of cards and the number to choose
totalCards = 50;
chooseCards = 5;

% Generate all possible combinations
combinations = nchoosek(1:totalCards, chooseCards);

% Initialize an empty array to store valid combinations
validCombinations = [];

% Initialize the progress bar
progressBarLength = 50; % Length of the progress bar
fprintf('Progress: |%s|\n', repmat(' ', 1, progressBarLength));
fprintf('          ');

% Define a function to check for consecutive numbers
hasConsecutive = @(comb) any(diff(comb) == 1) || any(diff(comb) == 2);

% Iterate through each combination
for i = 1:size(combinations, 1)
    combination = combinations(i,:);
    
    % Check if there are 5, 4, or 3 numbers in a row
    if ~hasConsecutive(combination)
        % If no 5, 4, or 3 numbers in a row, add it to validCombinations
        validCombinations = [validCombinations; combination];
    end
    
    % Update the progress bar
    percentComplete = i / size(combinations, 1) * 100;
    progress = round(percentComplete / 100 * progressBarLength);
    fprintf(repmat('#', 1, progress));
    fprintf(repmat(' ', 1, progressBarLength - progress));
    fprintf(' %.2f%%', percentComplete);
    fprintf('\b\b\b\b\b\b\b\b\b\b'); % Move the cursor back to overwrite the progress
end

% Save valid combinations to a text file
fileID = fopen('valid_combinations.txt', 'w');
for i = 1:size(validCombinations, 1)
    fprintf(fileID, '%d ', validCombinations(i,:));
    fprintf(fileID, '\n');
end
fclose(fileID);

% Display a message indicating the file has been saved
fprintf('\nValid combinations have been saved to "valid_combinations.txt".\n');
