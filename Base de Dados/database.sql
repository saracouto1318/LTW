PRAGMA FOREIGN_KEYS = ON;
.mode columns
.header ON
.nullvalue NULL

CREATE TABLE user (
	idUser INTEGER PRIMARY KEY AUTOINCREMENT,
	user_name CHAR(10) NOT NULL,
	email CHAR(20) NOT NULL,
	password CHAR(10) NOT NULL,
	photo BOOLEAN
);

CREATE TABLE owner (
	idOwner REFERENCES user(id) PRIMARY KEY
);

CREATE TABLE reviewer (
	idReviewer REFERENCES user(id) PRIMARY KEY
);

CREATE TABLE restaurant (
	idRestaurante INTEGER PRIMARY KEY AUTOINCREMENT,
	name CHAR(20) NOT NULL,
	contact LONG,
	email CHAR(20),
	priceAVG DOUBLE
);

CREATE TABLE location (
	idLocation INTEGER PRIMARY KEY AUTOINCREMENT,
	road CHAR(50),
	city CHAR(15),
	country CHAR(10),
	code INTEGER,
	altitude DOUBLE,
	longitude DOUBLE
);

CREATE TABLE category (
	idCategory INTEGER PRIMARY KEY AUTOINCREMENT,
	category CHAR(20)
);

CREATE TABLE evaluation (
	idEvaluation INTEGER PRIMARY KEY AUTOINCREMENT,
	numberAVG DOUBLE,
	CHECK(numberAVG > -1),
	CHECK(numberAVG < 10)
);

CREATE TABLE review (
	idReview INTEGER PRIMARY KEY AUTOINCREMENT,
	score INTEGER,
	comment CHAR(300),
	CHECK(score > -1),
	CHECK(score < 11)
);

CREATE TABLE reply (
	idReply INTEGER PRIMARY KEY AUTOINCREMENT,
	comment CHAR(300)
);

