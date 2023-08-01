# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
USE pubs
GO
SELECT * FROM authors;
GO
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
USE pubs
GO
SELECT au_fname , au_lname , phone FROM authors;
GO
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
USE pubs
GO
SELECT au_fname , au_lname , phone FROM authors
ORDER BY au_fname ASC , au_lname ASC;
GO
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
USE pubs
GO
SELECT au_fname AS first_name , au_lname AS last_name, phone AS telephone FROM authors
ORDER BY first_name ASC , last_name ASC;
GO
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
USE pubs
GO
SELECT au_fname AS first_name , au_lname AS last_name, phone AS telephone FROM authors
WHERE au_lname != 'Ringer' AND state = 'CA'
ORDER BY first_name ASC , last_name ASC
GO
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
USE pubs
GO
SELECT * FROM publishers
WHERE pub_name LIKE '%Bo%';
GO
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
USE pubs
GO
SELECT DISTINCT pub.pub_name FROM publishers AS pub JOIN titles AS tit
ON pub.pub_id = tit.pub_id
WHERE tit.type = 'business';
GO
```

### *h)* Número total de vendas de cada editora; 

```
USE pubs
GO
SELECT pub.pub_id, pub.pub_name, SUM(tit.ytd_sales) AS t_sales 
FROM publishers AS pub JOIN titles AS tit
ON pub.pub_id = tit.pub_id
GROUP BY pub.pub_id, pub.pub_name;
GO
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
USE pubs
GO
SELECT pub.pub_id, pub.pub_name, SUM(tit.ytd_sales) AS t_sales 
FROM publishers AS pub JOIN titles AS tit
ON pub.pub_id = tit.pub_id
WHERE tit.ytd_sales != 0
GROUP BY pub.pub_id, pub.pub_name, tit.title;
GO
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
USE pubs
GO
SELECT DISTINCT titles.title FROM (stores JOIN sales ON stores.stor_id = sales.stor_id)
JOIN titles ON titles.title_id = sales.title_id
WHERE stores.stor_name = 'Bookbeat';
GO
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
USE pubs
GO
SELECT authors.au_fname, authors.au_lname
FROM (authors JOIN titleauthor ON  authors.au_id = titleauthor.au_id
	      JOIN titles ON titles.title_id = titleauthor.title_id)
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
HAVING COUNT(titles.type) > 1;
GO
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
USE pubs
GO
SELECT titles.type, AVG(titles.price) AS med_price, SUM(sales.qty) AS total_sales
FROM (titles JOIN sales ON titles.title_id = sales.title_id)
GROUP BY titles.type, titles.pub_id
GO
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
USE pubs
GO
SELECT titles.type FROM titles
GROUP BY titles.type
HAVING MAX(advance)>1.5*AVG(advance)
GO
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
USE pubs
GO
SELECT titles.title, authors.au_fname AS first_name, authors.au_lname, 
	(titleauthor.royaltyper/100.0)*(titles.royalty/100.0)*ytd_sales*price AS gain
		FROM titles JOIN titleauthor ON titles.title_id = titleauthor.title_id JOIN authors ON titleauthor.au_id = authors.au_id;
GO
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
USE pubs
GO
SELECT DISTINCT ttl.title, ttl.ytd_sales, ttl.ytd_sales * ttl.price AS billing, 
	(ttl.royalty/100.0) * (ttl.ytd_sales * ttl.price) AS a_interest,
		(ttl.ytd_sales * ttl.price) - (ttl.ytd_sales * ttl.price * ttl.royalty/100.0) AS p_interest
FROM titles AS ttl
WHERE ttl.ytd_sales > 0;
GO
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
USE pubs
GO
SELECT DISTINCT ttl.title, ttl.ytd_sales, CONCAT(a.au_fname, ' ', a.au_lname) AS author, 
	(ttl.ytd_sales*ttl.price) AS billing, 
		(ttl.royalty/100.0) * (ttl.ytd_sales * ttl.price) * (ta.royaltyper/100.0) AS a_interest,
			(ttl.ytd_sales * ttl.price) - (ttl.ytd_sales * ttl.price * ttl.royalty/100.0) AS p_interest

