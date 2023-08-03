/*-------------------- PACIENTES -------------------------*/

/*----- Ver todos os pacientes -----*/
create procedure [dbo].[getPacientes]
as
	begin
			select * from RTD.Paciente
	end
go

--exec dbo.getPacientes

/*------- Pesquisar Pacientes ------*/
create procedure [dbo].[searchPacientes](@num_utente INT)
as
	select * from RTD.Paciente where num_utente = @num_utente
go

/*-------- Inserir Paciente ---------*/
create procedure [dbo].[insertPaciente](@cc INT, @num_utente INT, @nome VARCHAR(32), @morada VARCHAR(64), @data_nasc DATE, @id_local INT)
as
	begin
			insert into RTD.Paciente(cc,num_utente,nome,morada,data_nasc,id_local) values (@cc,@num_utente,@nome,@morada@data_nasc,@id_local)
	end
go

/*-------- Remover Pacientes --------*/
create procedure [dbo].[removePacientes](@num_utente INT)
as
	begin
			delete from RTD.Pacinete where num_utente = @num_utente
	end
go

drop procedure dbo.removePacientes

