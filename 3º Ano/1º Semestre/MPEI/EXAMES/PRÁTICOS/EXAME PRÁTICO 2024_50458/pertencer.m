%{
    Verificar se elemento(s) pertence(m) ao bloomfilter.
%}

function out = pertencer(BF,chave,k)
    m = length(BF);
    out = true;
    for i = 1:k
        chave = [chave num2str(i)];
        h = DJB31MA( chave, 127);
        h = mod(h,m)+1;
        if ~BF(h)
            out = false;
            return
        end
    end
end