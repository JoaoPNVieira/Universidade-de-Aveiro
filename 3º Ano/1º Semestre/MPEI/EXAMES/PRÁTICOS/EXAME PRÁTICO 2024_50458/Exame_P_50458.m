clc;clear;
%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNO: JOÃO PEDRO NUNES VIEIRA
NºMEC.: 50458
CURSO: LECI
################################

[ EXAME PRÁTICO - 17/01/2024 ]

%}
%% EXERCÍCIO 1
% a) 
% Estado 1  2    3    4  5
    T = [0, 0  , 0.9, 0, 0; %Estado 1
         1, 0  , 0  , 0, 0; %Estado 2
         0, 0.8, 0  , 0, 0; %Estado 3
         0, 0.2, 0  , 1, 0; %Estado 4
         0, 0  , 0.1, 0, 1];%Estado 5

    estocastica = sum(T);
    fprintf("\n 1a) \n")
    disp(T);
    disp(estocastica);

% b)     
%Pb_exp = (T^8)*vb;
    
    iter = 9;
    vb = [0 1 0 0 0]';
    Pb2 = T*vb;
    for i = 2:(iter-1)
        Pb2 = (T^i)*Pb2;
    end
    
    Pb2 = Pb2(2);
    fprintf("\n 1b) \n")
    disp(Pb2)

% c)

    Q = T(1:3,1:3);
    O = T(1:3,4:5);
    R = T(4:5,1:3);
    I = T(4:5,4:5);

    F = inv(eye(3)-Q);
    t = ones(1,3)';
    t = F*t;

   % nMedio = sum(t);
    nMedio_E2 = t(2);
    fprintf("\n 1c) \n")
    disp(nMedio_E2);

% d)
    
    B = R*F;
    fprintf("\n 1d) \n")
    Pd = B(2,2); 
    disp(Pd);

%% EXERCÍCIO 2
% Bloom filter com contagem:
%       -> Tamanho: n = 300;
%       -> Hash Functions: k = 3
% a )
    

    fprintf("\n 2a) \n")
    load data.mat;
    numNomes = length(names);
    fprintf("Numero de nomes de pessoas no universo: ")
    disp(numNomes);

    count = 0;
    for i = 1:numNomes
        if names{i} == "Paolo";
            disp(names{i})
            count = count + 1;
            lastLine = i;
        end
    end
    fprintf("\n Paolo - Contagem:  \n")
    fprintf("Last line: %d", lastLine);
    disp(count);


    m = count;
    k = 3;
    % n = 300; ??????????
    n = 8*count;

    BF = iniciar(n);
    for i = 1:m
        BF = inserir(BF,names{i},k);
    end


% 3) https://bit.ly/42401GK ---> Ficheiro não disponível (?)

    Set = {} % file!
    K = 3;
    threshold = 0.1;
    assinaturas = inf(N,K);
    
    for i = 1:N
        element = Set{i};
        h_out = hf24(element,K);
        assinaturas(i, :) = min(h_out, assinaturas(i, :));
    end
    for n1 = 1:N
        for n2= n1+1:N                 
            J(n1,n2) = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/K;
        end
    end


    SimilarUsers = pares(J, N, table ,threshold)


    
    


