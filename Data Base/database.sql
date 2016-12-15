-- PRAGMA FOREIGN_KEYS = ON;

.mode columns
.header ON
.nullvalue NULL

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS reviewer;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS hours;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS photoUSER;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS restaurantCategory;
DROP TABLE IF EXISTS restaurantHours;

/* **************************************************************************** */
/*								Tables creation                                 */
/* **************************************************************************** */

CREATE TABLE user (
	userName CHAR(10) NOT NULL,
	email CHAR(20) PRIMARY KEY,
	password CHAR(10) NOT NULL
);

CREATE TABLE owner (
	email REFERENCES user(email) PRIMARY KEY
);

CREATE TABLE reviewer (
	email REFERENCES user(email) PRIMARY KEY
);

CREATE TABLE restaurant (
	name CHAR(20) NOT NULL,
	contact CHAR(20),
	email CHAR(20) PRIMARY KEY,
	priceAVG DOUBLE,
	evaluation DOUBLE,
	emailOwner INTEGER,
	idLocation INTEGER,
	FOREIGN KEY(emailOwner) REFERENCES owner(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idLocation) REFERENCES location(idLocation)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	CHECK(evaluation >= 0),
	CHECK(evaluation <= 5)
);

CREATE TABLE hours (
	idHours INTEGER PRIMARY KEY,
	day char(15),
	initialHour char(5),
	finalHour char(5)
);

