INSERT INTO stock_orders.tipo_fornecedor(
	Codigo,
	Designacao
)
VALUES
	(101,'Carnes'),
	(102,'Peixe'),
	(103,'Frutas'),
	(104,'Legumes'),
	(105,'Bebidas'),
	(106,'Escritório'),
	(107,'Detergentes');

SELECT * FROM stock_orders.tipo_fornecedor;

INSERT INTO stock_orders.fornecedor(
	NIF,
	Nome,
	No_FAX,
	Endereco,
	Condicoes_pagamento,
	Tipo
)
VALUES
	(519123852,'LoRebarbo',232154326,NULL,69,169),
	(512054620,'DomDuarte,LDA',221564852,'Rua de Sua Majestade 41',54,235),
	(564651689,'DoceBebida',2123231732,'Rua da Fonte 14',16,635),
	(513856198,'Fruta Fresca',232125126,NULL,91,351),
	(567446489,'Limpaqui',215412285, 'Rua do Tamanco Limpo 621',25,19),
	(568541646,'GrandeBifa',223468434,'Estrada da Vaca 2233',54,24),
	(512151454,'Emlatatudo', 234125489,'Rua do Aluminio 82',20,364);

SELECT * FROM stock_orders.fornecedor;

INSERT INTO stock_orders.produto(
	Codigo,
	Nome,
	Preco,
	Taxa_IVA,
	No_unidades
)
VALUES
	(10001,'Bife da Naldega', 9.99,23,150),
	(10002,'Pêra do Queixo',1.35,23,1),
	(10003,'Pera Rocha',1.42,23,2000),
	(10004,'Secretos de Porco Preto',10.15,23,200),
	(10005,'Vinho Tinto',0.50,13,110000),
	(10006,'Queijo de Cabra',9.00,23,500),
	(10007,'Pepino Enlatado',0.65,23,54),
	(10008,'Cerveja Boemia',1.00,13,100000),
	(10009,'Detergente Limão', 0.85,23,1000),
	(10010,'Óleo de Coco', 5.45,23,69),
	(10011,'Agua das Pedras',0.55,16,1543),
	(10012,'Broa de Milho',0.25,16,50),
	(10013,'Massa Esparguete',0.25,14,1000),
	(10014,'Iogurte Liquido',0.41,13,1000);

SELECT * FROM stock_orders.produto;

INSERT INTO stock_orders.encomenda(
	No_encomenda,
	Data,
	Fornecedor
)
VALUES
	(1,'2023-03-21',519123852),
	(2,'2023-03-22',564651689),
	(3,'2023-03-23',564651689),
	(4,'2023-03-26',513856198),
	(5,'2023-03-27',513856198),
	(6,'2023-03-28',513856198),
	(7,'2023-03-29',564651689),
	(8,'2023-03-30',564651689),
	(9,'2023-03-31',512151454),
	(10,'2023-04-01',512151454);

SELECT * FROM stock_orders.encomenda;

INSERT INTO stock_orders.contem(
	No_encomenda,
	Codigo_produto,
	No_itens_encomendados
)
VALUES
	(1,10001,500),
	(1,10004,500),
	(2,10002,1500),
	(2,10003,3200),
	(3,10013,300),
	(4,10006,200),
	(4,10007,20),
	(4,10014,20),
	(5,10005,5000),
	(5,10008,360),
	(5,10011,450),
	(6,10009,69),
	(6,10010,71),
	(7,10003,120),
	(8,10013,3500),
	(9,10009,1000),
	(9,10010,100),
	(10,10012,250);

SELECT * FROM stock_orders.contem;