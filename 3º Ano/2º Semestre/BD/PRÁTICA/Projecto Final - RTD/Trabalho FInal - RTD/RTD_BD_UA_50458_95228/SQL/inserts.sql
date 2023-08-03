/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES N�O URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

Titles: INSERTS
*/

DELETE FROM RTD.Responsavel;
DELETE FROM RTD.Escalado;
DELETE FROM RTD.Serve;
DELETE FROM RTD.Consulta;
DELETE FROM RTD.EventoClinico;
DELETE FROM RTD.Necessidades;
DELETE FROM RTD.Requisicao;
DELETE FROM RTD.Transporte;
DELETE FROM RTD.Profissional;
DELETE FROM RTD.UnidadeTratamento;
DELETE FROM RTD.Bombeiro;
DELETE FROM RTD.Quartel;
DELETE FROM RTD.Cuidador;
DELETE FROM RTD.Paciente;
DELETE FROM RTD.Localidade;
DELETE FROM RTD.Pessoa;

-- INSERT - TABELA RTD.Pessoa
INSERT INTO RTD.Pessoa ([cc], [num_utente], [nome], [morada], [data_nasc])
VALUES (12345678, 159753456, 'Tiago da Silva Marques', 'Rua do Vale da Mataassiano Branco, Lisboa', '1976-01-01'),
       (87654321, 225456985, 'Margarida da Silva', 'Rua de Alberto Sampaio, Porto', '2000-05-23'),
       (15975345, 312547825, 'Honório Rodrigues Serrano', 'Rua do Vale da Mata, Coimbra', '1940-12-15'),
       (15975365, 465486212, 'Gregório Alberto Batata', 'Rua Dom Afonso Henriques, Nº69', '1939-04-20'),
       (15975355, 512356489, 'Joaquim Alberto Costa Soldado', 'Rua Senhora da Ajuda, Nº24 ', '1952-08-24'),
       (10203040, 696969696, 'Pedro António Carvalho e Gordo', 'Rua Carlos Albertina, Nº41 ', '1984-02-17'),
       (25845600, 705658965, 'Diogo Luis da Silva Cruz', 'Praça de São José, Edf 6, 4º Dir ', '1978-03-01'),
       (85265408, 856865236, 'Filipa Maria Robalo Salsa', 'Rua José Amador Silvestre, Edf 3, 2ºEsq. ', '2004-05-07'),
       (65485202, 909085621, 'Fausto Manuel Cerqueira', 'Rua da Azeitona, Nº29 ', '1994-09-20'),
       (75395165, 101546582, 'Luis Manuel Magro e Gordo', 'Avenida da Estrada Grande, Nº 12', '1990-09-09'),
       (36974125, 112569852, 'André Tiago Silva Ramalho', 'Rua Chapéu de Côco, Edif 1, 3º Esq ', '1968-08-01'),
       (19735824, 122452256, 'Rodrigo Jesus Cabeçudo', 'Rua da Cabeça Grande, Nº 18', '1982-02-19'),
       (87236541, 132356585, 'Ricardo de Pereira Gonçalves', 'Rua da Cabeça Pequena, Nº 34', '2003-12-24'),
       (12398765, 143216549, 'Lara Catarina Matos', 'Rua do Desespero, Nº 7', '2001-12-25'),
       (85209173, 151856965, 'João Pedro Vieira', 'Rua do Pânico, Nº 7 ', '2000-02-09');

-- INSERT - TABELA RTD.Localidade
INSERT INTO RTD.Localidade ([id_local], [nome], [coordenadas])
VALUES (1, 'Lisboa', '38.7071º N, 9.1355º W'),
       (2, 'Porto', '41.1620º N, 8.6217º W'),
       (3, 'Coimbra', '40.2035º N, 8.4106º W'),
       (4, 'Faro', '37.0157º N, 7.9350º W'),
       (5, 'Aveiro', '40.6362º N, 8.6487º W');

