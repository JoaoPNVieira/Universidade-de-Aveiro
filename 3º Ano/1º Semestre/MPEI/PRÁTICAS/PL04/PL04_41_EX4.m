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
%% EXERCÍCIO 4
%{
    Repita os exercícios 2 e 3 usando agora as chaves criadas no exercício 1b). 
    As conclusoes destes resultados sao semelhantes as do exercício 3?
%}
load keysB.mat;

T1 = 5e5; T2 = 1e6; T3 = 2*1e6;
N  = length(keysB);

H1 = zeros(4,N);  H2 = zeros(4,N);  H3 = zeros(4,N);  % guarda os hashcodes
P1 = zeros(4,T1); P2 = zeros(4,T2); P3 = zeros(4,T3); % nº de atribuições de cada hashcode
c1 = [0 0 0 0];   c2 = [0 0 0 0];   c3 = [0 0 0 0];   % nº de colisões
t1 = [0 0 0 0];   t2 = [0 0 0 0];   t3 = [0 0 0 0];   % guarda tempos de execução
%% Hash: string2hash() ---> djb2
start = tic;
    for i = 1:N
        hash = string2hash(keysB{i}); % DEFAULT: djb2
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
        hash = string2hash(keysB{i}); % DEFAULT: djb2
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
        hash = string2hash(keysB{i}); % DEFAULT: djb2
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
        hash = string2hash(keysB{i},'sdbm');
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
        hash = string2hash(keysB{i},'sdbm');
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
        hash = string2hash(keysB{i},'sdbm');
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
        code = hashstring(keysB{i}, T1) + 1 ;
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
        code = hashstring(keysB{i}, T2) + 1 ;
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
        code = hashstring(keysB{i}, T3) + 1 ;
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
        h = DJB31MA(keysB{i}, 127); % 127 é (2^32 - 1)
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
        h = DJB31MA(keysB{i}, 127); % 127 é (2^32 - 1)
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
        h = DJB31MA(keysB{i}, 127); % 127 é (2^32 - 1)
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







 subplot(3,4,1);
    histogram(H1(1,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: djb2 [5e5]')
    subplot(3,4,2)
    histogram(H1(2,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: sdbm [5e5]')
    subplot(3,4,3)
    histogram(H1(3,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: hashstring() [5e5]')
    subplot(3,4,4)
    histogram(H1(4,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: DJB31MA [5e5]')
    
    subplot(3,4,5);
    histogram(H2(1,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: djb2 [10e6]')
    subplot(3,4,6)
    histogram(H2(2,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: sdbm [10e6]')
    subplot(3,4,7)
    histogram(H2(3,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: hashstring() [10e6]')
    subplot(3,4,8)
    histogram(H2(4,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: DJB31MA [10e6]')

    subplot(3,4,9);
    histogram(H3(1,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: djb2 [2x10^6]')
    subplot(3,4,10)
    histogram(H3(2,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: sdbm [2x10^6]')
    subplot(3,4,11)
    histogram(H3(3,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: hashstring() [2x10^6]')
    subplot(3,4,12)
    histogram(H3(4,:),100);
    xlabel('Intervalos');
    ylabel('Hashcodes');
    title('3a) Algoritmo: DJB31MA [2x10^6]')

    H1norm1 = H1(1,:)/T1;
    H1norm2 = H1(2,:)/T1;
    H1norm3 = H1(3,:)/T1;
    H1norm4 = H1(4,:)/T1;
    
    fprintf('H1: Momento 2: Teórico = %.5f Medido %.5f\n',1/3,mean(H1norm1.^2));
    fprintf('H1: Momento 5: Teórico = %.5f Medido %.5f\n',1/6,mean(H1norm1.^5));    
    fprintf('H1: Momento 10: Teórico = %.5f Medido %.5f\n',1/11,mean(H1norm1.^10));

    fprintf('H2: Momento 2: Teórico = %.5f Medido %.5f\n',1/3,mean(H1norm2.^2));
    fprintf('H2: Momento 5: Teórico = %.5f Medido %.5f\n',1/6,mean(H1norm2.^5));    
    fprintf('H2: Momento 10: Teórico = %.5f Medido %.5f\n',1/11,mean(H1norm2.^10));

    fprintf('H3: Momento 2: Teórico = %.5f Medido %.5f\n',1/3,mean(H1norm3.^2));
    fprintf('H3: Momento 5: Teórico = %.5f Medido %.5f\n',1/6,mean(H1norm3.^5));    
    fprintf('H3: Momento 10: Teórico = %.5f Medido %.5f\n',1/11,mean(H1norm3.^10));

    fprintf('H4: Momento 2: Teórico = %.5f Medido %.5f\n',1/3,mean(H1norm4.^2));
    fprintf('H4: Momento 5: Teórico = %.5f Medido %.5f\n',1/6,mean(H1norm4.^5));    
    fprintf('H4: Momento 10: Teórico = %.5f Medido %.5f\n',1/11,mean(H1norm4.^10));
    
    fprintf('Max no de atribuições %d\n',max(P1(1,:)));
    fprintf('Max no de atribuições %d\n',max(P1(2,:)));
    fprintf('Max no de atribuições %d\n',max(P1(3,:)));
    fprintf('Max no de atribuições %d\n',max(P1(4,:)));
    fprintf('Max no de atribuições %d\n',max(P2(1,:)));
    fprintf('Max no de atribuições %d\n',max(P2(2,:)));
    fprintf('Max no de atribuições %d\n',max(P2(3,:)));
    fprintf('Max no de atribuições %d\n',max(P2(4,:)));
    fprintf('Max no de atribuições %d\n',max(P3(1,:)));
    fprintf('Max no de atribuições %d\n',max(P3(2,:)));
    fprintf('Max no de atribuições %d\n',max(P3(3,:)));
    fprintf('Max no de atribuições %d\n',max(P3(4,:)));
    
    fprintf("\n ------------------------------------- \n")

    fprintf('Execution time djb2         [5e5] : %.5f\n',t1(1))
    fprintf('Execution time sdbm         [5e5] : %.5f\n',t1(2))
    fprintf('Execution time hashstring() [5e5] : %.5f\n',t1(3))
    fprintf('Execution time DJB31MA      [5e5] : %.5f\n\n',t1(4))

    fprintf('Execution time djb2         [1e6] : %.5f\n',t2(1))
    fprintf('Execution time sdbm         [1e6] : %.5f\n',t2(2))
    fprintf('Execution time hashstring() [1e6] : %.5f\n',t2(3))
    fprintf('Execution time DJB31MA      [1e6] : %.5f\n\n',t2(4))

    fprintf('Execution time djb2         [2x1e6] : %.5f\n',t3(1))
    fprintf('Execution time sdbm         [2x1e6] : %.5f\n',t3(2))
    fprintf('Execution time hashstring() [2x1e6] : %.5f\n',t3(3))
    fprintf('Execution time DJB31MA      [2x1e6] : %.5f\n\n',t3(4))