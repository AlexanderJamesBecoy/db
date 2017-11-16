/*
DELETE FROM Person
DELETE FROM Movie
DELETE FROM Movie_Directors
DELETE FROM Movie_Cast
DELETE FROM Genre
DELETE FROM Movie_Genre
DELETE FROM Country
DELETE FROM Payment
DELETE FROM Contract
DELETE FROM Customer
DELETE FROM Watchhistory
*/

INSERT INTO Person VALUES 
	(83616, 'Wachowski', 'Andy', 'M'),
	(83617, 'Wachowski', 'Larry', 'M'),
	(393411, 'Reeves', 'Keanu', 'M'),
	(729933, 'Moss', 'Carrie-Anne', 'F'),
	(151786, 'Fishburne', 'Laurence', 'M')

INSERT INTO Movie VALUES 
	(11, 'Matrix, The', 122, 'Description of Matrix, The', 1999, NULL, NULL, 2.50, 'http...'),
	(12, 'Matrix Reloaded, The', 106, 'Description of Matrix Reloaded, The', 2003, NULL, 11, 2.50, 'http...'),
	(13, 'Matrix Revolutions, The', 103, 'Description of Matrix Revolutions, The', 2003, NULL, 12, 2.50, 'http...')

INSERT INTO Movie_Directors VALUES 
	(11, 83616),
	(11, 83617),
	(12, 83616),
	(12, 83617)

INSERT INTO Movie_Cast VALUES 
	(11, 393411, 'Neo'),
	(11, 729933, 'Trinity'),
	(11, 151786, 'Morpheus')

INSERT INTO Genre VALUES 
	('Action', 'Creative works characterized by emphasis on exciting action sequences'),
	('Drama', 'Fictional division between comedy and tragedy'),
	('Family', 'Movies suitable for a wide range of age groups'),
	('Sci-Fi', 'Fictional movies dealing with imaginative content such as futuristic settings, futuristic science and technology, space travel, time travel, parallel universes, and extraterrestrial life')

INSERT INTO Movie_Genre VALUES
	(11, 'Action'),
	(11, 'Sci-Fi')

INSERT INTO Country VALUES 
	('The Netherlands'),
	('Belgium')

INSERT INTO Payment VALUES 
	('Mastercard'),
	('Visa'),
	('Amex')

INSERT INTO Contract VALUES
	('Basic', 4, 0),
	('Premium', 5, 20),
	('Pro', 6, 40)

INSERT INTO Customer VALUES
	('peter@pan.de', 'Pan', 'Peter', 'Mastercard', '0123456789', 'Basic', '2014-10-01', '2014-10-28', 'pp123', 'peterpass', 'The Netherlands', 'M', '1971-06-26'),
	('guy@monk.nl', 'Threepwood', 'Guybrush', 'Visa', '333-555-777', 'Premium', '2014-01-01', NULL, 'gm4ever', 'guypass', 'Belgium', 'M', '1972-03-03')

INSERT INTO Watchhistory VALUES
	(11, 'peter@pan.de', '2014-10-01', 2.50, 1),
	(11, 'peter@pan.de', '2014-10-02', 2.50, 0),
	(12, 'guy@monk.nl', '2014-03-10', 2.00, 0)