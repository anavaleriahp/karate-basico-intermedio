CREATE DATABASE IF NOT EXISTS karate_training;

CREATE USER IF NOT EXISTS 'karate_user'@'localhost' IDENTIFIED BY 'karate_pass';
GRANT SELECT ON karate_training.* TO 'karate_user'@'localhost';

USE karate_training;

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY,
    sku VARCHAR(40) NOT NULL,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(80) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    active BOOLEAN NOT NULL
);

INSERT INTO products (id, sku, name, category, price, stock, active)
VALUES (25, 'KARATE-025', 'Teclado mecánico', 'Accesorios', 79.90, 12, TRUE)
ON DUPLICATE KEY UPDATE
    sku = VALUES(sku),
    name = VALUES(name),
    category = VALUES(category),
    price = VALUES(price),
    stock = VALUES(stock),
    active = VALUES(active);
