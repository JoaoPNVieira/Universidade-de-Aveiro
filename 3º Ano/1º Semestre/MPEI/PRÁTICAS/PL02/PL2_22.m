clear; clc;
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################
%}
% PL02 - Probabilidade e Variáveis Aleatórias
%--------------------------------------------------------------------------
%{ 
2.2 - Variáveis Aleatórias:
CALCULOS TEÓRICO EM FOLHAS:
###########################################################################
    1.) Considere a variavel aleatoria X correspondente a face que fica 
        para cima no lancamento de 1 dado.
        Usando os valores teoricos: ´
        
    a) Produza um grafico, em Matlab, que represente a funcao massa 
       de probabilidade de X
        
%}
    Sx = 1:6;                                   % Espaço de Amostragem
    Px = ones(1,6)/6;                           % Probabilidades dos acontecimentos elementares de X

    subplot (2, 1, 1);                          % Divisão de plot: 2 linhas | 1 coluna | 1º grafico
    stem(Sx,Px), xlabel('x'), ylabel('P(x)'),title('EX.:1a) Função Massa de Probabilidade - Simulação')    % x no eixo xx ; Px no eixo yy
    axis padded
    grid on

%{
    b) Num segundo grafico da mesma figura, desenhe o grafico da funcao 
       de distribuicao acumulada (use a funcao stairs do Matlab).
%}
    Fx = cumsum(Px);                  % Função Distribuição acumulativa: cumsum => soma acumulativa
    subplot (2, 1, 2);
    stairs(Fx),xlabel('x'), ylabel('PX.Acumulada'),title('EX.:1b) Função Probabilidade Acumulada - Simulação'); %grafico em forma de "escadas"
    xlim([-0.1,7])
    ylim([-0.1,1.1])
    grid on

%%
%{
    2.) Considere uma caixa contendo 90 notas de 5 Euros, 9 notas de 50 e 1 de 100.

    a.) Descreva o espaço de amostragem da experiencia aleatória, retirar uma nota da 
    caixa, e as probabilidades dos acontecimentos elementares.
    
    Caixa com:
    90 notas de 5€ | 9 notas de 50€ | 1 nota de 100€
    A:"Retira 5€"  | B:"Retira 50€" | c:"Retira 100€"
    S={ 5, 5, ... , 5, 50, 50, ..., 50, 100 } 

%}
    fprintf('EX.:2 - Alinea a): \n')
     
    nA = 90; nB = 9; nC = 1;    % 90 notas de 5€ | 9 notas de 50€ | 1 nota de 100€
    total = nA + nB + nC;       % Nº total de notas na caixa
    pNota = 1/total;            % Probabilidade de retirar uma nota ao acaso

    % Probabilidades de acontecimentos elementares: 
                    
    % A:"Retira 5€"  | B:"Retira 50€" | c:"Retira 100€"
      pA = nA/total;   pB = nB/total;   pC = nC/total;


    Sx = [(ones(1,90)*5),  (ones(1,9)*50), 100]; % Espaço amostral

    fprintf('Espaço de Amostragem: %d: \n\n'); disp(Sx)
    fprintf('Probabilidade de retirar uma nota ao acaso: %.4f: \n', pNota);
    fprintf('Probabilidade elementar A: "Retirar 5€"   : %.4f: \n', pA);
    fprintf('Probabilidade elementar B: "Retirar 50€"  : %.4f: \n', pB);
    fprintf('Probabilidade elementar C: "Retirar 100€" : %.4f: \n', pC);
    fprintf('\n \n');
%{   
    b.) Considere agora a variavel aleatoria X (valor de uma nota retirada
    a sorte da caixa). Descreva o espaço de amostragem e a Função Massa de Probabilidade de X.

    Var. Aleatória  X: "Retirar uma nota aleatóriamente"
    S={ 5, 5, ... , 5, 50, 50, ..., 50, 100 } 
%}

    Pxa = [(ones(1,90)*pA)];                    % Probabilidades dos acontecimentos elementares
    Pxb = [(ones(1,9)*pB)];
    Px = [Pxa, Pxb, pC];
    
    stem(Sx,Px), xlabel('Espaço Amostral X'), ylabel('P(x)'), title('EX.:2b) Função Massa de Probabilidade - Simulação')       % Sx no eixo xx ; Px no eixo yy
    axis padded
    grid on

