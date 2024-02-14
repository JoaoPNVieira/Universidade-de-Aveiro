function minHashOp5()
    load('datamaker.mat', 'movieData', 'signaturesOp5', 'genreList');

    userInput = input('Select one or more genres (separated by '','' ): ', 's');
    selectedGenres = strsplit(userInput, ',');

    % Verificar se os gêneros selecionados são válidos
    if ~all(ismember(selectedGenres, genreList))
        disp('Invalid genres. Please enter valid genres.');
        return;
    end

    % Gerar assinatura para os gêneros selecionados
    userSignature = generateSignature(selectedGenres);

    % Calcular a semelhança de Jaccard entre input e os filmes
    similarities = calculateSimilarities(userSignature, signaturesOp5);

    % Ordenar filmes com base na semelhança (ordem decrescente)
    [~, sortedIndices] = sort(similarities, 'descend');

    % Exiba os 5 melhores filmes (semelhança Jaccard)
    disp('Top 5 movies similar to selected genres:');
    disp('------------------------------------------');
    for i = 1:min(5, length(sortedIndices))
        movieIndex = sortedIndices(i);
        movieName = movieData{movieIndex, 1};
        movieYear = movieData{movieIndex, 2}; 
        genre = movieData(movieIndex, 3:end);
        similarity = similarities(movieIndex);

        % Vê se o filme tem pelo menos 1 genero
        l = 0;
        if ~isempty(genre)
            for k = 1:length(genre)-1
                if ismissing(genre{k}) == 0
                    l = l+1;
                end
            end
            fprintf('%d. %s (Year: %d, Jaccard Similarity: %.4f)\n', i, movieName, movieYear, similarity/l);
            fprintf('   Genres: ');
            % Genero do Filme
            for k = 1:length(genre)-1
                if ismissing(genre{k}) == 0
                    fprintf('%s; ', genre{k})
                end
            end
            fprintf('\n ');
        else
            fprintf('%d. %s (Year: %s, Jaccard Similarity: %.4f)\n', i, movieName, movieYear, similarity/l);
            fprintf('   Genres: N/A\n');
        end
    end
end

function signature = generateSignature(selectedGenres)
    K = 100;

    % Gera MinHash para os generos
    signature = inf(1, K);
    for i = 1:length(selectedGenres)
        genre = selectedGenres{i};
        if ~ismissing(genre)
            h_out = muxDJB31MA(genre, 127, K);
            signature = min(h_out, signature);
        end
    end
end

function similarities = calculateSimilarities(userSignature, movieSignatures)
    intersection = sum(userSignature == movieSignatures, 2);
    unionSet = sum(userSignature | movieSignatures, 2);
    similarities = intersection ./ unionSet;
end

