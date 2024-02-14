%{
    Insere elementos da chave no Bloom Filter inicializado
%}
function BF = inserir(BF,chave,k)
    m = length(BF);
    for i = 1:k
        chave = [chave num2str(i)];
        h = DJB31MA( chave, 127);
        h = mod(h,m)+1;
        BF(h) = true;
    end
end