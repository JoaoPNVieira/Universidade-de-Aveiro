/*
UNIVERSIDADE DE AVEIRO - 2022/23
UC: BASES DE DADOS 

João Veira - 50458 (LECI)
Lara Matos - 95228 (LECI)

Ex.4.1.5)
	Base de Dados: Sistema de Gestão de Conferências

*/

use p10g9
GO
DROP TABLE IF EXISTS CONFERENCIAS.Conf;
DROP TABLE IF EXISTS CONFERENCIAS.Comprovativo;
DROP TABLE IF EXISTS CONFERENCIAS.NaoEstudante;
DROP TABLE IF EXISTS CONFERENCIAS.Escreve;
DROP TABLE IF EXISTS CONFERENCIAS.Estudante;
DROP TABLE IF EXISTS CONFERENCIAS.Artigo;
DROP TABLE IF EXISTS CONFERENCIAS.Autor;
DROP TABLE IF EXISTS CONFERENCIAS.Pessoa;
DROP TABLE IF EXISTS CONFERENCIAS.Instituicao;
DROP TABLE IF EXISTS CONFERENCIAS.Participante;
GO

DROP SCHEMA IF EXISTS CONFERENCIAS;
GO

CREATE SCHEMA CONFERENCIAS;
GO

CREATE TABLE CONFERENCIAS.Participante (
	[nome]					VARCHAR(128),
	[morada]				VARCHAR(256),
	[data_incricao]			DATE,
	[mail]					NVARCHAR(64)			NOT NULL		UNIQUE,
	[data_conf]				DATE									UNIQUE,					
	PRIMARY KEY (
		[mail],
		[data_conf]
	)
);
GO

CREATE TABLE CONFERENCIAS.Conf (
	[data]					DATE														FOREIGN KEY REFERENCES CONFERENCIAS.Participante(data_conf)
);
GO

CREATE TABLE CONFERENCIAS.Estudante (
	[email_uni]				NVARCHAR(64)			NOT NULL		PRIMARY KEY			FOREIGN KEY REFERENCES CONFERENCIAS.Participante(mail),
);
GO

CREATE TABLE CONFERENCIAS.Comprovativo (
	[mail_aluno]			NVARCHAR(64)			NOT NULL		PRIMARY KEY			REFERENCES CONFERENCIAS.Estudante(email_uni),
	[localizacao]			NVARCHAR(128)			NOT NULL
);
GO

CREATE TABLE CONFERENCIAS.NaoEstudante (
	[email_uni]				NVARCHAR(64)			NOT NULL		PRIMARY KEY			REFERENCES CONFERENCIAS.Participante(mail),
	[comp_transferencia]	VARCHAR(64)				NOT NULL
);
GO

CREATE TABLE CONFERENCIAS.Instituicao (
	[nome]					VARCHAR(128)			NOT NULL,
	[endereco]				NVARCHAR(128)			NOT NULL		PRIMARY KEY
);
GO

CREATE TABLE CONFERENCIAS.Pessoa (
	[email_uni]				NVARCHAR(64)			NOT NULL		UNIQUE				REFERENCES CONFERENCIAS.Participante(mail),
	[end_inst]				NVARCHAR(128)			NOT NULL							REFERENCES CONFERENCIAS.Instituicao(endereco),
	[nome]					VARCHAR(128),
	PRIMARY KEY(
		[email_uni],
		[end_inst]
	)
);
GO

CREATE TABLE CONFERENCIAS.Autor (
	[nome]					VARCHAR(128),
	[mail]					NVARCHAR(64)			NOT NULL		PRIMARY KEY			FOREIGN KEY REFERENCES CONFERENCIAS.Pessoa(email_uni)
);
GO

CREATE TABLE CONFERENCIAS.Artigo (
	[titulo]				VARCHAR(128)			NOT NULL,
	[numRegisto]			INT						NOT NULL		PRIMARY KEY	
);
GO

CREATE TABLE CONFERENCIAS.Escreve(
	[mail_autor]			NVARCHAR(64)			NOT NULL							REFERENCES CONFERENCIAS.Autor(mail),
	[regArtigo]				INT						NOT NULL							REFERENCES CONFERENCIAS.Artigo(numRegisto),
	PRIMARY KEY (
		[mail_autor],
		[regArtigo]
	)
);
GO
