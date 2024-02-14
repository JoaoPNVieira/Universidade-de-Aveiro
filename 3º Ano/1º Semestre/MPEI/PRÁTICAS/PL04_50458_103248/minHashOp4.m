function minHashOp4()
    load('datamaker.mat', 'movieData', 'signaturesOp4');

    % Pede o nome do filme
    userInput = input('Insert a string: ', 's');

    % Cria as Assinaturas
    userSignature = generateSignature(userInput);

    % Calcula a Semelhança entre o Nome posto pelo User e Os Filmes 
    similarities = calculateSimilarities(userSignature, signaturesOp4);

    % Ordena Por Ordem Decrescente de Jaccard
    [~, sortedIndices] = sort(similarities, 'descend');

    % Diplay dos 5 Filmes Mais Proximos
    disp('Top 5 Movies Similar to the Inserted String:');
    disp('------------------------------------------');
    for i = 1:min(5, length(sortedIndices))
        movieIndex = sortedIndices(i);
        movieName = movieData{movieIndex, 1};
        genre = movieData(movieIndex, 3:end);
        similarity = similarities(movieIndex);

        %Nº na ordem e Titulo
        fprintf('\n %d. %s (Genres: ', i, movieName);
        
        % Genero do Filme
        for k = 1:length(genre)-1
            if ismissing(genre{k}) == 0
                fprintf('%s; ', genre{k})
            end
        end

        %Jaccard Similarity
        fprintf(')(Jaccard Similarity: %.4f)', similarity);
        % ------------------------------------------------
    end
end


function signature = generateSignature(inputString)
    K = 100;

    % Converte String para um Set de Words
    words = unique(strsplit(inputString, ' '));

    % Cria MinHash para a String
    signature = inf(1, K);
    for i = 1:length(words)
        word = words{i};
        h_out = muxDJB31MA(word, 127, K);
        signature = min(h_out, signature);
    end
end

function similarities = calculateSimilarities(userSignature, movieSignatures)
    similarities = sum(userSignature == movieSignatures, 2) / length(userSignature);
end

