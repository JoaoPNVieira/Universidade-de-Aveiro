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
%% EXERCÍCIO 4
%{
   Crie uma nova versao da função de calculo de distância recorrendo a uma 
aproximação probabilística usando MinHash. Comece por testar esta nova 
implementação com um nº pequeno de utilizadores e depois teste-a com o 
conjunto total de utilizadores.
    Na implementação do MinHash, considere um nº k de funções de dispersão 
de 50, 100 e 200. Compare os pares considerados como similares (e o seu valor 
de similaridade) para cada valor de k com os obtidos com a implementação 
nao probabilística e retire conclusões
%}

t = tic;
K = 100;

[Set,Nu,users] = make_set('u.data');
threshold = 0.4;
assinaturas = inf(Nu,K);
for n = 1:Nu
    conjunto = Set{n}; 
    for i = 1:length(conjunto)
        chave = num2str(conjunto(i));
        h_out = muxDJB31MA(chave, 127,K);
        assinaturas(n,:) = min(h_out,assinaturas(n,:));
    end
end 
for n1 = 1:Nu
    for n2= n1+1:Nu                 
        J(n1,n2) = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/K;
    end
end
toc(t)

SimilarUsers = pares(J, Nu, users, threshold);

%% TESTE DE FUNCTION
    
for K = [50, 100, 200]
    fprintf("\nFor (K = %d): ", K)
    [Set,Nu,users] = make_set('u.data');
    M = minHash(Set, Nu, K);
    threshold = 0.4;
    SimilarUsers = pares(J, Nu, users, threshold)
end