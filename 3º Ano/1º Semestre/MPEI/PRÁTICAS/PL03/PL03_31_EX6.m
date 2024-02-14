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
%% EXERCÍCIO 6
%{
    NOTA: Matriz Canónica Tc = [Q 0;
                                R I];

    Considere a cadeia de Markov com o diagrama de transição de 
    estados seguinte: (Ver diagrama no guião)
    
    a) Defina em Matlab a matriz de transicão de estados T, com Tij sendo 
    a probabilidade de ir do estado j para o estado i num unico passo. 
%}
     Tc = [8 0 3 0  0;
           2 6 2 0  0;
           0 1 4 0  0;
           0 3 0 10 0;
           0 0 1 0  10]/10    
    fprintf('\n EX.:6 - Alinea a) \n')
    disp(Tc);
%{
    b) Defina em Matlab a matriz de transicão de estados T, com Tij sendo 
    a probabilidade de ir do estado j para o estado i num unico passo. 
%}
    fprintf('\n EX.:6 - Alinea b): Analisar gráfico \n')
    v   = [1 0 0 0 0]';
    res = zeros(1,100);
    for n = 1:100
        v = Tc * v;
        res(n) = v(2);
    end

    xx = 1:100;
    subplot(1,3,1)
    plot(xx, res)
    xlabel('n número de passos')
    ylabel('Prob. Xn')    
    title('Ex.6 - Alinea b)')
    axis([0 100 0 0.3]);

%{
    c) Faça um grafico com a probabilidade de, começando no estado 1, 
    estar no estado 3 ao fim de n passos. 
    Na mesma figura, faça um segundo grafico com a probabilidade de, 
    começando no estado 1, estar no estado 5 ao fim de n passos. 
    
    Em ambos os casos, considere n a variar de 1 ate 100. 
    Justifique o que observa
%}
    v = [1 0 0 0 0]';
    prob_E3 = zeros(1,100);
    prob_E5 = zeros(1,100);
    for c = 1:100
        v = Tc * v;
        prob_E3(c) = v(4);
        prob_E5(c) = v(5);
    end
    
    subplot(1,3,2)
    plot(xx, prob_E3)
    xlabel('n número de passos')
    ylabel('Prob. Xn')    
    title('Ex.6 - Alinea c) Estado 3')
    subplot(1,3,3)
    plot(xx, prob_E5)
    xlabel('n número de passos')
    ylabel('Prob. Xn')    
    title('Ex.6 - Alinea c) Estado 5')
    
%{
    d) Determine a matriz Q.
%}
    fprintf('\n EX.:6 - Alinea d) Matriz Q \n')
    nena = 3;
    Q = Tc(1:nena,1:nena)

%{
    e) Determine a matriz fundamental F.
%}    
    fprintf('\n EX.:6 - Alinea e) Matriz Fundamental \n')
    F  = inv(eye(3)-Q) % referente aos estados nena 1, 2 e 4
%{
    f) Qual a media (valor esperado) do nº de passos antes da absorção 
    começando no estado 1? 
    E começando no estado 2? 
    E começando no estado 4?
%}
    soma = sum(F);
    media_Est1 = soma(1);
    media_Est2 = soma(2);
    media_Est4 = soma(3);

    fprintf('\n EX.:6 - Alinea f) \n')
    fprintf('Média (valor esperado) do nº de passos até absorção do estado 1: %.4f \n', media_Est1);
    fprintf('Média (valor esperado) do nº de passos até absorção do estado 2: %.4f \n', media_Est2);
    fprintf('Média (valor esperado) do nº de passos até absorção do estado 4: %.4f \n', media_Est4);


%{
    g) Começando no estado 1, qual é a probabilidade de absorção 
    do estado 3? E do estado 5? Verifique a coerencia destes valores 
    com o que observou na alınea 6 (c).

%}

    R = Tc(nena+1:end, 1:nena); % (4:5 , 1:3)
    Absor = R*F;
    absorE1_E3 = Absor(1,1); % p[Estado=3 | Start=1]
    absorE1_E5 = Absor(2,1); % p[Estado=3 | Start=1]

    fprintf('\n EX.:6 - Alinea g) \n')
    fprintf('Probabilidade de Absorção do estado 3, começando no estado 1: %.20f \n', absorE1_E3);
    fprintf('Probabilidade de Absorção do estado 5, começando no estado 1: %.20f \n', absorE1_E5);
