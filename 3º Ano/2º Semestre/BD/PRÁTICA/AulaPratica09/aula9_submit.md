# BD: Guião 9


## ​9.1
 
### *a)*

```
GO
CREATE PROCEDURE remove_employee 
	@ssn as INT	
AS
BEGIN	
	DELETE FROM dependents WHERE essn = @ssn;
	DELETE FROM works_on WHERE essn = @ssn; 
	UPDATE department set Mgr_ssn = NULL where Mgr_ssn = @ssn;
	UPDATE employee set Super_ssn = NULL where Super_ssn = @ssn;
	DELETE FROM employee WHERE ssn = @ssn;
END
GO
```

### *b)* 

```
GO
CREATE PROC dbo.p_RecordSetI(@OldestEmployee INT OUTPUT)
AS
BEGIN
	SELECT TOP 1 @OldestEmployee = Ssn
	FROM (dbo.DEPARTMENT AS Dep JOIN dbo.EMPLOYEE AS Emp on Dep.Mgr_ssn = Emp.Ssn) 
	ORDER BY Mgr_start_date DESC
	SELECT * FROM (dbo.DEPARTMENT AS Dep JOIN dbo.EMPLOYEE AS Emp on Dep.Mgr_ssn = Emp.Ssn)
END
GO
```

### *c)* 

```
GO
CREATE TRIGGER dpt_manager ON department
INSTEAD OF INSERT, UPDATE
AS
BEGIN
	DECLARE @Mgr_ssn AS INT;
	SELECT @Mgr_ssn=Mgr_ssn FROM inserted;
	IF @Mgr_ssn IN (SELECT Mgr_ssn FROM department)
	BEGIN
		PRINT 'Error: Employee is already managing a department!'
	END
	ELSE
	BEGIN
		INSERT INTO department SELECT * FROM inserted;
		PRINT 'Done!'
	END
END
GO
```

### *d)* 

```
GO
CREATE TRIGGER t_salary ON dbo.EMPLOYEE AFTER INSERT, UPDATE
AS 
BEGIN
	DECLARE @Essn				AS INT;
	DECLARE @Esalary			AS INT;
	DECLARE @Dno				AS INT;
	DECLARE @ManagerSalary	AS INT;

	SELECT @Essn=inserted.Ssn, @Esalary=inserted.Salary, @Dno=inserted.Dno FROM inserted;
	SELECT @ManagerSalary=EMPLOYEE.Salary FROM DEPARTMENT JOIN EMPLOYEE ON DEPARTMENT.Mgr_ssn=EMPLOYEE.Ssn WHERE @Dno=DEPARTMENT.Dnumber;
	
	IF @Esalary>@ManagerSalary 
	BEGIN
		UPDATE EMPLOYEE
		SET EMPLOYEE.Salary=@ManagerSalary 
		WHERE EMPLOYEE.Ssn=@Essn;
	END
END
GO
```

### *e)* 

```
GO
CREATE FUNCTION locations_name (@ssn CHAR(9)) RETURNS @table TABLE
	(Pname		VARCHAR(15),
	 PLocation  VARCHAR(15))
AS
BEGIN
	INSERT @table
		SELECT Pname, Plocation FROM works_on, project WHERE Essn = @ssn AND Pno = Pnumber;
	RETURN;
END
GO
```

### *f)* 

```
GO
CREATE FUNCTION dbo.AboveAverageSalary (@dno int) RETURNS @table TABLE (Ssn int)
AS
	BEGIN
		INSERT @table
			SELECT EMPLOYEE.Ssn FROM EMPLOYEE JOIN (SELECT Dno, AVG(Salary) 'AverageSalary'
				FROM EMPLOYEE
				GROUP BY Dno) AS AVGSALARY
				ON AVGSALARY.Dno=EMPLOYEE.Dno
			WHERE EMPLOYEE.Salary > AVGSALARY.AverageSalary
		RETURN;
	END;
GO
```

### *g)* 

