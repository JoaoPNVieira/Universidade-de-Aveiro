/*
UNIVERSIDADE DE AVEIRO - 2022/23
UC: BASES DE DADOS 

João Veira - 50458 (LECI)
Lara Matos - 95228 (LECI)

Ex.4.1.3.)
	Base de Dados: Sistema de Gestão de Stocks – Módulo de Encomendas

*/

use p10g9
GO

DROP TABLE IF EXISTS ENCOMENDAS.Armazem;
DROP TABLE IF EXISTS ENCOMENDAS.Produtos;
DROP TABLE IF EXISTS ENCOMENDAS.Tem;
DROP TABLE IF EXISTS ENCOMENDAS.Encomenda;
DROP TABLE IF EXISTS ENCOMENDAS.Pagamento;
DROP TABLE IF EXISTS ENCOMENDAS.TipoFornecedor;
DROP TABLE IF EXISTS ENCOMENDAS.Fornecedor;


DROP SCHEMA IF EXISTS ENCOMENDAS;
GO

CREATE SCHEMA ENCOMENDAS;
GO

CREATE TABLE ENCOMENDAS.Armazem(
	[Codigo]	INT				NOT NULL PRIMARY KEY,
	[Morada]	VARCHAR(1024)	NOT NULL,
	[Contacto]	INT				NOT NULL,
)
GO

CREATE TABLE ENCOMENDAS.Produtos(
	[Codigo]	INT				NOT NULL PRIMARY KEY,
	[Nome]		VARCHAR(256)	NOT NULL,
	[Preco]		DECIMAL			NOT NULL,
	[IVA]		INT				NOT NULL,
)
GO

CREATE TABLE ENCOMENDAS.Tem(
	[Num_Armazem]	INT			NOT NULL REFERENCES ENCOMENDAS.Armazem(Codigo),
	[Num_Produto]	INT			NOT NULL REFERENCES ENCOMENDAS.Produtos(Codigo),
	[Stock]			INT	,
	PRIMARY KEY(
		[Num_Armazem],
		[Num_Produto]
	)
)
GO

CREATE TABLE ENCOMENDAS.Encomenda(
	[Numero]		INT			NOT NULL PRIMARY KEY,
	[Data]			DATE		NOT NULL,
	[Cod_Produtos]	INT			NOT NULL REFERENCES ENCOMENDAS.Produtos(Codigo),
)
GO

CREATE TABLE ENCOMENDAS.Pagamento(
	[Codigo]				INT			NOT NULL PRIMARY KEY,
	[Nome]					VARCHAR(64)	NOT NULL,
	[Prazo]					DATE		NOT NULL,
)
GO

CREATE TABLE ENCOMENDAS.TipoFornecedor(
	[Codigo]				INT			NOT NULL PRIMARY KEY,
	[Nome]					VARCHAR(32)	NOT NULL,
)
GO

CREATE TABLE ENCOMENDAS.Fornecedor(
	[Cod_Pagamento]			INT	NOT NULL REFERENCES ENCOMENDAS.Pagamento(Codigo),
	[Cod_tipoFornecedor]	INT	NOT NULL REFERENCES ENCOMENDAS.TipoFornecedor(Codigo),
	[Cod_Encomenda]			INT	NOT NULL REFERENCES ENCOMENDAS.Encomenda(Numero),
	PRIMARY KEY(
		[Cod_Pagamento],
		[Cod_tipoFornecedor]
	)
)
GO