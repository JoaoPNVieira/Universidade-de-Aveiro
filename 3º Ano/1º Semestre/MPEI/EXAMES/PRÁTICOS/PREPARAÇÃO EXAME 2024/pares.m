function P = pares(J, N, users)
    users = double(users);
    P = zeros(1, 3);
    k = 1;
    for n1 = 1:N
        for n2 = n1+1:N
            P(k, :) = [users(n1) users(n2) J(n1, n2)];
            k = k + 1;
        end
    end
end