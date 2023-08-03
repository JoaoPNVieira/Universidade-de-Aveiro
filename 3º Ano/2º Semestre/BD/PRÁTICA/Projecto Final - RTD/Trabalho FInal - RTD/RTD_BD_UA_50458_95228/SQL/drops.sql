/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES NÃO URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

Titles: DROPS
*/

USE p10g9;
GO



-- DROP TRIGGERS 
DROP TRIGGER IF EXISTS consulta_insert_trigger;

-- DROP VIEWS OF THE RTD SCHEMA 
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
GO

/* DROPS: INDEXES */
DROP INDEX IF EXISTS RTD.Pessoa.idx_pessoaCc;
DROP INDEX IF EXISTS RTD.Pessoa.idx_pessoaNome;
DROP INDEX IF EXISTS RTD.Pessoa.idx_pessoaUtente;
DROP INDEX IF EXISTS RTD.Pessoa.idx_pessoaNasc;
DROP INDEX IF EXISTS RTD.Paciente.idx_pacienteId;
DROP INDEX IF EXISTS RTD.Paciente.idx_pacienteNome;
DROP INDEX IF EXISTS RTD.Paciente.idx_pacienteUtente;
DROP INDEX IF EXISTS RTD.Cuidador.idx_cuidadorId;
DROP INDEX IF EXISTS RTD.Cuidador.idx_cuidadorNome;
DROP INDEX IF EXISTS RTD.Bombeiro.idx_BombeiroId;
DROP INDEX IF EXISTS RTD.Bombeiro.idx_BombeiroNome;
DROP INDEX IF EXISTS RTD.Profissional.idx_profissionalId;
DROP INDEX IF EXISTS RTD.Profissional.idx_profissionalNome;
DROP INDEX IF EXISTS RTD.Quartel.idx_quartelId;
DROP INDEX IF EXISTS RTD.Quartel.idx_quartelLocalidade;
DROP INDEX IF EXISTS RTD.UnidadeTratamento.idx_unidadeId;
DROP INDEX IF EXISTS RTD.UnidadeTratamento.idx_unidadeNome;
DROP INDEX IF EXISTS RTD.UnidadeTratamento.idx_unidadeLocal;
DROP INDEX IF EXISTS RTD.Transporte.idx_transporteId;
DROP INDEX IF EXISTS RTD.Transporte.idx_transporteMatricula;

-- DROP DE TODAS AS TABELAS NO SCHEMA
DROP TABLE IF EXISTS RTD.Responsavel;
DROP TABLE IF EXISTS RTD.Escalado;
DROP TABLE IF EXISTS RTD.Serve;
DROP TABLE IF EXISTS RTD.Consulta;
DROP TABLE IF EXISTS RTD.EventoClinico;
DROP TABLE IF EXISTS RTD.Necessidades;
DROP TABLE IF EXISTS RTD.Requisicao;
DROP TABLE IF EXISTS RTD.Transporte;
DROP TABLE IF EXISTS RTD.Profissional;
DROP TABLE IF EXISTS RTD.UnidadeTratamento;
DROP TABLE IF EXISTS RTD.Bombeiro;
DROP TABLE IF EXISTS RTD.Quartel;
DROP TABLE IF EXISTS RTD.Cuidador;
DROP TABLE IF EXISTS RTD.Paciente;
DROP TABLE IF EXISTS RTD.Localidade;
DROP TABLE IF EXISTS RTD.Pessoa;
GO

-- DROP DO SCHEMA
DROP SCHEMA IF EXISTS RTD;
GO