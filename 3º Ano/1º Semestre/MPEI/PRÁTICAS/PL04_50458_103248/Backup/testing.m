%% ########################################################################
%% TESTES: Constroi a estrutura de dados para Problema 2

    
    movieData = readcell('movies.csv', 'Delimiter', ',');

    % Extract genre information
    totalGenres = movieData(:, 3:end);

    % Remove missing cells
    for i = 1:numel(totalGenres)
        if ismissing(totalGenres{i})
            totalGenres{i} = [];
        end
    end

    % Concatenate non-empty elements
    totalGenres = [totalGenres{:}];

    % Calculate parameters for Counting Bloom Filter
    m = numel(unique(totalGenres));
    n = 8 * m;
    k = round((n * log(2)) / m);

    % Initialize BloomFilter
    BloomFilter = false(1, n);

    % Fill the Counting Bloom Filter
    for i = 1:k
        h = DJB31MA(totalGenres, 127);
        h = mod(h, length(BloomFilter)) + 1;
        BloomFilter(h) = true;
    end

    % Save necessary variables to a file
    save('datamaker', 'movieData', 'totalGenres', 'BloomFilter', 'm', 'k');