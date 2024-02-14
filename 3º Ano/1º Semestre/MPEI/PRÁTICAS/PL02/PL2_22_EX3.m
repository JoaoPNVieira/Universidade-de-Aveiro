clear; clc;
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################
%}
% PL02 - Probabilidade e Variáveis Aleatórias
%--------------------------------------------------------------------------
%{ 
2.2 - Variáveis Aleatórias:
CALCULOS TEÓRICO EM FOLHAS:
###########################################################################

    3.) Considere 4 lançamentos de uma moeda equilibrada. 
        Seja X a variavel aleatoria representativa do numero de coroas 
        observados nos 4 lançamentos.
    
      S = [x x x x];

    a) Estime por simulaçao a funçao massa de probabilidade pX(x) da variavel aleatoria X

%}
    
    N = 1e6;            % nº de experiências
    lancamentos = 4;    
    pCoroa = 0.5;
    x = 0:4;

    Mexp = rand(lancamentos,N) < pCoroa;    % Matriz experiências
    cfav = sum(Mexp);                       % casos favoráveis/elementares
    Fx = [sum(cfav==x(1))/N, sum(cfav==x(2))/N, sum(cfav==x(3))/N, sum(cfav==x(4))/N, sum(cfav==x(5))/N];
    
    subplot(2,1,1)
    stem(x,Fx),xlabel('x'),ylabel('Px'),title('EX.: 3a.) Função Massa de Probabilidade - Simulação');
    axis padded
    grid on

    fprintf('EX.: 3a.)\n')
    fprintf('Fx(0) = %.6f \n', Fx(1));
    fprintf('Fx(1) = %.6f \n', Fx(2));
    fprintf('Fx(2) = %.6f \n', Fx(3));
    fprintf('Fx(3) = %.6f \n', Fx(4));
    fprintf('Fx(4) = %.6f \n', Fx(5));
    fprintf('\n \n');

%{
    b) Estime o valor esperado, a variancia e o desvio padrao de X com base em pX(x).
    
    NOTA TEÓRICA - Tendo todos os xi e respectivas probabilidades:
    
    Esperança: E[X] = sum(i)(xi*pi);
    Variancia: VAR[X] = sum(i)((xi - E[X])^2)*pi) = E[X^2] - E^2[X]
    Desvio Padrão: dP = sqrt(VAR[X]);
%}

    fprintf('EX.: 3b.) \n')
    % --------------------------------------------------
    % Valor Esperado: E[x]
    valEsp = 0;
    for i = 1:5
        valEsp = valEsp + (x(i) * Fx(i));
    end
    fprintf('Valor Esperado: E[x] = %.4f \n', valEsp)
    
    % --------------------------------------------------
    % Variância: Var = E[X^2] - E^2[X]
    var = 0;
    for i=1 : 5
      var = var + ((x(i)^2) * Fx(i));
    end
    var = var - (valEsp^2);
    fprintf('Variância: V[x] = %.4f \n', var)
    
   % --------------------------------------------------
    % Desvio padrão: dp = sqrt(var[X]);
    dp = sqrt(var); 
    fprintf('Desvio Padrão: Dp[x] = %.4f \n', dp)
    fprintf('\n \n');

%{
    c) Identifique o tipo da distribuicao da variavel aleatoria X e escreva 
    a expressao teorica da respectiva funcao de probabilidade
%}

    fprintf('EX.: 3c.) É uma distribuição Binomial com p=0.5 e n=4 \n');
    fprintf('\n \n');

%{
    d) Calcule os valores teoricos da funcao massa de probabilidade de X e 
    compare-os com os valores estimados por simulacao obtidos em a).
%}
    F1 = 0.0625; 
    F2 = 0.25;
    F3 = 0.375;
    F4 = 0.25;
    F5 = 0.0625;
    fprintf('EX.: 3d.) Valores teóricos\n')
    fprintf('Fx(0) = %.6f ', F1); fprintf('~~ %.6f \n', Fx(1));
    fprintf('Fx(1) = %.6f ', F2); fprintf('~~ %.6f \n', Fx(2));
    fprintf('Fx(2) = %.6f ', F3); fprintf('~~ %.6f \n', Fx(3));
    fprintf('Fx(3) = %.6f ', F4); fprintf('~~ %.6f \n', Fx(4));
    fprintf('Fx(4) = %.6f ', F5); fprintf('~~ %.6f \n', Fx(5));
    fprintf('\n \n');

%{
    e) Calcule os valores teoricos de E[x] e de Var(X) e compare-os com os valores obtidos em (b).
%}

