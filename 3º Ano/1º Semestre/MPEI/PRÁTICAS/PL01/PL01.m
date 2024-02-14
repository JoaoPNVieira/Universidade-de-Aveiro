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

[PL01 - Probabilidade: Conceitos base]

%}
%% EXERCÍCIO 1
%{
    a)  Crie um vetor linha com uma sequencia de números pares 
        de 4 até 100.
%}
    v1a = [4:2:100];
    fprintf('1a.) v = \n');
    disp(v1a);
%{
    b)  Crie um vetor linha com uma sequencia decrescente de números 
        inteiros de 5 até -5.
%}
    v1b = [5:-1:-5];
    fprintf('1b.) v = \n');
    disp(v1b);
%{
    c)   Crie um vetor linha com uma sequencia de números reais igualmente 
         espaçados com 100 elementos pertencentes ao intervalo [0 ... 1].
%}
    v1c = [0:(1/99):1];
    fprintf('1c.) v = \n');
    disp(v1c);
%{
    d)   Crie uma matriz aleatoria usando o comando "B= rand(20,30)" 
         (20 linhas e 30 colunas).
         Construa um comando que permita extrair para uma matriz C 
         uma sub-matriz de B constituída pelas linhas de 10 a 15 e 
         as colunas de 9 a 12
%}

    B = rand(20,30);
    M = B(10:15,9:12);
    fprintf('1d.) M = \n');
    disp(M);
%{
    e)   Gere uma sequencia, x, a começar em −π e a acabar em π 
         com um passo de π/15.
%}

    x = [-pi:(pi/15):pi];
    fprintf('1e.) x = \n');
    disp(x);

%{
    f)   Corra o comando "plot(x, sin(4*pi*x)". 
         A que corresponde o grafico obtido?
%}
    plot(x, sin(4*pi*x)),xlabel('x'), ylabel('sin(4*pi*x)'), title("EX.: 1e.)");
    grid on;

%% EXERCÍCIO 2
%{
    2.)  Considere a experiencia aleatória:
            -> Lançar 3 vezes uma moeda equilibrada. 
            -> Pretende-se estimar por simulaçao a probabilidade de se 
            obter 2 caras no fim dos 3 lançamentos .
            -> N = 10000 experiencias aleatórias

    a) Implemente ambos os metodos descritos no guião PL1
    b.) Efectue as simulações várias vezes
%}
    %}
    % ----  MÉTODO 1:
        
    experiencias    = rand(3,10000);        % matriz 3x10000 de números aleatórios entre ]0,1[
    lancamentos     = experiencias > 0.5;   % matriz lançamentos por experiencia onde cara = 1 (>0.5) e coroa =0 (=<0.5)
    resultados      = sum(lancamentos);     % vector resultados
    sucessos        = resultados==2;        % sucessos se cara = 2
    prob2met1        = sum(sucessos)/10000; % probabilidade final

    fprintf('2.) Método 1 -> Probabilidade = %.6f \n', prob2met1)
        
% ----  MÉTODO 2:

    N = 1e4;                % 10000 experiências
    p = 0.5;                % probabilidade de sair cara
    k = 2;                  % número de caras pretendidas a sair
    n = 3;                  % nº de lançamentos 
    L = rand(n,N) > p;      % matriz de n lançamentos em N experiências
    s = sum(L) == k;        % sucessos de duas e duas só caras
    prob2met2 = sum(s)/N;   % calculo de probabilidade pretendida
        
    fprintf('2.) Método 2 -> Probabilidade = %.6f', prob2met2);
    fprintf('\n \n')

%%
%{
    3.) Moeda equilibrada
        Lançamentos = 15 (por experiencia) 
        Pretendemos P(6 e só 6 caras) 
%}

    N = 1e4;                % 10000 experiências
    p = 0.5;                % probabilidade de sair cara
    k = 6;                  % número de caras pretendidas
    n = 15;                 % nº de lançamentos por experiência
    L = rand(n,N) > p;      % matriz de n lançamentos em N experiências
    s = sum(L) == k;        % vector sucessos de 6 e só 6 caras
    prob3 = sum(s)/N;       % calculo da probabilidade pretendida
    fprintf('3.) Probabilidade de obter 6 e só 6 caras em 15 lançamentos: %.6f', prob3);
    fprintf('\n \n')

