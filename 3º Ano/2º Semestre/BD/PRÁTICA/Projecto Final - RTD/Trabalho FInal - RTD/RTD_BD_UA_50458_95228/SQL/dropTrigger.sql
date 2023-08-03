USE p10g9
GO


IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'consulta_insert_trigger' AND parent_class_desc = 'DATABASE' AND type_desc = 'SQL_TRIGGER')
BEGIN
    PRINT 'Trigger não existe! Pode criar novamente...';
END
ELSE
BEGIN
    PRINT 'Trigger existe! Vamos efectuar DROP...';
	DROP TRIGGER IF EXISTS consulta_insert_trigger;
	PRINT 'DROP efectuado!';
END