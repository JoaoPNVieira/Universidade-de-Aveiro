%% Calcula a distância de Jaccard entre todos os pares pela definicão.

function J = jaccard(Set, Nu)
    J = zeros(Nu, Nu);  % array to store distances
    for n1 = 1:Nu      % for each user
        for n2 = n1+1:Nu
            I = intersect(Set{n1}, Set{n2});
            U = union(Set{n1}, Set{n2});
            J(n1, n2) = 1 - length(I) / length(U);  % Fix this line
            J(n2, n1) = J(n1, n2);  % Jaccard similarity is symmetric
        end
    end
end
