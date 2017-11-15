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

INSERT INTO Person VALUES (83616, 'Wachowski', 'Andy', 'M');
INSERT INTO Person VALUES (83617, 'Wachowski', 'Larry', 'M');
INSERT INTO Person VALUES (393411, 'Reeves', 'Keanu', 'M');
INSERT INTO Person VALUES (729933, 'Moss', 'Carrie-Anne', 'F');
INSERT INTO Person VALUES (151786, 'Fishburne', 'Laurence', M);

INSERT INTO Movie VALUES (11, 'Matrix, The', 122, 'Description of Matrix, The', 1999, NULL, NULL, 2.50, 'http...');
INSERT INTO Movies VALUES (12, 'Matrix Reloaded, The', 106, 'Description of Matrix Reloaded, The', 2003, NULL, 11, 2.50, 'http...');
INSERT INTO Movies VALUES (13, 'Matrix Revolutions, The', 103, 'Description of Matrix Revolutions, The', 2003, NULL, 12, 2.50, 'http...');

INSERT INTO Movie_Directors VALUES (11, 83616);
INSERT INTO Movie_Directors VALUES (11, 83617);
INSERT INTO Movie_Directors VALUES (12, 83616);
INSERT INTO Movie_Directors VALUES (12, 83617);

INSERT INTO Movie_Cast VALUES (11, 393411, 'Neo');
INSERT INTO Movie_Cast VALUES (11, 729933, 'Trinity');
INSERT INTO Movie_Cast VALUES (11, 151786, 'Morpheus');

INSERT INTO Genre VALUES ('Action', 'Creative works characterized by emphasis on exciting action sequences');
INSERT INTO Genre VALUES ('Drama', 'Fictional division between comedy and tragedy');
INSERT INTO Genre VALUES ('Family', 'Movies suitable for a wide range of age groups');
INSERT INTO Genre VALUES ('Sci-Fi', 'Fictional movies dealing with imaginative content such as futuristic settings, futuristic science and technology, space travel, time travel, parallel universes, and extraterrestrial life');

INSERT INTO Movie_Genre VALUES (11, 'Action');
INSERT INTO Movie_Genre VALUES (11, 'Sci-Fi');

INSERT INTO Country VALUES ('The Netherlands');
INSERT INTO Country VALUES ('Belgium');

INSERT INTO Country VALUES ('Mastercard');
INSERT INTO Country VALUES ('Visa');
INSERT INTO Country VALUES ('Amex');

INSERT INTO Contract VALUES ('Basic', 4, 0);
INSERT INTO Contract VALUES ('Premium', 5, 20);
INSERT INTO Contract VALUES ('Pro', 6, 40);

INSERT INTO Customer VALUES ('peter@pan.de', 'Pan', 'Peter', 'Mastercard', '0123456789', 'Basic', '01-oct-2014', '28-oct-2014', 'pp123', 'peterpass', 'The Netherlands', 'M', '26-juni-1971');
INSERT INTO Customer VALUES ('guy@monk.nl', 'Threepwood', 'Guybrush', 'Visa', '333-555-777', 'Premium', '01-jan-2014', NULL, 'gm4ever', 'guypass', 'Belgium', 'M', '03-mar-1972');

INSERT INTO Watchhistory VALUES (11, 'peter@pan.de', '01-oct-2014', 2.50, 1);
INSERT INTO Watchhistory VALUES (11, 'peter@pan.de', '02-oct-2014', 2.50, 0);
INSERT INTO Watchhistory VALUES (12, 'guy@monk.nl', '10-mar-2014', 2.00, 0);