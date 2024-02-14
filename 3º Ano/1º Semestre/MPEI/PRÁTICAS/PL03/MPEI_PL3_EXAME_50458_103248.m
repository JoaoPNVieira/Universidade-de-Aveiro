clear; clc;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI

ALUNOS: 
    JOÃO PEDRO NUNES VIEIRA, 50458
    JOSÉ MIGUEL GUARDADO SILVA, 103248

CURSO: LECI
################################
%}
%% EXERCÍCIO 1
% a)
%         A     B   C   D
    T = [0.1 , 0.1, 0.3, 0.3; 
         0.4 , 0.1, 0.3, 0.3;
         0.25, 0.5, 0.1, 0.3;
         0.25, 0.3, 0.3, 0.1]

    Estocastica = sum(T)
    
%b) Exercício executado na folha de exame

%c) 
    n = 5; % 5 transições (7:00, 7:02, 7:04, 7:06, 7:08, 7:10)
    %      A    B      C     D   
    v = [0.25, 0.25, 0.25, 0.25]';
    Pub = (T^n)*v;
    PubA = Pub(1)

    % RESULTADO = 0.2055
%d)  
    Id = eye(size(T));  % Matriz Identidade
    b = [zeros(4,1);1]; % vetor
    M = [ T - Id; 
        ones(1,4)];     % (T-I)u
    u = M\b             % left division


    %
    n = 360 - 1; % cada hora tem 30 publicidades e em 12h temos 360 possiveis
   
    pubicidades_de_A = u(1)*n;
    tempo_hora_A = (pubicidades_de_A * 2)/12 % cada publicidade tem 2 min.
    % RESPOSTA: 12.2945 min/h para publicidades de A

%e) 
    pA1  = v(1);
    pB1  = T(2,1);
    X1   = sum(T(:,2));
    X2   = 1;
    X3   = 1;
    pB2  = T(2,1) + T(2,2) + T(2,3) + T(2,4);
    pA2  = T(1,2);

    ABXXXBA = pA1 * pB1 * X1 * X2 * X3 * pB2 * pA2
 %% EXERCÍCIO 2
% a)
    load('L.mat');





%%
% APAGAR
%%
%{
Gráficos:
    subplot(linhas,colunas,local)
    plot(x, y)
    xlabel('label de x')
    ylabel('label de y')    
    title('título')


Matriz Canónica: (para determinar matrizes em situações limite de cadeias
absorventes)
    Tc = [Q 0;
          R I];


Matriz estocástica:
    Est = sum(Tc)


Probabilidades limite de cada estado (estacionário):    
    Id = eye(size(T));  % Matriz Identidade
    b = [zeros(4,1);1]; % vetor
    
    M = [ T - Id; 
        ones(1,4)];     % (T-I)u

    u = M\b;            % left division


Matriz Q: (probabilidades de permanecer em estados não absorventes, ie, transientes)
    ini  = 1;
    nena = 3; 
    Q = Tc(ini:nena,ini:nena)


Matriz Id: (estados absorventes)
    Id = eye(x)


Matriz R: (probabilidades de transição, num periodo, de estados transientes
para absorção
    R = Tc(nena+1:end, 1:nena); % (4:5 , 1:3)


Matriz Fundamental: (de precurso aleatório, dá o nº médio de visitas a cada
estado antes da absorção - visitou estado j saindo de i)
    F = inv(eye(3)-Q)


Média (valor esperado) do nº de passos antes da absorção 
    SOMA = sum(F) % da matriz fundamental


Probabilidade de absorção do estado x:
    Absor = R*F;
    absorE1_E3 = Absor(linha,coluna);
%}