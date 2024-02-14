clear; clc;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL04 - Algoritmos Probabilísticos ]
%}
%% [ SECÇÃO PARA AVALIAÇÃO ]
%{
    Considere uma aplicação com funcionalidades de um sistema online de
    disponibilização de filmes. A aplicação deve considerar um conjunto de
    utilizadores identificados por um ID e um conjunto de filmes
    identificados por um ID.
    
    Dados de entrada:
    1) Ficheiro u.data:
        - 1ª Coluna: ID User
        - 2ª Coluna: ID Filme 
        - 3ª Coluna: Rating

    2) Ficheiro users.txt e contem info sobre cada user, onde cada n ID corresponde a linha n
        e onde cada coluna está separada por ";":
        - 1ª Coluna: ID User
        - 2ª Coluna: Nome Prórpio
        - 3ª Coluna: Apelido
        - Restantes Colunas: Interesses

        dic = readcell('users.text','Delimiter',';') - Cria um cell array
        dic, em que a célula {i,j} contém a informação da linha i e coluna
        j do ficheiro.

    3) Ficeiro filminfo.txt: Contem informação sobre os filmes. Cada coluna
    está separada por tabs:
        - Linha: ID do Filme
        - 1ª Coluna: Título e ano de estreia
        - Restantes Colunas: Géneros cinematográficos
___________________________________________________________________________
    
    Descrição da aplicação a desenvolver:
    
    1) A aplicação deve começar por pedir um ID do filme (válido no u.data): 
Insert Film ID (1 to 1682).
    
    2) A aplicação deve permitir ao utilizador 5 opções:
    
        1 - Users that evaluated current movie:
        
            Lista os nomes dos users que avaliaram o filme actual (1 por 
            linha): ID + Nome de user

        2 - Suggestion of users to evaluate movie
            
            Determina os 2 filmes mais similares ao atual (em termos de
            utilizadores que os avaliaram) e apresenta

        3 - Suggestion of users to based on common interests
        4 - Movies feedback based on popularity
        5 - Exit


    
%}

function [dataSet,dic,dic2] = datamaker(file)

    % E1 - u.data:
    data = load(file); % ---------> Carrega o ficheiro u.data
    userID  = data(:,1); % ---> Extrai os IDs dos utilizadores
    movieID = data(:,2); % ---> Extrai os IDs dos filmes
    rating = data(:,3); % ----> Extrai os ratings dos filme
    clear data;
    matrizData = [userID, movieID, rating];
    dic     = readcell('users.txt','Delimiter',';') % --------> Cell array users
    dic2    = readcell('film_info.txt','Delimiter','/t') % ---> Cell array filmes    
    uData = {userID, movieID, rating} % --------------------> Cell array u.data

    % Inicializar Bloom Filter:
    m = length(dic);
    n = 8*m; 
    k = round(0.693*n / m);
    B = inicializar(n);

    % Inserir elementos(users):
    for i = 1:m
        B = inserir(B,dic{i},k); 
    end
    fn = 0;

    % Verificar elementos(u.data)
    for i = 1:m
        r = verificar(B,uData{i},k)
        if r
            fprintf(1,"%s esta no Filtro \n",uData{i});            
        else
            fprintf(1,"%s NÃO ESTA no Filtro \n",uData{i});
            fn = fn+1;
        end
    end

    fprintf(1,"Falsos Negativos: %d\n",fn);

end

%% ------------------------------------------------------------------------
%% FUNÇÕES A USAR EM DATAMAKER:
%   
%   
%   
%   
%   
%   
%% ------------------------------------------------------------------------    
%% Determinar distancia de Jaccard
 
function J = jaccardDistance (users,Set)

    Nu= length(users); % Nº total de utilizadores
      
    J=zeros(Nu,Nu); %  Array de distancias
    h= waitbar(0,'A calcular...');
    
    for n1= 1:Nu,
        waitbar(n1/Nu,h);
        for n2= n1+1:Nu,
            i = intersect(Set{n1},Set{n2});
            u = union(Set{n1},Set{n2});
            J(n1,n2) = 1 - (length(i) / length(u));
        end
    end
    delete (h)
