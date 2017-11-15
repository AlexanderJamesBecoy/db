CREATE DATABASE Fletnix

CREATE TABLE Person
(
	person_id int NOT NULL,
	lastname varchar(50) NOT NULL,
	firstname varchar(50) NOT NULL,
	gender char(1),
	CONSTRAINT pk_person_id PRIMARY KEY (person_id)
)

CREATE TABLE Movie
(
	movie_id int NOT NULL,
	title varchar(255) NOT NULL,
	duration int,
	description varchar(255),
	publication_year int,
	cover_image varchar(255),
	previous_part int,
	price numeric(5,2) NOT NULL,
	URL varchar(255),
	CONSTRAINT pk_movie_id PRIMARY KEY (movie_id),
	CONSTRAINT fk_movie_previouspart FOREIGN KEY (previous_part) REFERENCES Movie(movie_id)
)

CREATE TABLE Movie_Directors
(
	movie_id int NOT NULL,
	person_id int NOT NULL,
	CONSTRAINT fk_md_movie_id FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
	CONSTRAINT fk_md_person_id FOREIGN KEY (person_id) REFERENCES Person(person_id)
)

CREATE TABLE Movie_Cast
(
	movie_id int NOT NULL,
	person_id int NOT NULL,
	role varchar(255) NOT NULL,
	CONSTRAINT fk_mc_movie_id FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
	CONSTRAINT fk_mc_person_id FOREIGN KEY (person_id) REFERENCES Person(person_id),
	CONSTRAINT un_role UNIQUE (role)
)

CREATE TABLE Genre
(
	genre_name varchar(255) NOT NULL,
	description varchar(255),
	CONSTRAINT pk_genre PRIMARY KEY (genre_name)
)

CREATE TABLE Movie_Genre
(
	movie_id int NOT NULL,
	genre_name varchar(255) NOT NULL,
	CONSTRAINT fk_mg_movie_id FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
	CONSTRAINT fk_mg_genre_name FOREIGN KEY (genre_name) REFERENCES Genre(genre_name)
)

CREATE TABLE Country
(
	country_name varchar(50) NOT NULL,
	CONSTRAINT pk_country_name PRIMARY KEY (country_name)
)

CREATE TABLE Payment
(
	payment_method varchar(10) NOT NULL,
	CONSTRAINT pk_payment_method PRIMARY KEY (payment_method)
)

CREATE TABLE Contract
(
	contract_type varchar(10) NOT NULL,
	price_per_month numeric(5,2) NOT NULL,
	discount_percentage numeric(2) NOT NULL,
	CONSTRAINT pk_contract_type PRIMARY KEY (contract_type)
)

CREATE TABLE Customer
(
	customer_mail_address varchar(255) NOT NULL,
	lastname varchar(50) NOT NULL,
	firstname varchar(50) NOT NULL,
	payment_method varchar(10) NOT NULL,
	payment_card_number varchar(30) NOT NULL,
	contract_type varchar(10) NOT NULL,
	subscription_start date NOT NULL,
	subscription_end date,
	user_name varchar(30) NOT NULL,
	password varchar(50) NOT NULL,
	country_name varchar(50) NOT NULL,
	gender char(1),
	birth_date date,
	CONSTRAINT pk_customer_mail_address PRIMARY KEY (customer_mail_address),
	CONSTRAINT fk_c_payment_method FOREIGN KEY (payment_method) REFERENCES Payment(payment_method),
	CONSTRAINT fk_c_contract_type FOREIGN KEY (contract_type) REFERENCES Contract(contract_type)
)

CREATE TABLE  Watchhistory
(
	movie_id int NOT NULL,
	customer_mail_address varchar(255) NOT NULL,
	watch_date date NOT NULL,
	price numeric(5,2) NOT NULL,
	invoiced bit NOT NULL,
	CONSTRAINT fk_wh_movie_id FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
	CONSTRAINT fk_wh_customer_mail_address FOREIGN KEY (customer_mail_address) REFERENCES Customer(customer_mail_address)
)