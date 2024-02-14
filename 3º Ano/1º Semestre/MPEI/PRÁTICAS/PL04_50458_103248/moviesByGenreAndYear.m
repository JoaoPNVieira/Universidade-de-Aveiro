function moviesByGenreAndYear()
    load('datamaker.mat', 'genreList', 'BloomFilterGenderYear', 'm');
    n = 8 * m;
    k = round((n * log(2)) / m);

    userInput = input('Select a genre and year (e.g., Action,2000): ', 's');
    
    userInputParts = strsplit(userInput, ',');
    
    % Verificação se foram fornecidos genero e ano
    if numel(userInputParts) ~= 2
        disp('Invalid input. Please provide both genre and year separated by a comma.');
        return;
    end
    
    genreSelect = userInputParts{1};
    yearSelect = str2double(userInputParts{2});
    
    % Verificar se genero existe
    if ~ismember(genreSelect, genreList)
        disp('Invalid genre. Please enter a valid genre.');
        return;
    end

    % Verificar se o ano é válido
    if isnan(yearSelect) || ~isreal(yearSelect) || yearSelect < 1
        disp('Invalid year. Please enter a valid positive integer.');
        return;
    end

    % Iniciar: Counting Bloom Filter
    genreIndex = find(strcmp(genreList, genreSelect));
    BloomFilterGenreYear = BloomFilterGenderYear(1,genreIndex);

    % Estimar Nº de filmes com genero e ano selecionados
    estimatedCount = movieCount(BloomFilterGenreYear, m, k);

    % Display da contagem estimada
    fprintf('Estimated number of movies with genre %s in year %d: %d\n', genreSelect, yearSelect, estimatedCount);
end

function count = movieCount(BloomFilterGenreYear, m, k)

    estimate = 0;

    % Obter contagem minima, k funções hash
    for i = 1:k
        h = DJB31MA([num2str(i) BloomFilterGenreYear], 127); % Use a different seed for each hash function
        h = mod(h, numel(BloomFilterGenreYear)) + 1;
        estimate = min(estimate, BloomFilterGenreYear(h));
    end

    count = round(-m * log(1 - estimate / m) / k);
    % contagem não negativa:
    count = max(0, count);
end
