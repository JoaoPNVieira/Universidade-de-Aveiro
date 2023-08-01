clear all

minN=2.22e-308; maxN=1.8*308; %-------> N˙meros minimo e m·ximo represent·veis em Matlab
 %-----------------------------> Vari‡vel x simbÛlica
a = -pi/2 ; b = pi/2; %---> Intervalo minimo 
J1 = -5*pi ; J2 = 5*pi; %-------------> Extremos do Intervalo J: -5pi < J < 5pi
T = abs(a-b); %-----------------------> Periodo
t = T/2 %-----------------------------> Periodo restante

for i=1:5
    I(i,:) = linspace(a,b,1000);
    a = b; b = b+T;
end
b = b-t; I(6,:)= linspace(a,b,1000); 
a = -3*pi/2; b = -pi/2;
for i=7:10
    I(i,:) = linspace(a,b,1000);
    b = a; a = a-T;
end
a = a+t; I(11,:)= linspace(a,b,1000);

x = [I(11,:);I(10,:);I(9,:);I(8,:);I(7,:);
I(1,:);I(2,:);I(3,:);I(4,:);I(5,:);I(6,:)]

y = pi-x
 % ---------------------------------------------------------------------- %
 %                        Gera√ß√£o Do Gr√°fico                              %
 % ---------------------------------------------------------------------- %
 
 figure(1)
 plot(x,y,'lineWidth',1.5,'Color','k')
 hold on