clear all
close all

syms x;

%-COLOQUE A PARTE 1 EM COMENTÁRIO E EXECUTE A PARTE 2 CASO PRETENDA GRÁFICOS SOBREPOSTOS

%PARTE 1:
n = 1; %-----------> ORDEM: Inserir a Ordem de Somas pretendida
f=((-1/n)*cos(n*(pi/2))+(2/(pi*n^2)*(-1)^n))*sin(n*x);
ezplot(f,[-5*pi 5*pi])
hold on
title("Série de Fourier de Ordem:" + n)
xlabel("X")
ylabel("FX")
hold off

%GRÁFICOS DA SÉRIE DE FOURIER SOBREPOSTOS  
%PARTE 2
% while n<=4
% f=((-1/n)*cos(n*(pi/2))+(2/(pi*n^2)*(-1)^n))*sin(n*x);
% ezplot(f,[-5*pi 5*pi])
% hold on
% title("Série de Fourier de Ordem:" + n)
% xlabel("X")
% ylabel("FX")
% axis([-5 5 -5 5])
% n=n+1;
% end
%hold off