-- INSERT - TABELA RTD.Paciente
INSERT INTO RTD.Paciente ([cc], [num_utente], [nome], [morada], [data_nasc], [id_local])
VALUES (12345678, 159753456, 'Tiago da Silva Marques', 'Rua do Vale da Mataassiano Branco, Lisboa', '1976-01-01', 1),
       (87654321, 225456985, 'Margarida da Silva', 'Rua de Alberto Sampaio, Porto', '2000-05-23', 2),
       (15975345, 312547825, 'Honório Rodrigues Serrano', 'Rua do Vale da Mata, Coimbra', '1940-12-15', 3),
       (15975365, 465486212, 'Gregório Alberto Batata', 'Rua Dom Afonso Henriques, Nº69', '1939-04-20', 5),
       (15975355, 512356489, 'Joaquim Alberto Costa Soldado', 'Rua Senhora da Ajuda, Nº24 ', '1952-08-24', 4),
       (10203040, 696969696, 'Pedro António Carvalho e Gordo', 'Rua Carlos Albertina, Nº41 ', '1984-02-17', 2),
       (25845600, 705658965, 'Diogo Luis da Silva Cruz', 'Praça de São José, Edf 6, 4º Dir ', '1978-03-01', 3),
       (85265408, 856865236, 'Filipa Maria Robalo Salsa', 'Rua José Amador Silvestre, Edf 3, 2ºEsq. ', '2004-05-07', 1),
       (65485202, 909085621, 'Fausto Manuel Cerqueira', 'Rua da Azeitona, Nº29 ', '1994-09-20', 4),
       (75395165, 101546582, 'Luis Manuel Magro e Gordo', 'Avenida da Estrada Grande, Nº 12', '1990-09-09', 5),
       (36974125, 112569852, 'André Tiago Silva Ramalho', 'Rua Chapéu de Côco, Edif 1, 3º Esq ', '1968-08-01', 1),
       (19735824, 122452256, 'Rodrigo Jesus Cabeçudo', 'Rua da Cabeça Grande, Nº 18', '1982-02-19', 3),
       (87236541, 132356585, 'Ricardo de Pereira Gonçalves', 'Rua da Cabeça Pequena, Nº 34', '2003-12-24', 2),
       (12398765, 143216549, 'Lara Catarina Matos', 'Rua do Desespero, Nº 7', '2001-12-25', 2),
       (85209173, 151856965, 'João Pedro Vieira', 'Rua do Pânico, Nº 7 ', '2000-02-09', 3);

-- INSERT - TABELA RTD.Cuidador
INSERT INTO RTD.Cuidador ([cc_cuidador], [num_utente], [nome], [morada], [data_nasc])
VALUES (87654321, 225456985, 'Margarida da Silva', 'Rua de Alberto Sampaio, Porto', '2000-05-23'),
       (25845600, 705658965, 'Diogo Luis da Silva Cruz', 'Praça de São José, Edf 6, 4º Dir', '1978-03-01'),
       (75395165, 101546582, 'Luis Manuel Magro e Gordo', 'Avenida da Estrada Grande, Nº 12', '1990-09-09');

-- INSERT - TABELA RTD.Quartel
INSERT INTO RTD.Quartel ([id_quartel], [nome], [localidade], [morada], [id_local])
VALUES (1111, 'Quartel dos Bombeiros de Almada', 'Lisboa', 'Avenida de Luta, N7 ', 1),
       (2222, 'Quartel dos Bombeiros do Porto', 'Porto', 'Rua Grande e Comprida, Nº 14 ', 2),
       (3333, 'Quartel dos de Dom Pedro', 'Coimbra', 'Rua da Quinta das Lagrimas Caidas, Nº 12 ', 3),
       (4444, 'Quartel dos Bombeiros de Faro', 'Faro', 'Avenida da Praia Nova, Nº 42', 4),
       (5555, 'Quartel dos Bombeiros de Aveiro', 'Aveiro', 'Rua Maria Albertina, Nº 23', 5);

