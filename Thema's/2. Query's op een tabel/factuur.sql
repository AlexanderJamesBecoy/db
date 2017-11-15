CREATE TABLE Bedrijf
(
    KvK-nummer varchar(12) NOT NULL,
    naam varchar(20) NOT NULL,
    straat varchar(20) NOT NULL,
    postcode char(6) NOT NULL,
    plaats varchar(15) NOT NULL,
    email-adres varchar(30) NOT NULL,
    IBAN char(18) NOT NULL,
    btw-nummer varchar(20) NOT NULL,
    PRIMARY KEY(KvK-nummer)
);

CREATE TABLE Factuur
(
    factuurnummer int(11) NOT NULL,
    factuurdatum DATE NOT NULL,
    vervaldatum DATE NOT NULL,
    referentie varchar(11) NOT NULL,
    klantid int(11) NOT NULL,
    CONSTRAINT pk_factuurid PRIMARY KEY(factuurnummer),
    CONSTRAINT fk_klantid FOREIGN KEY(klantid)
        REFERENCES (klantid) Klant(klantid)
);

CREATE TABLE Klant
(
    klantnummer int(11) NOT NULL,
    btw-nummer varchar(20) NOT NULL,
    naam varchar(30) NOT NULL,
    straat varchar(20) NOT NULL,
    postcode char(6) NOT NULL,
    plaats varchar(12) NOT NULL,
    kortingspercentage int(2),
    CONSTRAINT pk_klantid PRIMARY KEY(klantnummer)
);

CREATE TABLE Factuurregel
(
    factuurid int(11) NOT NULL,
    aantal int(2) NOT NULL,
    aantal_eenheid varchar(10),
    verkoopprijs_inGehelen int(4) NOT NULL,
    verkoopprijs_inDecimalen int(2) NOT NULL,
    artikel int(11) NOT NULL,
    CONSTRAINT pk_factuurregelid PRIMARY KEY(factuurid),
    CONSTRAINT fk_artikelid FOREIGN KEY(artikel)
        REFERENCES (artikel) Factuur(artikelid)
);

CREATE TABLE Artikel
(
    artikelid varchar(11) NOT NULL,
    omschrijving TEXT,
    btw int(2) NOT NULL,
    prijs_inGehelen int(4) NOT NULL,
    prijs_inGehelen int(2) NOT NULL,
    CONSTRAINT pk_artikelid PRIMARY KEY(artikelid)
);
