-- Create users
DROP USER IF EXISTS 'adminAnimalDB'@'%';
DROP USER IF EXISTS 'ownerAnimalDB'@'%';
DROP USER IF EXISTS 'veterinarianAnimalDB'@'%';
CREATE USER 'adminAnimalDB'@'%' IDENTIFIED BY 'adminpassword';
CREATE USER 'ownerAnimalDB'@'%' IDENTIFIED BY 'ownerpassword';
CREATE USER 'veterinarianAnimalDB'@'%' IDENTIFIED BY 'vetpassword';

-- adminAnimalDB
GRANT ALL PRIVILEGES ON mydb.* TO 'adminAnimalDB'@'%';

-- ownerAnimalDB/simple user
GRANT SELECT ON mydb.* TO 'ownerAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Owner TO 'ownerAnimalDB'@'%';

-- veterinarianAnimalDB/doctor
GRANT SELECT ON mydb.* TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Veterinarian TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Surgeries TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Antiparasitic_Treatments TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Other_Treatments TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Veterinarian_works_at_Clinic TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Veterinarian_vaccinates_Animal TO 'veterinarianAnimalDB'@'%';
GRANT INSERT, UPDATE ON mydb.Diagnostic_Tests TO 'veterinarianAnimalDB'@'%';
