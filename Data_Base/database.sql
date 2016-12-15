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
	idPhoto INTEGER PRIMARY KEY AUTOINCREMENT,
	path CHAR(50),
	email CHAR(20),
	FOREIGN KEY(email) REFERENCES restaurant(email)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

CREATE TABLE menu (
	idFood INTEGER PRIMARY KEY AUTOINCREMENT,
	detail CHAR(50),
	email CHAR(20),
	FOREIGN KEY(email) REFERENCES restaurant(email)
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
/*				Insertions                                */
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

INSERT INTO owner(email) VALUES('maugusta@hotmail.com');
INSERT INTO owner(email) VALUES('saracouto1318@hotmail.com');
INSERT INTO owner(email) VALUES('vascoPereira96@hotmail.com');
INSERT INTO owner(email) VALUES('blanca1973@hotmail.com');
INSERT INTO owner(email) VALUES('phOxford@hotmail.com');
INSERT INTO owner(email) VALUES('joeFergurson@gmail.com');
INSERT INTO owner(email) VALUES('evangeline1234@gmail.com');
INSERT INTO owner(email) VALUES('maryahBBB@hotmail.com');
INSERT INTO owner(email) VALUES('oiGirl@gmail.com');
INSERT INTO owner(email) VALUES('pauloValério65@gmail.com');

INSERT INTO reviewer(email) VALUES('mancinho@gmail.com');
INSERT INTO reviewer(email) VALUES('mary_butterfly@hotmail.com');
INSERT INTO reviewer(email) VALUES('afonsoTeles@hotmail.com');
INSERT INTO reviewer(email) VALUES('emily_moracean@hotmail.com');
INSERT INTO reviewer(email) VALUES('williamf@hotmail.com');
INSERT INTO reviewer(email) VALUES('norio_fukunaga@hotmail.com');
INSERT INTO reviewer(email) VALUES('manuel96@hotmail.com');
INSERT INTO reviewer(email) VALUES('andrewAlves@hotmail.com');
INSERT INTO reviewer(email) VALUES('maryNice@gmail.com');
INSERT INTO reviewer(email) VALUES('andanderson@gmail.com');
INSERT INTO reviewer(email) VALUES('amandaFergurson@gmail.com');
INSERT INTO reviewer(email) VALUES('mixMixMix@hotmail.com');
INSERT INTO reviewer(email) VALUES('emmaBarbosa@gmail.com');

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

INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Um ótimo restaurante, com um bom ambiente e com uma relação qualidade/preço excelente', 'mancinho@gmail.com', 'masterRestaurant@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (2.5, 'Um BOM restaurante, com um bom ambiente, mas com um atendimento um pouco mau', 'mancinho@gmail.com', 'masterRestaurant@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Um ótimo restaurante', 'mancinho@gmail.com', 'ovarenseRestaurante@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Restaurante agradável, com boa comida e bom atendimento', 'mary_butterfly@hotmail.com', 'masterRestaurant@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (3, 'Um restaurante como todos os outros', 'afonsoTeles@hotmail.com', 'masterRestaurant@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (3, 'Um restaurante como todos os outros', 'afonsoTeles@hotmail.com', 'girlPower@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4.5, 'Restaurante maravilhoso!! Conto em lá voltar', 'williamf@hotmail.com', 'bistroEmma@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Um ótimo restaurante, com um bom ambiente', 'norio_fukunaga@hotmail.com', 'ovarenseRestaurante@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (1.5, 'Atendimento péssimo', 'manuel96@hotmail.com', 'evangelineRestaurante@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Restaurante agradável', 'manuel96@hotmail.com', 'blancaKithnet@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (3, 'Nice restaurant', 'maryNice@gmail.com', 'evangelineRestaurante@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4.5, 'Awesome restaurant! I love it!!!', 'maryNice@gmail.com', 'bistroEmma@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Nice quality and prices', 'maryNice@gmail.com', 'valerio@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (2.5, 'Horrible and disgusting', 'amandaFergurson@gmail.com', 'blancaKithnet@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (4, 'Restaurante agradável e com boa comida', 'amandaFergurson@gmail.com', 'blancaKithnet@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (3, 'Um restaurante banal', 'emmaBarbosa@gmail.com', 'restauranteMAugusta@gmail.com');
INSERT INTO review( score, comment, emailReviewer, emailRestaurant)
	VALUES (5, 'Restaurante maravilhoso!', 'emmaBarbosa@gmail.com', 'restauranteMAugusta@gmail.com');

INSERT INTO reply( comment, emailOwner, idReview ) VALUES ('Agradeço a sua avaliação! Volte sempre!', 'maugusta@hotmail.com', 17);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Conto em voltar', 'maugusta@hotmail.com', 16);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Agradeço a sua avaliação... Espero que da próxima as coisas estejam melhores', 'evangeline1234@gmail.com', 9);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Espero que melhore', 'saracouto1318@hotmail.com', 1);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Agradeço a sua avaliação', 'saracouto1318@hotmail.com', 2);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Agradeço a sua avaliação', 'saracouto1318@hotmail.com', 4);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Agradeço a sua avaliação', 'saracouto1318@hotmail.com', 5);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Agradeço a sua avaliação', 'blanca1973@hotmail.com', 10);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Agradeço a sua avaliação', 'blanca1973@hotmail.com', 14);
INSERT INTO reply( comment, emailOwner, idReview  ) VALUES ('Thanks for your evaluation', 'blanca1973@hotmail.com', 15);

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

INSERT INTO menu(detail, email) VALUES ('Carne assada com arroz', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Francesinha', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Caldeirada de Peixe', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Frango de churrasco', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Lasanha', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Palha Italiana', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Macarrão', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Polenta', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Hamburguer com alho', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Hamburguer de novilho', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pizza margarita', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pizza 4 queijos', 'restauranteMAugusta@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Sushi', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Nigiri', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Gigot de Agneau', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Ris de veau', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Escargots', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Lombinhos de porco', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Salada grega', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pizza margarita', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pizza napolitana', 'masterRestaurant@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Hamburguer com alho', 'ovarenseRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Hamburguer especial', 'ovarenseRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Carne assada com arroz', 'ovarenseRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Francesinha', 'ovarenseRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pizza margarita', 'ovarenseRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pizza hawaiana', 'ovarenseRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Paella', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES ('Cocido Madrileño', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Tortilla', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Spaghetti', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Pad Thai', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Curry', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES ( 'Khao man kai', 'blancaKithnet@gmail.com');
INSERT INTO menu(detail, email) VALUES('Pork tenderloin', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES('Greek salad', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES('Rossini', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Pod salad', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Greek salad', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES('Rossini', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES('Pod salad', 'gourmet@gmail.com');
INSERT INTO menu(detail, email) VALUES('Frnacesinha', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES('Lasagna', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Pod salad', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES('Codfish', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Spaghetti', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Sushi', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Huramaki', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Special hamburguer', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Foie Gras', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Fondue', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Pad Thai', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Khao man kai', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES('Greek salad', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES( 'Pizza margarita', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hawaian pizza', '5stars@gmail.com');
INSERT INTO menu(detail, email) VALUES('Carne assada com arroz', 'bistroEmma@gmail.com');
INSERT INTO menu(detail, email) VALUES('Leitão', 'bistroEmma@gmail.com');
INSERT INTO menu(detail, email) VALUES('Foie Gras', 'bistroEmma@gmail.com');
INSERT INTO menu(detail, email) VALUES('Magret de Canard', 'bistroEmma@gmail.com');
INSERT INTO menu(detail, email) VALUES('Foie Gras', 'evangelineRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES('Fondue', 'evangelineRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hamburguer com alho', 'evangelineRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hamburguer especial', 'evangelineRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES('Pizza margarita', 'evangelineRestaurante@gmail.com');
INSERT INTO menu(detail, email) VALUES('Pizza margarita', 'girlPower@gmail.com');
INSERT INTO menu(detail, email) VALUES('Pizza vegan', 'girlPower@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hamburguer de salmão', 'girlPower@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hamburguer especial', 'girlPower@gmail.com');
INSERT INTO menu(detail, email) VALUES('Sushi', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Nigiri', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Sashimi', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hamburguer de salmão', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Hamburguer especial', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Francesinha', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Feijoada', 'valerio@gmail.com');
INSERT INTO menu(detail, email) VALUES('Pizza vegan', 'valerio@gmail.com');

INSERT INTO restaurantHours(email, idHours) VALUES('restauranteMAugusta@gmail.com','masterRestaurant@gmail.com');
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

INSERT INTO photos( path, email) VALUES('images/restauranteMariaAugusta.jpg', 'restauranteMAugusta@gmail.com');
INSERT INTO photos( path, email) VALUES('images/restauranteMariaAugusta2.png', 'restauranteMAugusta@gmail.com');
INSERT INTO photos( path, email) VALUES('images/master.jpg', 'masterRestaurant@gmail.com');
INSERT INTO photos( path, email) VALUES('images/master2.jpg', 'masterRestaurant@gmail.com');
INSERT INTO photos( path, email) VALUES('images/master.jpg', 'masterRestaurant@gmail.com');
INSERT INTO photos( path, email) VALUES('images/ovarense.jpg', 'ovarenseRestaurante@gmail.com');
INSERT INTO photos( path, email) VALUES('images/ovarense2.jpg', 'ovarenseRestaurante@gmail.com');
INSERT INTO photos( path, email) VALUES('images/ovarense3.jpg', 'ovarenseRestaurante@gmail.com');
INSERT INTO photos( path, email) VALUES('images/blanca.jpg', 'blancaKithnet@gmail.com');
INSERT INTO photos( path, email) VALUES('images/blanca2.jpg', 'blancaKithnet@gmail.com');
INSERT INTO photos( path, email) VALUES('images/blanca3.jpg', 'blancaKithnet@gmail.com');
INSERT INTO photos( path, email) VALUES('images/gourmet.jpg', 'gourmet@gmail.com');
INSERT INTO photos( path, email) VALUES('images/gourmet.jpg', 'gourmet@gmail.com');
INSERT INTO photos( path, email) VALUES('images/fergunson.jpg', '5stars@gmail.com');
INSERT INTO photos( path, email) VALUES('images/fergunson2.jpg', '5stars@gmail.com');
INSERT INTO photos( path, email) VALUES('images/bistro.jpg', 'bistroEmma@gmail.com');
INSERT INTO photos( path, email) VALUES('images/evangeline.jpg', 'evangelineRestaurante@gmail.com');
INSERT INTO photos( path, email) VALUES('images/girlPower.jpg', 'girlPower@gmail.com');
INSERT INTO photos( path, email) VALUES('images/valerio.jpg', 'valerio@gmail.com');
