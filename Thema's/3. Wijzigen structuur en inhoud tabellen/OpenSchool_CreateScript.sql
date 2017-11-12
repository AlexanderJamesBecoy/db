/*==============================================================*/
/* Database name:  OpenSchool                                   */
/* Script:		   DDL			                                */
/* Created on:     19-10-2016		                            */
/*==============================================================*/


USE MASTER
GO
IF EXISTS(SELECT * FROM sysdatabases WHERE name = 'Openschool')
	DROP DATABASE Openschool
GO
CREATE DATABASE Openschool
GO

USE Openschool
GO

CREATE TABLE Vakgroep(
	code				CHAR(2)		NOT NULL,
	naam				VARCHAR(25) NOT NULL,
	CONSTRAINT PK_Vakgroep		PRIMARY KEY (code)
);

CREATE TABLE Docent(
	acr					CHAR(3)		NOT NULL,
	naam				VARCHAR(20)	NOT NULL,
	vervanger			CHAR(3)		NULL,
	vakgroep			CHAR(2)		NOT NULL,
	CONSTRAINT PK_Docent		PRIMARY KEY (acr),
	CONSTRAINT UQ_Docent		UNIQUE  (naam)
);

CREATE TABLE Student(
	nr                INTEGER		NOT NULL,
	naam              VARCHAR(20)	NOT NULL,
	mentor            CHAR(3)		NULL,
	CONSTRAINT PK_Student		PRIMARY KEY (nr)
);

CREATE TABLE Cursus(
	code              VARCHAR(4)    NOT NULL,
	naam              VARCHAR(25)   NOT NULL,
	uren              INTEGER       NOT NULL,
	credits           NUMERIC(4,1)  NOT NULL,
	examinator        CHAR(3)		NULL,
	CONSTRAINT PK_Cursus		PRIMARY KEY (code),
	CONSTRAINT UQ_Cursus		UNIQUE (naam)
);

CREATE TABLE Begeleider(
	docent            CHAR(3)      NOT NULL,
	cursus            VARCHAR(4)   NOT NULL,
	CONSTRAINT PK_Begeleider	PRIMARY KEY (docent, cursus)
);

CREATE TABLE Voorkenniseis(
	cursus            VARCHAR(4)   NOT NULL,
	voorkennis        VARCHAR(4)   NOT NULL,
	CONSTRAINT PK_Voorkenniseis PRIMARY KEY (cursus, voorkennis)
);

CREATE TABLE Inschrijving(
	student           INTEGER      NOT NULL,
	cursus            VARCHAR(4)   NOT NULL,
	datum             DATE         NOT NULL DEFAULT GETDATE(),
	cijfer            NUMERIC(2),
	vrijstelling      VARCHAR(1),
	CONSTRAINT PK_Inschrijving	PRIMARY KEY (student, cursus)

);

CREATE TABLE Tentamen(
	student           INTEGER   NOT NULL, --wrong in book: was numeric(4)
	cursus            VARCHAR(4)   NOT NULL,
	volgnr            NUMERIC(2)   NOT NULL,
	datum             DATE         NOT NULL,
	cijfer            NUMERIC(2),
	CONSTRAINT PK_Tentamen		PRIMARY KEY (student, cursus, volgnr),
	CONSTRAINT UQ_Tentamen		UNIQUE (student, cursus, datum)
);

ALTER TABLE Docent ADD 
	CONSTRAINT FK_Docent_Vakgroep 
		FOREIGN KEY (vakgroep) REFERENCES Vakgroep(code)
		ON DELETE NO ACTION 
		ON UPDATE CASCADE,
	CONSTRAINT FK_Docent_Docent
		FOREIGN KEY (vervanger) REFERENCES Docent(acr)
		--ON UPDATE CASCADE; <<may cause cycles or multiple cascade paths
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION

ALTER TABLE Student ADD
		CONSTRAINT FK_Student_Docent FOREIGN KEY (mentor) 
		REFERENCES Docent(acr)
		ON DELETE NO ACTION 
		ON UPDATE CASCADE

ALTER TABLE Cursus ADD
	CONSTRAINT FK_Cursus_Docent FOREIGN KEY (examinator) 
		REFERENCES Docent(acr)
		ON DELETE NO ACTION 
		ON UPDATE CASCADE

ALTER TABLE Begeleider ADD
	CONSTRAINT FK_Begeleider_Docent FOREIGN KEY (docent) 
		REFERENCES Docent(acr)
		ON DELETE NO ACTION --ON DELETE CASCADE << cause cycles or multiple cascade paths
		ON UPDATE NO ACTION,--ON UPDATE CASCADE,
	CONSTRAINT FK_Begeleider_Cursus FOREIGN KEY (cursus) 
		REFERENCES Cursus(code)
		ON DELETE NO ACTION 
		ON UPDATE CASCADE

ALTER TABLE Voorkenniseis ADD
	CONSTRAINT FK_Voorkenniseis_Cursus_cursus FOREIGN KEY (cursus)
		REFERENCES Cursus(code)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	CONSTRAINT FK_Voorkenniseis_Cursus_voorkennis FOREIGN KEY (voorkennis)
		REFERENCES Cursus(code)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION --ON UPDATE CASCADE <<may cause cycles or multiple cascade path

ALTER TABLE Inschrijving ADD
	CONSTRAINT FK_Inschrijving_Student FOREIGN KEY (student) 
		REFERENCES Student(nr)
		ON DELETE NO ACTION --ON DELETE CASCADE << cause cycles or multiple cascade paths
		ON UPDATE NO ACTION,--ON UPDATE CASCADE,
	CONSTRAINT FK_Inschrijving_Cursus FOREIGN KEY (cursus) 
		REFERENCES Cursus(code)
		ON UPDATE CASCADE

ALTER TABLE Tentamen ADD
	CONSTRAINT FK_Tentamen_Inschrijving FOREIGN KEY (student, cursus)
		REFERENCES Inschrijving(student, cursus)
		ON DELETE CASCADE 
		ON UPDATE CASCADE

/*
-- variant van Student t.b.v. leereenheid 5, paragraaf 1.5
CREATE TABLE Student1
(nr                integer      NOT NULL,
 voornaam          VARCHAR(15)  NOT NULL,
 voorvoegsel       VARCHAR(7),
 naam              VARCHAR(20)  NOT NULL,
 mentor            CHAR(3),
 PRIMARY KEY (nr),
 FOREIGN KEY (mentor) REFERENCES Docent(acr)
    ON UPDATE CASCADE
);
--
-- twee extra tabellen t.b.v. voorbeeld 11.13
--
CREATE TABLE DWCursus
(code              VARCHAR(4)    NOT NULL,
 naam              VARCHAR(25)   NOT NULL,
 begeleidJN        CHAR(1)       NOT NULL,
 PRIMARY KEY (code)
);

CREATE TABLE DWCursusresultaat
(cursuscode               VARCHAR(4)    NOT NULL,
 cursusnaam               VARCHAR(25)   NOT NULL,
 jaar                     integer       NOT NULL,
 maand                    integer       NOT NULL,
 aantal_inschrijvingen    integer,
 aantal_afgerond          integer,
 PRIMARY KEY (cursuscode, jaar, maand)
);

*/