function genreList = option1(movieData)

% Create an genre only cell array
totalGenres = movieData(:, 3:end);
% Reshape array to vector
totalGenres = reshape(totalGenres,1,numel(totalGenres));
temp = 1;
ti = {};

% Remove missing cells
for i = 1:length(totalGenres) -1 
    if ismissing(totalGenres{i}) ~= 1
        ti{temp} = totalGenres{i};
        temp = temp +1;
    end
end

clear i; 
clear totalGenres; 
clear temp;

% Get unique genres
genreList = unique(ti);
clear ti;                                                    
end                    