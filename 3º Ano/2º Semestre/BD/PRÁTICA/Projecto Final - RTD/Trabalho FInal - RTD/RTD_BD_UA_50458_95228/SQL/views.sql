/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES NÃO URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

Titles: Views
*/
use P10G9
GO
--
--
DROP VIEW IF EXISTS TodosProfissionais;
DROP VIEW IF EXISTS TodosTransportes;
DROP VIEW IF EXISTS TodosQuarteis;
DROP VIEW IF EXISTS TodasUnidades;
DROP VIEW IF EXISTS ConsultasProfissionais;
DROP VIEW IF EXISTS PacientesPorto;
DROP VIEW IF EXISTS PacientesAveiro;
DROP VIEW IF EXISTS PacientesCoimbra;
DROP VIEW IF EXISTS PacientesLisboa;
DROP VIEW IF EXISTS PacientesFaro;
DROP VIEW IF EXISTS ProfissionaisPorto;
DROP VIEW IF EXISTS ProfissionaisAveiro;
DROP VIEW IF EXISTS ProfissionaisCoimbra;
DROP VIEW IF EXISTS ProfissionaisLisboa;
DROP VIEW IF EXISTS ProfissionaisFaro;
DROP VIEW IF EXISTS ConsultasProfissionais;
--
--
GO
/* VIEW - Todos os Profissionais */
CREATE VIEW TodosProfissionais AS SELECT * FROM RTD.Profissional;
--
--
GO
/* VIEW - Todos os Transportes */
CREATE VIEW TodosTransportes AS SELECT * FROM RTD.Transporte;
--
--
GO
/* VIEW - Todos os Quarteis */
CREATE VIEW TodosQuarteis AS SELECT * FROM RTD.Quartel;
--
--
GO
/* VIEW - Todos as Unidades de Tratamento */
CREATE VIEW TodasUnidades AS SELECT * FROM RTD.UnidadeTratamento;
--
--
GO
/* VIEW - Ver Pacientes residentes em Coimbra */
CREATE VIEW RTD.PacientesPorto AS
SELECT p.cc, p.num_utente, p.nome, p.morada, p.data_nasc, l.nome AS localidade
FROM RTD.Paciente pac
JOIN RTD.Pessoa p ON pac.cc = p.cc
JOIN RTD.Localidade l ON pac.id_local = l.id_local
WHERE l.nome = 'Porto';
--
--
GO
/* VIEW - Ver Pacientes residentes em Coimbra */
CREATE VIEW RTD.PacientesAveiro AS
SELECT p.cc, p.num_utente, p.nome, p.morada, p.data_nasc, l.nome AS localidade
FROM RTD.Paciente pac
JOIN RTD.Pessoa p ON pac.cc = p.cc
JOIN RTD.Localidade l ON pac.id_local = l.id_local
WHERE l.nome = 'Aveiro';
--
--
GO
/* VIEW - Ver Pacientes residentes em Coimbra */
CREATE VIEW RTD.PacientesCoimbra AS
SELECT p.cc, p.num_utente, p.nome, p.morada, p.data_nasc, l.nome AS localidade
FROM RTD.Paciente pac
JOIN RTD.Pessoa p ON pac.cc = p.cc
JOIN RTD.Localidade l ON pac.id_local = l.id_local
WHERE l.nome = 'Coimbra';
--
--
GO
/* VIEW - Ver Pacientes residentes em Coimbra */
CREATE VIEW RTD.PacientesLisboa AS
SELECT p.cc, p.num_utente, p.nome, p.morada, p.data_nasc, l.nome AS localidade
FROM RTD.Paciente pac
JOIN RTD.Pessoa p ON pac.cc = p.cc
JOIN RTD.Localidade l ON pac.id_local = l.id_local
WHERE l.nome = 'Lisboa';
--
--
GO
/* VIEW - Ver Pacientes residentes em Coimbra */
CREATE VIEW RTD.PacientesFaro AS
SELECT p.cc, p.num_utente, p.nome, p.morada, p.data_nasc, l.nome AS localidade
FROM RTD.Paciente pac
JOIN RTD.Pessoa p ON pac.cc = p.cc
JOIN RTD.Localidade l ON pac.id_local = l.id_local
WHERE l.nome = 'Faro';
--
--
GO
/* VIEW - Profissionais que trabalham no Porto */
GO
CREATE VIEW ProfissionaisPorto AS
SELECT P.*
FROM RTD.Profissional P
JOIN RTD.UnidadeTratamento UT ON P.id_centro = UT.id_centro
JOIN RTD.Localidade L ON UT.id_local = L.id_local
WHERE L.nome = 'Porto';
--
--
/* VIEW - Profissionais que trabalham em Aveiro */
GO
CREATE VIEW ProfissionaisAveiro AS
SELECT P.*
FROM RTD.Profissional P
JOIN RTD.UnidadeTratamento UT ON P.id_centro = UT.id_centro
JOIN RTD.Localidade L ON UT.id_local = L.id_local
WHERE L.nome = 'Aveiro';
--
--
/* VIEW - Profissionais que trabalham em Aveiro */
GO
CREATE VIEW ProfissionaisCoimbra AS
SELECT P.*
FROM RTD.Profissional P
JOIN RTD.UnidadeTratamento UT ON P.id_centro = UT.id_centro
JOIN RTD.Localidade L ON UT.id_local = L.id_local
WHERE L.nome = 'Coimbra';
--
--
GO
/* VIEW - Profissionais que trabalham em Lisboa */
CREATE VIEW ProfissionaisLisboa AS
SELECT P.*
FROM RTD.Profissional P
JOIN RTD.UnidadeTratamento UT ON P.id_centro = UT.id_centro
JOIN RTD.Localidade L ON UT.id_local = L.id_local
WHERE L.nome = 'Lisboa';
--
--
GO
/* VIEW - Profissionais que trabalham em Lisboa */
CREATE VIEW ProfissionaisFaro AS
SELECT P.*
FROM RTD.Profissional P
JOIN RTD.UnidadeTratamento UT ON P.id_centro = UT.id_centro
JOIN RTD.Localidade L ON UT.id_local = L.id_local
WHERE L.nome = 'Faro';
--
--
GO
/* VIEW - Profissionais com mais de 1 consulta */
CREATE VIEW RTD.ConsultasProfissionais AS
SELECT pr.cedula, p.nome AS nome_profissional, COUNT(c.id_consulta) AS total_consultas
FROM RTD.Profissional pr
JOIN RTD.Pessoa p ON pr.cc = p.cc
JOIN RTD.Consulta c ON pr.cedula = c.cedula
GROUP BY pr.cedula, p.nome
HAVING COUNT(c.id_consulta) >= 2;
--
--




