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
    Considere o conjunto de clubes de futebol
        - A: Atletico de Madrid
        - B: Benfica
        - J: Juventus
        - L: Liverpool
        - P: Porto
        - R: Real de Madrid

    Transições = Epocas de futebol
%}
% a) Gerar Matriz de Transição na forma canónica

    T = [0.1, 0  , 0.4, 0  , 0, 0;
         0.4, 0.1, 0.6, 0.2, 0, 0;
         0.3, 0  , 0  , 0.2, 0, 0;
         0  , 0  , 0  , 0.6, 0, 0;
         0.2, 0.4, 0  , 0  , 1, 0;
         0  , 0.5, 0  , 0  , 0, 1];

    Est = sum(T);
    Q   = T(1:4,1:4);
    O   = T(1:4,5:6);
    R   = T(5:6,1:4);
    I   = T(5:6,5:6);

%  b) Iniciando no Benfica, em media, quantas epocas demora um jogador a 
% chegar ao Liverpool ou ao Real Madrid:

    F = inv(eye(4)-Q);
    % Absorbing probability matrix
    B = R * F;
    
    disp('Absorbing probability matrix B:');
    disp(B);

    real_madrid = 1 / B(1, 1);
    liverpool   = 1 / B(2, 1); 
 
    
    fprintf("\n Liverpool: %.6f \n")
    disp(liverpool)
    fprintf("\n Real Madrid: %.6f \n")
    disp(real_madrid)

%  c) Em que clube é mais provavel um jogador terminar a sua carreira se 
% iniciar no porto - INDICAR VALOR DE PROBABILIDADE

    vPorto = [0 0 1 0 0 0]';
    
    for i = 1:10E3
        vPorto = T * vPorto;
    end
    
    probFim_RM = vPorto(6);
    
    fprintf('Probabilidade de terminar no Real Madrid começando no Porto: %.6f\n', probFim_RM);

%% EXERCÍCIO 2
%{
    COUNTING BLOOM FILTER:
        Gerar palavras (A-Z) equiprovaveis com: 
            Comprimento 4 caracteres (prob. 30%)
            Comprimento 8 caracteres (prob. 70%)
%}
%   a) e b) 
%       Filtro Bloom onde:
%       B = 5000 posições
%       k = 2 funções hash
%       elem = 1000

    N = 2000;
    imin = 4;
    imax = 8;
    vec = 'A':'Z';
    chaves = genKey(N,imin,imax,vec);
    elem = chaves(1:1000);
    n = 5000;
    m = 1000;
    k = 2;
    kOtimo = round((n*log(2))/m);
    
    BF = iniciar(n); % iniciar Bloom Filter
    for i = 1:m
        BF = inserir(BF,elem{i},k);
    end

    fp = 0;
    for i = m+1:length(chaves)
        out = pertencer(BF,chaves{i},k);
        if out 
            fp = fp + 1;
        end
    end
    
    percent = fp/100;
    fprintf("\n 2b) Falsos Positivos: %.4f %% \n", percent)

