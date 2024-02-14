function M = minHash(Set, Nu, K)

    assinaturas = inf(Nu,K);
    for n = 1:Nu
        conjunto = Set{n}; 
        for i = 1:length(conjunto)
            chave = num2str(conjunto(i));
            h_out = muxDJB31MA(chave, 127,K);
            assinaturas(n,:) = min(h_out,assinaturas(n,:));
        end
    end 
    for n1 = 1:Nu
        for n2= n1+1:Nu                 
            M(n1,n2) = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/K;
        end
    end
