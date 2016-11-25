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
	priceAVG DOUBLE,
	evaluation DOUBLE,
	CHECK(evaluation > -1),
	CHECK(evaluation < 11)
	idOwner INTEGER,
	idLocation INTEGER,
	idReview INTEGER,
	FOREIGN KEY(idOwner) REFERENCES Local(owner)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idLocation) REFERENCES Local(location)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReview) REFERENCES Local(review)
				ON DELETE SET NULL
				ON UPDATE CASCADE
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

CREATE TABLE review (
	idReview INTEGER PRIMARY KEY AUTOINCREMENT,
	score INTEGER,
	comment CHAR(300),
	idReviewer INTEGER,
	FOREIGN KEY(idReviewer) REFERENCES Local(reviewer)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	CHECK(score > -1),
	CHECK(score < 11)
);

CREATE TABLE reply (
	idReply INTEGER PRIMARY KEY AUTOINCREMENT,
	comment CHAR(300),
	idOwner INTEGER, 
	idReviewer INTEGER,
	idReview INTEGER,
	FOREIGN KEY(idOwner) REFERENCES Local(owner)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReview) REFERENCES Local(review)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReviewer) REFERENCES Local(reviewer)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
);

CREATE TABLE restaurantCategory (
	idRestaurant INTEGER,
	idCategory INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES Local(restaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idCategory) REFERENCES Local(category)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE restaurantReview (
	idRestaurant INTEGER,
	idReview INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES Local(restaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReview) REFERENCES Local(review)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

