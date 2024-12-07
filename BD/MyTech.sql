CREATE DATABASE MyTechDB;
USE MyTechdb;

CREATE TABLE shipment (
    id_shipment INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(250),
    tracking_number VARCHAR(100),
    status VARCHAR(45),
    shipping_date DATE,
    estimated_delivery_date DATE
);
SELECT * FROM shipment;

CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(250),
    email VARCHAR(100),
    phone_number VARCHAR(45),
    rol VARCHAR(45)
);
SELECT * FROM user;

CREATE TABLE message (
    id_message INT PRIMARY KEY AUTO_INCREMENT,
    comment VARCHAR(100),
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES user(id_user)
);
SELECT * FROM message;

CREATE TABLE card (
    id_card INT PRIMARY KEY AUTO_INCREMENT,
    name_card VARCHAR(100),
    number_card BIGINT,
    cvv INT,
    expiration_date DATE,
    user_id_user INT,
    FOREIGN KEY (user_id_user) REFERENCES user(id_user)
);
SELECT * FROM card;

CREATE TABLE products (
    id_products INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(45),
    url_image VARCHAR(250),
    price INT,
    `condition` VARCHAR(45),
    color VARCHAR(45),
    description VARCHAR(250),
    user_id_user INT,
    FOREIGN KEY (user_id_user) REFERENCES user(id_user)
);
SELECT * FROM products;

CREATE TABLE `order` (
    id_order INT PRIMARY KEY AUTO_INCREMENT,
    amount INT,
    subtotal INT,
    total INT,
    date_creation DATE,
    user_card_id_card INT,
    user_id_user INT,
    products_id_products INT,
    shipment_id_shipment INT,
    FOREIGN KEY (user_card_id_card) REFERENCES card(id_card),
    FOREIGN KEY (user_id_user) REFERENCES user(id_user),
    FOREIGN KEY (products_id_products) REFERENCES products(id_products),
    FOREIGN KEY (shipment_id_shipment) REFERENCES shipment(id_shipment)
);
