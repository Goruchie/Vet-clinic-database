/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name varchar(100),
    date_of_birth date,
    escape_attemps INT,
    neutered boolean,
    weight_kg decimal
);
