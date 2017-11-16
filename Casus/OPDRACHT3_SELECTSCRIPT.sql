/* Opdracht 3B */
SELECT * FROM Movie
	WHERE publication_year >= 1990
	AND publication_year <= 2010

/* Opdracht 3C */
SELECT lastname, firstname, subscription_start From Customer
	WHERE subscription_end IS NOT NULL