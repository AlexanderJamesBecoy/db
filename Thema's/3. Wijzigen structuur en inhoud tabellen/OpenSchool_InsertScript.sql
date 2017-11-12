/*==============================================================*/
/* Database name:  OpenSchool                                   */
/* Script:		   Insert script			                    */
/* Created on:     19-10-2016		                            */
/*==============================================================*/

USE OpenSchool
GO

DELETE FROM Tentamen;
DELETE FROM Inschrijving;
DELETE FROM Begeleider;
DELETE FROM Voorkenniseis;
DELETE FROM Student;
DELETE FROM Cursus;
DELETE FROM Docent;
DELETE FROM Vakgroep;

INSERT INTO Vakgroep(code,naam) VALUES 
	 ('IS', 'Informatiesystemen')
	,('ST', 'Softwaretechnologie')

INSERT INTO Docent(acr,naam,vervanger,vakgroep) VALUES 
	 ('DAT', 'C.Date',    'COD', 'IS')
	,('COD', 'E.Codd',    null, 'IS')
	,('BAC', 'C.Bachman', 'DAT', 'ST')

INSERT INTO Cursus(code,naam,uren,credits,examinator) VALUES 
	 ('II', 'Inleiding informatica',  80, 3, 'BAC')
	,('DW', 'Discrete wiskunde',     120, 4, 'DAT')
	,('DB', 'Databases',             120, 4, 'COD')
	,('IM', 'Informatiemodelleren',  150, 5, 'DAT')
	,('SW', 'Semantic web',          120, 4, null );

INSERT INTO Student(nr,naam,mentor) VALUES 
	 (1, 'Berk', 'DAT')
	,(2, 'Tack', 'DAT')
	,(3, 'Bos',  'COD')
	,(4, 'Eik',  null )

INSERT INTO Begeleider(docent,cursus) VALUES 
	 ('DAT', 'DB')
	,('DAT', 'DW')
	,('DAT', 'IM')
	,('BAC', 'II')
	,('BAC', 'DB')

INSERT INTO Voorkenniseis(cursus,voorkennis) VALUES 
	 ('DB', 'II')
	,('DB', 'DW')
	,('IM', 'DB')
	,('SW', 'DB')

INSERT INTO Inschrijving(student,cursus,datum,cijfer,vrijstelling) VALUES 
	 (1, 'II', '12-jan-2012', 7,    'N' )
	,(1, 'DW', '19-jan-2012', 5,    'N' )
	,(1, 'DB', '18-mar-2012', 8,    'N' )
	,(1, 'IM', '20-jun-2012', null, 'N' )
	,(2, 'II', '12-jan-2012', null, 'J' )
	,(2, 'DW', '12-jan-2012', null, 'J' )
	,(2, 'IM', '26-jan-2012', 5,    'N' )
	,(3, 'II', '16-jan-2012', null, null)
	,(4, 'II', '20-jan-2012', null, 'J' )
	,(4, 'DB', '29-feb-2012', null, 'N' )

INSERT INTO Tentamen VALUES 
	 (1, 'II', 1, '17-apr-2012', 7   )
	,(1, 'DW', 1, '17-apr-2012', 5   )
	,(1, 'DB', 1, '19-apr-2012', 5   )
	,(1, 'DB', 2, '26-jun-2012', 8   )
	,(2, 'IM', 1, '06-apr-2012', 4   )
	,(2, 'IM', 2, '11-jun-2012', 5   )
	,(4, 'DB', 1, '26-jun-2012', null)

---- zie leereenheid 5, paragraaf 1.5
--INSERT INTO Student1 VALUES 
--	 (1, 'Inge', null,  'Berk', 'DAT')
--	,(2, 'Max',  null,  'Tack', 'DAT')
--	,(3, 'Max',  null,  'Bos',  'BAC')
--	,(4, 'Iris', 'van', 'Eik',  null )
