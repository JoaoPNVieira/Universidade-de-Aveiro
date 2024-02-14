clear; clc;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2022/23]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL02 - Probabilidade e Variáveis Aleatórias ]
[2.2  Variaveis e distribuições aleatórias ]

%}
%% EXERCÍCIO 9
%{
    Considere a variavel aleatoria X, representativa das classificações 
    dos alunos de um determinado curso, contínua e com distribuição normal
    (media de 14 e desvio padrao 2). 
    Obtenha atraves de simulação uma estimativa para as seguintes 
    probabilidades de:
    
    a) Um aluno do curso ter uma classificação entre 12 e 16;

%}
    % mean() ---> Média | std() ---> desvio padrão

    N = 1e6;                    % Nº de Alunos
    X = randn(1, N);            % randn: Media = 0 | Desvio Padrão = 1;
    Z = normcdf(X,14,2);
    dp = 2;                     % desvio padrão = 2
    med = 14;                   % média = 14
    Y = 14 + 2*X;               % 
    cf = sum( Y > 12 & Y < 16); % casos favoráveis
    p9a = cf/N;                 % Probabilidade pretendida
    
    fprintf('9a.) P (um aluno do curso ter uma classificação entre 12 e 16) = %.16f', p9a);
    fprintf('\n')
%{
    b) Os alunos terem classificações entre 10 e 18;
%}
    
    cf = sum(Y >= 10 & Y <= 18);    % casos favoráveis
    p9b = cf/N;                     % Probabilidade pretendida

    fprintf('9b.) P (os alunos terem classificações entre 10 e 18) = %.16f', p9b);
    fprintf('\n')

%{
    c) Um aluno passar (ter classificação maior ou igual a 10);
%}

    cf = sum (Y >= 10);
    p9c = cf/N;

    fprintf('9c.) P (aluno passar com nota>= 10) = %.16f', p9c);
    fprintf('\n')

%{
    d) Verifique a correção dos resultados anteriores usando a função 
       Matlab: normcdf().
%}
    
    Z = normcdf(Y,14,2);
    histogram(Z)
    