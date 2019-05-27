create database wordpress;
CREATE USER 'wpdbuser'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL ON wordpress.* TO 'worpress'@'localhost' IDENTIFIED BY 'admin123' WITH GRANT OPTION;
