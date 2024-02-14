
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ REMAKE - ESTUDO PARA EXAME ]
[ PL03 - Cadeias de Markov ]
[ 3.1  Exercícios base ]

%}
%% EXERCÍCIO 1
% a)    
         %Ir    Ñ Ir
    TE1 = [ 0.7   0.8 ;   %   Ir <-
          0.3   0.2 ];  % Ñ Ir <-

    va = [1 0]';
    va = (TE1^2)*va; % 2 saltos: Q-S-Q
    Pa = va(1);

% b)    
    
    vb = [0 1]';
    vb = (TE1^2)*vb;
    Pb = vb(1);

% c)
    
    vc = [1 0]';
    aulas = 15*2;
    vc = (TE1^(aulas-1))*vc;
    Pc = vc(1);

% d)    
    
    vd    = [0.85 0.15]'; 
    vd2    = TE1*vd;
    Pd    = zeros(1,30);
    Pd(1) = vd2(2);

    for i = 2:30
        r = (TE1^i)*vd;
        Pd(i) = r(2);
    end 
    
    eixo_xx = (1:30);
    plot(eixo_xx,Pd)
    
    hold on
    xlabel('Aulas num Semestre de 15 semanas')
    ylabel('Probabilidade de faltar')
    title("Probabilidade de faltar a todas as 30 aulas")
    axis padded

%% EXERCÍCIO 2
% a)

    TE2 = [ 1/3, 1/4,   0    ;
           1/3, 11/20, 1/2  ;
           1/3, 1/5,   1/2 ];

    est = sum(TE2);

% b) 

    alunos = 90;
    C = 15;
    B = 15;
    A = 2*(C+B);
    Total = A + B + C;
    vb = [ A B C ]'/Total;

% c)
    aulas = 30;
    n  = aulas - 1;
    vc = (TE2^n)*vb;
    vc =vc*90;

% d)
    v = [90/3, 90/3, 90/3]';
    vd = (TE2^n) * v;

%% EXERCÍCIO 3
% a)

