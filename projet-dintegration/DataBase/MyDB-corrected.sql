-- I changed the form so it can run on MySQL or MariaDB or PostgreSQL 
--(I'm using MySQL XAMPP)

CREATE TABLE Options (
    `Option` CHAR(55) NOT NULL,
    `Département` CHAR(55) NOT NULL,
    `OptionAraB` CHAR(55) NULL,
    `CodeOption` INT NULL,
    UNIQUE KEY `unique_option_departement` (`Option`, `Département`)
);



--Mohamed Amin Grami

