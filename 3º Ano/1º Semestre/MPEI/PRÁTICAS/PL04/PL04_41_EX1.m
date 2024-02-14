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

[ PL04 - Algoritmos Probabilísticos ]
[ 4.1 Funções de dispersão ]

%}
%% EXERCÍCIO 1
%{
    O objectivo destes exercícios é avaliar o funcionamento de uma estrutura de dados importante, a Chaining
Hash Table, e um dos conceitos que a suportam, Hash Functions (funções de dispersão). 

    a) Gere um conjunto de N = 10e5 chaves usando todas as letras maiusculas e minusculas 
    ( A’ a ’Z’ e ’a’ a ’z’) com igual probabilidade e em que imin = 6 e imax = 20.
%}
tic
    N = 1e5; imin = 6; imax = 20;
    vec = ['A':'Z','a':'z'];
    keysA = genKey(N,imin,imax,vec);
toc
    save 'keysA.mat' 'keysA'
%{
    (b) Gere um conjunto de N = 10e5 chaves usando todas as letras minusculas 
    ( a’ a ’z’) com as probabilidades contidas no ficheiro prob_pt.txt e que 
    correspondem as frequencias das letras em Portugues 
    Considere novamente imin = 6 e imax = 20.
%}
tic
    N = 1e5; imin = 6; imax = 20;
    vec = ['a':'z'];
    prob = zeros(1,length(vec));  

    file = readlines("prob_pt.txt");
    for i = 1:length(prob)
        prob(i) = file(i);
    end

    keysB = genKey(N,imin,imax,vec,prob);
toc
    save 'keysB.mat' 'keysB'