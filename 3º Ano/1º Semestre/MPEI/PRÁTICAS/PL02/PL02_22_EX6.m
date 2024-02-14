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
%% EXERCÍCIO 6
%{
    A distribuição de Poisson é uma forma limite da distribuição binomial 
    (quando n → ∞ , p → 0 e np permanece constante) e portanto pode ser 
    usada para aproximar e simplificar os calculos envolvidos com a binomial 
    em situações em que as condições anteriores se verifiquem.
    
    Num processo industrial de fabrico de chips, alguns aparecem defeituosos 
    tornando-os inapropriados para comercialização. É sabido que em média 
    por cada 1000 chips há um defeituoso.
 ´
    a) Usando a distribuição binomial, determine a probabilidade de numa 
    amostra de 8000 chips aparecerem 7 defeituosos.

    Lei Binomial: nchoosek(n,k)*(P^k)*[(1-P)^(n-k)]
%}
    n = 8000;       % Nº de chips
    p = 1/1000;     % Probabilidade de chip defeituoso
    k = 7;          % Sucessos da Binomial
    P6a = nchoosek(n,k)*(p^k)*[(1-p)^(n-k)];
    fprintf('6b.) Probabilidade Binomial = %.6f', P6a);
    fprintf('\n')
    
%{
    b)

%}

    n = 8000;       % Nº de Chips
    p = 1/1000;     % Probabilidade (média) de chip com defeito 
    lambda = n*p;   % lambda de poisson   
    k = 7;          % k de poisson
    P6b = ((lambda^k)*exp(lambda*(-1)))/factorial(7); %formula de poisson
    
    fprintf('6b.) Probabilidade Poisson = %.6f', P6b);
    fprintf('\n')






    