FROM (titles AS ttl JOIN titleauthor AS ta ON ttl.title_id = ta.title_id) JOIN authors AS a ON a.au_id = ta.au_id
WHERE ttl.ytd_sales > 0;
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
-- FAZER DEPOIS. NÃO ESQUECER -- 
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
USE pubs
GO
SELECT stor_id, stor_name, avgsales
FROM (SELECT AVG(qty) AS all_avgsales FROM sales AS sl JOIN stores as st ON sl.stor_id = st.stor_id) AS all_avg 
	 JOIN
	 (SELECT st.stor_id, stor_name, AVG(qty) AS avgsales FROM sales AS sl JOIN stores as st ON sl.stor_id = st.stor_id GROUP BY st.stor_id, st.stor_name) AS average_each 
	 ON avgsales > all_avgsales;
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
USE pubs
GO
SELECT t.title FROM titles as t 
	JOIN sales as sl ON t.title_id=sl.title_id 
	JOIN stores as st ON st.stor_id=sl.stor_id
WHERE st.stor_name!='Bookbeat'
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
USE pubs
GO
SELECT pbs.pub_name, st.stor_id FROM publishers AS pbs, stores AS st
GROUP BY pbs.pub_name, st.stor_id
	EXCEPT
		SELECT pbs.pub_name, st.stor_id FROM publishers AS pbs
										JOIN titles AS ttl ON pbs.pub_id=ttl.pub_id
										JOIN sales  AS sl  ON ttl.title_id=sl.title_id
										JOIN stores AS st  ON sl.stor_id=st.stor_id
		GROUP BY pbs.pub_name, st.stor_id
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script | b) Data Insertion Script
 
[SQL File](ex_6_2_1.sql "SQLFileQuestion and SQLFileQuestion")


#### c) Queries

##### *a)*

```
/*
 * a) Obtenha uma lista contendo os projetos e funcionários (ssn e nome completo) que lá trabalham.
 */
-- π Pname, Pnumber, Plocation, Dnum, Fname, Minit, Lname, Ssn (((project) ⨝ Pnumber=Pno (works_on)) ⨝ Essn = Ssn (employee))

SELECT Pname, Pnumber, Plocation, Dnum, Fname, Minit, Lname, Ssn
FROM (company.project JOIN company.works_on ON Pnumber = Pno)
	JOIN company.employee ON Essn = Ssn;

```

##### *b)* 

```
/*
 * b) Obtenha o nome de todos os funcionários supervisionados por ‘Carlos D Gomes’.
 */
-- π employee.Fname, employee.Minit, employee.Lname ((employee) ⨝ employee.Super_ssn=man.Ssn (ρ man (σ Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes' (employee))))

SELECT e.Fname, e.Minit, e.Lname
FROM company.employee AS e JOIN 
	(SELECT  * 
		FROM company.employee
		WHERE Fname = 'Carlos' AND Minit='D' AND Lname='Gomes') 
	AS man ON e.Super_ssn = man.Ssn; 
```

##### *c)* 

```
/*
 * c) Para cada projeto, listar o seu nome e o número de horas (por semana) gastos nesse projeto por todos os funcionários.
 */
-- γ Pname; sum(Hours)->total_hours ((project) ⨝ Pnumber=Pno (works_on))

SELECT Pname, SUM(Hours) AS total_hours
FROM company.project JOIN company.works_on ON Pnumber=Pno
GROUP BY Pname;

```

##### *d)* 

