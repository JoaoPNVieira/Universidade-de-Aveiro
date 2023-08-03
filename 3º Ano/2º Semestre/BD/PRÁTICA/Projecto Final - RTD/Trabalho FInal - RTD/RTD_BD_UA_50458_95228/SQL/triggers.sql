/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES NÃO URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

Titles: TRIGGER - Função "Médico"
*/

USE p10g9
GO

IF OBJECT_ID('consulta_insert_trigger', 'TR') IS NOT NULL
BEGIN
    DROP TRIGGER consulta_insert_trigger
END
GO

CREATE TRIGGER consulta_insert_trigger
ON RTD.Consulta
AFTER INSERT
AS
BEGIN
    DECLARE @prof_funcao VARCHAR(20);
    DECLARE @prof_cedula INT;

    -- OBTER FUNÇÃO E CEDULA DO PROFISSIONAL
    SELECT @prof_funcao = funcao, @prof_cedula = cedula
    FROM RTD.Profissional
    WHERE cedula IN (SELECT cedula FROM inserted);

    -- VERIFICAR SE O PROFISSIONAL É "Médico"
    IF @prof_funcao = 'Médico'
    BEGIN
        -- VERIFICAR SE A CEDULA CORRESPONDE
        IF EXISTS (SELECT 1 FROM inserted WHERE cedula <> @prof_cedula)
        BEGIN
            -- GERAR ERRO SE A CEDULA NÃO CORRESPONDER
            PRINT 'Cédula inválida para função "Médico"';
			DELETE FROM RTD.Consulta WHERE id_consulta IN (SELECT id_consulta FROM inserted);
        END
    END
    ELSE
    BEGIN
        -- GERAR ERRO SE O PROFISSIONAL NÃO FOR "Médico"
        PRINT 'Apenas um profissional com cedula/função "Médico" pode efectuar uma marcação de consulta';
        DELETE FROM RTD.Consulta WHERE id_consulta IN (SELECT id_consulta FROM inserted);
    END;
END;
GO