/*
UNIVERSIDADE DE AVEIRO - 2022/23
UC: BASES DE DADOS 

João Veira - 50458 (LECI)
Lara Matos - 95228 (LECI)

Ex.4.1.1)
	Base de Dados: Sistema de Gestão de um Rent-a-Car

*/


use p10g9
GO
DROP TABLE IF EXISTS RENTACAR.Ligeiro;
DROP TABLE IF EXISTS RENTACAR.Aluguer;
DROP TABLE IF EXISTS RENTACAR.Pesado;
DROP TABLE IF EXISTS RENTACAR.Similaridade;
DROP TABLE IF EXISTS RENTACAR.Client;
DROP TABLE IF EXISTS RENTACAR.Balcao;
DROP TABLE IF EXISTS RENTACAR.Veiculo;
DROP TABLE IF EXISTS RENTACAR.Tipo_Veiculo;
GO

DROP SCHEMA IF EXISTS RENTACAR;
GO

CREATE SCHEMA RENTACAR;
GO

CREATE TABLE RENTACAR.Client(
	[NIF]				INT				NOT NULL PRIMARY KEY,  
	[Nome]				VARCHAR(256)	NOT NULL,
	[Endereco]			VARCHAR(1024)	NOT NULL,	
	[Num_carta]			VARCHAR(32)		NOT NULL
)
GO

CREATE TABLE RENTACAR.Balcao(
	[Numero]			INT				NOT NULL PRIMARY KEY,
	[Nome]				VARCHAR(256)	NOT NULL,
	[Endereco]			VARCHAR(1024)	NOT NULL,	
)
GO

CREATE TABLE RENTACAR.Tipo_Veiculo(
	[Codigo]			INT				NOT NULL PRIMARY KEY,
	[Designacao]		VARCHAR(1024)	NOT NULL,
	[Arcondicionado]	BIT				NOT NULL,
)
GO

CREATE TABLE RENTACAR.Veiculo(
	[Matricula]			VARCHAR(16)		NOT NULL PRIMARY KEY,
	[Designacao]		VARCHAR(1024)	NOT NULL,
	[Arcondicionado]	BIT				NOT NULL,	
	[Cod_tipo]			INT				NOT NULL	UNIQUE		REFERENCES RENTACAR.Tipo_Veiculo(Codigo),
)
GO

CREATE TABLE RENTACAR.Aluguer(
	[Numero]			INT				NOT NULL PRIMARY KEY,
	[Veiculo_matric]	VARCHAR(16)		NOT NULL REFERENCES RENTACAR.Veiculo(Matricula),
	[Duracao]			INT						,
	[Data]				DATETIME				,					
	[Client_NIF]		INT				NOT NULL REFERENCES RENTACAR.Client(NIF), 
	[Balcao_num]		INT				NOT NULL REFERENCES RENTACAR.Balcao(Numero), 
)
GO

CREATE TABLE RENTACAR.Ligeiro(
	[Cod_tipo]			INT				NOT NULL PRIMARY KEY	REFERENCES RENTACAR.Tipo_Veiculo(Codigo),
	[num_lugares]		INT				NOT NULL,
	[Portas]			INT				NOT NULL,
	[Combustivel]		VARCHAR(32)		NOT NULL,
)
GO

CREATE TABLE RENTACAR.Pesado(
	[Cod_tipo]			INT				NOT NULL PRIMARY KEY	REFERENCES RENTACAR.Tipo_Veiculo(codigo),
	[Peso]				INT				NOT NULL,
	[Passageiros]		INT				NOT NULL,
)
GO

CREATE TABLE RENTACAR.Similaridade(
	[Cod_tipo1]			INT				NOT NULL		UNIQUE		REFERENCES RENTACAR.Tipo_Veiculo(codigo),
	[Cod_tipo2]			INT				NOT NULL		UNIQUE		REFERENCES RENTACAR.Tipo_Veiculo(codigo),
	PRIMARY KEY(
		[Cod_tipo1],
		[Cod_tipo2]
	)
)
GO