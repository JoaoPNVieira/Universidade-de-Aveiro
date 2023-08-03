/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES N�O URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	Jo�o Pedro Nunes Vieira - 50458

Titles: Alter Table Requisição
*/


use p10g9

GO

ALTER TABLE RTD.Requisicao
DROP CONSTRAINT FK_Requisicao_Necessidades;

ALTER TABLE RTD.Requisicao
DROP CONSTRAINT UQ_Requisicao_Tipologia;

ALTER TABLE RTD.Requisicao
ADD [description] VARCHAR(100) NULL;

ALTER TABLE RTD.Requisicao
ALTER COLUMN [nome] VARCHAR(50) NOT NULL;

ALTER TABLE RTD.Requisicao
ADD CONSTRAINT PK_Requisicao PRIMARY KEY ([id_nec], [tipologia]);

ALTER TABLE RTD.Requisicao
ADD FOREIGN KEY ([id_nec]) REFERENCES RTD.Necessidades(id_req);

ALTER TABLE RTD.Requisicao
ADD FOREIGN KEY ([tipologia]) REFERENCES RTD.Transporte(tipologia);
