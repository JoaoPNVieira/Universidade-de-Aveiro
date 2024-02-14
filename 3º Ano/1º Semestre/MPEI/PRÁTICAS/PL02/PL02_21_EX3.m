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
%% EXERCÍCIO 3
%{
    3.) Considere um array de tamanho T que serve de base a implementaçao de 
        uma memoria associativa (por exemplo em Java). Assuma que a função de 
        hash devolve um valor entre 0 e T − 1 com todos os valores igualmente 
        provaveis. 
    
    a.) Determine por simulação a probabilidade de haver pelo menos uma 
        colisão (pelo menos 2 keys mapeadas pela função de hash para a 
        mesma posição do array) se forem introduzidas 10 keys num array 
        de tamanho T = 1000.
%}
    N = 1e5;
    T = 1000;
    count = 0;
    for i = 1:N
        hash = randi(T,1,10)-1;
        c = length(hash)-length(unique(hash));
        if c~=0
            count = 1;
        end
    end

    Pcolisao = count/N; 
    fprintf('5a.) Probabilidade de colisões: %.6f', Pcolisao);
    fprintf('\n')
    
%{
    B.) Faça um grafico da probabilidade da alınea a) (estimada por simulacão) 
    em função do numero de keys para todos os valores relevantes num array de 
    tamanho T = 1000.
%}

    N = 1e5;
    T = 1000;
    count = 0;
    keys = 10:10:100;
    r = zeros(1,10);
    for i = 1:length(keys)
        k = keys(i);
        for i = 1:N
            hash = randi(T,1,k)-1;
            c = length(hash)-length(unique(hash));
            if c~=0
                count = 1;
            end
        end
        r(i) = count/N;
    end
