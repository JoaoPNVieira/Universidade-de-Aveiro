clc;clear;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ MINITESTE PRÁTICO - 13/01/2023 ]

%}
%% EXERCÍCIO 1
%{
    Considere um jogo de tabuleiro simple de 2 jogadores.
    Cada jogador parte da casa 1 e ganha aquele que chegar mais depressa à
    casa "Meta".
    
    O percurso de cada jogador segue o diagrama apresentado (ver folhas).
    A escolha do percurso depende do resultado do lançamento de uma moeda
    (não equilibrada, diferente para cada casa).

    O resultado do lançamento depende do paramentro "alpha". Assuma que
    alpha = [0.2, 0.3, 0.1, 0.45]
%}
% a) Represente a matriz transição T
    %    a1   a2  a3   a4   a5
    a = [0.2, 0, 0.3, 0.1, 0.45];

    %    1        2   3        4        5       Meta
    T = [0      , 0 , 0      , 0      , 0      , 0;     % 1
         a(1)   , 0 , 0      , 0      , 0      , 0;     % 2
         0      , 0 , 0      , a(4)   , a(5)   , 0;     % 3
         0      , 0 , a(3)   , 0      , 1-a(5) , 0;     % 4
         1-a(1) , 1 , 1-a(3) , 0      , 0      , 0;     % 5
         0      , 0 , 0      , 1-a(4) , 0      , 1];    % Meta

   Est = sum(T);

   fprintf("\n 1a) \n")
   disp(T);
   disp(Est);

% b) Determine o percurso mais pequeno (trajecto c\menor nº de casas) até à Meta
    
    p1_5 = T(5,1);  % Probabilidade de ir de 1 até 5
    p5_4 = T(4,5);  % Probabilidade de ir de 5 até 4
    p4_meta = T(6,4); % Probabilidade de ir de 4 até Meta
    pcurto = p1_5 * p5_4 * p4_meta ;
    
    fprintf("\n 1b) \n")
    disp(pcurto);

% c) Determine o número médio de casa percorridas até absorção

    Q = T(1:5,1:5);
    O = T(1,1:5);
    R = T(6,1:5);
    I = T(6,6);

    F = inv(eye(5)-Q);
    t = ones(1,5)';
    t = F*t; % tempo médio até absorção
    nMedio = sum(t);

    fprintf("\n 1c) \n")
    disp(nMedio);

%% EXERCÍCIO 2
%{
    Considere a implementação de um filtro de Bloom para representar os
    elementos de um conjunto de palavras geradas aleatóriamente com
    caracteres de 'a' até 'z' (equiprováveis) e com comprimento de 5
    (probabilidade 40%) ou comprimento de 8 caracteres (probabilidade 60%).
%}
% a) Assuma que vai adicionar 300 palavras a um Bloom filter cuja função de
% dispersão (unica) deverá ter uma taxa de falsos positivos de 3%. 
% 
% Assim, determine o tamanho adequado do filtro de Bloom
  
    m = 300; % nº elementos a inserir
    Pfp = 3/100; % probabilidade de falsos positivos 
    % (Pfp = (1 - exp(-k * n / m))^k;)
    k = 1; % nº de hash functions

    n = - (m*log(Pfp))/((log(2))^2);




    % Round up to the nearest integer
    n = ceil(n);
    
    fprintf("\n 2a) \n")
    disp(n);

% b) Inicialize o filtro Bloom usando o tamanho 10000. De seguida inclua no
% filtro 300 palavras diferentes geradas aleatóriamente com as
% caracteristicas definidas a cima. Use a função de dispersão default
% providenciada pela função string2hash na implementação das funções do
% filtro Bloom. Finalmente determine por simulação a probabilidade de
% falsos positivos do filtro implementado, usando um conjunto adequado de
% palavras.

    N = 10^3;
    imin = 5;
    imax = 8;
    vec = 'a':'z';
    chaves = genKey(N,imin,imax,vec);
    pal = chaves(1:300);
    m = 300;
    %n = 10000;
    k = 1;
    
    BF = iniciar(n); % iniciar Bloom Filter
    for i = 1:m
        BF = inserir(BF,pal{i},k);
    end

    fp = 0;
    for i = m+1:length(chaves)
        out = pertencer(BF,chaves{i},k);
        if out 
            fp = fp + 1;
        end
    end
    
    percent = fp/100;
    fprintf("\n 2b) Falsos Positivos: %.4f %% \n", percent)

%% EXERCÍCIO 3
%{
    Considere as 4 frases seguintes:
        1.) Lisboa e Porto são duas cidades importantes de Portugal
        2.) Lisboa é a capital de Portugal.
        3.) Porto é a capital do Norte de Portugal
        4.) Portugal não é só Lisboa e Porto

    Implementando MinHash, determine as assinaturas de cada frase
    considerando todos os seus caracteres (incluindo ponto final e
    espaços), estime a distância de Jaccard entre todas as frases e
    apresente o par mais similar entre todas. Na implementação tem de usar
    a função de dispersão "hf1()" disponível em https://bit.ly/3LaAynd,
    aplicar 4 funções de dispersão, usar shingles de comprimento k=3
%}

    F1 = 'Lisboa e Porto são duas cidades importantes de Portugal';
    F2 = 'Lisboa é a capital de Portugal.';
    F3 = 'Porto é a capital do Norte de Portugal';
    F4 = 'Portugal não é só Lisboa e Porto';

    N = 4; %4 frases
    K = 4; % 4 funções de dispersão

    Set = {F1,F2,F3,F4};
    threshold = 0.1;
    assinaturas = inf(N,K);
    
    for i = 1:N
        shingle = Set{i}(1:3);
        h_out = hf24(shingle, K);
        assinaturas(i, :) = min(h_out, assinaturas(i, :));
    end

    for n1 = 1:N
        for n2= n1+1:N                 
            J(n1,n2) = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/K;
        end
    end
    
    SimilarUsers = pares(J, N, 1:N)
    




    
   