%{
    FUNÇÃO 1: Cálculo de probabilidade de obter k Caras por simulação

    Parâmetros de Entrada:
        -> p: probabilidade de cara
        -> n: nº de lançamentos 
        -> k: nº de caras pretendidas
        -> N: nº de experiências
%}


function Probabilidade = ProbCarasExactas(p,n,N,k)
        
        lancamentos = rand(n,N) > p;        % matriz de n lançamentos em N experiencias
        sucessos = sum(lancamentos) == k;   % sucessos de k e só k caras
        Probabilidade = sum(sucessos)/N;    % calculo de probabilidade pretendida

end

