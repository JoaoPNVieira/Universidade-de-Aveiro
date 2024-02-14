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
%% EXERCÍCIO 5
%{
    5.) Considere: Um dado de jogo comum de 6 faces de 1 - 6 (equilibrado).
        Lançando 2 vezes o dado, considere os acontecimentos seguintes:
        “A – a soma dos dois valores e igual a 9”, 
        "B – o segundo valor é par”, 
    	"C – pelo menos um dos valores é igual a 5"
        "D – nenhum dos valores é igual a 1”.

    a) Estime por simulação a probabilidade da cada um dos 4 acontecimentos.
%}
    N = 1e5;            % nº de experiências
    lancamentos = 2;    % nº lançamentos
    faces = 6;          % faces do dado
    p = 1/faces;        % probabilidade por face
    % ------------------------------
    % Probilidade do acontecimento A: "a soma dos dois valores e igual a 9":
    k = 9;              % resultado pretendido
    Mexp = randi(faces,lancamentos,N); % Matriz de Experiências

    sucess = sum(Mexp) == k;  % vector sucessos
    prob4a_PA = sum(sucess)/N; % probabilidade pretendida

    fprintf('5a.) Probabilidade A = %.6f', prob4a_PA);
    fprintf('\n')
    
    % ------------------------------
    % Probilidade do acontecimento B: "O segundo valor é par":
    k = 2;
    v = Mexp(2,:);
    i = 1; count = 0;
    while i <= N
        if mod(v(i),2) == 0
            count = count + 1;
        end 
        i = i + 1;
    end
    prob4a_PB = count/N;     % probabilidade pretendida 
    fprintf('5a.) Probabilidade B = %.6f', prob4a_PB);
    fprintf('\n')
    % ------------------------------
    % Probilidade do acontecimento C: "Pelo menos um dos valores é igual a 5":
    i = 1; count = 0;
    while i <= N
        if Mexp(1,i) == 5 || Mexp(2,i) == 5
            count = count + 1;
        end
        i = i + 1;
    end
    prob4a_PC = count/N;     % probabilidade pretendida 
    fprintf('5a.) Probabilidade C = %.6f', prob4a_PC);
    fprintf('\n')
    % ------------------------------
    % Probilidade do acontecimento D: "nenhum dos valores é igual a 1":
    i = 1; count = 0;
    while i <= N
        if Mexp(1,i) ~= 1 && Mexp(2,i) ~= 1
            count = count + 1;
        end
        i = i + 1;
    end
    prob4a_PD = count/N;     % probabilidade pretendida 
    fprintf('5a.) Probabilidade D = %.6f', prob4a_PD);
    fprintf('\n')
%{ 
    b) Determine teoricamente se os acontecimentos A e B sao independentes:
    Teoria Clássica:
    P(A):   cf = 4, ie (6+3) | (3+6) | (5+4) | (4+5) 
            cp = 36

    P(B) = 1/2;
    
    P(A)*P(B) = 0.05555556;
    P(AB) = 0.5555556
    P(A)*P(B) == P(AB) ----> Tautologia (A e B são independentes)

    c) Determine teoricamente se os acontecimentos C e D sao independentes:

    P(C)*P(D) = 0.21219136
    p(CD) = 0.25000000
    P(C)*P(D) ~= P(CD) ----> C e D não são independentes
%} 
