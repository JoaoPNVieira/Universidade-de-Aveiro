/*
-- UDFs
*/


use p10g9;

DROP FUNCTION IF EXISTS getEventsByNum;
DROP FUNCTION IF EXISTS getTransport;
DROP FUNCTION IF EXISTS getFirefighter;
DROP FUNCTION IF EXISTS getHeadquartersName;

-- Dado um paciente devolve os diagnosticos dos eventos clinicos
GO
CREATE FUNCTION getEventsByNum (@num_utente INT) RETURNS TABLE AS
	RETURN (SELECT * FROM RTD.EventoClinico
				WHERE num_utente = @num_utente)
GO

-- Devolver o Quartel que um dado veiculo pertence
CREATE FUNCTION getTransport (@id_quartel INT) RETURNS TABLE AS
	RETURN (SELECT * FROM RTD.Transporte
				WHERE id_quartel = @id_quartel)
GO

-- Devolver o Quartel que um dado bombeiro pertence
CREATE FUNCTION getFirefighter (@id_quartel INT) RETURNS TABLE AS
	RETURN (SELECT * FROM RTD.Transporte
				WHERE id_quartel = @id_quartel)
GO

-- Devolver o nome de um quartel
CREATE FUNCTION getHeadquartersName (@nome VARCHAR(32)) RETURNS TABLE AS
	RETURN (SELECT * FROM RTD.Quartel
				WHERE nome = @nome)
GO

