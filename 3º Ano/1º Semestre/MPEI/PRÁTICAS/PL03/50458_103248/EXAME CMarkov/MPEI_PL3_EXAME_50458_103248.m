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
    Tamanho = size(L) % Valor de N : 90 x 90
    dead = sum(L) == 0;
    T_Dead_end = sum(dead)
    vec = sum(L)
    dead_end_ident = find(vec==0)

% b) 
    H = L;
    H = H./sum(H);
    H(isnan(H)) = 0

% c) 
    H = L;
    H = H./sum(H);
    H(isnan(H)) = 1/90;
    N = ones(90,90)/90;
    beta = 0.85;
    A = (beta*H) + ((1-beta)*N)

% d)
    pagerank = ones(90,1)/90; % vetor inicial
    tol = 1e-4;             % 10^-4 de tolerancia máxima no vector pagerank
    converge = 0;           % flag se tolerancia for diferente
    i = 0;                  % iterador

    while converge == 0
        i = i + 1;
        new_pagerank = A * pagerank;
        if i > 2 && max(abs(new_pagerank - pagerank)) < tol        % Verificar convergência (da tolerancia)
            converge = 1;
        end
        
        pagerank = new_pagerank;
    end
    
    disp(pagerank)
    iter = num2str(i);
    
% e )
    
    dead_ends_pagerank = [pagerank(22), pagerank(25), pagerank(32), pagerank(51)]
%% EXERCICIO 3
% b )
%       1
    T = [0  , 8/30, 0  , 8/30, 0  , 0;
        1/3, 0   , 0.5, 0   , 0.4 , 0;
        1/3, 8/30, 0  , 8/30, 0   , 0;
        1/3, 0   , 0.5, 0   , 0.4 , 0;
        0  , 8/30, 0  , 8/30, 0   , 0; 
        0  , 0.2 , 0  , 0.2  , 0.2, 1]
% c) 
    state = crawl(T, 1, 6)