```
-- Aveiro Digital = 14 => (20)
GO
CREATE FUNCTION employeeDeptHighAverage(@departId  INT)
RETURNS @table TABLE (
	pname  VARCHAR(20), 
	pnumber INT, 
	plocation VARCHAR(15), 
	dnum INT, 
	budget FLOAT, 
	totalbudget FLOAT )
AS
BEGIN
	DECLARE C CURSOR
        FOR
            SELECT Pname, Pnumber, Plocation, Dnum, SUM( ( Salary*1.0*Hours) / 40 ) AS Budget 
            FROM project JOIN works_on
            ON Pnumber=Pno
            JOIN employee
            ON Essn=Ssn
            WHERE Dnum=@departId
            GROUP BY Pnumber, Pname, Plocation, Dnum;
 
	DECLARE @pname AS VARCHAR(15), @pnumber AS INT, @plocation as VARCHAR(15), @dnum AS INT, @budget AS FLOAT, @totalbudget AS FLOAT;
	SET @totalbudget = 0;
    OPEN C;
	FETCH C INTO @pname, @pnumber, @plocation, @dnum, @budget;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @table VALUES (@pname, @pnumber, @plocation, @dnum, @budget, @totalbudget);
		FETCH C INTO @pname, @pnumber, @plocation, @dnum, @budget;
	END
	CLOSE C;
	DEALLOCATE C;
	RETURN;
END
GO
```

### *h)* 

```
-- Trigger type: instead of
--
GO
CREATE TRIGGER t_RemoveDepartment_InsteadOf ON dbo.DEPARTMENT INSTEAD OF DELETE
AS
BEGIN
	DECLARE @Dname			AS VARCHAR(30);
	DECLARE @Dnumber		AS INT;
	DECLARE @Mgr_ssn		AS INT;
	DECLARE @Mgr_start_date AS DATE;

	SELECT @Dname=deleted.Dname, @Dnumber=deleted.Dnumber, @Mgr_ssn=deleted.Mgr_ssn, @Mgr_start_date=deleted.Mgr_start_date FROM deleted;
	IF NOT (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
		CREATE TABLE DEPARTMENT_DELETED (
		Dname					varchar(30)		NOT NULL,
		Dnumber				int,
		Mgr_ssn				int,
		Mgr_start_date		date,
		CONSTRAINT DEPARTMENT_DELETED_PK PRIMARY KEY (Dnumber)
	);
	INSERT INTO dbo.DEPARTMENT_DELETED SELECT * FROM deleted;
	DELETE FROM dbo.DEPARTMENT WHERE Dnumber=@Dnumber;
END
GO

-- Trigger type: after
GO
CREATE TRIGGER t_RemoveDepartment_After ON dbo.DEPARTMENT AFTER DELETE
AS
BEGIN
	DECLARE @Dname			AS VARCHAR(30);
	DECLARE @Dnumber		AS INT;
	DECLARE @Mgr_ssn		AS INT;
	DECLARE @Mgr_start_date AS DATE;

	SELECT @Dname=deleted.Dname, @Dnumber=deleted.Dnumber, @Mgr_ssn=deleted.Mgr_ssn, @Mgr_start_date=deleted.Mgr_start_date FROM deleted;
	IF NOT (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
		CREATE TABLE DEPARTMENT_DELETED (
		Dname				varchar(30) NOT NULL,
		Dnumber				int,
		Mgr_ssn				int,
		Mgr_start_date		date,
		CONSTRAINT DEPARTMENT_DELETED_PK PRIMARY KEY (Dnumber)
	);
	INSERT INTO dbo.DEPARTMENT_DELETED SELECT * FROM deleted;
END
```

### *i)* 

```
/*
Ambos SP's e as UDF'S são compilados uma única vêz assim que são gerados/criados, 
sendo guardados em cache na sua primeira execução. Contudo têm características que as distingue:

	1 - Ao contrário das UDF's, as SP's permitem chamar outras SP's.
	2 - SP's podem devolver vários valores de output, mas as UDF's só podem ter 1 valor de output.
	3 - Ao contrário das UDF's, SP's podem definir trasações, e lançar execução.
	4 - SP's funcionam como uma camada de abstração do modelo de dados. 
	5 - Tornam o manuseamento da base de dados mais fácil, sendo que se alguma coisa for alterado no modelo de dados não existe qualquer impacto para os clientes.
	6 - Garantem a integridade e segurança dos dados.
	
	Exemplo: 	Podem ser utilizadas para efectuar um conjunto de operações com várias tabelas, onde é preciso lidar com erros. 
	Este conjunto de operações pode ser visto como uma operação unica, ou seja uma trasação (ponto 3 anterior).

	1 - As UDF's não podem usar instruçoes DML na Base Dados.
	2 - UDF's podem ser usadas como fontes de dados, nas clausulas SELECT/ WHERE 
	3 - UDF's são deterministicas, ie, para os mesmos parametros de input produzem o mesmo valor output.
	4 - UDF's podem ser usadas como abstração de uma estrutura lógica complexa sob a forma de uma função deterministica. 
	
	Exemplo: Podem funcionar com uma VIEW parametrizada, devolvendo uma tabela em função dos parametros de input
*/
```