CREATE TABLE photos (
	idPhoto INTEGER PRIMARY KEY,
	path CHAR(50),
	email CHAR(20),
	FOREIGN KEY(email) REFERENCES restaurant(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE menu (
	idFood INTEGER PRIMARY KEY,
	detail CHAR(50),
	idRestaurant INTEGER,
	FOREIGN KEY(idRestaurant) REFERENCES restaurant(idRestaurant)
				ON DELETE SET NULL
				ON UPDATE CASCADE
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
	emailReviewer CHAR(20),
	emailRestaurant CHAR(20),
	FOREIGN KEY(emailReviewer) REFERENCES reviewer(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(emailRestaurant) REFERENCES restaurant(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	CHECK(score >= 0),
	CHECK(score <= 5)
);

CREATE TABLE reply (
	idReply INTEGER PRIMARY KEY AUTOINCREMENT,
	comment CHAR(300),
	emailOwner CHAR(20),
	emailReviewer CHAR(20),
	idReview INTEGER,
	FOREIGN KEY(emailOwner) REFERENCES owner(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idReview) REFERENCES review(idReview)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(emailReviewer) REFERENCES reviewer(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE restaurantCategory (
	email CHAR(20),
	idCategory INTEGER,
	FOREIGN KEY(email) REFERENCES restaurant(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idCategory) REFERENCES category(idCategory)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE restaurantMenu (
	email CHAR(20),
	idFood INTEGER,
	FOREIGN KEY(email) REFERENCES restaurant(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idFood) REFERENCES menu(idFood)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE restaurantHours (
	email CHAR(20),
	idHours INTEGER,
	FOREIGN KEY(email) REFERENCES restaurant(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
	FOREIGN KEY(idHours) REFERENCES hours(idHours)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE photoUSER (
	idPhoto INTEGER PRIMARY KEY,
	idUser INTEGER,
	FOREIGN KEY(idUser) REFERENCES user(idUser)
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

INSERT INTO owner(email) VALUES(1);
INSERT INTO owner(email) VALUES(6);
INSERT INTO owner(email) VALUES(11);
INSERT INTO owner(email) VALUES(14);
INSERT INTO owner(email) VALUES(15);
INSERT INTO owner(email) VALUES(17);
INSERT INTO owner(email) VALUES(20);
INSERT INTO owner(email) VALUES(21);
INSERT INTO owner(email) VALUES(22);
INSERT INTO owner(email) VALUES(23);

INSERT INTO reviewer(email) VALUES(2);
INSERT INTO reviewer(email) VALUES(3);
INSERT INTO reviewer(email) VALUES(4);
INSERT INTO reviewer(email) VALUES(5);
INSERT INTO reviewer(email) VALUES(7);
INSERT INTO reviewer(email) VALUES(8);
INSERT INTO reviewer(email) VALUES(9);
INSERT INTO reviewer(email) VALUES(10);
INSERT INTO reviewer(email) VALUES(12);
INSERT INTO reviewer(email) VALUES(13);
INSERT INTO reviewer(email) VALUES(16);
INSERT INTO reviewer(email) VALUES(18);
INSERT INTO reviewer(email) VALUES(19);

INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Restaurante Maria Augusta', '(+351)258776094', 'restauranteMAugusta@gmail.com', 15, 3, 'maugusta@hotmail.com', 3);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Master', '(+351)252354110', 'masterRestaurant@gmail.com', 20, 4, 'saracouto1318@hotmail.com', 1);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Restaurante Ovarense', '(+351)910964453', 'ovarenseRestaurante@gmail.com', 10, 4, 'andrewAlves@hotmail.com', 2);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Blanca KitchNet', '(+34)123897640', 'blancaKithnet@gmail.com', 30, 4, 'blanca1973@hotmail.com', 4);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Gourmet Kitchen', '(+44)099856421', 'gourmet@gmail.com', 20, 4, 'phOxford@hotmail.com', 5);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Fergunson 5 Stars', '(+44)000226176', '5stars@gmail.com', 75, 5, 'joeFergurson@gmail.com', 6);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Emma Bistro', '(+351)251886094', 'bistroEmma@gmail.com', 60, 4.5, 'emmaBarbosa@gmail.com', 7);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Evangeline', '(+351)254333159', 'evangelineRestaurante@gmail.com', 10, 2.5, 'evangeline1234@gmail.com', 8);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Girl Power', '(+33)987651234', 'girlPower@gmail.com', 40, 3, 'maryahBBB@hotmail.com', 9);
INSERT INTO restaurant(name, contact, email, priceAVG, evaluation, emailOwner, idLocation)
	VALUES ('Valério', '(+351)938228554', 'valerio@gmail.com', 10, 3.5, 'oiGirl@gmail.com', 10);

INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (1, 'Segunda-Feira', '11:00', '21:00');
INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (2, 'Terça-Feira', '11:00', '21:00');
INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (3, 'Quarta-Feira', '11:00', '21:00');
INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (4, 'Quinta-Feira', '11:00', '21:00');
INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (5, 'Sexta-Feira', '11:00', '00:00');
INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (6, 'Sábado', '10:00', '00:00');
INSERT INTO hours(idHours, day, initialHour, finalHour) VALUES (7, 'Domingo', '10:00', '23:00');

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

INSERT INTO category(category) VALUES ('Italian');
INSERT INTO category(category) VALUES ('Japanese');
INSERT INTO category(category) VALUES ('Hamburguer');
INSERT INTO category(category) VALUES ('French');
INSERT INTO category(category) VALUES ('Thai');
INSERT INTO category(category) VALUES ('Gourmet');
INSERT INTO category(category) VALUES ('Portuguese');
INSERT INTO category(category) VALUES ('Pizza');
INSERT INTO category(category) VALUES ('Spanish');

INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (1, 4, 'Um ótimo restaurante, com um bom ambiente e com uma relação qualidade/preço excelente', 2, 'masterRestaurant@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (2, 2.5, 'Um BOM restaurante, com um bom ambiente, mas com um atendimento um pouco mau', 2, 'restauranteMAugusta@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (3, 4, 'Um ótimo restaurante', 2, 3);
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 4, 'Restaurante agradável, com boa comida e bom atendimento', 3, 'valerio@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (5, 3, 'Um restaurante como todos os outros', 4, 'restauranteMAugusta@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (6, 3, 'Um restaurante como todos os outros', 4, 'girlPower@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (7, 4.5, 'Restaurante maravilhoso!! Conto em lá voltar', 7, 'bistroEmma@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (8, 4, 'Um ótimo restaurante, com um bom ambiente', 8, 'ovarenseRestaurante@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (9, 1.5, 'Atendimento péssimo', 9, 'evangelineRestaurante@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (10, 4, 'Restaurante agradável', 10, 'valerio@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (11, 3, 'Nice restaurant', 12, 'evangelineRestaurante@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (12, 4.5, 'Awesome restaurant! I love it!!!', 12, 'bistroEmma@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (13, 4, 'Nice quality and prices', 13, 'valerio@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (14, 2.5, 'Horrible and disgusting', 16, 'blancaKithnet@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (15, 4, 'Restaurante agradável e com boa comida', 18, 'masterRestaurant@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (16, 3, 'Um restaurante banal', 19, '5stars@gmail.com');
INSERT INTO review(idReview, score, comment, emailReviewer, emailRestaurant)
	VALUES (17, 5, 'Restaurante maravilhoso!', 19, 'restauranteMAugusta@gmail.com');

INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (1, 'Agradeço a sua avaliação! Volte sempre!', 1, 1);
INSERT INTO reply(idReply, comment, emailReviewer, idReview) VALUES (2, 'Conto em voltar', 1, 1);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (3, 'Agradeço a sua avaliação... Espero que da próxima as coisas estejam melhores', 11, 2);
INSERT INTO reply(idReply, comment, emailReviewer, idReview) VALUES (4, 'Espero que melhore', 2, 2);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (5, 'Agradeço a sua avaliação', 6, 3);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (6, 'Agradeço a sua avaliação', 6, 4);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (7, 'Agradeço a sua avaliação', 6, 5);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (8, 'Agradeço a sua avaliação', 19, 17);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (9, 'Agradeço a sua avaliação', 20, 15);
INSERT INTO reply(idReply, comment, emailOwner, idReview) VALUES (10, 'Thanks for your evaluation', 20, 13);

INSERT INTO restaurantCategory(email, idcategory) VALUES ('restauranteMAugusta@gmail.com',1);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('restauranteMAugusta@gmail.com',3);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('restauranteMAugusta@gmail.com',7);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('masterRestaurant@gmail.com',1);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('masterRestaurant@gmail.com',2);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('masterRestaurant@gmail.com',4);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('masterRestaurant@gmail.com',6);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('ovarenseRestaurante@gmail.com',3);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('ovarenseRestaurante@gmail.com',7);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('ovarenseRestaurante@gmail.com',8);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('blancaKithnet@gmail.com',9);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('blancaKithnet@gmail.com',1);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('blancaKithnet@gmail.com',5);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('gourmet@gmail.com',6);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',1);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',2);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',3);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',4);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',5);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',6);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',7);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('5stars@gmail.com',8);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('bistroEmma@gmail.com',7);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('bistroEmma@gmail.com',4);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('evangelineRestaurante@gmail.com',4);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('evangelineRestaurante@gmail.com',3);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('evangelineRestaurante@gmail.com',8);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('girlPower@gmail.com',8);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('girlPower@gmail.com',3);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('valerio@gmail.com',2);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('valerio@gmail.com',3);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('valerio@gmail.com',7);
INSERT INTO restaurantCategory(email, idcategory) VALUES ('valerio@gmail.com',8);

INSERT INTO menu(idFood, detail, idRestaurant) VALUES (1, 'Carne assada com arroz', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (2, 'Francesinha', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (3, 'Caldeirada de Peixe', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (4, 'Frango de churrasco', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (5, 'Lasanha', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (6, 'Palha Italiana', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (7, 'Macarrão', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (8, 'Polenta', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (9, 'Hamburguer com alho', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (10, 'Hamburguer de novilho', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (11, 'Pizza margarita', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (12, 'Pizza 4 queijos', 1);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (13, 'Sushi', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (14, 'Nigiri', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (15, 'Gigot de Agneau', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (16, 'Ris de veau', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (17, 'Escargots', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (18, 'Lombinhos de porco', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (19, 'Salada grega', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (20, 'Pizza margarita', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (21, 'Pizza napolitana', 2);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (22, 'Hamburguer com alho', 3);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (23, 'Hamburguer especial', 3);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (24, 'Carne assada com arroz', 3);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (25, 'Francesinha', 3);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (26, 'Pizza margarita', 3);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (27, 'Pizza hawaiana', 3);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (28, 'Paella', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (29, 'Cocido Madrileño', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (30, 'Tortilla', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (31, 'Spaghetti', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (32, 'Pad Thai', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (33, 'Curry', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES (34, 'Khao man kai', 4);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(35, 'Pork tenderloin', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(36, 'Greek salad', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(37, 'Rossini', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(38, 'Pod salad', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(39, 'Greek salad', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(40, 'Rossini', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(41, 'Pod salad', 5);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(42, 'Frnacesinha', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(43, 'Lasagna', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(44, 'Pod salad', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(45, 'Codfish', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(46, 'Spaghetti', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(47, 'Sushi', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(48, 'Huramaki', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(49, 'Special hamburguer', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(50, 'Foie Gras', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(51, 'Fondue', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(52, 'Pad Thai', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(53, 'Khao man kai', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(54, 'Greek salad', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(55, 'Pizza margarita', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(56, 'Hawaian pizza', 6);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(57, 'Carne assada com arroz', 7);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(58, 'Leitão', 7);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(59, 'Foie Gras', 7);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(60, 'Magret de Canard', 7);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(61, 'Foie Gras', 8);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(62, 'Fondue', 8);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(63, 'Hamburguer com alho', 8);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(64, 'Hamburguer especial', 8);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(65, 'Pizza margarita', 8);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(66, 'Pizza margarita', 9);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(67, 'Pizza vegan', 9);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(68, 'Hamburguer de salmão', 9);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(69, 'Hamburguer especial', 9);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(70, 'Sushi', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(71, 'Nigiri', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(72, 'Sashimi', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(73, 'Hamburguer de salmão', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(74, 'Hamburguer especial', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(75, 'Francesinha', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(76, 'Feijoada', 10);
INSERT INTO menu(idFood, detail, idRestaurant) VALUES(77, 'Pizza vegan', 10);

INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('masterRestaurant@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('masterRestaurant@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('masterRestaurant@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('masterRestaurant@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('masterRestaurant@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',1);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('ovarenseRestaurante@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',1);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('blancaKithnet@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('gourmet@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('gourmet@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('gourmet@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('gourmet@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('gourmet@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('gourmet@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('5stars@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('5stars@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('5stars@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('5stars@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('5stars@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',1);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('bistroEmma@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('evangelineRestaurante@gmail.com',1);
INSERT INTO restaurantHours(email, idHours) VALUES('evangelineRestaurante@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('evangelineRestaurante@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('evangelineRestaurante@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('evangelineRestaurante@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('evangelineRestaurante@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',1);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',6);
INSERT INTO restaurantHours(email, idHours) VALUES('girlPower@gmail.com',7);
INSERT INTO restaurantHours(email, idHours) VALUES('valerio@gmail.com',2);
INSERT INTO restaurantHours(email, idHours) VALUES('valerio@gmail.com',3);
INSERT INTO restaurantHours(email, idHours) VALUES('valerio@gmail.com',4);
INSERT INTO restaurantHours(email, idHours) VALUES('valerio@gmail.com',5);
INSERT INTO restaurantHours(email, idHours) VALUES('valerio@gmail.com',6);

INSERT INTO photos(idPhoto, path, email) VALUES(1, 'images/restauranteMariaAugusta.jpg', 'restauranteMAugusta@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(2, 'images/restauranteMariaAugusta2.png', 'restauranteMAugusta@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(3, 'images/master.jpg', 'masterRestaurant@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(4, 'images/master2.jpg', 'masterRestaurant@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(5, 'images/master.jpg', 'masterRestaurant@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(6, 'images/ovarense.jpg', 'ovarenseRestaurante@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(7, 'images/ovarense2.jpg', 'ovarenseRestaurante@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(8, 'images/ovarense3.jpg', 'ovarenseRestaurante@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(9, 'images/blanca.jpg', 'blancaKithnet@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(10, 'images/blanca2.jpg', 'blancaKithnet@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(11, 'images/blanca3.jpg', 'blancaKithnet@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(12, 'images/gourmet.jpg', 'gourmet@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(13, 'images/gourmet.jpg', 'gourmet@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(14, 'images/fergunson.jpg', '5stars@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(15, 'images/fergunson2.jpg', '5stars@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(16, 'images/bistro.jpg', 'bistroEmma@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(17, 'images/evangeline.jpg', 'evangelineRestaurante@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(18, 'images/girlPower.jpg', 'girlPower@gmail.com');
INSERT INTO photos(idPhoto, path, email) VALUES(19, 'images/valerio.jpg', 'valerio@gmail.com');