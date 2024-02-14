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

[ PL03 - Cadeias de Markov ]
[3.1  Exercícios base ]

%}
%% EXERCÍCIO 7
%{
    Considere o conjunto de paginas Web e respetivas hyperligações 
    entre si dado pelo diagrama do guião.

    a) Usando a matriz H das hyperligações, obtenha a estimativa do 
    pagerank de cada página ao fim de 10 iterações. Relembre que deve 
    considerar: 
        
        i) a mesma probabilidade de transição de cada página para todas 
        as paginas seguintes possıveis;
        
        ii) a probabilidade da pagina inicial deve ser igual para todas 
        as paginas. 

    Qual/quais a(s) página(s) com maior pagerank e qual o seu valor?
%}
%       A  B  C  D  E  F
    H =[0, 0, 0, 0, 1, 0;
        1, 0, 0, 0, 1, 0;
        0, 1, 0, 1, 0, 0;
        0, 0, 1, 0, 0, 0;
        0, 1, 0, 0, 0, 0;
        0, 0, 0, 0, 1, 0];
    
    H = H./sum(H);
    H(isnan(H)) = 0; % matriz H
    pagerank = ones(6,1)/6 % vetor de estados, com mesma prob. 
    t = 10; % nº de transições

    for i = 1:t
        pagerank = H*pagerank;
    end

    fprintf('\n EX.:7 - Alinea a) \n');
    fprintf('Estimativa de Pagerank após 10 iterações: \n');
    disp(pagerank)

%{
    b) Identifique a "spider trap”e o ”dead-end”contidos neste conjunto de paginas:    
%}
    fprintf('\n EX.:7 - Alinea b) \n');
    fprintf('SPIDER TRAP: Estado C-D \n');
    fprintf('DEAD-END:    Estado F \n');
%{
    c) Altere a matriz H para resolver o problema do "Dead-end" e
    recalcular o pagerank de cada página (em 10 iterações).
%}
    Hc = H;
    Hc(:,6) = 1/6;
    pagerank = ones(6,1)/6;

    for i = 1:10
        pagerank = Hc*pagerank;
    end

    fprintf('\n EX.:7 - Alinea c) \n');
    fprintf('Estimativa de Pagerank após 10 iterações: \n');
    disp(pagerank)

%{
    d) Resolva agora ambos os problemas e recalcule o pagerank de cada 
    pagina novamente em 10 iterações (assuma β = 0, 8).
%}
    N = ones(6,6)/6;
    beta = 0.8;
    A = (beta*H) + ((1-beta)*N);
    pagerank = ones(6,1)/6;

    for i = 1:10
        pagerank = A*pagerank;
    end

    fprintf('\n EX.:7 - Alinea d) \n');
    fprintf('Estimativa de Pagerank após 10 iterações: \n');
    disp(pagerank)

%{
    e) Calcule agora o pagerank de cada pagina considerando um nº mınimo 
    de iterações que garanta que nenhum valor muda mais do que (10^−4) em 2 
    iterações consecutivas. 
    Quantos iterações são necessarias? 
    Compare os valores de pagerank obtidos com os da alínea anterior. 
    O que conclui?
%}
    pagerank = ones(6,1)/6; % vetor inicial
    tolerance = 1e-4;       % tolerancia máxima no vector pagerank
    converge = 0;           % flag se tolerancia for diferente
    i = 0;                  % iterador

    while converge == 0
        i = i + 1;
        new_pagerank = A * pagerank;
    
        % Verificar convergência (tolerancia)
        if i > 10 && max(abs(new_pagerank - pagerank)) < tolerance
            converge = 1;
        end
        
        pagerank = new_pagerank;
    end
    
    disp(['(e) PageRank após convergência em ', num2str(i), ' iterações:']);
    disp(pagerank);