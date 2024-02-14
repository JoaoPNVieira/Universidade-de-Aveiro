clc; clear;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ MINITESTE PRÁTICO - 18/01/2017 ]

%}
%% EXERCÍCIO 1
%{
    Considade a comunicação entre um terminal e o seu ponto de acesso à
    rede. Cada pacote de dados é enviado pelo emissor com informação
    adicional que permite ao recetor corrigir até um erro por pacote.
    
    Designa-se por por "pacote perdido", um pacote que chega ao seu destino
    com 2 ou mais erros.
    
    Probabilidade de haver erros num pacote é dada da seguinte forma:
        -> Se o pacote anterior não tem erros: 
            P_1erro = 0.09 e P_2erros = 0.01
        
        -> Se o pacote anteriror TEM erros:
            P_1erro = 0.4 e P_2erros = 0.1

    Considere uma cadeia de Markov com 3 estados:
        -> Estado 1: pacote sem erros
        -> Estado 2: pacote com 1 erro
        -> Estado 3: pacote com 2 ou mais erros

    Considere ainda que o 1º pacote contem 3 erros!
%}
% a) Criar matriz transição e vector inicial


    T = [ 0.9, 0.5 0.5;
         0.09, 0.4 0.4;
         0.01, 0.1 0.1];

    estocatica = sum(T);

    v = [0 0 1]';

    fprintf("1a) ")
    disp(T);
    disp(estocatica);
    disp(v)

% b)
    n = 4;
    Pb = (T^(n-1))*v;
    fprintf("1b) sem erros: %.6f \n", Pb(1))
    fprintf("1b) 1 erro: %.6f \n", Pb(2))
    fprintf("1b) 2 ou mais erros: %.6f \n", Pb(3))

% c)

    Xn = [0 0 1]';
    i = 1;
    c = 1
    while c 
        Xold = Xn;
        Xn = (T^i)*v;
        if(max(abs(Xn-Xold))<0.001)
            c = 0;
            break
        end
        i = i + 1;  
    end

    
    P_perdidosSemCodigo = Xn(2)+Xn(3)

 %% EXERCÍCIO 2
 %{
    
    Considere um pequeno conjunto de páginas web identificadas pelas letras
    C até G com as seguintes ligações no 1º dia (1 Janeiro de 2017):
        -> C liga com: D, E;
        -> D liga com: E, C (só);
        -> E liga com: C, E, G
        -> G liga com: D, F
        -> F liga com: Todas excepto ela mesma
    
 %}
 % a) 
        %
    H = [0 1 1 1 0;
         1 0 0 1 1;
         1 1 1 1 0;
         0 0 0 0 1;
         0 0 1 1 0];

    s = sum(H);
    H = H./s;
    
    beta = 0.8;
    N = ones(5,5)/5;
    A = (beta*H)+(1-beta)*N;

    fprintf("Matriz Google A: \n")
    disp(A)

% b) 
    pagerank = ones(5,1)/5;
    iter = 10;

    for i = 1:iter
        pagerank = A*pagerank;
    end

    fprintf("Pagerank de A: \n")
    disp(pagerank)

%% EXERCÍCO 3
% a)
    

    T = [0.7 0.2 0   0   0 0;
         0.2 0   0.3 0   0 0;
         0   0.6 0.3 0   0 0;
         0.1 0.2 0.3 0.1 0 0;
         0   0   0.1 0.5 1 0;
         0   0   0   0.4 0 1];

% b)
    v = [1 0 0 0 0 0]';
    P10   = (T^9)*v;
    P10_c = P10(3);
    P15   = (T^14)*v;
    P15_d = P15(4);

    fprintf("3b) Prob. 10º Caracter é C: %.6f \n", P10_c);
    fprintf("3b) Prob. 15º Caracter é D: %.6f \n", P15_d);

% c) 

    Q = T(1:4,1:4);
    F  = inv(eye(4)-Q);
    s = sum(F);
    s = s(3);

    fprintf("3c) Média (valor esperado) começando em C " + ...
        "e terminando em . ou ?: %.6f \n", P10_c);