-- INSERT - TABELA RTD.Bombeiro
INSERT INTO RTD.Bombeiro ([cc], [num_utente], [nome], [morada], [data_nasc], [id_bombeiro], [id_quartel], [patente], [valencias])
VALUES	(12345678, 159753456, 'Tiago da Silva Marques', 'Rua do Vale da Mataassiano Branco, Lisboa', '1976-01-01', 123456, 1111, '1ºCMD', 'Curso XYZ Vermelho'),
		(25845600, 705658965, 'Diogo Luis da Silva Cruz', 'Praça de São José, Edf 6, 4º Dir ', '1978-03-01', 135486, 2222, '1ºCMD', 'Curso XPTO Azul Bebe'),
		(75395165, 101546582, 'Luis Manuel Magro e Gordo', 'Avenida da Estrada Grande, Nº 12', '1990-09-09', 255234, 3333, '1ªClasse', NULL),
		(87654321, 225456985, 'Margarida da Silva', 'Rua de Alberto Sampaio, Porto', '2000-05-23', 951753, 4444, '1ªClasse', NULL),
		(12398765, 143216549, 'Lara Catarina Matos', 'Rua do Desespero, Nº 7', '2001-12-25', 225544, 5555, '2ªClasse', 'Curso ASD'),
		(85209173, 151856965, 'João Pedro Vieira', 'Rua do Pânico, Nº 7 ', '2000-02-09', 332244, 5555, '2ªClasse', 'Curso QWE');

-- INSERT - TABELA RTD.UnidadeTratamento
INSERT INTO RTD.UnidadeTratamento ([id_centro], [id_local], [nome], [morada], [GPS])
VALUES (11111111, 1, 'Centro Hospitalar de Lisboa', 'Rua Bela Moça', '38.7223º N, 9.1393º W'),
       (22222222, 2, 'Centro Hospitalar do Porto', 'Rua da Boa Tripa', '41.1691º N, 8.6145º W'),
       (33333333, 3, 'Centro Hospitalar de Coimbra', 'Avenida Direita', '40.2118º N, 8.4298º W'),
       (44444444, 4, 'Hospital da Praia de Faro', 'Rua das Maçãs', '37.0169º N, 7.9332º W'),
       (55555555, 5, 'Hospital de Aveiro', 'Rua da Boa Hora', '40.6381º N, 8.6513º W');


-- INSERT - TABELA RTD.Profissional
INSERT INTO RTD.Profissional ([cc], [num_utente], [nome], [morada], [data_nasc], [cedula], [id_centro], [funcao])
VALUES (36974125, 112569852, 'André Tiago Silva Ramalho', 'Rua Chapéu de Côco, Edif 1, 3º Esq ', '1968-08-01', 12345678, 11111111, 'Médico'),
       --(15425625, 652145236, 'Rita Gasosa Ferreira', 'Rua Comboio Comprido', '1998-02-22', 87654321, 22222222, 'Enfermeiro'),
       --(18422452, 985665421, 'João Alberto Silva', 'Rua Maria Fernanda de Fátima', '1966-07-22', 96319190, 33333333, 'Médico'),
       (65485202, 909085621, 'Fausto Manuel Cerqueira', 'Rua da Azeitona, Nº29 ', '1994-09-20', 42186212, 55555555, 'Médico'),
       (75395165, 101546582, 'Luis Manuel Magro e Gordo', 'Avenida da Estrada Grande, Nº 12', '1990-09-09', 75315624, 55555555 , 'Enfermeiro');
       


