clear; 
clc;
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL04 - Algoritmos Probabilísticos ]
[ 4.3 Deteção de similaridade - Algoritmo MinHash ] 

%}
%% EXERCÍCIO 2 & EXCERCÍCIO 3
%{
    Com base no codigo que adaptou, crie funcões para:
        a) criar a estrutura de dados com os conjuntos de filmes;
        b) calcular as distancias entre conjuntos; ˆ
        c) processar as distancias e devolver os pares de conjuntos similares. 
        Um dos parametros de entrada desta função deve ser o limiar de decisão.
    
    Depois do teste anterior com um numero reduzido de utilizadores e da 
resolução de eventuais problemas detectados, execute o seu programa com 
todo o conjunto de dados por forma a determinar todos os pares de utilizadores 
com uma distancia de Jaccard inferior a 0.4.
Tome nota dos tempos e dos resultados obtidos.
%}
    [Set,Nu,users] = make_set('u.data');
    J = jaccard(Set,Nu);
    threshold = 0.4;
    SimilarUsers = pares(J, Nu, users, threshold);
    fprintf("\nEx4.3.1.) Nº de Pares de utilizadores com distâncias inferiores ao limiar definido: %d ", length(SimilarUsers(:,1)));
    fprintf("\nEx4.3.1.) Pares de utilizadores com distâncias inferiores ao limiar definido: \n ");
    disp(SimilarUsers);
    