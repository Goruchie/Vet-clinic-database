/* Project - create animals table. */

INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Devimon', '2017-05-12', 5, true, 11);

/* Project - query and update animals table */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Ditto', '2022-05-14', 4, true, 22);

/* Project - multiple tables */

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name)
VALUES ('Pokemon');
INSERT INTO species (name)
VALUES ('Digimon');
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
    )
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Pokemon'
    )
WHERE name NOT LIKE '%mon';
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Sam Smith'
    )
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Jennifer Orwell'
    )
WHERE name in ('Gabumon', 'Pikachu');
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
WHERE name in ('Devimon', 'Plantmon');
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Melody Pond'
    )
WHERE name in ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Dean Winchester'
    )
WHERE name in ('Angemon', 'Boarmon');

/* Project - add join tables */
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, 'Jun 8, 2008');
INSERT INTO specializations (species_id, vet_id)
VALUES (
        (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        )
    );
INSERT INTO specializations (species_id, vet_id)
VALUES (
        (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    (
        (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    );
INSERT INTO specializations (species_id, vet_id)
VALUES (
        (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        )
    );
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        'May 24, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        'Jul 22, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Gabumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        'Feb 2, 2021'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Jan 5, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Mar 8, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'May 14, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Devimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        'May 4, 2021'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Charmander'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        'Feb 24, 2021'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Dec 21, 2019'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        'Aug 10, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Apr 7, 2021'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Squirtle'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        'Sep 29, 2019'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        'Oct 3, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        'Nov 4, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Jan 24, 2019'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'May 15, 2019'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Feb 27, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        'Aug 3, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        'May 24, 2020'
    ),
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        'Jan 11, 2021'
    );