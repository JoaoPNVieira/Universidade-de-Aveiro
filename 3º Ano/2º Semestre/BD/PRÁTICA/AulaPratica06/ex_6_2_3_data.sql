INSERT INTO prescrition_system.Medico(
	No_identificacao,
	Nome,
	Especialidade
)
VALUES
	(101,'João Pedro Nunes Vieira', 'Neurologia'),
	(102,'Lara Catarina Matos', 'Pediatria'),
	(103,'João Rodrigo Faria', 'Psiquiatria'),
	(104,'Manuel Bernardo Cunha', 'Oncologia'),
	(105,'Samuel de Sousa Silva', 'Cardiologia'),
	(106,'Honório Anacleto da Boa Esperança', 'Radiologia'),
	(107,'Catarina de Jesus Silva', 'Medicina Geral');

SELECT * FROM prescrition_system.Medico;

INSERT INTO prescrition_system.Paciente(
	No_utente,
	Nome,
	Data_nascimento,
	Endereco
)
VALUES
	(01,'José Manelino','1969-12-15','Rua da Torta Direita 15'),
	(02,'Albertina Garfo-em-pé','1985-01-31','Rua Couxo que Corre 68'),
	(03,'Carminda Ferreira','2002-06-22','Rua da Cã 151'),	
	(04,'Diamantina Gomes','1995-11-01','Rua de Tomar 69'),
	(05,'Ricardo Rico','1935-08-25','Rua do Ouro 9387'),
	(06,'Ricardo Pobre','1935-08-26','Rua do Pé Descalso 1234')

SELECT * FROM prescrition_system.Paciente;

INSERT INTO prescrition_system.Farmacia(
	Nome,
	Telefone,
	Endereco
)
VALUES
	('Farmacia JáFoste',235525489,'Rua da Cova Grande 69'),
	('Farmacia Adeus',234404404,'Praça do Coveiro 05'),
	('Farmacia NossaSenhora',234696969,'Avenida do Céu 12'),
	('Farmacia Agrela',237854265,'Rua de Fátima 32');

SELECT * FROM prescrition_system.Farmacia;

INSERT INTO prescrition_system.Farmaceutica(
	Registo_farmaceutica,
	Nome,
	Endereco
)
VALUES
	(905,'Ferrero','Curva da Senhora 69'),
	(906,'Atchim','Rua do Espirro 64'),
	(907,'Minimus','Rua Pequenita 1'),
	(908,'Maximus', 'Avenida Grande 1000 ');

SELECT * FROM prescrition_system.Farmaceutica;

INSERT INTO prescrition_system.Farmaco(
	Registo_farmaceutica,
	Nome_comercial,
	Formula
)
VALUES
	(905,'Mézinha da avó','XPTO'),
	(906,'ServicePack3','SSP-3'),
	(907,'ibuprofeno 600','IBP-600'),
	(908,'IMODIUM','IMOD'),
	(909,'Ultra Levure 250','UL-250'),
	(910,'Aspirina 1000','ASP-1000');

SELECT * FROM prescrition_system.Farmaco;

INSERT INTO prescrition_system.Prescricao(
	No_prescricao,
	Pac_id,
	Med_id,
	Farmacia_process,
	Data_process
)
VALUES
	(10001,1,105,234370500,'2013-01-15'),
	(10002,1,105,NULL,NULL),
	(10003,3,102,234158562,'2016-01-18'),
	(10004,2,101,221197359,'2014-06-09'),
	(10005,3,102,234158562,'2020-01-17'),
	(10006,3,102,229876543,'2023-12-25'),
	(10007,5,103,NULL,NULL),
	(10008,1,101,221197359,'2010-04-22'),
	(10009,3,102,229876543,'2001-12-11');

SELECT * FROM prescrition_system.Prescricao;

INSERT INTO prescrition_system.PrescricoesEnvolvemFarmacos(
	No_prescricao,
	Registo_farmaceutica,
	Nome_farmaco
)
VALUES
	(10001,905,'Mézinha da avó'),
	(10002,908,'IMODIUM'),
	(10003,908,'IMODIUM'),
	(10003,909,'Ultra Levure 250'),
	(10003,909,'Ultra Levure 250'),
	(10004,905,'Mézinha da avó'),
	(10004,909,'Ultra Levure 250'),
	(10005,910,'Aspirina 1000'),
	(10006,905,'Mézinha da avó'),
	(10006,910,'Aspirina 1000'),
	(10006,910,'Aspirina 1000'),
	(10006,910,'Aspirina 1000'),
	(10007,906,'ServicePack3'),
	(10008,906,'ServicePack3'),
	(10008,910,'Aspirina 1000'),
	(10009,906,'ServicePack3'),
	(10009,906,'ServicePack3'),
	(10009,909,'Ultra Levure 250');

SELECT * FROM prescrition_system.PrescricoesEnvolvemFarmacos;