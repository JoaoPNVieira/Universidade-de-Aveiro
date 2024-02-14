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
%% EXERCÍCIO 4
%{
    Considerando o diagrama da Cadeia de Markov:
    
    a) Defina, em Matlab, a matriz transição de estados T, assuminfo que:
        p = 0.4
        q = 0.6
%}
    p = 0.4; q = 0.6;
    T = [(p^2)   , 0, 0, (q^2)   ;
         (1-p)^2 , 0, 0, q*(1-q) ; 
         p*(1-p) , 0, 0, q*(1-q) ;
         p*(1-p) , 1, 1, (1-q)^2];
    fprintf('EX.:4 - Alinea a) \n')
    disp(T)
%{
    b) Assuma que o sistema se encontra inicialmente no estado A. 
    Qual a probabilidade de estar em cada estado ao fim de: 
        - 5 transições 
        - 10 transições 
        - 100 transições
        - 200 transições
%}  
    va = [1 0 0 0]';
    n = 5;
    va5 = (T^5)*va;
    va10 = (T^10)*va;
    va100 = (T^100)*va;
    va200 = (T^200)*va;

    fprintf('\n EX.:4 - Alinea b) \n')
    fprintf('5 Transições: \n \n');
    disp(va5)
    fprintf('10 Transições: \n \n');
    disp(va10)
    fprintf('100 Transições: \n \n');
    disp(va100)
    fprintf('200 Transições: \n \n');
    disp(va200)
    
%{
    c) Determine as probabilidades limite de cada estado. 
    Compare estes valores com os obtidos na alínea anterior. 
    O que conclui?
%}

    Id = eye(size(T));  % Matriz Identidade
    b = [zeros(4,1);1]; % vetor
    M = [ T - Id; 
        ones(1,4)];     % (T-I)u

    u = M\b;            % left division

    fprintf('\n EX.:4 - Alinea c) \n')
    disp(u)