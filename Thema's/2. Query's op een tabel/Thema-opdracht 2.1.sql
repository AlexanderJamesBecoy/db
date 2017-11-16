SELECT titel, genre, jaartal, naam FROM Stuk, Componist 
	WHERE genre = 'pop' OR genre = 'jazz'
	AND niveaucode = 'A'
	AND Stuk.componistId = Componist.componistId
	ORDER BY jaartal DESC

SELECT titel, omschrijving FROM Stuk LEFT JOIN Niveau
	WHERE stuknrOrigineel IS NOT NULL
	ORDER BY titel