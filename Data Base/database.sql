-- PRAGMA FOREIGN_KEYS = ON;

.mode columns
.header ON
.nullvalue NULL

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS reviewer;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS menu;
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
	contact CHAR(20),
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

CREATE TABLE photos (
	idPhoto INTEGER PRIMARY KEY,
	idRestaurant INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES restaurant(idRestaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE menu (
	idFood INTEGER PRIMARY KEY,
	detail CHAR(50)
);

CREATE TABLE location (
	idLocation INTEGER PRIMARY KEY AUTOINCREMENT,
	road CHAR(50),
	city CHAR(15),
	country CHAR(10),
	code CHAR(6),
	latitude DOUBLE,
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

CREATE TABLE restaurantMenu (
	idRestaurant INTEGER,
	idFood INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES restaurant(idRestaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idFood) REFERENCES menu(idFood)
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
INSERT INTO user(userName, email, password) VALUES ('André Alves', 'andrewAlves@hotmail.com', 'andrewAwesome');
INSERT INTO user(userName, email, password) VALUES ('Vasco Pereira', 'vascoPereira96@hotmail.com', 'vascoMagPereira');
INSERT INTO user(userName, email, password) VALUES ('Mary', 'maryNice@gmail.com', 'maryNICE');
INSERT INTO user(userName, email, password) VALUES ('Andrew Anderson', 'andanderson@gmail.com', 'andanderson');
INSERT INTO user(userName, email, password) VALUES ('Blanca', 'blanca1973@hotmail.com', 'blanchGirl');
INSERT INTO user(userName, email, password) VALUES ('Philip', 'phOxford@hotmail.com', 'oxfordMan');
INSERT INTO user(userName, email, password) VALUES ('Amanda Fergunson', 'amandaFergurson@gmail.com', 'fergunsonA');
INSERT INTO user(userName, email, password) VALUES ('Joe Fergunson', 'joeFergurson@gmail.com', 'joejoef');
INSERT INTO user(userName, email, password) VALUES ('Mix Tane', 'mixMixMix@hotmail.com', 'mixes1234');
INSERT INTO user(userName, email, password) VALUES ('Emma', 'emmaBarbosa@gmail.com', 'emmaBarbosa12');
INSERT INTO user(userName, email, password) VALUES ('Evangeline 1234', 'evangeline1234@gmail.com', 'evangeline1234');
INSERT INTO user(userName, email, password) VALUES ('Maryah', 'maryahBBB@hotmail.com', 'BBBh');
INSERT INTO user(userName, email, password) VALUES ('Girl Power', 'oiGirl@gmail.com', 'girlPower1001');
INSERT INTO user(userName, email, password) VALUES ('Paulo Valério', 'pauloValério65@gmail.com', 'paulo65');

INSERT INTO owner(idOwner) VALUES(1);
INSERT INTO owner(idOwner) VALUES(6);
INSERT INTO owner(idOwner) VALUES(11);
INSERT INTO owner(idOwner) VALUES(14);
INSERT INTO owner(idOwner) VALUES(15);
INSERT INTO owner(idOwner) VALUES(17);
INSERT INTO owner(idOwner) VALUES(20);
INSERT INTO owner(idOwner) VALUES(21);
INSERT INTO owner(idOwner) VALUES(22);
INSERT INTO owner(idOwner) VALUES(23);

INSERT INTO reviewer(idReviewer) VALUES(2);
INSERT INTO reviewer(idReviewer) VALUES(3);
INSERT INTO reviewer(idReviewer) VALUES(4);
INSERT INTO reviewer(idReviewer) VALUES(5);
INSERT INTO reviewer(idReviewer) VALUES(7);
INSERT INTO reviewer(idReviewer) VALUES(8);
INSERT INTO reviewer(idReviewer) VALUES(9);
INSERT INTO reviewer(idReviewer) VALUES(10);
INSERT INTO reviewer(idReviewer) VALUES(12);
INSERT INTO reviewer(idReviewer) VALUES(13);
INSERT INTO reviewer(idReviewer) VALUES(16);
INSERT INTO reviewer(idReviewer) VALUES(18);
INSERT INTO reviewer(idReviewer) VALUES(19);

INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Restaurante Maria Augusta', '(+351)258776094', 'restauranteMAugusta@gmail.com', 15, 3, 1, 3);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Master', '(+351)252354110', 'masterRestaurant@gmail.com', 20, 4, 6, 1);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Restaurante Ovarense', '(+351)910964453', 'ovarenseRestaurante@gmail.com', 10, 4, 10, 2);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Blanca KitchNet', '(+34)123897640', 'blancaKithnet@gmail.com', 30, 4, 14, 4);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Gourmet Kitchen', '(+44)099856421', 'gourmet@gmail.com', 20, 4, 15, 5);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Fergunson 5 Stars', '(+44)000226176', '5stars@gmail.com', 75, 5, 17, 6);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Emma Bistro', '(+351)251886094', 'bistroEmma@gmail.com', 60, 4.5, 19, 7);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Evangeline', '(+351)254333159', 'evangelineRestaurante@gmail.com', 10, 2.5, 20, 8);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Girl Power', '(+33)987651234', 'girlPower@gmail.com', 40, 3, 21, 9);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, idOwner, idLocation)
	VALUES ('Valério', '(+351)938228554', 'valerio@gmail.com', 10, 3.5, 22, 10);

INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Rua 1º de Maio', 'Trofa', 'Portugal', '4785-353', 41.337867, -8.560493);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Rua da Madragoa', 'Ovar', 'Portugal', '3880-164', 40.853282, -8.614401);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Rua de Cima', 'Lisboa', 'Portugal', '2655-129', 38.935349, -9.401735);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('31 Calle Gran Vía', 'Madrid', 'Espanha', '28000', 40.422703, -3.709455);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Regent Street', 'London', 'England', 'WC2N', 51.5108, -0.1387);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Westbourne Grove', 'London', 'England', 'WC2N', 51.5090312972, -0.1903825718);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Rua Infante D. Henrique', 'Trofa', 'Portugal', '4785-323', 41.337143, -8.562737);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Rua Marquês de Pombal', 'Lisboa', 'Portugal', '2565-672', 39.148754, -9.232771);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Rua Sem Nome', 'Lisboa', 'Portugal', '2670-675', 38.884943, -9.179544);
INSERT INTO location(road, city, country, code, latitude, longitude) VALUES ('Travessa 1º de Dezembro', 'Braga', 'Portugal', '4700-860', 41.410203, -8.515568);

INSERT INTO category(idCategory, category) VALUES (1, 'Italian');
INSERT INTO category(idCategory, category) VALUES (2, 'Japanese');
INSERT INTO category(idCategory, category) VALUES (3, 'Hamburguer');
INSERT INTO category(idCategory, category) VALUES (4, 'French');
INSERT INTO category(idCategory, category) VALUES (5, 'Thai');
INSERT INTO category(idCategory, category) VALUES (6, 'Gourmet');
INSERT INTO category(idCategory, category) VALUES (7, 'Portuguese');
INSERT INTO category(idCategory, category) VALUES (8, 'Pizza');
INSERT INTO category(idCategory, category) VALUES (9, 'Spanish');

INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (1, 4, 'Um ótimo restaurante, com um bom ambiente e com uma relação qualidade/preço excelente', 2);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (2, 2.5, 'Um BOM restaurante, com um bom ambiente, mas com um atendimento um pouco mau', 2);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (3, 4, 'Um ótimo restaurante', 2);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (4, 4, 'Restaurante agradável, com boa comida e bom atendimento', 3);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (5, 3, 'Um restaurante como todos os outros', 4);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (6, 3, 'Um restaurante como todos os outros', 4);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (7, 4.5, 'Restaurante maravilhoso!! Conto em lá voltar', 7);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (8, 4, 'Um ótimo restaurante, com um bom ambiente', 8);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (9, 1.5, 'Atendimento péssimo', 9);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (10, 4, 'Restaurante agradável', 10);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (11, 3, 'Nice restaurant', 12);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (12, 4.5, 'Awesome restaurant! I love it!!!', 12);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (13, 4, 'Nice quality and prices', 13);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (14, 2.5, 'Horrible and disgusting', 16);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (15, 4, 'Restaurante agradável e com boa comida', 18);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (16, 3, 'Um restaurante banal', 19);
INSERT INTO review(idReview, score, comment, idReviewer)
	VALUES (17, 5, 'Restaurante maravilhoso!', 19);

INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (1, 'Agradeço a sua avaliação! Volte sempre!', 1, 1);
INSERT INTO reply(idReply, comment, idReviewer, idReview) VALUES (2, 'Conto em voltar', 1, 1);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (3, 'Agradeço a sua avaliação... Espero que da próxima as coisas estejam melhores', 11, 2);
INSERT INTO reply(idReply, comment, idReviewer, idReview) VALUES (4, 'Espero que melhore', 2, 2);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (5, 'Agradeço a sua avaliação', 6, 3);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (6, 'Agradeço a sua avaliação', 6, 4);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (7, 'Agradeço a sua avaliação', 6, 5);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (8, 'Agradeço a sua avaliação', 19, 17);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (9, 'Agradeço a sua avaliação', 20, 15);
INSERT INTO reply(idReply, comment, idOwner, idReview) VALUES (10, 'Thanks for your evaluation', 20, 13);

INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (1,1);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (1,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (1,7);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (2,1);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (2,2);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (2,4);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (2,6);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (3,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (3,7);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (3,8);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (4,9);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (4,1);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (4,5);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (5,6);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,1);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,2);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,4);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,5);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,6);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,7);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (6,8);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (7,7);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (7,4);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (8,4);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (8,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (8,8);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (9,8);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (9,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (10,2);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (10,3);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (10,7);
INSERT INTO restaurantCategory(idRestaurant, idcategory) VALUES (10,8);

INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (1,5);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (1,2);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (2,1);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (3,3);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (3,8);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (4,16);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (5,4);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (6,17);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (7,7);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (7,12);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (8,11);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (8,9);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (8,14);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (9,6);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (10,10);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (10,13);
INSERT INTO restaurantReview(idRestaurant, idReview) VALUES (10,15);

INSERT INTO category(idCategory, category) VALUES (1, 'Italian');
INSERT INTO category(idCategory, category) VALUES (2, 'Japanese');
INSERT INTO category(idCategory, category) VALUES (3, 'Hamburguer');
INSERT INTO category(idCategory, category) VALUES (4, 'French');
INSERT INTO category(idCategory, category) VALUES (5, 'Thai');
INSERT INTO category(idCategory, category) VALUES (6, 'Gourmet');
INSERT INTO category(idCategory, category) VALUES (7, 'Portuguese');
INSERT INTO category(idCategory, category) VALUES (8, 'Pizza');
INSERT INTO category(idCategory, category) VALUES (9, 'Spanish');

INSERT INTO menu(idFood, detail) VALUES (1, 'Carne assada com arroz');
INSERT INTO menu(idFood, detail) VALUES (2, 'Francesinha');
INSERT INTO menu(idFood, detail) VALUES (3, 'Caldeirada de Peixe');
INSERT INTO menu(idFood, detail) VALUES (4, 'Frango de churrasco');
INSERT INTO menu(idFood, detail) VALUES (5, 'Feijoada');
INSERT INTO menu(idFood, detail) VALUES (6, 'Leitão');
INSERT INTO menu(idFood, detail) VALUES (7, 'Bacalhau à Lagareiro');
INSERT INTO menu(idFood, detail) VALUES (8, 'Lasanha');
INSERT INTO menu(idFood, detail) VALUES (9, 'Palha Italiana');
INSERT INTO menu(idFood, detail) VALUES (10, 'Macarrão');
INSERT INTO menu(idFood, detail) VALUES (11, 'Polenta');
INSERT INTO menu(idFood, detail) VALUES (12, 'Sushi');
INSERT INTO menu(idFood, detail) VALUES (13, 'Sashimi');
INSERT INTO menu(idFood, detail) VALUES (14, 'Nigiri');
INSERT INTO menu(idFood, detail) VALUES (15, 'Norimaki');
INSERT INTO menu(idFood, detail) VALUES (16, 'Huramaki');
INSERT INTO menu(idFood, detail) VALUES (17, 'Hamburguer com alho');
INSERT INTO menu(idFood, detail) VALUES (18, 'Hamburguer de novilho');
INSERT INTO menu(idFood, detail) VALUES (19, 'Hamburguer especial');
INSERT INTO menu(idFood, detail) VALUES (20, 'Foie Gras');
INSERT INTO menu(idFood, detail) VALUES (21, 'Magret de Canard');
INSERT INTO menu(idFood, detail) VALUES (22, 'Gigot de Agneau');
INSERT INTO menu(idFood, detail) VALUES (23, 'Ris de veau');
INSERT INTO menu(idFood, detail) VALUES (24, 'Escargots');
INSERT INTO menu(idFood, detail) VALUES (25, 'Fondue');
INSERT INTO menu(idFood, detail) VALUES (26, 'Pad Thai');
INSERT INTO menu(idFood, detail) VALUES (27, 'Curry');
INSERT INTO menu(idFood, detail) VALUES (28, 'Khao man kai');
INSERT INTO menu(idFood, detail) VALUES (29, 'Lombinhos de porco');
INSERT INTO menu(idFood, detail) VALUES (30, 'Salada grega');
INSERT INTO menu(idFood, detail) VALUES (31, 'Tournedos Rossini');
INSERT INTO menu(idFood, detail) VALUES (32, 'Salada de vagem');
INSERT INTO menu(idFood, detail) VALUES (33, 'Pizza margarita');
INSERT INTO menu(idFood, detail) VALUES (34, 'Pizza 4 quejos');
INSERT INTO menu(idFood, detail) VALUES (35, 'Pizza napolitana');
INSERT INTO menu(idFood, detail) VALUES (36, 'Pizza margarita');
INSERT INTO menu(idFood, detail) VALUES (37, 'Pizza hawaiana');
INSERT INTO menu(idFood, detail) VALUES (38, 'Pizza vegan');
INSERT INTO menu(idFood, detail) VALUES (39, 'Paella');
INSERT INTO menu(idFood, detail) VALUES (40, 'Cocido Madrileño');
INSERT INTO menu(idFood, detail) VALUES (41, 'Gazpacho');
INSERT INTO menu(idFood, detail) VALUES (42, 'Tortilla');
INSERT INTO menu(idFood, detail) VALUES (43, 'Tapas');
INSERT INTO menu(idFood, detail) VALUES (44, 'Pisto');

INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,1);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,2);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,3);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,4);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,8);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,9);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,10);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,11);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,17);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,18);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,19);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,33);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(1,34);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,12);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,12);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,14);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,22);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,23);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,24);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,29);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,30);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,33);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,37);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(2,38);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,17);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,18);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,19);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,1);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,2);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,5);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,33);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,34);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(3,36);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,39);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,40);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,42);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,44);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,10);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,26);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,27);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(4,28);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(5,29);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(5,30);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(5,31);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(5,32);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,1);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,2);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,3);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,6);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,7);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,8);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,10);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,12);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,13);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,15);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,18);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,20);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,26);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,28);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,30);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,31);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,32);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,34);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,35);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,36);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(6,37);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(7,1);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(7,2);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(7,3);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(7,20);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(7,21);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(7,22);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,20);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,21);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,22);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,17);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,18);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,33);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(8,34);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(9,33);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(9,34);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(9,17);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(9,19);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,12);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,13);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,14);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,17);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,18);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,1);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,3);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,4);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,35);
INSERT INTO restaurantMenu(idRestaurant, idFood) VALUES(10,36);

INSERT INTO photos(idPhoto, idRestaurant) VALUES(1,1);
