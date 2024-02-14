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
%% EXERCÍCIO 1
%{
    Um aluno do primeiro ano de um curso de Engenharia tem todas as semanas 
    2 aulas TP de uma UC X as 9:00, as quartas e sextas. 
    Todos os dias que tem aulas desta UC, o aluno decide se vai a aula ou 
    não da seguinte forma: 
    -> Se foi à aula anterior a probabilidade de ir à aula seguinte é 70%; 
    -> Se faltou à anterior, a probabilidade de ir à aula seguinte é 80%.

    a) Se estiver presente na aula de quarta numa determinada semana, qual 
    a probabilidade de estar presente na aula de quarta da semana seguinte?

    Sugestao: Comece por definir a matriz de transicao de estados e 
    o vetor estado correspondentes. 
%} 

    T = [7/10, 8/10;
         3/10, 2/10];

    va = [1 0]';
    va = (T^2)*va;
    p1a  = va(1);

    fprintf('EX.:1 - Alinea a) \n')
    fprintf(['Probabilidade = %.6f \n \n'], p1a);
%{
    b) Se nao estiver presente na aula de quarta numa determinada semana, 
    qual a probabilidade de estar presente na aula de quarta da semana 
    seguinte?
%}
    
    vb  = [0 1]';
    vb  = (T^2)*vb;
    p1b = vb(1);

    fprintf('EX.:1 - Alinea b) \n')
    fprintf(['Probabilidade = : %.6f \n \n'], p1b);

%{
    c) Sabendo que esteve presente na primeira aula, qual a probabilidade 
    de estar na ultima aula, assumindo que o semestre tem exactamente 
    15 semanas de aulas e nao existem feriados?
%}
    n = (15*2)-1;
    vc = [1 0]';
    vc = (T^n)*vc;
    
    p1c = vc(1);
    fprintf('EX.:1 - Alinea c) \n')
    fprintf(['Probabilidade = : %.6f \n \n'], p1c);

%{
    d) Represente num grafico a probabilidade de faltar a cada uma das 
    30 aulas, assumindo que a probabilidade de estar presente na primeira 
    aula e de 85%
%}

    vd  = [0.85 0.15]';
    vd2 = T * vd;
    xi = 30;
    res = zeros(1,xi);
    res(1) = vd2(2);

    for count = 2:xi
        r = (T^(count-1)) * vd2;
        res(count) = r(2);
    end
  
    eixo_xx = (1:30);
    plot(eixo_xx,res)
    
    hold on
    xlabel('Aulas num Semestre de 15 semanas')
    ylabel('Probabilidade de faltar')
    title("Probabilidade de faltar a todas as 30 aulas")
    axis padded

 