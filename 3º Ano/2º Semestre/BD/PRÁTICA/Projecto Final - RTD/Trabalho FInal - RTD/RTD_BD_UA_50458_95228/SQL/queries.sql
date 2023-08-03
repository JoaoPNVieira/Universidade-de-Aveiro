/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES NÃO URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

TABELS Queries
*/
--
/* Profissionais com mais do que uma consulta */
use P10g9
GO
--
/*Selecionar todos os tuplos da tabela Paciente */
SELECT * FROM RTD.Paciente;
--
--
/*Selecionar todos os tuplos da tabela Cuidador */
SELECT * FROM RTD.Cuidador;
--
--
/*Selecionar todos os tuplos da tabela Profissional */
SELECT * FROM RTD.Profissional;
--
--
/*Selecionar todos os tuplos da tabela Bombeiro */
SELECT * FROM RTD.Bombeiro;
--
--
/*Selecionar todos os tuplos da tabela Localidade */
SELECT * FROM RTD.Localidade;
--
--
/*Selecionar todos os tuplos da tabela Quartel */
SELECT * FROM RTD.Quartel;
--
--
/*Selecionar todos os tuplos da tabela Transporte */
SELECT * FROM RTD.Transporte;
--
--
/*Selecionar todos os tuplos da tabela UnidadeTratamento */
SELECT * FROM RTD.UnidadeTratamento;
--
--
/*Selecionar todos os Profissionais com 2 ou mais consulta */
SELECT		RTD.Profissional.cedula, RTD.Profissional.nome, RTD.Profissional.id_centro, RTD.Profissional.funcao, COUNT(RTD.Consulta.id_consulta) AS numeroConsultas
FROM		RTD.Profissional, RTD.Consulta
WHERE		RTD.Profissional.cedula = RTD.Consulta.cedula
GROUP BY	RTD.Profissional.funcao, RTD.Profissional.nome, RTD.Profissional.cedula, RTD.Profissional.id_centro
HAVING		COUNT(RTD.Consulta.id_consulta) >=2;
--
--

/*Ver quais os transportes que existem em cada quartel*/
SELECT Q.nome AS Quartel, T.tipologia AS Transporte
FROM RTD.Quartel Q
INNER JOIN RTD.Transporte T ON Q.id_quartel = T.id_quartel;