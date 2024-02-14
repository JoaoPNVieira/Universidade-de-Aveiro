function [Set,Nu,users] = make_set(nome)
    
    udata = load(nome);       % Carrega o ficheiro dos dados dos filmes
    
    % Apenas as duas primeiras colunas:
    u= udata(1:end,1:2); clear udata;

    % Lista de utilizadores:
    users = unique(u(:,1));     % Extrai os IDs dos utilizadores
    Nu = length(users);         % Número de utilizadores
    
    % Constroi lista de filmes para cada utilizador:
    Set= cell(Nu,1);                    % Usa celulas
    for n = 1:Nu                        % Para cada utilizador
        ind = find(u(:,1) == users(n)); % Obter os filmes de cada um
                                        % e guarda num array. Usa celulas porque utilizador tem um numero
                                        % diferente de filmes. Se fossem iguais podia ser um array
        Set{n} = [Set{n} u(ind,2)];
    end