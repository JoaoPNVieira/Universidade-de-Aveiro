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
[ 4.2 Filtros de Bloom ] - Crie um conjunto de funções Matlab que implementem as funcionalidades 
de um Bloom Filter basico. 
    
    As funções devem ter os parâmetros necessários para que seja possível 
criar Bloom Filters: 
    -> De diferentes tamanhos (n) 
    -> Com utilização de diferentes nº de funções de dispersão (k). 

    Na criação das diferentes funções de dispersao, use o metodo descrito 
no slide 49 da apresentação TP sobre funções de dispersão com a função que
melhor desempenho teve na secção 4.1 anterior. (DJB31MA)

Sugestao: Criar pelo menos 3 funções [1, sec. 3.2]: 
    -> 1ª para inicializar a estrutura de dados; 
    -> 2ª para inserir elementos no filtro; 
    -> 3ª para verificar se um elemento pertence ao conjunto  

TIP: Bloom Filters como Boolean (ocupa 1 bit) em vez de 1 e 0 (integer que ocupa 6 bits)
%}
%% EXERCÍCIO 1
%{
    Com as funções que desenvolveu, crie um Bloom Filter para guardar um 
conjunto, U1, de 1000 palavras diferentes. 
    Use um Bloom Filter de tamanho n = 8000 e k = 3 funções de dispersão. 
%}

    fid = fopen('wordlist-preao-20201103.txt','r');
    dicionario = textscan(fid,'%s');
    dicionario = dicionario{1};
    fclose(fid);

    n = 8000;   % comprimento do Bloom Filter
    k = 3;      % nº de hash functions
    m = 1000;   % nº de elementos inseridos

    BF = iniciar(n); % iniciar Bloom Filter de comprimento n
    for i = 1:m
         BF = inserir(BF,dicionario{i},k);
    end
%% EXERCÍCIO 2
%{
    Teste o Bloom Filter criado anteriormente, verificando a pertença de 
todas as palavras do conjunto U1. 
    Obteve algum falso negativo? 
    
    R: Bloom Filter não tem Falsos Negativos
%}  
    fn = 0;
    for i = 1:m
        out = pertencer(BF,dicionario{i},k);
        if ~out 
            fn = fn + 1;
        end
    end
    
    fprintf("Ex. 4.2.2: Percentagem de Falsos Negativos: %.2f %%\n", fn/100)

%% EXERCÍCIO 3
%{
    Teste o Bloom Filter criado anteriormente, verificando a pertença de 
um novo conjunto, U2, com 10000 palavras todas diferentes das de U1. 
    Indique a percentagem de falsos positivos obtidos:
%}  
    fp = 0;
    for i = m+1:m+10000
        out = pertencer(BF,dicionario{i},k);
        if out 
            fp = fp + 1;
        end
    end
    
    percent = fp/100;
    fprintf("Ex. 4.2.3: Percentagem de Falsos Positivos: %.2f %%\n", percent)

%% EXERCÍCIO 4
%{
    Compare a percentagem de falsos positivos obtida anteriormente com a
    estimativa que aprendeu nas TPs:

    P = (1-e^-km/n)^k
%}

    Pfp = (1-exp((-k*m)/n))^k;
    Pfp = Pfp*100;

    fprintf("Ex. 4.2.4: Percentagem de Falsos Positivos Teóricos: %.2f %%\n", Pfp)

%% EXERCÍCIO 5
%{
    Repita os exercÍcios 1.) e 3.) para um numero de funções de dispersão k
de 4 ate 10. Faça um gráfico com a percentagem de falsos positivos em função
de k. 
    Analisando os resultados, qual o valor otimo k? Compare este valor com 
o valor teorico que aprendeu nas TPs. 
%}
    n = 8000;           % comprimento do Bloom Filter
    m = 1000;           % nº de elementos inseridos
    res = zeros(1,7);   % nº de elementos inseridos
    idx = 1;
    
    for k = 4:10
        BF = iniciar(n); % iniciar Bloom Filter de comprimento n
        for i = 1:m
             BF = inserir(BF,dicionario{i},k);
        end
        fp = 0;
        for i = m+1:m+10000
            out = pertencer(BF,dicionario{i},k);
            if out 
                fp = fp + 1;
            end
        end
        res(idx) = fp;
        idx = idx + 1;
    end
        k = 4:10;
        plot(k,res/100)
        title("K Ótimo")
        xlabel("Valores de K")
        ylabel("Percentagens de Falsos Positivos")

        kOtimo = round((n*log(2))/m);
        fprintf("Ex. 4.2.5: kOtimo Teórico: %d \n", kOtimo)
