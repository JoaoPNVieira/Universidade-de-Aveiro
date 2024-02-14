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

[ PL03 - Cadeias de Markov ]
[3.1  Exercícios base ]

%}
%% EXERCÍCIO 3
%{
    Gere aleatoriamente uma matriz de transicao de estados para uma cadeia 
    de 20 estados (identificados de 1 a 20), recorrendo a funcao do Matlab 
    rand. Com base nessa matriz:
    
    a) Confirme que a matriz de transicao de estados é estocastica.
%}

    T = randi(20,20)
    S = sum(T)

    for i=1:20
            T(:,i) = T(:,i)/S(i);
    end

    estocastica = sum(T)

    fprintf('EX.:3 - Alinea a) \n');
    fprintf(['Matriz T é estocástica: \n']);
    disp(estocastica);

%{
    b) Qual a probabilidade de o sistema, começando no estado 1, 
    estar no estado 20 apos 2 transicoes? E apos 5? E apos 10? E apos 100? 
    
    Apresente os resultados em percentagem e com 5 casas decimais. 
    O que conclui?
%}

    v = zeros(20,1);
    v(1) = 1;

    n = 2;
    T2 = (T^n)*v;
    T2 = T2(20);
    fprintf('EX.:3 - Alinea b) \n');
    fprintf(['Probabilidade estado 20 em 2 Transições: %.6f\n'],T2*100);    
    n = 5;
    T5 = (T^n)*v;
    T5 = T5(20);
    fprintf(['Probabilidade estado 20 em 5 Transições: %.6f\n'], T5*100);    
    n = 10;
    T10 = (T^n)*v;
    T10 = T10(20);
    fprintf(['Probabilidade estado 20 em 10 Transições: %.6f\n'],T10*100);    
    n = 100;
    T100 = (T^n)*v;
    T100 = T100(20);
    fprintf(['Probabilidade estado 20 em 100 Transições: %.6f\n'],T100*100);    
