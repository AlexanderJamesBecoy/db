
CREATE TABLE klant
(
    klantnr numeric(4) NOT NULL,
    klantnaam char(30) NOT NULL,
    adres char(30) NOT NULL,
    plaats char(20) NOT NULL,
    telefoon char(11),
    PRIMARY KEY (klantnr)
);

INSERT INTO klant VALUES
    (1234, 'Janssen HJM', 'Kerkstraat 31', 'Wijchen', '024-6415567'),
    (1866, 'Peters JC', 'Daltonstraat 22', 'Nijmegen', '024-3317534'),
    (2007, '024-3155440', 'Jacoblaan 11', 'Nijmegen', '024-3155440');

SELECT * FROM klant ORDER BY klantnr;

CREATE TABLE klantTelefoon
(
    klantnr numeric(4) NOT NULL,
    telefoon char(11) NOT NULL,
    FOREIGN KEY (klantnr) REFERENCES klant(klantnr)
        ON UPDATE CASCADE ON DELETE CASCADE;
);

INSERT INTO klantTelefoon
    SELECT klantnr, telefoon
    FROM klant
    WHERE telefoon IS NOT NULL;

INSERT INTO klantTelefoon VALUES
    (1234, '06-23568911'),
    (2007, '06-23451176');

SELECT * FROM klantTelefoon ORDER BY klantnr;
