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
[2.1 Probabilidade condicional, independencia ]

%}
%% EXERCÍCIO 1
%{
   1.) Considere famílias com filhos em que a probabilidade de nascimento
de rapazes é igual à de nascimento deraparigas

    a) Obtenha porsimulacão uma estimativa da probabilidade do acontecimento
"ter pelo menos um filho rapaz" em famílias com 2 filhos.

%}
    N = 1e5; % Nº de experiências
    p = 0.5; % Probabilidade
    k = 1;   % Nº de filhos rapaz pretendidos
    n = 2;   % Nº de filhos por familia

    Exp = rand(n,N)>p; % Matriz Experiências 
    sucess = sum(Exp) >= k;  % vector sucessos
    prob_1a = sum(sucess)/N; % probabilidade pretendida no exercício

    fprintf('1a) Probabilidade = %.6f', prob_1a);
    fprintf('\n')

%{
    b) P(b) = 3/4   
    c) Suponha que para uma família com 2 filhos escolhida ao acaso,
    sabemos que um dos filhos é rapaz.
    Qual a probabilidade do outro filho ser também rapaz?

        Valor Teórico:  P(c) = 1/3
%}
    N = 1e5;
    n = 2;
    p = 0.5;
    Exp = rand(n,N)>p;
    
    cf = sum(Exp)==2;   % Casos Favoráveis: são das soma de todas as experiencias
                        % os casos em que ambos os filhos são rapazes (2)
    cp = sum(Exp)>=1;   % Casos Possíveis: são todos os casos das experiências n
                        % nos quais existe pelo menos um filho rapaz

    prob_1c = sum(cf)/sum(cp);

    fprintf('1c) Probabilidade = %.6f', prob_1c);
    fprintf('\n')
%{
    d) Sabendo que o primeiro filho de uma família com 2 filhos é rapaz,
    determine por simulacão a probabilidade do segundo filho ser rapaz.

    Valor Teórico:  P(d) = 1/2
%}
    N = 1e5;
    n = 2;
    p = 0.5;
    Exp = rand(n,N)>p;
    
    cf = sum(Exp)==2;
    cp = Exp(1,:);      % Casos Possíveis: são todos os casos das experiências n
                        % nos quais o 1º filho é rapaz (1ª linha de todas
                        % as colunas!)

    prob_1d = sum(cf)/sum(cp);

    fprintf('1d) Probabilidade = %.6f', prob_1d); % são acontecimentos independentes!
    fprintf('\n')
%{
    e) Considere uma família com 5 filhos. Sabendo que pelo menos um dos 
    filhos é rapaz, obtenha por simulação uma estimativa para a probabilidade 
    de um dos outros(e apenas um) ser também rapaz.
%}
    
    N = 1e5;
    n = 5;
    p = 0.5;
    Exp = rand(n,N)>p;
    
    cf = sum(Exp)==2;
    cp = sum(Exp)>=1;

    prob_1e = sum(cf)/sum(cp);

    fprintf('1e) Probabilidade = %.6f', prob_1e); % são acontecimentos independentes!
    fprintf('\n')
%{

    f) Repita a alínea anterior (e), mas estimando a probabilidade de pelo menos
    um dos outros ser também rapaz.

%}

    N = 1e5;
    n = 5;
    p = 0.5;
    Exp = rand(n,N)>p;
    
    cf = sum(Exp)>=2;
    cp = sum(Exp)>=1;

    prob_1e = sum(cf)/sum(cp);

    fprintf('1f) Probabilidade = %.6f', prob_1e); % são acontecimentos independentes!
    fprintf('\n \n')