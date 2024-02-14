function moviesByGenre()
    load ('datamaker.mat','BloomFilterGender','genreList')
    estimatedCount = 0;
    genderSelect = input('Select a genre: ', 's');

    % Verificar se o genero existe
    if ~ismember(genderSelect, genreList)
        disp('Invalid genre. Please enter a valid genre: ');
        return;
    end
    
    for i = 1:length(BloomFilterGender)
        index = mod(hashstring(genderSelect, length(BloomFilterGender)), length(BloomFilterGender)) + 1;
        if BloomFilterGender(index) == 1
            estimatedCount = estimatedCount +1;
        end
    end
    % % Counting Bloom Filter para o genero selecionado
    % genreIndex = find(strcmp(unique(totalGenres), genderSelect));
    % BloomFilterGenre = BloomFilterGender(genreIndex, :);
    % 
    % % Estimatar Nº de filmes com o genero selecionado
    % estimatedCount = movieCount(BloomFilterGenre, m, k);

    fprintf('Estimated number of movies with genre %s: %d\n', genderSelect, estimatedCount);
end
% function count = movieCount(BloomFilterGenre, m, k)
%     estimate = Inf;
% 
%     for i = 1:k
%         h = DJB31MA([num2str(i) num2str(find(BloomFilterGenre))], 127);
%         h = mod(h, numel(find(BloomFilterGenre))) + 1;
%         estimate = min(estimate, BloomFilterGenre(h));
%     end
% 
%     count = round(m * log(1 / (estimate / m)) / k);
% 
%     count = max(0, count);
% end