```
/*
 * d) Obter o nome de todos os funcionários do departamento 3 que trabalham mais de 20 horas por semana no projeto ‘Aveiro Digital'.
 */
-- π Fname, Minit, Lname (σ Hours>20 ((σ Dno=3 (employee)) ⨝ Ssn=Essn (works_on)) ⨝ Pno=Pnumber (σ Pname='Aveiro Digital' (project)))

SELECT Fname, Minit, Lname
FROM (company.employee JOIN company.works_on ON Ssn=Essn AND Dno=3) 
	JOIN company.project ON Pno=Pnumber AND Pname='Aveiro Digital'
WHERE Hours > 20;

```

##### *e)* 

```
/*
 * e) Nome dos funcionários que não trabalham para projetos.
 */
-- π Fname, Minit, Lname (σ Pno=null ((employee) ⟕ Ssn=Essn (works_on)))

SELECT Fname, Minit, Lname
FROM company.employee LEFT OUTER JOIN company.works_on ON Ssn=Essn
WHERE Pno IS NULL;
```

##### *f)* 

```
/*
 * f) Para cada departamento, listar o seu nome e o salário médio dos seus funcionários do sexo feminino.
 */
-- π Dname, avg_Salary ((γ Dno; avg(Salary)->avg_Salary (σ Sex='F' (employee))) ⨝Dno=Dnumber (department))

SELECT Dname, AVG(Salary) AS avg_Salary
FROM company.employee JOIN company.department ON Dno=Dnumber 
WHERE Sex='F'
GROUP BY Dno, Dname;
```

##### *g)* 

```
/*
 * g) Obter uma lista de todos os funcionários com mais do que dois dependentes.
 */
-- π Fname, Minit, Lname (σ Num_dependents>2 (γ Fname, Minit, Lname, Ssn; count(Essn)->Num_dependents ((employee) ⨝ Ssn=Essn (dependent))))

SELECT Fname, Minit, Lname
FROM company.employee JOIN company.dependent ON Ssn=Essn
GROUP BY Fname, Minit, Lname, Ssn
HAVING COUNT(Essn)> 2;

```

##### *h)* 

```
/*
 * h) Obtenha uma lista de todos os funcionários gestores de departamento que não têm dependentes.
 */
-- π Fname, Minit, Lname (σ Num_dependents=0 (γ Fname, Minit, Lname, Ssn; count(Essn)->Num_dependents (((employee) ⨝ Ssn=Mgr_ssn (department)) ⟕ Ssn=Essn (dependent))))

SELECT Fname, Minit, Lname
FROM (company.employee JOIN company.department ON Ssn=Mgr_ssn) 
	LEFT OUTER JOIN company.dependent ON Ssn=Essn
GROUP BY Fname, Minit, Lname, Ssn
HAVING COUNT(Essn) = 0;
```

##### *i)* 

```
/*
 * i) Obter os nomes e endereços de todos os funcionários que trabalham em, pelo menos, um projeto localizado em Aveiro mas
 * o seu departamento não tem nenhuma localização em Aveiro.
 */
-- π Ssn, Fname, Minit, Lname, Address ((((employee) ⨝Ssn=Essn (works_on)) ⨝ Pno=Pnumber (σ Plocation='Aveiro' ((project)))) ⨝Dno=Dnumber  (σ Dlocation!='Aveiro' ((department) ⟕ (dept_location))))

SELECT DISTINCT Ssn, Fname, Minit, Lname, Address
FROM company.employee 
	JOIN company.works_on ON Ssn=Essn
	JOIN company.project ON Pno=Pnumber AND Plocation='Aveiro'
	JOIN (SELECT company.department.*
		  FROM (company.department LEFT OUTER JOIN company.dept_location 
		  ON company.department.Dnumber=company.dept_location.Dnumber)
		  WHERE Dlocation!='Aveiro' OR Dlocation IS NULL
		 ) AS deps ON Dno=Dnumber;
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
-- a) Tabela dos fornecedores que não têm encomendas:

SELECT * 
FROM stock_orders.fornecedor
EXCEPT
SELECT NIF,F.Nome,No_FAX,Endereco,Condicoes_pagamento,Tipo
FROM stock_orders.fornecedor as F JOIN stock_orders.encomenda as E ON F.NIF=E.Fornecedor;

```

