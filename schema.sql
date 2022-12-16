/* Project - create animals table. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

/* Project - query and update animals table */

ALTER TABLE animals ADD species varchar;

/* Project - multiple tables and primary key & foreign key */

CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(50), age INT, PRIMARY KEY(id));
CREATE TABLE species(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(50), PRIMARY KEY(id));
\d animals
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT CONSTRAINT species_fk REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT CONSTRAINT owner_fk REFERENCES owners (id);

/* Project - add join tables */

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    PRIMARY KEY(species_id, vet_id)
);

CREATE TABLE visits(
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    PRIMARY KEY(animal_id, vet_id, visit_date)
);