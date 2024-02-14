clear
clc
fprintf(['MÉTODOS PROBABILISTICOS PARA ENGENHARIA INFORMÁTICA \n' ...
         'Conjuntos(Set) em MATLAB - Estudo Independente' ...
         'Nome: João Pedro Nunes Vieira \n' ...
         'NºMec.: 50458 \n' ...
         'Licenciatura em Engenharia de Computadores e Informática \n']);

%{
    MÉTODOS PROBABILISTICOS PARA ENGENHARIA INFORMÁTICA  
    Conjuntos(Set) em MATLAB - Estudo Independente

    Nome: João Pedro Nunes Vieira
    NºMec.: 50458
    Licenciatura em Engenharia de Computadores e Informática
%}
%%
% ARRAY DE CARACTERES:

A1 = 'Hello there!'  % A é um array de caracteres 1x12
sizeA = size(A1)
a = double('a')     % a é um double (Decimal ASCII do character a)
A2 = char(a)        % C é um array de caracteres 'a' 1x1
sizeA2 = size(A2)   

%%
% MANIPULAÇÃO DE STRINGS:

g = 'Hello, my name is';
n = 'João Vieira';
r = [g,' ',n];
disp(r)

%%
% Cell Arrays:

x=[1:5] 
y = floor(2.*randn(1,5)) 
z = [100:-20:20]
M = [x; y; z]
c = {M M+M; M(:,1) M(3,:) } % c é Cell Array 2x2 com conteudo
C = cell(3,6) % C é um cell array vasia 3x6

%%
first = 'Hello';
second = {'hello','world','from','me'};
third(1,1) = {'happy'}; % Cell indexing
third{2,1} = 'birthday'; % Content addressing
third{3,1} = 40;
third


C = {'How';'about';'this for a';'cell array of strings?'}
size(C)
C(2:3)
C([4,3,2,1])
[a,b,c,d] = deal(C{:})

%% Estruturas

person.firstname = 'Joao'
person.surname = 'Vieira'
person.address = 'PC Galaxy, Loja Informática'
person.city = 'Aveiro'
person.zip = 3800

person