##### *b)* 

```
-- b) Número médio de unidades encomendadas para cada produto:

SELECT I.Codigo_produto,avg(I.No_itens_encomendados) as avg_unidades
FROM stock_orders.contem as I
GROUP BY I.Codigo_produto;

SELECT * FROM stock_orders.contem as I;
```


##### *c)* 

```
-- c) Número médio de produtos por encomenda (nota: não interessa o número de unidades):

SELECT avg(Cast(R.num_occurences as float)) as avg_num_prod
FROM (
	SELECT count(I.Codigo_produto) as num_occurences
	FROM stock_orders.contem as I
	GROUP BY I.No_encomenda
) as R
```


##### *d)* 

```
-- d) Lista de produtos (e quantidades) fornecidas por cada fornecedor: 

SELECT E.Fornecedor,I.Codigo_produto, sum(I.No_itens_encomendados) as quantity
FROM stock_orders.contem as I JOIN stock_orders.encomenda as E ON I.No_encomenda=E.No_encomenda
GROUP BY E.Fornecedor,I.Codigo_produto
ORDER BY E.Fornecedor
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
-- a) Lista de pacientes que nunca tiveram uma prescrição

SELECT P.No_utente, P.Nome
FROM (prescrition_system.Paciente AS P LEFT OUTER JOIN prescrition_system.Prescricao AS Pr ON P.No_utente=Pr.Pac_id)
WHERE No_prescricao is NULL;
```

##### *b)* 

```
-- b) Número de prescrições por especialidade médica

SELECT M.Especialidade,count(PR.No_prescricao) as num_prescricoes
FROM prescrition_system.Prescricao AS PR JOIN prescrition_system.Medico AS M ON M.No_identificacao=PR.Med_id
GROUP BY M.Especialidade
```


##### *c)* 

```
-- c) Número de prescrições processadas por farmácia

SELECT count(P.No_prescricao) as num_processadas_por_farmacias
FROM prescrition_system.Prescricao AS P
WHERE P.Farmacia_process IS NOT NULL
```


##### *d)* 

```
-- d) Para a farmacêutica com registo número 906, lista dos seus fármacos nunca prescritos

SELECT F.Nome_comercial,F.Formula
FROM prescrition_system.Farmaco AS F LEFT OUTER JOIN prescrition_system.PrescricoesEnvolvemFarmacos AS P ON F.Nome_comercial=P.Nome_farmaco
WHERE F.Registo_farmaceutica=906 AND P.No_prescricao IS NULL
```

##### *e)* 

```
-- e) Para cada farmácia, o número de fármacos de cada farmacêutica vendidos

SELECT P.Farmacia_process,PF.Registo_farmaceutica,count(P.Farmacia_process) as num
FROM
( 
	(SELECT DISTINCT p1.No_prescricao,p1.Farmacia_process
	  FROM prescrition_system.Prescricao as p1
	  WHERE p1.Farmacia_process IS NOT NULL) as P
	JOIN
	prescrition_system.PrescricoesEnvolvemFarmacos AS PF
	ON P.No_prescricao=PF.No_prescricao
)
GROUP BY P.Farmacia_process,PF.Registo_farmaceutica
```

##### *f)* 

```
-- d) Pacientes que tiveram prescrições de médicos diferentes

SELECT P1.Pac_id
FROM(
	SELECT P.Pac_id,P.Med_id,count(P.Pac_id) as num
	FROM prescrition_system.Prescricao as P
	GROUP BY P.Pac_id,P.Med_id
) AS P1
GROUP BY P1.Pac_id
HAVING count(P1.Pac_id) > 1
```
