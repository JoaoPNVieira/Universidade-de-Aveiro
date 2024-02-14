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
%% EXERCÍCIO 7
%{
    Suponha que o numero de mensagens que chega a um servidor de email 
    segue uma lei de Poisson com media de 15 (mensagens por segundo). 
    Calcule a probabilidade de num intervalo de um segundo:

    a)  O servidor não receber nenhuma mensagem
%}
    lambda = 15;
    k = 0;
    P7a = ((lambda^k)*exp(lambda*(-1)))/factorial(k);
    fprintf('7a.) P (não receber quaisquer mensagens) = %.16f', P7a);
    fprintf('\n')
%{   
    b)  O servidor receber mais de 10 mensagens.
%} 
    lambda = 15;
    pX = zeros(1,11); % vetor mensagens recebidas (mais que 10, ie, 11 no min)
    
    for k = 0:10      % enquento k recebidas for entre 0 e 10, incrementando
      i = k+1;        
      pX(i) = ((lambda^k)*exp(lambda*(-1)))/factorial(k);
    end
    
    Px10mais = sum(pX);
    p7b = 1-Px10mais;
    fprintf('7b.) P (receber mais que 10 mensagens) = %.6f', p7b);
    fprintf('\n')


