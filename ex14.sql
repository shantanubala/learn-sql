BEGIN;
ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN phone_number INTEGER;
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;

ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

ALTER TABLE pet ADD COLUMN parent INTEGER;
ALTER TABLE pet ADD COLUMN dob DATETIME;

UPDATE person SET dead = 0 WHERE id = 0;
UPDATE person SET dob = 164566 WHERE id = 0;
UPDATE person SET salary = 10.10 WHERE id = 0;
UPDATE person SET phone_number = 5555555 WHERE id = 0;

UPDATE pet SET parent = 0 WHERE id = 1;
UPDATE pet SET dob = 100 WHERE id = 0;
UPDATE pet SET dob = 1000 WHERE id = 1;

UPDATE person_pet SET purchased_on = 2000 WHERE pet_id = 0;
UPDATE person_pet SET purchased_on = 3000 WHERE pet_id = 1;

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (1, "Shantanu", "Bala", 21, 0, 4802420876, 50000.0, 6111994);
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (2, "Anika", "Larson", 22, 0, 6235559999, 36000.0, 7181993);
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (3, "Bala", "Adiseshan", 55, 0, 6238257671, 100000.0, 6549846);
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (4, "Gayathri", "Bala", 51, 0, 4805595170, 300000.0, 445641);

INSERT INTO pet (id, name, breed, age, dead, parent, dob)
	VALUES (2, "DOG", "dog", 10, 0, 6, 123156);
INSERT INTO pet (id, name, breed, age, dead, parent, dob)
	VALUES (3, "Spot", "dog", 6, 1, 6, 123156);
INSERT INTO pet (id, name, breed, age, dead, parent, dob)
	VALUES (4, "Smokes", "cat", 7, 0, 5, 123156);
INSERT INTO pet (id, name, breed, age, dead, parent, dob)
	VALUES (5, "Darth", "cat", 8, 1, 0, 123156);
INSERT INTO pet (id, name, breed, age, dead, parent, dob)
	VALUES (6, "Lela", "dog", 9, 0, 0, 123156);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (0, 2, 8745465465);
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (1, 3, 8787465465);
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (2, 4, 8798541512);
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (3, 5, 15648941521);
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (4, 6, 98794541365);

SELECT pet.name, person.first_name, person.last_name FROM pet, person, person_pet WHERE
	pet.id = person_pet.pet_id AND
	person_pet.person_id = person.id AND
	person_pet.purchased_on > 8000;

SELECT * FROM pet WHERE parent = 0;
COMMIT;