-- INSERT - TABELA RTD.Transporte
INSERT INTO RTD.Transporte ([id_transporte], [id_quartel], [matricula], [lotacao], [tipologia], [lista_recolha], [id_local])
VALUES (123456, 1111, 'AD-11-21', 4, 'TP Cadeira de rodas 01', 'AA-0021', 1),
       (154321, 1111, 'AX-13-22', 3, 'TP Cadeira de rodas 02', 'AA-0012', 1),
       (159725, 1111, 'AT-56-72', 4, 'TP Canadianas 01', 'AA-0014', 1),
       (252356, 2222, 'BD-43-32', 4, 'TP Canadianas 02', 'BB-0035', 2),
       (268235, 2222, 'BR-73-62', 6, 'TP Canadianas 03', 'BB-0015', 2),
       (395682, 3333, 'CT-73-42', 3, 'TP 8 lugares', 'CC-0016', 3),
       (396521, 3333, 'CG-42-41', 4, 'TP 7 lugares', 'CC-0005', 3),
       (365481, 3333, 'CH-49-69', 6, 'TP 6 lugares', 'CC-0002', 3),
       (445832, 4444, 'CD-91-26', 4, 'TP Andarilho 01', 'DD-0009', 4),
       (468794, 4444, 'CD-13-22', 4, 'TP Andarilho 02', 'DD-0005', 4),
       (556852, 5555, 'EE-78-00', 3, 'TP Andarilho 03', 'EE-0003', 5),
       (565325, 5555, 'EE-56-62', 6, 'TP Andarilho 04', 'EE-0012', 5),
       (515965, 5555, 'EE-47-04', 6, 'TP Cadeira de rodas 04', 'EE-0004', 5),
       (563258, 5555, 'EE-31-84', 4, 'TP Cadeira de rodas 05', 'EE-0021', 5),
       (516523, 5555, 'EE-23-25', 4, 'TP Cadeira de rodas 06', 'EE-0005', 5);


-- INSERT - TABELA RTD.Requisicao
INSERT INTO RTD.Requisicao ([id_nec], [nome], [tipologia])
VALUES (1, 'Cadeira de Rodas', 'TP Caderia de rodas 01'),
       (2, 'Cama Articulada', 'TP Andarilho 02'),
       (3, 'Andarilho Especial', 'TP Canadianas 03');

-- INSERT - TABELA RTD.Necessidades
INSERT INTO RTD.Necessidades ([id_req], [tipologia])
VALUES (1, 'TP Cadeira de rodas 01'),
       (2, 'TP Andarilho 02'),
       (3, 'TP Canadianas 03');

-- INSERT - TABELA RTD.EventoClinico
INSERT INTO RTD.EventoClinico ([num_utente], [data], [causa], [diagnostico], [tratamentos], [vacinas], [receitas])
VALUES (465486212, '2023-02-12', 'Queda de Bicicleta', 'Fractura do Femure Direito', 'Cirurgia ao Femure Direito', 'N/A', 'Pomada XPTO Azul do Mar; Brufen 600'),
       (909085621, '2021-02-01', 'Queda de Mota', 'Fratura do Crânio', 'Cirurgia de Emergência', 'N/A', 'Brufen 600; Benuron 1000; Juizo'),
       (856865236, '2021-02-01', 'Dor de Garganta', 'Amigdalite Aguda', 'Consulta geral e receita de', 'N/A', 'Amoxicilina 500mg');

-- INSERT - TABELA RTD.Consulta
INSERT INTO RTD.Consulta ([id_consulta], [id_centro], [num_utente], [cedula], [data], [hora])
VALUES (123456, 11111111, 112569852, 12345678, '2023-06-15', '09:30:00'),
       (951753, 55555555, 101546582, 42186212, '2023-12-10', '11:30:00'),
       (799692, 55555555, 465486212, 42186212, '2023-08-14', '11:00:00');

-- INSERT - TABELA RTD.Serve
INSERT INTO RTD.Serve ([id_quartel], [id_local])
VALUES (1111, 1),
       (2222, 2),
       (3333, 3),
       (4444, 4),
       (5555, 5);

-- INSERT - TABELA RTD.Escalado
INSERT INTO RTD.Escalado ([id_bombeiro], [id_transporte])
VALUES (123456, 123456),
       (225544, 515965),
       (332244, 515965);

-- INSERT - TABELA RTD.Responsavel
INSERT INTO RTD.Responsavel ([cc_cuidador], [num_utente])
VALUES (87654321, 696969696),
       (75395165, 465486212);
