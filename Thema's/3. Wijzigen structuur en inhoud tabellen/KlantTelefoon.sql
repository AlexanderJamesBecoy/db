USE Muziekdatabase
GO
DROP TABLE Klant

CREATE TABLE Klant(
	klantnr		numeric(4)	not null,
	klantnaam	char(30)	not null,
	adres		char(30)	not null,
	plaats		char(20)	not null,
	telefoon	char(11)	null,
	CONSTRAINT PK_Klant PRIMARY KEY (klantnr)
	)
GO

INSERT INTO Klant (klantnr,klantnaam,adres,plaats,telefoon)
VALUES (1234,'Janssen HJM','Kerkstraat 31','Wijchen','024-6415567')
INSERT INTO Klant (klantnr,klantnaam,adres,plaats,telefoon)
VALUES (1866,'Peters JC','Daltonstraat 22','Nijmegen','024-3317534')
INSERT INTO Klant (klantnr,klantnaam,adres,plaats,telefoon)
VALUES (2007,'Storm N','Jacobslaan 11','Nijmegen','024-3155440')


CREATE TABLE KlantTelefoon (
	klantnr  	numeric(4)	NOT NULL,
	telefoon 	char(11)	NOT NULL,
	CONSTRAINT pk_KlantTelefoon PRIMARY KEY (klantnr, telefoon),
	CONSTRAINT fk_KlantTelefoon_Klant 
		FOREIGN KEY (klantnr) REFERENCES Klant (klantnr)
		ON UPDATE CASCADE   ON DELETE CASCADE 
	)

