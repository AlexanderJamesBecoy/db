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
	(151786, 'Fishburne', 'Laurence', 'M'),
	(121111, 'Anthony', 'Ray', 'M'),
	(121112, 'Anu', 'Christine', 'F'),
	(121113, 'Alice', 'Mary', 'F'),
	(121114, 'Atwal', 'Tanveer K.', 'F')
	(123143, 'Darabont', 'Frank', 'M'),
	(123145, 'Robbens', 'Tim', 'M'),
	(123144, 'Freeman', 'Morgan', 'M'),
	(123146, 'Gunton', 'Bob', 'M'),
	(123147, 'Nolan', 'Christopher', 'M'),
	(123148, 'Bale', 'Christian', 'M'),
	(123149, 'Ledger', 'Heath', 'M'),
	(123150, 'Eckhart', 'Aaron', 'M')


INSERT INTO Movie VALUES
	(11, 'Matrix, The', 122,
		'Description of Matrix, The', 1999, NULL, NULL, 2.50, 'https://www.youtube.com/watch?v=m8e-FF8MsqU'),
	(12, 'Matrix Reloaded, The', 106,
		'Description of Matrix Reloaded, The', 2003, NULL, 11, 2.50, 'https://www.youtube.com/watch?v=kYzz0FSgpSU'),
	(13, 'Matrix Revolutions, The', 103,
		'Description of Matrix Revolutions, The', 2003, NULL, 12, 2.50, 'https://www.youtube.com/watch?v=hMbexEPAOQI')
	(14, 'Shawshank Redemption, The', 144,
		'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
		1995, 2.50, 'https://www.youtube.com/watch?v=6hB3S9bIaco')
	(15, 'Dark Knight, The', 152,
		'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
		2008, 2.50, 'https://www.youtube.com/watch?v=EXeTwQWrcwY')

INSERT INTO Movie_Directors VALUES
	(11, 83616),
	(11, 83617),
	(12, 83616),
	(12, 83617),
	(13, 83616),
	(13, 83617),
	(14, 123143),
	(15, 123147)

INSERT INTO Movie_Cast VALUES
	(11, 393411, 'Neo'),
	(11, 729933, 'Trinity'),
	(11, 151786, 'Morpheus'),
	(12, 121111, 'Power Station Guard'),
	(12, 121112, 'Kali'),
	(13, 121113, 'The Oracle'),
	(13, 121114, 'Sati'),
	(14, 123145, 'Andy Dufresne'),
	(14, 123144, 'Red'),
	(14, 123146, 'Warden Norton'),
	(15, 123148, 'Bruce Wayne'),
	(15, 123149, 'Joker'),
	(15, 123150, 'Harvey Dent')

INSERT INTO Genre VALUES
	('Action', 'Creative works characterized by emphasis on exciting action sequences'),
	('Drama', 'Fictional division between comedy and tragedy'),
	('Family', 'Movies suitable for a wide range of age groups'),
	('Sci-Fi', 'Fictional movies dealing with imaginative content such as futuristic settings, futuristic science and technology, space travel, time travel, parallel universes, and extraterrestrial life')

INSERT INTO Movie_Genre VALUES
	(11, 'Action'),
	(11, 'Sci-Fi'),
	(12, 'Action'),
	(12, 'Sci-Fi'),
	(13, 'Action'),
	(13, 'Sci-Fi'),
	(14, 'Drama'),
	(15, 'Action'),
	(15, 'Drama')

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
