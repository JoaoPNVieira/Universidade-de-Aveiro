clear; 
clc;
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL04 - Algoritmos Probabilísticos ]
[ 4.1 Funções de dispersão ]

%}
%% EXERCÍCIO 2
%{
    Considere a função Matlab string2hash() que implementa duas funções de 
    dispersão diferentes. Considere ainda 2 funções Matlab fornecidas que 
    são adaptações para Matlab das funções de dispersão hashstring()
    e DJB31MA()

    Utilizando separadamente cada uma destas quatro funções de dispersão, 
    simule a inserção das chaves criadas no exercício 1a) em 3 Chaining 
    Hash Tables, uma de tamanho (5x10^5) outra de tamanho (10^6)
    e a terceira de tamanho (2×10^6). 
    
    Para cada uma das simulações (4 funções de dispersão × 3 tamanhos):
    
    a) Guarde um vetor com os hashcodes obtidos
    b) Registe o numero de atribuições a cada uma das posições de cada Hash Table.
    c) Calcule o numero de colisões (em cada Hash Table e para cada função de dispersão). 
    d) O tempo de execução da simulação.
%}
%%  a, b, c, d)
% main()

load keysA.mat;
load keysB.mat;
test_keysB = true;
if test_keysB == true
    keysA = keysB;
end

T1 = 5e5; T2 = 1e6; T3 = 2*1e6;
N  = length(keysA); 

H1 = zeros(4,N);  H2 = zeros(4,N);  H3 = zeros(4,N);  % guarda os hashcodes
P1 = zeros(4,T1); P2 = zeros(4,T2); P3 = zeros(4,T3); % nº de atribuições de cada hashcode
c1 = [0 0 0 0];   c2 = [0 0 0 0];   c3 = [0 0 0 0];   % nº de colisões
t1 = [0 0 0 0];   t2 = [0 0 0 0];   t3 = [0 0 0 0];   % guarda tempos de execução
%% Hash: string2hash() ---> djb2
start = tic;
    for i = 1:N
        hash = string2hash(keysA{i}); % DEFAULT: djb2
        hash = mod(hash,T1) + 1;
        H1(1,i) = hash;
        P1(1,hash) = P1(hash) + 1;
    end
    for i = 1:T1
        if P1(1,i) >= 2
            c1(1) = c1(1) + P1(1,i) - 1;
        end
    end
t1(1) = toc(start);
%
start = tic;
    for i = 1:N
        hash = string2hash(keysA{i}); % DEFAULT: djb2
        hash = mod(hash,T2) + 1;
        H2(1,i) = hash;
        P2(1,hash) = P2(hash) + 1;
    end
    for i = 1:T2
        if P2(1,i) >= 2
            c2(1) = c2(1) + P2(1,i) - 1;
        end
    end
t2(1) = toc(start);
%
start = tic;
    for i = 1:N
        hash = string2hash(keysA{i}); % DEFAULT: djb2
        hash = mod(hash,T3) + 1;
        H3(1,i) = hash;
        P3(1,hash) = P3(hash) + 1;
    end
    for i = 1:T3
        if P3(1,i) >= 2
            c3(1) = c3(1) + P3(1,i) - 1;
        end
    end
t3(1) = toc(start);
%% Hash: string2hash() ---> sdbm
start = tic;
    for i = 1:N
        hash = string2hash(keysA{i},'sdbm');
        hash = mod(hash,T1) + 1;
        H1(2,i) = hash;
        P1(2,hash) = P1(hash) + 1;
    end
    for i = 1:T1
        if P1(2,i) >= 2
            c1(2) = c1(2) + P1(2,i) - 1;
        end
    end
t1(2) = toc(start);
%
start = tic;
    for i = 1:N
        hash = string2hash(keysA{i},'sdbm');
        hash = mod(hash,T2) + 1;
        H2(2,i) = hash;
        P2(2,hash) = P2(hash) + 1;
    end
    for i = 1:T2
        if P2(2,i) >= 2
            c2(2) = c2(2) + P2(2,i) - 1;
        end
    end
t2(2) = toc(start);
%
start = tic;
    for i = 1:N
        hash = string2hash(keysA{i},'sdbm');
        hash = mod(hash,T3) + 1;
        H3(2,i) = hash;
        P3(2,hash) = P3(hash) + 1;
    end
    for i = 1:T3
        if P3(2,i) >= 2
            c3(2) = c3(2) + P3(2,i) - 1;
        end
    end
t3(2) = toc(start);
%% Hash: hashstring()
start = tic;
    for i = 1:N
        code = hashstring(keysA{i}, T1) + 1 ;
        H1(3,i) = code;
        P1(3,code) = P1(code) + 1;
    end
    for i = 1:T1
        if P1(3,i) >= 2
            c1(3) = c1(3) + P1(3,i) - 1;
        end
    end
t1(3) = toc(start);
%
start = tic;
    for i = 1:N
        code = hashstring(keysA{i}, T2) + 1 ;
        H2(3,i) = code;
        P2(3,code) = P2(code) + 1;
    end
    for i = 1:T2
        if P2(3,i) >= 2
            c2(3) = c2(3) + P2(3,i) - 1;
        end
    end
t2(3) = toc(start);
%
start = tic;
    for i = 1:N
        code = hashstring(keysA{i}, T3) + 1 ;
        H3(3,i) = code;
        P3(3,code) = P3(code) + 1;
    end
    for i = 1:T3
        if P3(3,i) >= 2
            c3(3) = c3(3) + P3(3,i) - 1;
        end
    end
t3(3) = toc(start);
%% Hash: DJB31MA 
start = tic;
    for i = 1:N
        h = DJB31MA(keysA{i}, 127); % 127 é (2^32 - 1)
        h = mod(h,T1) + 1; % calcula resto de divisão de h por T dando valor entre 0 e T-1(+1) (ie, entre 0 e T)
        H1(4,i) = h;
        P1(4,h) = P1(h) + 1;
    end
    for i = 1:T1
        if P1(4,i) >= 2
            c1(4) = c1(4) + P1(4,i)-1;
        end
    end
t1(4) = toc(start);
%
start = tic;
    for i = 1:N
        h = DJB31MA(keysA{i}, 127); % 127 é (2^32 - 1)
        h = mod(h,T2) + 1; % calcula resto de divisão de h por T dando valor entre 0 e T-1(+1) (ie, entre 0 e T)
        H2(4,i) = h;
        P2(4,h) = P2(h) + 1;
    end
    for i = 1:T2
        if P2(4,i) >= 2
            c2(4) = c2(4) + P2(4,i)-1;
        end
    end
t2(4) = toc(start);
%
start = tic;
    for i = 1:N
        h = DJB31MA(keysA{i}, 127); % 127 é (2^32 - 1)
        h = mod(h,T3) + 1; % calcula resto de divisão de h por T dando valor entre 0 e T-1(+1) (ie, entre 0 e T)
        H3(4,i) = h;
        P3(4,h) = P3(h) + 1;
    end
    for i = 1:T3
        if P3(4,i) >= 2
            c3(4) = c3(4) + P3(4,i)-1;
        end
    end
t3(4) = toc(start);