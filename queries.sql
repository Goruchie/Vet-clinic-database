/*Queries that provide answers to the questions from all projects.*/

 SELECT * from animals WHERE name like '%mon';
 SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
 SELECT name from animals WHERE neutered = true and escape_attemps < 3;
 SELECT date_of_birth from animals where name in ('Argumon', 'Pikachu');
 SELECT name, escape_attemps from animals WHERE weight_kg > 10.5;
 SELECT * from animals WHERE neutered = true;
 SELECT * from animals WHERE name not in ('Gabumon');
 SELECT * from animals WHERE weight_kg between 10.3 and 17.4;