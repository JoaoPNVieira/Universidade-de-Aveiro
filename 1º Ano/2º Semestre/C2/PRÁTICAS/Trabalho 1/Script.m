% ----------------------------------------------------------------------- %
%                          Definição de intervalos                        %
% ----------------------------------------------------------------------- %

Intervalo_1 = linspace(-pi/2,pi/2,1000); %--------> pi - ok
Intervalo_2 = linspace(pi/2,3*pi/2,1000); %-------> pi - ok
Intervalo_3 = linspace(3*pi/2,5*pi/2,1000); %-----> pi - ok
Intervalo_4 = linspace(5*pi/2,7*pi/2,1000); %-----> pi - ok
Intervalo_5 = linspace(7*pi/2,9*pi/2,1000); %-----> pi - ok
Intervalo_6 = linspace(9*pi/2,5*pi,1000); %-------> upper limit (pi/2) - ok
Intervalo_7 = linspace(-3*pi/2,-pi/2,1000); %-----> pi - ok
Intervalo_8 = linspace(-5*pi/2,-3*pi/2,1000); %---> pi - ok
Intervalo_9 = linspace(-7*pi/2,-5*pi/2,1000); %---> pi - ok
Intervalo_10 = linspace(-9*pi/2,-7*pi/2,1000); %--> pi - ok
Intervalo_11 = linspace(-5*pi,-9*pi/2,1000); %----> lower limit (pi/2) - ok
Intervalo_J = linspace(-5*pi,5*pi,1000); %--------> 10pi - ok


% ----------------------------------------------------------------------- %
%                          Matriz De Intervalos                           %
% ----------------------------------------------------------------------- %

x = [Intervalo_1;
     Intervalo_2;
     Intervalo_3;
     Intervalo_4;
     Intervalo_5;
     Intervalo_6;
     Intervalo_7;
     Intervalo_8;
     Intervalo_9;
     Intervalo_10;
     Intervalo_11];
 
% ----------------------------------------------------------------------- %
%                         Matriz De Funções                               %
% ----------------------------------------------------------------------- %
 
y = [x(1,:);
     pi-x(2,:);
     x(3,:);
     pi-x(4,:);
     x(5,:);
     pi-x(6,:);
     pi-x(7,:);
     x(8,:);
     pi-x(9,:);
     x(10,:);
     pi-x(11,:)];
 
 % ---------------------------------------------------------------------- %
 %                        Geração Do Gráfico                              %
 % ---------------------------------------------------------------------- %
 
 figure(1)
 plot(x',y','lineWidth',1.5,'Color','k')
 hold on