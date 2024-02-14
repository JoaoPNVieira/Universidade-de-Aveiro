clear; clc;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL03 - Cadeias de Markov ]
[3.1  Exercícios base ]

%}
%% EXERCÍCIO 5
%{
    Considere que o tempo em cada dia e genericamente classificado 
    num de 3 estados: Sol, Nuvens e Chuva.
    Considere que o tempo num determinado dia apenas depende do tempo 
    no dia anterior. 
    Assuma que estamos no primeiro dia de janeiro e que as probabilidades 
    de transição de estados são as da tabela.

    a) Defina, em Matlab, a correspondente matriz de transição.
%}
%        SOL NUVEM CHUVA
    T = [0.7, 0.2, 0.3;
         0.2, 0.3, 0.3;
         0.1, 0.5, 0.4];
    fprintf('\n EX.:5 - Alinea a) \n')
    disp(T);
    sum(T);
%{
    b) Qual a probabilidade de estar sol no segundo dia e no terceiro dia 
    de janeiro quando o primeiro dia e de sol? 
%}
    
    prob_B = 1*T(1,1)*T(1,1);
    fprintf('\n EX.:5 - Alinea b) \n')
    fprintf(['Probabilidade 2º dia ser sol = %.6f \n'], prob_B);
%{
    c) Qual a probabilidade de não chover nem no segundo dia nem no 
    terceiro dia de janeiro quando o primeiro dia e de sol?
%}

    v = [1; 0; 0];
    v2 = T*v;
    w = v2/(v2(1) + v2(2)); % no segundo dia so pode estar sol ou nuvens
    v3 = T*w;
    prob_C = v(1)*(v2(1)+v2(2)) * (v3(1)+v3(2))
    fprintf('\n EX.:5 - Alinea c) \n');
    fprintf(['Probabilidade não chuva = %.6f \n'], prob_C);

%{
    d) Assumindo que o primeiro dia e de sol, determine o número médio 
    de dias de sol, de nuvens e de chuva que se espera ter em todo o 
    mes de janeiro.
%}
    somaSol = v(1);        %o primeiro dia ja foi sol
    somaNuvens = v(2);
    somaChuva = v(3);
    for i = 2:31
        %ou y = T^(i-1)*x; depois usar y
        v = T*v;
        somaSol = somaSol + v(1);
        somaNuvens = somaNuvens + v(2);
        somaChuva = somaChuva + v(3);
    end

    fprintf('\n EX.:5 - Alinea d) \n')
    fprintf(['Número médio de dias de Sol    : %.6f \n'], somaSol);
    fprintf(['Número médio de dias de Nuvens : %.6f \n'], somaNuvens);
    fprintf(['Número médio de dias de Chuva  : %.6f \n \n'], somaChuva);

%{
    e) Assumindo que o primeiro dia e de chuva, determine o numero médio 
    de dias de sol, de nuvens e de chuva que se espera ter em todo o mes 
    de janeiro. Compare estes resultados com os da alınea anterior. 
    O que conclui?
%}
    v = [0 0 1]';
    somaSol = v(1);        %o primeiro dia ja foi sol
    somaNuvens = v(2);
    somaChuva = v(3);
    for i = 2:31
        v = T*v;
        somaSol = somaSol + v(1);
        somaNuvens = somaNuvens + v(2);
        somaChuva = somaChuva + v(3);
    end

    fprintf('\n EX.:5 - Alinea e) \n')
    fprintf(['Número médio de dias de Sol    : %.6f \n'], somaSol);
    fprintf(['Número médio de dias de Nuvens : %.6f \n'], somaNuvens);
    fprintf(['Número médio de dias de Chuva  : %.6f \n \n'], somaChuva);

%{
    f) Considere uma pessoa com reumatismo crónico que tem dores reumáticas 
    com probabilidades de 10%, 30% e 50% quando os dias sao de sol, de 
    nuvens ou de chuva, respetivamente.
    Qual o numero esperado de dias que a pessoa vai sofrer de dores 
    reumaticas em janeiro quando o primeiro dia e de sol? 
    E quando o primeiro dia e de chuva?
%}
    dores = [0.1, 0.3, 0.5];
    dias = [somaSol,  somaNuvens, somaChuva];
    dias_dores = zeros(1,3);
    for i = 1:3
        dias_dores(i) =  dias(i) * dores(i); 
    end

    num_dias_dores = sum(dias_dores);
    fprintf('\n EX.:5 - Alinea f) \n')
    fprintf(['Número de dias com dores se 1º dia é de sol: %.6f \n'], num_dias_dores);

