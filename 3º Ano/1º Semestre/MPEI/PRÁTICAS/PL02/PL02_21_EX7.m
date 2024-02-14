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
%% EXERCÍCIO 7
%{
    7.) Uma empresa tem 3 programadores: (Andre, Bruno e Carlos). 
        A probabilidade de um programa de cada um deles ter problemas ("bugs”) 
        e o numero de programas desenvolvidos assumem os valores apresentados 
        na tabela (ver guião).
        
        O Diretor da empresa seleciona de forma aleatoria um dos 100 programas 
        produzidos pelos seus 3 programadores e descobre que este contem um 
        erro sério.

    a) Qual é a probabilidade de o programa ser do Carlos? 
%}
    A = 20;
    B = 30;
    C = 50;
    total = A + B + C; 

    N = 1e5;

    erroA  = 0.01;
    erroB  = 0.05;
    erroC = 0.001;

    pE = 1/100;

    progA = rand(20,N) < erroA;
    progB = rand(30,N) < erroB;
    progC = rand(50,N) < erroC;
    progs = [progA;progB;progC];

    cf_Carlos = sum(sum(progC));
    cf_Erro = sum(sum(progs));

    prob7a = cf_Carlos / cf_Erro;
    fprintf('7a) Probabilidade = %.6f', prob7a);
    fprintf('\n')
%{
    b)  De quem e mais provável ser o programa? 
%}
    cf_Andre = sum(sum(progA));
    cf_Bruno = sum(sum(progB));
    cf_Carlos = sum(sum(progC));
    cf_Erro = sum(sum(progs));

    probAndre  = cf_Andre / cf_Erro;
    probBruno  = cf_Bruno / cf_Erro;
    probCarlos = cf_Carlos / cf_Erro;
    
    if probAndre > probBruno 
        if probAndre > probCarlos
            fprintf('7b) É mais provável que seja do André: P = %.6f', probAndre);
            fprintf('\n')
        else
            fprintf('7b) É mais provável que seja do Carlos: P = %.6f', probCarlos);
            fprintf('\n')
        end
    else
        if probBruno > probCarlos
            fprintf('7b) É mais provável que seja do Bruno: P = %.6f', probBruno);
            fprintf('\n')
        else
            fprintf('7b) É mais provável que seja do Carlos: P = %.6f', probCarlos);
            fprintf('\n')
        end
    end  