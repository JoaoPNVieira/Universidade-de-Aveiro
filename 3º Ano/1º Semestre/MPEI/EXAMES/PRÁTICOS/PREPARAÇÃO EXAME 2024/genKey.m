%{
    function [y1,...,yN] = myfun(x1,...,xM) declares a function named myfun 
        that accepts inputs x1,...,xM and returns outputs y1,...,yN. 
    This declaration statement must be the first executable line of the 
    function. Valid function names begin with an alphabetic character, 
    and can contain letters, numbers, or underscores.
---------------------------------------------------------------------------
    
    1. Crie uma função para gerar chaves constituídas por caracteres. 
    O comprimento de cada chave deve ser escolhido aleatoriamente (distribuiçao uniforme) 
    entre imin e imax. 
    A função deve ter como parametros de entrada: 
        -> o nº de N chaves a gerar. 
        -> Os valores de imin e imax
        -> Vector com os caracteres a usar nas chaves
        -> Um vector com as probabilidades de cada um dos caracteres a utilizar. 

    Se a função for chamada sem o ultimo parametro, deve considerar os caracteres 
    equiprováveis (ver a documentação da função nargin).

    A função deve devolver um "cell array" com o conjunto de chaves geradas 
    garantindo que as chaves são todas diferentes.
%}

function keys = genKey(N,imin,imax,vec,prob)

   
    if (nargin == 4)
        prob = ones(size(vec))/length(vec);
    end
    
    keys = cell(1,N);
    cumprob = cumsum(prob);
    for i = 1:N
        
        % 40% -> comprimento de 5 | 60% comprimento de 8
        esc = rand(i);
        if esc <= 0.4
            num = imin;
        else
            num = imax;
        end


        aux = zeros (1,num); % vector de 0 para a chave que se vai gerar de tamanho até num gerado anteriormente
        for j = 1:num
            U = rand(); % seleciona o caracter a usar
            k = 1 + sum(U > cumprob); % colocar 1 em local correcto
            aux(j) = k;
        end
        keys{i} = vec(aux);
    end
    keys = unique(keys);
    lenKeys = length(keys);
    while lenKeys < N
        num = randi([imin,imax]); % gera o tamanho da chave entre imin e imax
        aux = zeros (1,num); % vector de 0 para a chave que se vai gerar de tamanho até num gerado anteriormente
        for j = 1:num
            U = rand(); % seleciona o caracter a usar
            k = 1 + sum(U > cumprob); % colocar 1 em local correcto
            aux(j) = k;
        end
        key = vec(aux);
        if ~ismember(key,keys)
            lenKeys = lenKeys + 1;
            keys{lenKeys} = key;
        end
        %keys{lenKeys} = vec(aux);
    end
end
