clear; clc;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2022/23]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ PL02 - Probabilidade e Variáveis Aleatórias ]
[2.1 Probabilidade condicional, independencia ]

%}
%% EXERCÍCIO 2
%{
   2.) Considere o seguinte "jogo": 
    Lançamento com os olhos vendados de dardos, um de cada vez, param alvos,
    garantindo-se que cada dardo atinge sempre um alvo(e apenas1). 
    
    a) Estime por simulação a probabilidade de nenhum alvo ter sido atingido mais
    do que uma vez quando: n = 20 dardos 
                           m = 100 alvos.
%}
     n = 20;  % nº de Dardos
     m = 100; % nº de Alvos
     N = 1e5; % nº Experiências

     Exp = randi(m,n,N); % Matriz de lançamentos
    
     counter = 0;
     for i = 1:N
         aux = Exp(:,i);                % aux é vector coluna de todos os alvos atingidos por jogada
         if length(unique(aux)) == n    % Se o comprimento de aux for == 20 
                                        % significa que todos os alvos foram 
                                        % atingidos 1 vez só

             counter = counter + 1;     % Counter incrementa
         end
     end
     
     prob_2a = counter/N;
     fprintf('2a.) Probabilidade = %.6f', prob_2a)
     fprintf('\n')

%{
    
    b) Estime por simulação a probabilidade de pelo menos 1 alvo ter sido atingido 
    2 ou mais vezes quando:     n = 20 dardos
                                m = 100 alvos.
%}
  
     n = 20;  % nº de Dardos
     m = 100; % nº de Alvos
     N = 1e5; % nº Experiências

     Exp = randi(m,n,N); % Matriz de lançamentos
    
     counter = 0;
     for i = 1:N
         aux = Exp(:,i);                % aux é vector coluna de todos os alvos atingidos por jogada
         if length(unique(aux)) < n    % Se o comprimento de aux for <= 20 significa que pelo menos um
                                        % foi atingindo pelo menos 2 vezes                                      % atingidos 1 vez só

             counter = counter + 1;     % Counter incrementa
         end
     end
     
     prob_2b = counter/N;
     fprintf('2b.) Probabilidade = %.6f', prob_2b)
     fprintf('\n')

%{    
    c) Considere os valores de: 
    m=1000 e m=100000 alvos.
    Para cada um destes valores, faça as simulações necessárias para desenhar
    um gráfico (usando a função plot do Matlab) da probabilidade da alinea (b)
    em função do nº de dardos n.
    Considere n de 10 a 100 com incrementos de 10. 
    Os 2 gráficos devem ser sub-gráficos de uma mesma figura (use a instrucao subplot do Matlab). 
    Compare os resultados dos 2 casos e retire conclusões.
%}

      N=1e5;
      m = 1e3; % fixar valor de m = 1000
      x = 10:10:100; % vector do eixo do x
      res1e3 = []; % vector resultados
      
      for n = x % vector n de 10 a 100, com saltos de 10 em 10
          L = randi(m,n,N);
          d1e3 = zeros(1,N);
          for col = 1:N
              d1e3(col) = length(unique(L(:,col)))<n;
          end
          res1e3 = [res1e3 sum(d1e3)/N]; 
      end
      
      m = 1e5; % fixar valor de m = 100000
      res1e5 = []; % vector resultados
      for n = x % vector n de 10 a 100, com saltos de 10 em 10
          L = randi(m,n,N);
          d1e5 = zeros(1,N);
          for col = 1:N
              d1e5(col) = length(unique(L(:,col)))<n;
          end
          res1e5 = [res1e5 sum(d1e5)/N]; 
      end


      subplot(1,3,1)
      grid on;
      plot(x,res1e3,'r*-', xlabel('n'),ylabel('Probabilidade')), title('EX.: 2c.) m = 1e3')
      hold on;
      subplot(1,3,2)
      plot(x,res1e5,'r*-', xlabel('n'),ylabel('Probabilidade')), title('EX.: 2c.) m = 1e3')
      hold off
      
%{
    d)
    Considere o valor de n = 100 dardos.
    Faça as simulações necessárias para desenhar umgráfico da probabilidade da alínea
    (b) em função dos valores de m = 200,500,1000,2000,5000,10000, 20000,50000 e 100000 alvos.
    O que conclui dos resultados obtidos?
%}
    
    N = 1e5;  
    n = 100; % nº dardos
    x = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000]; % nº alvos
    resultados = [];
    idx = 1;

    for m = x
        L = randi(m,n,N);
        dif = zeros(1,N);
        for c = 1:N
            dif = length(unique(L(:,c)))<n;
        end
        resultados = [resultados sum(dif)/N];
    end
    
    subplot(1,3,3)
    axis([0 100000 0 1])
    plot(x,resultados,'r*-', xlabel('n'),ylabel('Probabilidade')), title('EX.: 2d.)')
