clear; clc;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNOS: JOÃO PEDRO NUNES VIEIRA
        JOSÉ MIGUEL GUARDADO SILVA

NºMEC.: 50458
        103248

CURSO: LECI
################################

[ PL04 - Algoritmos Probabilísticos ]
%}
%% [ DATAMAKER ]
%{
    UTILIDADE: Ler o ficheiro de entrada e criar a estrutura de dados
necessária que irá armazenar todos os dados necessários para implementar as 
opções da aplicação:    

    Opção 1 - Display de generos

    Opção 2 - Counting Bloom Filter
                DÁ Nº DE FILMES DE GENERO XPTO
    Opção 3 - Counting Bloom Filter
                DÁ Nº DE FILMES DE GENERO E ANO XTOP 1234
    Opção 4 - Minhash
                Ver quais os tipos mais parecidos a tring e verificar quais são os mais similares (5) Filmes e indicar os seus generos
    Opção 5 - Similaridade em generos
                Quais os filmes (ordenados de mais recente para antigo) de similares em relação a generos

%}
%% ########################################################################
%% Constroi estrutura de dados para armazenar a lista de géneros (únicos) por filme
    movieData = readcell('movies.csv','Delimiter',','); % Cell array dos filmes
    totalGenres = movieData(:, 3:end); % Cell array de géneros
    totalGenres = reshape(totalGenres,1,numel(totalGenres)); 
    temp = 1; allMovieGenders = {};
    
    % Remover "missing" cells
    for i = 1:length(totalGenres) -1 
        if ismissing(totalGenres{i}) ~= 1
            allMovieGenders{temp} = totalGenres{i};
            temp = temp +1;
        end
    end
    
    % Obter géneros únicos
    genreList = unique(allMovieGenders);
    clear i; clear totalGenres; clear temp;          
%% ########################################################################
%% Constroi a estrutura de dados para OPÇÃO 2

    % Parametros do Counting Bloom Filter
    m = length(allMovieGenders);
    n = 8 * m;
    %k = round((n * log(2)) / m);

    % Inicializar o Counting Bloom Filter
    BloomFilterGender = zeros(1, n);

    % Preencher o Counting Bloom Filter
    for i = 1:m
        hashcode = mod(hashstring(allMovieGenders{i}, n), n) + 1;
        BloomFilterGender(hashcode) = 1;
    end

%% ########################################################################
%% Constroi a estrutura de dados para OPÇÃO 3
    
    totalYearsAndGenres = movieData(:, [2, 3:end]);
    totalYearsAndGenres = reshape(totalYearsAndGenres,1,numel(totalYearsAndGenres));
    temp = 1; allYearsGenders = {};
    
    % Remover "missing" cells
    for i = 1:length(totalYearsAndGenres) -1 
        if ismissing(totalYearsAndGenres{i}) ~= 1
            allYearsGenders{temp} = totalYearsAndGenres{i};
            temp = temp +1;
        end
    end
    
     % Parametros do Counting Bloom Filter
    m = length(allYearsGenders);
    n = 8 * m;
    %k = round((n * log(2)) / m);

    % Inicializar o Counting Bloom Filter
    BloomFilterGenderYear = zeros(1, n);

    % Preencher o Counting Bloom Filter
    for i = 1:m
        hashcode = mod(hashstring(allYearsGenders{i}, n), n) + 1;
        BloomFilterGenderYear(hashcode) = 1;
    end
%% ########################################################################
%% Constroi a estrutura de dados para OPÇÃO 4

    % Extract movie names and genres
    movieNames = movieData(:, 1);
    genres = movieData(:, 3:end);

    % Create a set of unique words across all movie names
    allWords = unique(strsplit(strjoin(movieNames, ' ')));

    % Parameteros do MinHash
    Nu = length(movieNames);
    K = 100;                    

    signaturesOp4 = inf(Nu, K);

    % Gerar assinaturas para cada filme
    for n = 1:Nu
        movieNameSet = unique(strsplit(movieNames{n}, ' '));
        for i = 1:length(movieNameSet)
            word = movieNameSet{i};
            h_out = muxDJB31MA(word, 127, K);
            signaturesOp4(n, :) = min(h_out, signaturesOp4(n, :));
        end
    end

%% ########################################################################
%% Constroi a estrutura de dados para OPÇÃO 5

    % Extract genres
    genres = movieData(:, 3:end);
    
    % Parameteros do MinHash
    Nu = size(genres, 1);
    K = 100;
    
    % Initialize signatures for Option 5
    signaturesOp5 = inf(Nu, K);
    
    % Generate signatures for each movie
    for n = 1:Nu
        genreSet = strsplit(genres{n}, ',');
        for i = 1:numel(genreSet)
            currentGenre = strtrim(genreSet{i}); 
            if ~isempty(currentGenre) && ~strcmp(currentGenre, 'N/A')
                h_out = muxDJB31MA(currentGenre, 127, K);
                signaturesOp5(n, :) = min(h_out, signaturesOp5(n, :));
            end
        end
    end
    


% Save necessary variables to a file
save('datamaker', 'genreList', 'movieData', 'BloomFilterGender', ...
    'BloomFilterGenderYear','signaturesOp4', 'signaturesOp5', 'm','K');