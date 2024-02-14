clear; 
clc;
run PL04_41_EX1.m
run PL04_41_EX2.m
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
%% EXERCÍCIO 3
%{
    Utilizando a informação obtida no exercício anterior, compare o 
desempenho das quatro funções de dispersao para cada tamanho diferente 
da Hash Table, relativamente a:

    a) Uniformidade, de duas formas diferentes:
    
        i. ) visualize os histogramas dos hascodes com 100 intervalos e 
verifique se os valores nos diferentes intervalos sao similares;
        
        ii.) calcule os momentos de ordem 2, 5 e 10 das variaveis aleatórias 
correspondentes aos valores dos hashcodes divididos pelo comprimento da Hash 
Table (i.e, variavel aleatória toma valores entre 0 e 1) e compare com os valores 
teoricos da distribuição uniforme. 

    b) Nº de colisões e nº máximo de atribuições numa mesma posição da Hash Table.
    
    c) Tempos de execução.

%}
%% a )
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