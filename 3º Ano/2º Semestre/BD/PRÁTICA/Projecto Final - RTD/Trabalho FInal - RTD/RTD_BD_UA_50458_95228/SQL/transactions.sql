/*
UNIVERSIDADE DE AVEIRO - 2022/23
BASE DE DADOS: 
RTD - REDE DE TRANSPORTE DE DOENTES NÃO URGENTES

Autores:
-	Lara Catarina Matos - 95228
-	João Pedro Nunes Vieira - 50458

Titles: TRANSACTIONS
*/

BEGIN TRY
    BEGIN TRANSACTION;
    
-- INSERT - TABELA RTD.Pessoa
    INSERT INTO RTD.Pessoa ([cc], [num_utente], [nome], [morada], [data_nasc])
    VALUES (191919191, 37373737, 'Alberto Manuel', 'Rua André Fáustos, Nº38', '1999-08-01'),
           (919191919, 36363636, 'Maria Gato', 'Rua Moça Nova, Nº26', '1985-09-15'),
           (393939393, 35353535, 'Jorge Gonçalo', 'Rua Justiça Cega, Nº13', '1965-12-01');
    


    -- INSERT - TABELA RTD.Localidade
    INSERT INTO RTD.Localidade ([id_local], [nome], [coordenadas])
    VALUES (50, 'Braga', '41.5503º N, 8.4205º W'),
           (70, 'Porto', '39.2362º N, 8.6879º W');
           -- (3, 'Coimbra', '40.2059° N, 8.4296° W');
    
    -- CHECKPOINT
    CHECKPOINT;
    
    -- COMMIT
    COMMIT;
    
    -- ROLLBACK
    BEGIN TRANSACTION;
    
    
    -- INSERT - TABELA RTD.Cuidador
    INSERT INTO RTD.Cuidador ([cc_cuidador], [num_utente], [nome], [morada], [data_nasc])
    VALUES (444445555, 44444555, 'Ana Rodrigues ', 'Rua Joaquim Alberto, Nº56', '1970-07-22'),
           (555556666, 55555666, 'Pedro Almeida', 'Rua Ernesto Silva, Nº11', '1982-09-15');
    
    -- ROLLBACK
    ROLLBACK;
    
    -- BEGIN NEW TRANSACTION
    BEGIN TRANSACTION;
    
    -- INSERT - TABELA RTD.Quartel
    INSERT INTO RTD.Quartel ([id_quartel], [nome], [localidade], [morada], [id_local])
    VALUES (6666, 'Quartel dos Bombeiros da Cova da Moura', 'Lisboa', 'Rua F, Lisboa', 1),
           (7777, 'Quartel dos Bombeiros de Matosinhos', 'Porto', 'Rua G, Porto', 2);
    
    -- INSERT - TABELA RTD.Bombeiro
    INSERT INTO RTD.Bombeiro ([cc], [num_utente], [nome], [morada], [data_nasc], [id_bombeiro], [id_quartel], [patente], [valencias])
    VALUES (12345678, 159753456, 'Tiago da Silva Marques', 'Rua do Vale da Mataassiano Branco, Lisboa', '1976-01-01', 123456, 1111, '1ºCMD', 'Combate a Incêndios'),
           (25845600, 705658965, 'Diogo Luis da Silva Cruz', 'Praça de São José, Edf 6, 4º Dir ', '1978-03-01', 135486, 2222, '1ºCMD', 'Resgate Aquático');
    
    -- CHECKPOINT
    CHECKPOINT;
    
    -- COMMIT
    COMMIT;
    
    PRINT 'Transacção efectuadas com sucesso! Commit efectuado...';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK;
    
    PRINT 'Ocurreu um ou mais erros. Rollback iniciado';
    PRINT 'Erro: ' + ERROR_MESSAGE();
END CATCH;
