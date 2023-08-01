/*
UNIVERSIDADE DE AVEIRO - 2022/23
UC: BASES DE DADOS 

João Veira - 50458 (LECI)
Lara Matos - 95228 (LECI)

Ex.4.1.2)
	Base de Dados: Sistema de Gestão de Reservas de Voos

*/

use p10g9
GO
DROP TABLE IF EXISTS VOOS.Airplane;
DROP TABLE IF EXISTS VOOS.Fare;
DROP TABLE IF EXISTS VOOS.Seat;
DROP TABLE IF EXISTS VOOS.Airplane_Type;
DROP TABLE IF EXISTS VOOS.Leg_Instance;
DROP TABLE IF EXISTS VOOS.Can_Land;
DROP TABLE IF EXISTS VOOS.Airport;
DROP TABLE IF EXISTS VOOS.Flight_Leg;
DROP TABLE IF EXISTS VOOS.Flight;
GO

DROP SCHEMA IF EXISTS VOOS;
GO

CREATE SCHEMA VOOS;
GO

CREATE TABLE VOOS.Airport (
	[airport_code]		INT					NOT NULL		PRIMARY KEY,
	[city]				VARCHAR(64),
	[airport_state]		VARCHAR(64),
	[airport_name]		VARCHAR(64)
)
GO


CREATE TABLE VOOS.Can_Land (
	[airport_code]		INT					NOT NULL		UNIQUE					FOREIGN KEY REFERENCES VOOS.Airport(airport_code),
	[type_name]			VARCHAR(128)		NOT NULL		UNIQUE,
	PRIMARY KEY (
		[airport_code],
		[type_name]
	),
)
GO

CREATE TABLE VOOS.Airplane_Type (
	[type_name]		VARCHAR(128)							PRIMARY KEY				REFERENCES VOOS.Can_Land(type_name),
	[max_seats]		INT						NOT NULL,
	[company]		VARCHAR(64),
)
GO



CREATE TABLE VOOS.Flight(
	[number]				INT				NOT NULL		PRIMARY KEY,
	[airline]				VARCHAR(128),
	[weekdays]				INT
)
GO

CREATE TABLE VOOS.Flight_Leg(
	[flight_num]			INT				NOT NULL		UNIQUE					REFERENCES VOOS.Flight(number),
	[Departure_Airport]		VARCHAR(128)					UNIQUE,
	[Arrival_Airport]		VARCHAR(128)					UNIQUE,
	[Leg_no]				INT				NOT NULL		UNIQUE,
	[Scheduled_dep_time]	TIME			NOT NULL,
	[Scheduled_arr_time]	TIME			NOT NULL,
	PRIMARY KEY(
		[flight_num],
		[Departure_Airport],
		[Arrival_Airport],
		[Leg_no]
	),
)
GO

CREATE TABLE VOOS.Fare (
	[code]					INT				NOT NULL,
	[flight_num]			INT				NOT NULL							REFERENCES VOOS.Flight(number),
	[amount]				DECIMAL(10,2)	NOT NULL,
	[restrictions]			VARCHAR(128)
	PRIMARY KEY (
		[code],
		[flight_num]
	)
)
GO

CREATE TABLE VOOS.Leg_Instance (
	[date]					DATE							UNIQUE,
	[leg_no]				INT				NOT NULL		UNIQUE					REFERENCES VOOS.Flight_Leg(leg_no),
	[flight_num]			INT				NOT NULl		UNIQUE					REFERENCES VOOS.Flight_Leg(flight_num),
	[airplane_id]			INT				NOT NULL		UNIQUE,
	[arr_time]				TIME			NOT NULL,
	[dep_time]				TIME			NOT NULL,	
	[airport_code1]			INT				NOT NULL,
	[airport_code2]			INT				NOT NULL,
	[no_avail_seats]		INT				NOT NULL,
	PRIMARY KEY (
		[date],
		[leg_no],
		[flight_num]
	)
)
GO

CREATE TABLE VOOS.Seat (
	[costumer_name]			VARCHAR(128),
	[Cphone]				INT,
	[Seat_no]				INT,
	[date]					DATE,
	[leg_no]				INT				NOT NULL							REFERENCES VOOS.Leg_Instance(leg_no),
	[flight_num]			INT				NOT NULL							REFERENCES VOOS.Leg_Instance(flight_num),
	PRIMARY KEY (
		[Seat_no],
		[date],
		[leg_no],
		[flight_num]
	)
)
GO

CREATE TABLE VOOS.Airplane (
	[aiplane_id]			INT				NOT NULL		PRIMARY KEY			FOREIGN KEY REFERENCES VOOS.Leg_Instance(airplane_id),
	[type_name]				VARCHAR(128)										REFERENCES VOOS.Airplane_Type(type_name),	
	[total_no_of_seats]		INT				NOT NULL,
)
GO


