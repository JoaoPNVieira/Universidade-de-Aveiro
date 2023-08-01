# BD: Guião 7


## ​7.2 
 
### *a)*

```
Está na Primeira Forma Normal (1FN), pois não tem atributos compostos, multivalor ou nested relations.
No entanto, como tem dependências parciais (Afiliacao_autor depende apenas de Nome_autor), não está na Segunda Forma Normal (2FN).
```

### *b)* 

```
Para ficar na 3FN, será necessário remover dependências parciais e dependências transitivas do cenário original:

Livro(Titulo_Livro, Nome_Autor, Afiliacao_Autor, Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor, Ano_publicacao)

Titulo_Livro, Nome_Autor -> Editor, Tipo_livro, NoPaginas, Ano_Publicacao
TipoLivro, NoPaginas -> Preco
Nome_Autor -> Afiliacao_Autor
Editor -> Endereco_Editor

-------------------------
1. Criar uma nova relação para armazenar dados do autor, com Nome_Autor como chave primária e uma nova relação análoga para os dados do editor, com Editor como chave primária.
   A relação assim está na 2FN:

Livro(Titulo_Livro, Nome_Autor, Tipo_Livro, Preco, NoPaginas, Editor, Ano_publicacao)
Titulo_Livro, Nome_Autor -> Editor, Tipo_Livro, NoPaginas, Ano_Publicacao
Tipo_Livro, NoPaginas -> Preco

Autor(Nome_Autor, Afiliacao_Autor)
Nome_Autor -> Afiliacao_autor

Editor(Editor, Endereco_Editor)
Editor -> Endereco_Editor

-------------------------
2. Criar uma nova relação com Tipo_Livro e NoPaginas commo chave primária, para remover a dependência transitiva do atributo Preco.
   A relação assim estará na Terceira Forma Normal (3FN).

Livro(Titulo_Livro, Nome_Autor, Tipo_Livro, NoPaginas, Editor, Ano_Publicacao)
Titulo_Livro, Nome_Autor -> Editor, Tipo_Livro, NoPaginas, Ano_Publicacao

PrecoLivro(Tipo_Livro, NoPaginas, Preco)
Tipo_Livro, NoPaginas -> Preco

Autor(Nome_Autor, Afiliacao_Autor)
Nome_Autor -> Afiliacao_Autor

Editor(Editor, Endereco_Editor)
Editor -> Endereco_Editor
```




## ​7.3
 
### *a)*

```
{A, B}
```


### *b)* 

```
R1 = {A, B, C}, com dependências {A, B} -> C
R2 = {A, D, E, I, J}, com dependências F = {{A} -> {D, E}, {D} -> {I, J}}
R3 = {B, F, G, H}, com dependências F = {{B} -> {F}, {F} -> {G, H}}
```


### *c)* 

```
R1 = {A, B, C}, com dependências {A, B} -> {C}
R2 = {A, D, E}, com dependências {A} -> {D, E}
R3 = {B, F}, com dependências {B} -> {F}
R4 = {D, I, J}, com dependências {D} -> {I, J}
R5 = {F, G, H}, com dependências {F} -> {G, H}
```


## ​7.4
 
### a)


{A,B}



### b) 

'''
R = {A,B,C,D,E} com  dependências F = {{A,B}-> {C,D,E}, {D}->{E}, {C}->{A}}
R = {A,B,C,D,E} , com dependências {A,B}->{C,D,E}
R = {D,E} , com dependências {D}->{E} 
R = {C,A} , com dependências {C}->{A}
'''


### c) 

'''
R = {A,B,C,D,E} , com dependências {A,B}->{C,D,E}
R = {D,E} , com dependências {D}->{E} 
R = {C,A} , com dependências {C}->{A}

R = {B,C} , com dependências {B}->{C}
R = {D,E} , com dependências {D}->{E} 
R = {C,A} , com dependências {C}->{A}
'''



## ​7.5
 
### a)


{A,B}


### b) 

'''
R  = {A,B,C,D,E} onde F = {{A,B}-> {C,D,E}, {A}->{C}, {C}->{D}}
R  = {A,B,C,D,E} , com dependencias { {A,B} -> {C,D,E},{C} -> {D}}
R1 = {A,C,D} , com dependencias { {A}->{C}, {C}->{D}} 
'''


### c) 

'''
R  = {A,B,C,D,E} , com dependencias {{A,B}-> {C,D,E}, {C}->{D}}
R1 = {A,C,D} , com dependencias {{A}->{C}, {C}->{D}} 

R  = {A,B,C,D,E} , com dependencias {{A,B}-> {C,D,E}}
R1 = {A,C}, com dependencias {{A}->{C}}
R2 = {C,D}, com dependencias {{C}->{D}}
'''

### d) 

'''
R  = {A,B,C,D,E} , com dependencias {{A,B}-> {C,D,E}}
R1 = {A,C}, com dependencias {{A}->{C}}
R2 = {C,D}, com dependencias {{C}->{D}}
'''


