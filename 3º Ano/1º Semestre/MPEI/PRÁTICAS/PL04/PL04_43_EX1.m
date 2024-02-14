clear; 
clc;
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL04 - Algoritmos Probabilísticos ]
[ 4.3 Deteção de similaridade - Algoritmo MinHash ] 

    Criar e testar um modulo que suporte a descoberta de conjuntos similares 
(ex: [2, Cap. 3: Finding Similar Items]).

    Iremos utilizar o ficheiro u.data do conjunto de dados (release 4/1998) 
MovieLens 100k, disponível em http://grouplens.org/datasets/movielens/. 

    Este ficheiro contem informação sobre 943 utilizadores e 1682 filmes. 
    Tem cerca de 100 000 linhas, como as seguintes:
       
        196 242 3 881250949
        186 302 3 891717742
         22 377 1 878887116

    Sugestão: pode utilizar as palavras validas portuguesas do ficheiro
wordlist-preao-20201103.txt utilizado na secção de avaliac¸ao do guião PL03.

    As colunas são separadas por tabs. 
    1ª coluna contem o ID do utilizador. 
    2ª coluna contem o ID de um filme (avaliado pelo utilizador mencionado na primeira coluna). 
    3ª coluna contem a avaliação dada pelo utilizador.
    4ª coluna é um timestamp do momento da avaliação.

    O objectivo e descobrir utilizadores que avaliaram conjuntos similares de filmes. 
Para este objectivo as colunas 3 e 4 nao são necessárias.

%}
%% EXERCÍCIO 1
%{
    Analise o codigo Matlab disponibilizado no final desta secção e
complete-o por forma a conseguir calcular a distancia de Jaccard entre os 
conjuntos de filmes avaliados pelos varios utilizadores.
    Inclua no codigo a possibilidade de calcular o tempo que demora cada 
uma das partes (calculo da distancia e determinação das distancias abaixo 
de um determinado limiar). 
    Veja a informção relativa as funções Matlab tic, toc, cputime, etime.

    No final, o programa deve mostrar informação com: 
        1 - nº de pares de utilizadores com distancias inferiores ao limiar definido; 
        2 - informação sobre cada par (identificação dos utilizadores e distancia de Jaccard).

    Adicione, tambem, a capacidade de gravar em ficheiro a matriz de distâncias calculada. 
    Sugere-se que consulte a informação da função save.

%}
    % t2 = cputime;
    t = tic();
    udata=load('u.data');       % Carrega o ficheiro dos dados dos filmes
    
    % Apenas as duas primeiras colunas:
    u= udata(1:end,1:2); clear udata;

    % Lista de utilizadores:
    users = unique(u(:,1));     % Extrai os IDs dos utilizadores
    Nu = length(users);         % Número de utilizadores
    
    % Constroi lista de filmes para cada utilizador:
    Set= cell(Nu,1);                    % Usa celulas
    for n = 1:Nu                        % Para cada utilizador
        ind = find(u(:,1) == users(n)); % Obter os filmes de cada um
                                        % e guarda num array. Usa celulas porque utilizador tem um numero
                                        % diferente de filmes. Se fossem iguais podia ser um array
        Set{n} = [Set{n} u(ind,2)];
    end
    toc(t)
    t = tic;
    % cputime - t2;
    %% Calcula a distância de Jaccard entre todos os pares pela definicão.
    J=zeros(Nu,Nu);                     % array para guardar distancias
    % h= waitbar(0,'Calculating');      %

    for n1= 1:Nu                        % para cada user
    % waitbar(n1/Nu,h);                 %
        for n2= n1+1:Nu                 % outro user
            I = intersect(Set{n1},Set{n2});
            U = union(Set{n1},Set{n2});
            J(n1,n2) = 1 - length(I)/length(U);
        end
    end
    toc(t)
    % delete (h)
    t = tic;
    %% Com base na distância, determina pares com distância inferior a um limiar pré-definido
    threshold = 0.4; % limiar de decisão

    % Array para guardar pares similares (user1, user2, distância)
    SimilarUsers= zeros(1,3);
    k= 1;
    for n1= 1:Nu
        for n2= n1+1:Nu
            if J(n1,n2) < threshold
                SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
                k= k+1;
            end
        end
    end
    toc(t)
    fprintf("\nEx4.3.1.) Nº de Pares de utilizadores com distâncias inferiores ao limiar definido: %d ", length(SimilarUsers(:,1)));
    fprintf("\nEx4.3.1.) Pares de utilizadores com distâncias inferiores ao limiar definido: \n ");
    disp(SimilarUsers);
    save 'distJaccard.mat' 'J'