%%
%{
    4.) Moeda equilibrada
        Lançamentos = 15 (por experiencia) 
        Pretendemos P(pelo menos 6 caras) 
%}      
    N = 1e4;            % nº de experiências
    p = 0.5;            % probabilidade de sair cara
    k = 6;              % nº de caras pretendidas
    n = 15;             % nº lançamentos por experiência
    L = rand(n,N) > p;  % matriz n lançamentos por N experiências
    s = sum(L) >= k;    % vector sucessos
    prob4 = sum(s)/N;   % calculo da probabilidade prentendida

    fprintf('4.) Probabilidade de obter pelo menos 6 caras em 15 lançamentos: %.6f', prob4);
    fprintf('\n \n');

%%
%{
    5.) Criar uma função Matlab (ProbCarasExactas)
        Usar esta função para recalcular os exercícios anteriores.
        Calcular probabilidades para todo o espaço de amostragem,
        ie, S={0,1,2,3,...}, para 20, 40 e 100 lançamentos.
    
    a.) Fazer loop for ou while no exercício
        anterior e armazenar resultado em vector (0:x) onde x é o nº de
        possiveis resultados probabilisticos 
%}
    Prob5_20 = ProbCarasExactas(0.5,20,1e5,2); 
    Prob5_40 = ProbCarasExactas(0.5,40,1e5,2); 
    Prob5_100 = ProbCarasExactas(0.5,100,1e5,2); 
    fprintf('---------------------------------------------------- \n')
    fprintf('5a.) Probabilidade para 20 lançamentos: %.6f \n', Prob5_20);
    fprintf('5a.) Probabilidade para 40 lançamentos: %.6f \n', Prob5_40);
    fprintf('5a.) Probabilidade para 100 lançamentos: %.6f \n', Prob5_100);

%%
%{
    7.) Considere um processo de produção fabril que produz torneiras em 
        que a probabilidade de cada torneira ser produzida com defeito 
        é de 30%. No processo de controlo de qualidade, e selecionada 
        uma amostra de 5 peças.
    
    a.) Calcule analiticamente e por simulação a probabilidade de 3 peças 
        da amostra serem defeituosas.
%}
        N = 1e5;
        n = 5;
        k = 3;
        p = 0.3;
        E = rand(n,N)<p;
        s = sum(E)==k;
        Prob6a = sum(s)/N;

        fprintf('7a.) Probabilidade de 3 peças de uma amostra de 5 serem defeituosas: %.6f \n', Prob6a);

%{
    b.) Calcule analiticamente e por simulação a probabilidade de, no maximo, 
        2 das peças da amostra serem defeituosas.
%}
        N = 1e5;
        n = 5;
        k = 2;
        p = 0.3;
        E = rand(n,N)<p;
        s = sum(E)<=k;
        Prob6b = sum(s)/N;

        fprintf('7b.) Probabilidade de, no máximo, 2 peças de uma amostra de 5 serem defeituosas: %.6f \n', Prob6b);

%{
    c.) Baseado em simulação, construa no Matlab o histograma representativo 
        da distribuição de probabilidades do numero de peças defeituosas da 
        amostra.
%}
        p = 0.3;
        N = 1e5;
        n = 5;
        x = 0:5; % Eixo xx
        Prob = zeros(size(x));
        
        for k = 1:numel(x)
            E = rand(n, N) < p;
            s = sum(E) == x(k);
            P = sum(s) / N;
            Prob(k) = P;
        end
        
        if round(sum(Prob))~=1
            fprintf('6C.)ERRO: Soma de todas as probabilidades =/= 1 \n')
        else
            bar(x, Prob)
            xlabel('Numero de Sucessos')
            ylabel('Probabilidade')
            title('7c.) Distribuição Binomial de Probabilidades')
        end