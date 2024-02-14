%function out = option4(movieData)
movieData = readcell('movies.csv','Delimiter',',');
t = tic;
K = 150;
movieName = 'Toy';
% Get movie names
movies = movieData(:,1);

%Get number of movies
nMovies = length(movieData);

%Assinaturas(Mover para outro)
signs = inf(nMovies+1,K);

for n = 1:nMovies 
    chave = num2str(movies{n});
    h_out = muxDJB31MA(chave, 127,K);
    signs(n,:) = min(h_out,signs(n,:));
end 

chave = num2str(movieName);
h_out = muxDJB31MA(chave, 127,K);
signs(nMovies+1,:) = min(h_out,signs(nMovies+1,:));

for N = 1:nMovies    
    J(1,N) = sum(signs(nMovies+1,:) ~= signs(N,:))/K;
end
toc(t)

% 
% out = pares(J, Nu, users, threshold);

%end