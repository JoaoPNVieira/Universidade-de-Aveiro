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
%% EXERCÍCIO 2
%{
    Considere a seguinte “danca” de grupos: 
    Divide-se uma turma em 3 grupos (A, B e C) no inıcio do semestre e 
    no final de cada aula efectuam-se os seguintes movimentos:

    • 1/3 de A -> B e 1/3 de A -> C;
    • 1/4 de B -> A e 1/5 de B -> C
    • 1/2 de C -> B e 1/2 de C -> C 
 
    a) Crie em Matlab a matriz de transicao de estados que representa as 
    trocas entre grupos. Confirme que se trata de uma matriz estocastica
%} 

    T = [1/3, 1/4  , 0  ;
         1/3, 11/20, 1/2;
         1/3, 1/5  , 1/2 ];

    T_estocastica = sum(T);

    fprintf('EX.:2 - Alinea a) \n')
    fprintf('Matriz Transição: \n')
    disp(T);
    fprintf('Matriz Transição é estocástica: \n')
    disp(T_estocastica);

%{
    b) Crie o vector relativo ao estado inicial considerando que no total 
    temos 90 alunos, o grupo A tem o dobro da soma dos outros dois e os 
    grupos B e C tem o mesmo numero de alunos.
%}

    A = 60;
    B = 15;
    C = 15;
    total = A + B + C;
    vb = [A , B, C]'/total;
    fprintf('\n EX.:2 - Alinea b) \n');
    fprintf('Vector estado: \n');
    disp(vb)
%{
    c) Quantos elementos integrarao cada grupo no fim da aula 30 
    considerando como estado inicial o definido na alínea anterior?
%}
    n = 30-1;
    vc = (T^n)*vb;
    fprintf('\n EX.:2 - Alinea c) \n');
    fprintf('Vector estado: \n');
    disp(vc*90)

%{
    d) Quantos elementos integrarao cada grupo no fim da aula 30 
    considerando que inicialmente se distribuiram os 90 alunos 
    equitativamente pelos 3 grupos?
%}

    v  = [90/3 90/3 90/3]';
    vd = (T^n) * v;
    fprintf('\n EX.:2 - Alinea d) \n');
    fprintf('Vector estado: \n');
    disp(vd)
