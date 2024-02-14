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
%% EXERCÍCIO 8
%{
    Assumindo que o nº de erros tipograficos numa pagina de um livro tem 
    uma distribuicao de Poisson com λ = 0.02, calcule a probabilidade de 
    que exista no maximo 1 erro num livro de 100 paginas.

    Considere que o numero de erros em cada pagina é independente do nº de 
    erros nas outras paginas.
%}

    
    lambda = 0.02 * 100;
    pX = [0 0];
    for k = 0:1
        i = k+1;
        pX(i) = ((lambda^k)*exp(-lambda))/factorial(k);
    end
    P8 = sum(pX)/100;  
    fprintf('8.) P (no máximo 1 erro em 100 pag) = %.16f', P8);
    fprintf('\n')