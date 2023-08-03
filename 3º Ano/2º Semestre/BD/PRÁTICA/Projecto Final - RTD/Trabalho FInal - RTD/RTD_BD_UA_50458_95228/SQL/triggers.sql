/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES N�O URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	Jo�o Pedro Nunes Vieira - 50458

Titles: TRIGGER - Fun��o "M�dico"
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

    -- OBTER FUN��O E CEDULA DO PROFISSIONAL
    SELECT @prof_funcao = funcao, @prof_cedula = cedula
    FROM RTD.Profissional
    WHERE cedula IN (SELECT cedula FROM inserted);

    -- VERIFICAR SE O PROFISSIONAL � "M�dico"
    IF @prof_funcao = 'M�dico'
    BEGIN
        -- VERIFICAR SE A CEDULA CORRESPONDE
        IF EXISTS (SELECT 1 FROM inserted WHERE cedula <> @prof_cedula)
        BEGIN
            -- GERAR ERRO SE A CEDULA N�O CORRESPONDER
            PRINT 'C�dula inv�lida para fun��o "M�dico"';
			DELETE FROM RTD.Consulta WHERE id_consulta IN (SELECT id_consulta FROM inserted);
        END
    END
    ELSE
    BEGIN
        -- GERAR ERRO SE O PROFISSIONAL N�O FOR "M�dico"
        PRINT 'Apenas um profissional com cedula/fun��o "M�dico" pode efectuar uma marca��o de consulta';
        DELETE FROM RTD.Consulta WHERE id_consulta IN (SELECT id_consulta FROM inserted);
    END;
END;
GO