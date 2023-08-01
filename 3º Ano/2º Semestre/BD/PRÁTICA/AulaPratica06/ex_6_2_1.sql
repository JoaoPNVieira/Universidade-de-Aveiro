use p10g9
GO

DROP TABLE IF EXISTS COMPANY.Department;

DROP TABLE IF EXISTS COMPANY.Dept_Locations;
DROP TABLE IF EXISTS COMPANY.Project;
DROP TABLE IF EXISTS COMPANY.Works_on;
DROP TABLE IF EXISTS COMPANY.Dependents;
DROP TABLE IF EXISTS COMPANY.Employee;
GO

DROP SCHEMA IF EXISTS COMPANY;
GO

CREATE SCHEMA COMPANY;
GO

CREATE TABLE COMPANY.Employee (
	Fname			VARCHAR(16)			NOT NULL,
	Minit			CHAR(1),
	Lname			VARCHAR(16)			NOT NULL,
	Ssn				DECIMAL(9,0)		NOT NULL,
	Bdate			DATE,
	eAddress		VARCHAR(64),
	Sex				CHAR(1),
	Salary			DECIMAL(11,2),
	Super_ssn		DECIMAL(9,0),
	Dno				INT					NOT NULL,
	PRIMARY KEY (Ssn),
	FOREIGN KEY (Super_ssn) REFERENCES COMPANY.Employee
);

INSERT INTO COMPANY.Employee VALUES ('João', 'P', 'Vieira', 123456789, '20010502', 'Rua de Aveiro', 'M', 150.01, NULL, 5);
INSERT INTO COMPANY.Employee VALUES ('Maria', 'F', 'Casinhas', 987654321, '19980205', 'Rua do Porto', 'F', 123.45, NULL, 4);
INSERT INTO COMPANY.Employee VALUES ('José', 'L', 'Azevedo', 123654789, '19900414', 'Avenida de Ovar', 'M', 1400.00, NULL, 3);
INSERT INTO COMPANY.Employee VALUES ('Joana', 'K', 'Nunes', 000123000, '20000522', 'Rua de Santarém', 'F', 789.45, 21314151, 2);
INSERT INTO COMPANY.Employee VALUES ('Beatriz', 'A', 'Costa', 123000123, '20020325', 'Rua de Lisboa', 'F', 150.01, 21314151, 2);
INSERT INTO COMPANY.Employee VALUES ('Manuel', 'B', 'Cunha', 010203040, '20000101', 'Rua do Além', 'M', 150.01, 21314151, 2);


CREATE TABLE COMPANY.Department (
	Dname			VARCHAR(25)			NOT NULL,
	Dnumber			INT					NOT NULL,
	Mgr_ssn			DECIMAL(9,0),
	Mgr_start_date	DATE,
	PRIMARY KEY(Dnumber),
	FOREIGN KEY(Mgr_ssn) REFERENCES COMPANY.Employee(Ssn)
);


INSERT INTO COMPANY.Department VALUES ('Informatica', 1, 000123000, '41150888');
INSERT INTO COMPANY.Department VALUES ('Quimica', 2, 123456789, '85412010');
INSERT INTO COMPANY.Department VALUES ('Administracao', 3, 987654321, '78945123');
INSERT INTO COMPANY.Department VALUES ('Contabilidade', 4, 123000123, '78945123');
INSERT INTO COMPANY.Department VALUES ('Linguas', 5, NULL, NULL);

ALTER TABLE COMPANY.Employee ADD CONSTRAINT fk FOREIGN KEY(Dno) REFERENCES COMPANY.Department(Dnumber);

CREATE TABLE COMPANY.Dependents (
	Essn 			DECIMAL(9,0) 		NOT NULL,
	Dependent_name 	VARCHAR(100)		NOT NULL,
	Sex 			CHAR(1),
	Bdate 			DATE,
	Relationship	VARCHAR(20)			NOT NULL,
	PRIMARY KEY(Essn, Dependent_name),
	FOREIGN KEY(Essn) REFERENCES COMPANY.Employee(Ssn)
);

INSERT INTO COMPANY.Dependents VALUES (000123000, 'João Vieira', 'M', '20080401', 'Filho');
INSERT INTO COMPANY.Dependents VALUES (987654321, 'Maria Casinhas', 'F', '19901005', 'Neto');
INSERT INTO COMPANY.Dependents VALUES (010203040, 'José Azevedo', 'M', '20000804', 'Neto');
INSERT INTO COMPANY.Dependents VALUES (321233765, 'Joana Nunes', 'F', '20010222', 'Filho');
INSERT INTO COMPANY.Dependents VALUES (123000123, 'Beatriz Costa', 'F', '20060311', 'Filho');
INSERT INTO COMPANY.Dependents VALUES (123000123, 'Manuel Cunha', 'M', '20070413', 'Neto');
INSERT INTO COMPANY.Dependents VALUES (123456789, 'Vitor Gaspar', 'M', '20060208', 'Sobrinho');


CREATE TABLE COMPANY.Dept_location (
	Dnumber			INT 				NOT NULL,
	Dlocation 		VARCHAR(60)			NOT NULL,
	PRIMARY KEY(Dnumber, Dlocation),
	FOREIGN KEY(Dnumber) REFERENCES COMPANY.Department(Dnumber)
);

INSERT INTO COMPANY.Dept_location VALUES (2, 'Aveiro');
INSERT INTO COMPANY.Dept_location VALUES (3, 'Porto');


CREATE TABLE COMPANY.Project (
	Pname 		VARCHAR(20)	NOT NULL,
	Pnumber 	INT 		NOT NULL,
	Plocation 	VARCHAR(60),
	Dnum 		INT 		NOT NULL,
	PRIMARY KEY(Pnumber),
	FOREIGN KEY(Dnum) REFERENCES COMPANY.Department(Dnumber)
);

INSERT INTO COMPANY.Project VALUES ('Aveiro Digital', 1, 'Aveiro', 3);
INSERT INTO COMPANY.Project VALUES ('BD Open Class', 2, 'Alcanena', 2);
INSERT INTO COMPANY.Project VALUES ('Workspace', 3, 'Porto', 3);
INSERT INTO COMPANY.Project VALUES ('BD & GO', 4, 'Esmoriz', 3);


CREATE TABLE COMPANY.Works_on (
	Essn 	DECIMAL(9,0)	NOT NULL,
	Pno 	INT 			NOT NULL,
	Hours	DECIMAL(6,1),
	PRIMARY KEY(Essn, Pno),
	FOREIGN KEY(Essn) REFERENCES COMPANY.Employee(Ssn),
	FOREIGN KEY(Pno) REFERENCES COMPANY.Project(Pnumber)
);

INSERT INTO COMPANY.Works_on VALUES (123456789, 1, 20.0);
INSERT INTO COMPANY.Works_on VALUES (123000123, 3, 10.0);
INSERT INTO COMPANY.Works_on VALUES (000123000, 1, 20.0);
INSERT INTO COMPANY.Works_on VALUES (987654321, 1, 25.0);
INSERT INTO COMPANY.Works_on VALUES (010203040, 1, 20.0);
INSERT INTO COMPANY.Works_on VALUES (987654321, 4, 25.0);
INSERT INTO COMPANY.Works_on VALUES (010203040, 2, 20.0);
INSERT INTO COMPANY.Works_on VALUES (123000123, 3, 30.0);