end
%% ------------------------------------------------------------------------
%% Obter users similares com distância de Jaccard abaixo do limiar
function SimilarUsers = getSimilarities (users, J,threshold)
    Nu= length(users);
    SimilarUsers= zeros(1,3);
    k= 1;
    
    for n1= 1:Nu,
        for n2= n1+1:Nu,
            if J(n1,n2) < threshold
                SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
                k= k+1;
            end
        end
    end
    save('JaccardDistances.mat','J'); % GUARDAR MATRIZ DE DISTANCIAS
end
%% ------------------------------------------------------------------------
%% Bloom Filter :
% 1) Inicializar:
function B = inicializar (n)
  B=zeros(1,n,'uint8');
end
% .............
% 2.1) Inserir:
function B = inserir (B,elem,k)
    n = length(B);
    key=elem;
  
    for i=1 : k
        key=[key num2str(i)] ; 
        pos = string2hash(key);
        pos = mod(pos,n)+1;
        B(pos) = 1;
    end
end

% 2.2) Inserir (Counting Bloom):
function B = inserirCounting (B,elem,k)
    n = length(B);
    key=elem;

    for i=1 : k
        key=[key num2str(i)] ; 
        pos = string2hash(key);
        pos=mod(pos,n)+1;
        B(pos) = B(pos) + 1;
    end
end
% .............
% 3) Verificar:
function r = verificar (B,elem,k)
    n = length(B);
    key=elem;
    r=true;
  
    for i=1 : k
        key=[key num2str(i)]  ;
        pos = string2hash(key);
        pos=mod(pos,n)+1;
        if B(pos)==0
            r=false;
            break
        end
    end
end
%% ------------------------------------------------------------------------
%% minHash
function signatures = minHash (Set)
    numSet = length(Set);  %Nº de elementos do conjunto
    numHash = 100;       
    primo = 100103;    % Nº primo alto
    vals_1 = randi([1,(primo-1)],1,numHash);
    vals_2 = randi([1,(primo-1)],1,numHash);
  
    signatures = zeros(numHash,numSet); % Cada linha -> Conjunto entrada ; 
                                        % Cada coluna - Fazer hashing do set de entrada
  
    h= waitbar(0,'A calcular...');
  
    for i = 1 : numSet
        waitbar(i/numSet,h);
        for j = 1 : numHash
            hK = zeros(length(Set(i)));
            for k=1 : length(Set(i))
                hK(k) = mod(vals_1(j) * Set{i}(k) + vals_2(j),primo);
            end
            signatures(j,i) = min(hK);
        end
    end

    delete (h)
end
% .............
% minHashSimilares:
function minHashSimilares (users,signatures,threshold)
  
    Nu = length(users);
    threshold = 1-threshold;
    h= waitbar(0,'Getting similars');
      for n1 = 1:Nu
        waitbar(n1/Nu,h);
    
        for n2= n1+1:Nu
          dist = sum(signatures(:,n1) == signatures(:,n2))/100;
          if dist > threshold  
            fprintf("Distance: %f -> user 1: %d ; user 2: %d\n",dist,users(n1),users(n2));
          end
        end
      end
    delete(h)
end
%% ------------------------------------------------------------------------
%% string2hash
function hash = string2hash (str)


    str=double(str);
    if(nargin<2), type='djb2'; end
    switch(type)
        case 'djb2'
            hash = 5381*ones(size(str,1),1); 
            for i=1:size(str,2)
                hash = mod(hash * 33 + str(:,i), 2^32-1); 
            end
        case 'sdbm'
            hash = zeros(size(str,1),1);
            for i=1:size(str,2) 
                hash = mod(hash * 65599 + str(:,i), 2^32-1);
            end
        otherwise
            error('string_hash:inputs','unknown type');
    end
end


