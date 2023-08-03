/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES N�O URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	Jo�o Pedro Nunes Vieira - 50458

Titles: TABELS  Create
*/


use p10g9

GO


CREATE SCHEMA RTD;
GO


CREATE TABLE RTD.Pessoa (
	[cc]			INT				NOT NULL		UNIQUE				,
	[num_utente]	INT				NOT NULL		PRIMARY KEY			,
	[nome]			VARCHAR(32)		NOT NULL		UNIQUE				,
	[morada]		VARCHAR(64)						UNIQUE				,
	[data_nasc]		DATE			NOT NULL		UNIQUE				
	)
GO
CREATE TABLE RTD.Localidade (
	[id_local]		INT				NOT NULL	PRIMARY KEY											,
	[nome]			VARCHAR(32)		NOT NULL														,
	[coordenadas]	VARCHAR(64)		NOT NULL															
	)
GO


CREATE TABLE RTD.Paciente (
	[cc]			INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(cc)			,
	[num_utente]	INT				NOT NULL	UNIQUE			FOREIGN KEY		REFERENCES RTD.Pessoa(num_utente)	,
	[nome]			VARCHAR(32)		NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(nome)			,
	[morada]		VARCHAR(64)									FOREIGN KEY		REFERENCES RTD.Pessoa(morada)		,
	[data_nasc]		DATE			NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(data_nasc)	,
	[id_local]		INT				NOT NULL
	)
GO


CREATE TABLE RTD.Cuidador (
	[cc_cuidador]	INT				NOT NULL	PRIMARY KEY 					REFERENCES RTD.Pessoa(cc)			,
	[num_utente]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(num_utente)	,
	[nome]			VARCHAR(32)		NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(nome)			,
	[morada]		VARCHAR(64)									FOREIGN KEY		REFERENCES RTD.Pessoa(morada)		,													
	[data_nasc]		DATE			NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(data_nasc)										
	)
GO

CREATE TABLE RTD.Quartel (
	[id_quartel]	INT				NOT NULL	PRIMARY KEY															,
	[nome]			VARCHAR(32)		NOT NULL																		,
	[localidade]	VARCHAR(32)		NOT NULL																		,
	[morada]		VARCHAR(64)																						, -- VER
	[id_local]		INT				NOT NULL	UNIQUE			FOREIGN KEY		REFERENCES RTD.Localidade(id_local) ,											
	)
GO

CREATE TABLE RTD.Bombeiro (
	[cc]			INT				NOT NULL				 	FOREIGN KEY		REFERENCES RTD.Pessoa(cc)			,
	[num_utente]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(num_utente)	,
	[nome]			VARCHAR(32)		NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(nome)			,
	[morada]		VARCHAR(64)									FOREIGN KEY		REFERENCES RTD.Pessoa(morada)		,													
	[data_nasc]		DATE			NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(data_nasc)	,
	[id_bombeiro]	INT				NOT NULL	PRIMARY KEY															,
	[id_quartel]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Quartel(id_quartel)	,
	[patente]		VARCHAR(16)		NOT NULL																		,
	[valencias]		VARCHAR(256)
	)
GO

CREATE TABLE RTD.UnidadeTratamento (
	[id_centro]		INT				NOT NULL	PRIMARY KEY																	,	
	[id_local]		INT				NOT NULL					FOREIGN KEY	REFERENCES RTD.Localidade(id_local)				,
	[nome]			VARCHAR(64)		NOT NULL																				,
	[morada]		VARCHAR(64)		NOT NULL																				,
	[GPS]			VARCHAR(64)		NOT NULL
	)
GO

CREATE TABLE RTD.Profissional (
	[cc]			INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(cc)					,												
	[num_utente]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(num_utente)			,	
	[nome]			VARCHAR(32)		NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(nome)					,
	[morada]		VARCHAR(64)									FOREIGN KEY		REFERENCES RTD.Pessoa(morada)				,
	[data_nasc]		DATE			NOT NULL					FOREIGN KEY		REFERENCES RTD.Pessoa(data_nasc)			,									
	[cedula]		INT				NOT NULL	PRIMARY KEY																	,
	[id_centro]		INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.UnidadeTratamento(id_centro)	,
	[funcao]		VARCHAR(32)		NOT NULL	
	)
GO

CREATE TABLE RTD.Transporte (
	[id_transporte]	INT				NOT NULL	PRIMARY KEY																	,
	[id_quartel]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Quartel(id_quartel)			,
	[matricula]		VARCHAR(8)		NOT NULL																				,
	[lotacao]		INT																										,
	[tipologia]		VARCHAR(32)		NOT NULL	UNIQUE																		, -- VER
	[lista_recolha] VARCHAR(256)																							,
	[id_local]		INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Quartel(id_local)																							
	)
GO

CREATE TABLE RTD.Requisicao (
	[id_nec]		INT				NOT NULL	PRIMARY KEY ,
	[nome]			VARCHAR(32)		NOT NULL				,
	[tipologia]		VARCHAR(32)		NOT NULL					

)
GO

CREATE TABLE RTD.Necessidades (
	[id_req]		INT				NOT NULL	PRIMARY KEY	,
	[tipologia]		VARCHAR(32)		NOT NULL	UNIQUE				FOREIGN KEY		REFERENCES RTD.Transporte(tipologia)
	
)
GO

CREATE TABLE RTD.EventoClinico (
	[num_utente]	INT				NOT NULL	PRIMARY KEY					 REFERENCES RTD.Pessoa(num_utente)	,
	[data]			DATE			NOT NULL																	,
	[causa]			VARCHAR(64)		NOT NULL																	,
	[diagnostico]	VARCHAR(64)																					,
	[tratamentos]	VARCHAR(128)																				,
	[vacinas]		VARCHAR(128)																				,
	[receitas]		VARCHAR(512)
	)
GO

CREATE TABLE RTD.Consulta (
	[id_consulta]	INT				NOT NULL	PRIMARY	KEY																,
	[id_centro]		INT				NOT NULL					FOREIGN KEY REFERENCES RTD.UnidadeTratamento(id_centro)	,
	[num_utente]	INT				NOT NULL					FOREIGN KEY REFERENCES RTD.Pessoa(num_utente)			,
	[cedula]		INT				NOT NULL					FOREIGN KEY REFERENCES RTD.Profissional(cedula)			,
	[data]			DATE			NOT NULL																			,
	[hora]			TIME			NOT NULL																			
	)
GO

CREATE TABLE RTD.Serve (
	[id_quartel]	INT				NOT NULL					FOREIGN KEY REFERENCES RTD.Quartel(id_quartel)		,
	[id_local]		INT				NOT NULL					FOREIGN KEY REFERENCES RTD.Localidade(id_local)		,
	PRIMARY KEY (
		[id_quartel],
		[id_local]
	)
	)
GO

CREATE TABLE RTD.Escalado (
	[id_bombeiro]	INT				NOT NULL					FOREIGN KEY REFERENCES RTD.Bombeiro(id_bombeiro)	,
	[id_transporte]	INT				NOT NULL					FOREIGN KEY REFERENCES RTD.Transporte(id_transporte),
	PRIMARY KEY (
		[id_bombeiro],
		[id_transporte]
	)
	)
GO

CREATE TABLE RTD.Responsavel (
	[cc_cuidador]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Cuidador(cc_cuidador)	,
	[num_utente]	INT				NOT NULL					FOREIGN KEY		REFERENCES RTD.Paciente(num_utente)
		PRIMARY KEY (
			[cc_cuidador],
			[num_utente]
		)	
	)
GO