-- PRAGMA FOREIGN_KEYS = ON;

.mode columns
.header ON
.nullvalue NULL

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS reviewer;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS restaurantCategory;
DROP TABLE IF EXISTS restaurantReview;

/* **************************************************************************** */
/*								Tables creation                                 */
/* **************************************************************************** */

CREATE TABLE user (
	iduser INTEGER PRIMARY KEY AUTOINCREMENT,
	userName CHAR(10) NOT NULL,
	email CHAR(20) UNIQUE,
	password CHAR(10) NOT NULL
);

CREATE TABLE owner (
	idOwner REFERENCES user(iduser) PRIMARY KEY
);

CREATE TABLE reviewer (
	idReviewer REFERENCES user(iduser) PRIMARY KEY
);

CREATE TABLE restaurant (
	idRestaurant INTEGER PRIMARY KEY AUTOINCREMENT,
	name CHAR(20) NOT NULL,
	contact LONG,
	email CHAR(20),
	priceAVG DOUBLE,
	evaluation DOUBLE,
	idOwner INTEGER,
	idLocation INTEGER,
	FOREIGN KEY(idOwner) REFERENCES owner(idOwner)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idLocation) REFERENCES location(idLocation)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	CHECK(evaluation > -1),
	CHECK(evaluation < 11)
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
	FOREIGN KEY(idReviewer) REFERENCES reviewer(idReviewer)
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
	FOREIGN KEY(idOwner) REFERENCES owner(idOwner)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReview) REFERENCES review(idReview)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReviewer) REFERENCES reviewer(idReviewer)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE restaurantCategory (
	idRestaurant INTEGER,
	idCategory INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES restaurant(idRestaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idCategory) REFERENCES category(idCategory)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE restaurantReview (
	idRestaurant INTEGER,
	idReview INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES restaurant(idRestaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReview) REFERENCES review(idReview)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

/* ********************************************************************** */
/*								Insertions                                */
/* ********************************************************************** */

INSERT INTO user(userName, email, password) VALUES ('Maria Augusta', 'maugusta@hotmail.com', 'maugusta');
INSERT INTO user(userName, email, password) VALUES ('Amancio', 'mancinho@gmail.com', 'mancio56');
INSERT INTO user(userName, email, password) VALUES ('Maria', 'mary_butterfly@hotmail.com', 'butterfly');
INSERT INTO user(userName, email, password) VALUES ('Afonso Teles', 'afonsoTeles@hotmail.com', 'teles96');
INSERT INTO user(userName, email, password) VALUES ('Emily', 'emily_moracean@hotmail.com', 'moracean78');
INSERT INTO user(userName, email, password) VALUES ('Sara Couto', 'saracouto1318@hotmail.com', 'saracouto1318');
INSERT INTO user(userName, email, password) VALUES ('William Fukunaga', 'williamf@hotmail.com', 'willie');
INSERT INTO user(userName, email, password) VALUES ('Norio Fukunaga', 'norio_fukunaga@hotmail.com', 'fukunaga');
INSERT INTO user(userName, email, password) VALUES ('Manuel', 'manuel96@hotmail.com', 'manuel96');
INSERT INTO user(userName, email, password) VALUES ( 'André Alves', 'andrewAlves@hotmail.com', 'andrewAwesome');
INSERT INTO user(userName, email, password) VALUES ( 'Vasco Pereira', 'vascoPereira96@hotmail.com', 'vascoMagPereira');
INSERT INTO user(userName, email, password) VALUES ( 'Mary', 'maria_porto@gmail.com', 'mariap');

INSERT INTO owner(idOwner) VALUES(1);
INSERT INTO owner(idOwner) VALUES(6);
INSERT INTO owner(idOwner) VALUES(11);

INSERT INTO reviewer(idReviewer) VALUES(2);
INSERT INTO reviewer(idReviewer) VALUES(3);
INSERT INTO reviewer(idReviewer) VALUES(4);
INSERT INTO reviewer(idReviewer) VALUES(5);
INSERT INTO reviewer(idReviewer) VALUES(7);
INSERT INTO reviewer(idReviewer) VALUES(8);
INSERT INTO reviewer(idReviewer) VALUES(9);
INSERT INTO reviewer(idReviewer) VALUES(10);
INSERT INTO reviewer(idReviewer) VALUES(12);

INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Restaurante Maria Augusta', 258776094, 'restauranteMAugusta@gmail.com', 15, 3, 1, 3);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Master', 252354110, 'masterRestaurant@gmail.com', 20, 4, 6, 1);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Restaurante Ovarense', 910964453, 'ovarenseRestaurante@gmail.com', 10, 9, 10, 2);

INSERT INTO location(road, city, country, code, altitude, longitude) VALUES ('Rua 1º de Maio', 'Trofa', 'Portugal', 4785, 23, 57);
INSERT INTO location(road, city, country, code, altitude, longitude) VALUES ('Rua da Morteira', 'Ovar', 'Portugal', 4432, 70, 50);
INSERT INTO location(road, city, country, code, altitude, longitude) VALUES ('Rua de Cima', 'Lisboa', 'Portugal', 3369, 90, 20);
--
INSERT INTO category(idCategory, category) VALUES (1, 'Italiana');
INSERT INTO category(idCategory, category) VALUES (2, 'Japonesa');
INSERT INTO category(idCategory, category) VALUES (3, 'Hamburgueria');
INSERT INTO category(idCategory, category) VALUES (4, 'Francesa');
INSERT INTO category(idCategory, category) VALUES (5, 'Asiática');

INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (1, 4, 'Um ótimo restaurante, com um bom ambiente e com uma relação qualidade/preço excelente', 2);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (2, 2.5, 'Um ótimo restaurante, com um bom ambiente, mas com um atendimento um pouco mau', 2);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (3, 4, 'Restaurante agradável, com boa comida e bom atendimento', 3);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (4, 3, 'Um restaurante como todos os outros', 7);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (5, 4.5, 'Restaurante maravilhoso!! Conto em lá voltar', 12);

INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (1, 'Agradeço a sua avaliação! Volte sempre!', 1, 1);
INSERT INTO reply(idReply, comment, idReviewer, idReview) VALUES (2, 'Conto em voltar', 1, 1);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (3, 'Agradeço a sua avaliação... Espero que da próxima as coisas estejam melhores', 11, 2);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (4, 'Agradeço a sua avaliação', 6, 3);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (5, 'Agradeço a sua avaliação', 6, 5);

INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (1,1);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (2,1);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (2,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (3,2);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (3,4);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (3,5);

INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (1,1);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (3,2);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (2,3);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (2,5);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (1,4);
