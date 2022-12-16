/*Queries that provide answers to the questions from all projects.*/

 SELECT * from animals WHERE name like '%mon';
 SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
 SELECT name from animals WHERE neutered = true and escape_attemps < 3;
 SELECT date_of_birth from animals where name in ('Argumon', 'Pikachu');
 SELECT name, escape_attemps from animals WHERE weight_kg > 10.5;
 SELECT * from animals WHERE neutered = true;
 SELECT * from animals WHERE name not in ('Gabumon');
 SELECT * from animals WHERE weight_kg between 10.3 and 17.4;

 BEGIN;
 UPDATE animals SET species = 'unspecified';
 ROLLBACK;
 BEGIN;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
 COMMIT;
 BEGIN;
 TRUNCATE table animals;
 ROLLBACK;
 BEGIN;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT s1;
 UPDATE animals SET weight_kg = (weight_kg * -1);
 ROLLBACK to s1;
 UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
 COMMIT;

 SELECT COUNT(*) FROM animals;
 SELECT COUNT(*) FROM animals WHERE escape_attemps = 0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT name, escape_attemps FROM animals WHERE escape_attemps = (SELECT MAX(escape_attemps) FROM animals);
 SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;
 SELECT species, AVG(escape_attemps) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-12-31' GROUP BY species;

/* Project - query multiple tables */

SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT a.name FROM animals a JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';
SELECT o.full_name, a.name FROM owners o LEFT JOIN animals a ON o.id = a.owner_id;
SELECT count(*), s.name FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id JOIN species s ON a.species_id = s.id WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';
SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id WHERE a.escape_attempts = 0 AND o.full_name = 'Dean Winchester';
SELECT combined.full_name FROM (SELECT o.full_name, COUNT (a.name) AS animal_number FROM owners o LEFT JOIN animals a ON o.id = a.owner_id GROUP BY o.full_name) AS combined WHERE combined.animal_number = (        SELECT MAX (animal_number)
        FROM (
                SELECT o.full_name,
                COUNT (a.name) AS animal_number
                FROM owners o
                LEFT JOIN animals a ON o.id = a.owner_id
                GROUP BY o.full_name
              ) AS xx
);