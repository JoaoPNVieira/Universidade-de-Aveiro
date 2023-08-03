/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES NÃO URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

Title: INDEXES
*/

use p10g9;


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


/* INDEES: Pessoas */
CREATE INDEX idx_pessoaCc				ON RTD.Pessoa(cc);
CREATE INDEX idx_pessoaNome				ON RTD.Pessoa(nome);
CREATE INDEX idx_pessoaUtente			ON RTD.Pessoa(num_utente);
CREATE INDEX idx_pessoaNasc				ON RTD.Pessoa(data_nasc);

/* INDEES: Pacientes */
CREATE INDEX idx_pacienteId				ON RTD.Paciente(cc);
CREATE INDEX idx_pacienteNome			ON RTD.Paciente(nome);
CREATE INDEX idx_pacienteUtente			ON RTD.Paciente(num_utente);

/* INDEES: Cuidador */
CREATE INDEX idx_cuidadorId				ON RTD.Cuidador(cc_cuidador);
CREATE INDEX idx_cuidadorNome			ON RTD.Cuidador(nome);

/* INDEES: Bombeiro */
CREATE INDEX idx_bombeiroId				ON RTD.Bombeiro(id_bombeiro);
CREATE INDEX idx_bombeiroNome			ON RTD.Bombeiro(nome);

/* INDEES: Profissionais */
CREATE INDEX idx_profissionalId			ON RTD.Profissional(cedula);
CREATE INDEX idx_profissionalNome		ON RTD.Profissional(nome);

/* INDEES: Quartel */
CREATE INDEX idx_quartelId				ON RTD.Quartel(id_quartel);
CREATE INDEX idx_quartelLocalidade		ON RTD.Quartel(localidade);

/* INDEES: Unidades de Tratamento */
CREATE INDEX idx_unidadeId				ON RTD.UnidadeTratamento(id_centro);
CREATE INDEX idx_unidadeNome			ON RTD.UnidadeTratamento(Nome);
CREATE INDEX idx_unidadeLocal			ON RTD.UnidadeTratamento(id_local);

/* INDEES: Transportes */
CREATE INDEX idx_transporteId			ON RTD.Transporte(id_transporte);
CREATE INDEX idx_transporteMatricula	ON RTD.Transporte(matricula);
