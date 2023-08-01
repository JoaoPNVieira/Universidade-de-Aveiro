/*
UNIVERSIDADE DE AVEIRO - 2022/23
UC: BASES DE DADOS 

João Veira - 50458 (LECI)
Lara Matos - 95228 (LECI)

Ex.4.1.4.)
	Base de Dados: Sistema de Prescrição Eletrónica de Medicamentos

*/

use p10g9
GO
DROP TABLE IF EXISTS PRESCRICAO.Farmaco;
DROP TABLE IF EXISTS PRESCRICAO.FarmacoNomeComercial;
DROP TABLE IF EXISTS PRESCRICAO.Farmaceutica;
DROP TABLE IF EXISTS PRESCRICAO.Processa;
DROP TABLE IF EXISTS PRESCRICAO.Farmacia;
DROP TABLE IF EXISTS PRESCRICAO.Prescricao;
DROP TABLE IF EXISTS PRESCRICAO.Medico;
DROP TABLE IF EXISTS PRESCRICAO.Paciente;
GO

DROP SCHEMA IF EXISTS PRESCRICAO;
GO

CREATE SCHEMA PRESCRICAO;
GO


CREATE TABLE PRESCRICAO.Paciente(
	[Num_Utente]	INT				NOT NULL PRIMARY KEY,
	[Nome]			VARCHAR(128)	NOT NULL,
	[Data_Nasc]		DATE			NOT NULL,
	[Endereço]		VARCHAR(128)	NOT NULL,
)
GO

CREATE TABLE PRESCRICAO.Medico(
	[Codigo_SNS]	INT				NOT NULL PRIMARY KEY,
	[Nome]			VARCHAR(128)	NOT NULL,
	[Especialidade]	VARCHAR(32)		NOT NULL,			
)
GO

CREATE TABLE PRESCRICAO.Prescricao(
	[Codigo]		INT				NOT NULL UNIQUE,
	[Data]			DATE			NOT NULL,
	[Num_Utente]	INT				NOT NULL		REFERENCES PRESCRICAO.Paciente(Num_Utente),
	[Codigo_SNS]	INT				NOT NULL		REFERENCES PRESCRICAO.Medico(Codigo_SNS),
	[Num_unico]		INT				NOT NULL UNIQUE,
	CONSTRAINT PK_Prescricao PRIMARY KEY (
		[Codigo],
		[Num_unico]
	),
)
GO

CREATE TABLE PRESCRICAO.Farmacia(
	[NIF]				INT			 NOT NULL PRIMARY KEY,
	[Nome]				VARCHAR(32)	 NOT NULL,
	[Endereço]			VARCHAR(128) NOT NULL,
	[Telefone]			INT,		 
)
GO

CREATE TABLE PRESCRICAO.Processa(
	[Cod_Prescricao]	INT			NOT NULL UNIQUE REFERENCES PRESCRICAO.Prescricao(Codigo),
	[NIF_Farmacia]		INT			NOT NULL UNIQUE REFERENCES PRESCRICAO.Farmacia(NIF),
	[Data]				DATE		NOT NULL,
	PRIMARY KEY(
		[Cod_Prescricao],
		[NIF_Farmacia]
	)
)
GO

CREATE TABLE PRESCRICAO.Farmaceutica(
	[Num_Registo]		INT			 NOT NULL PRIMARY KEY,
	[Nome]				VARCHAR(32)	 NOT NULL,
	[Endereço]			VARCHAR(128) NOT NULL,
	[Telefone]			INT,		 
)
GO

CREATE TABLE PRESCRICAO.FarmacoNomeComercial(
	[Principio_Ativo]	VARCHAR(64) NOT NULL	UNIQUE,
	[Nome_Comercial]	VARCHAR(64) NOT NULL	UNIQUE,
	PRIMARY KEY(
		[Principio_Ativo],
		[Nome_Comercial]
	)
)
GO

CREATE TABLE PRESCRICAO.Farmaco(
	[Principio_Ativo]	VARCHAR(64) NOT NULL UNIQUE			FOREIGN KEY REFERENCES PRESCRICAO.FarmacoNomeComercial(Principio_Ativo),
	[Formula]			VARCHAR(16)	NOT NULL UNIQUE,
	[Num_Unico]			INT			NOT NULL UNIQUE			FOREIGN KEY REFERENCES PRESCRICAO.Prescricao(Num_unico),
	[reg_Farmaceutica]	INT			NOT NULL				FOREIGN KEY REFERENCES PRESCRICAO.Farmaceutica(Num_Registo),

	PRIMARY KEY(
		[Principio_Ativo],
		[Formula]
	)
)
GO
