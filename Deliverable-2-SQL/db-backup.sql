-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP SCHEMA IF EXISTS `mydb`;
CREATE SCHEMA `mydb`;
USE `mydb`;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `AnimalID` char(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Sex` enum('Male','Female','Other') NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Species` varchar(48) NOT NULL,
  `Breed` varchar(48) NOT NULL,
  `Color` varchar(48) NOT NULL,
  `Distinguishing_Marks` varchar(255) DEFAULT NULL,
  `OwnerID` char(10) NOT NULL,
  PRIMARY KEY (`AnimalID`),
  KEY `fk_Animal_Owner1_idx` (`OwnerID`),
  CONSTRAINT `fk_Animal_Owner1` FOREIGN KEY (`OwnerID`) REFERENCES `Owner` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES ('ABCD001001','Max','Male','2016-02-26','Dog','Maltese','White-Black',NULL,'ABKP190236'),('AQWE003123','Skonitsa','Female','2020-08-10','Cat','Domestic\nLong Hair','Grey','Bald spot on left shoulder','APNW121314'),('ASDF002002','Sohrab','Male','2017-11-20','Dog','GSD','Black and Tan','Missing tail','ANZQ365422'),('JBBA987390','Black Jack','Male','2019-04-20','Dog','Groenendael','Black',NULL,'JBBA987390'),('KCUT679675','Calypso','Female','2025-01-22','Cat','Domestic Short Hair','Tortoiseshell','One blue and one green eye','GHAH675652');
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Antiparasitic_Treatments`
--

DROP TABLE IF EXISTS `Antiparasitic_Treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Antiparasitic_Treatments` (
  `Name` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Parasite_Type` varchar(40) NOT NULL,
  `Substance` varchar(40) NOT NULL,
  `Brand` varchar(40) NOT NULL,
  `Dosage` varchar(40) NOT NULL,
  `Vet_Signature` char(10) NOT NULL,
  `AnimalID` char(10) NOT NULL,
  PRIMARY KEY (`Name`,`Date`,`Vet_Signature`,`AnimalID`),
  KEY `Vet_Signature_idx` (`Vet_Signature`),
  KEY `fk_Antiparasitic_Treatments_Animal1_idx` (`AnimalID`),
  CONSTRAINT `AnimalID` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `Vet_Signature` FOREIGN KEY (`Vet_Signature`) REFERENCES `Veterinarian` (`Signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Antiparasitic_Treatments`
--

LOCK TABLES `Antiparasitic_Treatments` WRITE;
/*!40000 ALTER TABLE `Antiparasitic_Treatments` DISABLE KEYS */;
INSERT INTO `Antiparasitic_Treatments` VALUES ('Flucin','2020-09-20','Balamuthia mandrillaris','Flucytosine','Para','1pill/day (morning)','LSOW028520','ABCD001001'),('Mrci','2025-10-02','Cryptosporidium','Maricious','Pfizer','5mg','FGHJ463189','JBBA987390'),('Purma','2009-11-29','Toxoplasma gondii','Pyrimethamine','Bayer','20mg','SFGU469368','KCUT679675'),('Smert','1990-09-30','Cyclospora cayetanensis','TMP-SMX','Bayer','10mg','BAKF763426','AQWE003123'),('Trimio','2019-04-25','Giardia','Trilium','General','15ml/day (noon)','VETS021523','ASDF002002');
/*!40000 ALTER TABLE `Antiparasitic_Treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clinic`
--

DROP TABLE IF EXISTS `Clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clinic` (
  `TaxID` char(10) NOT NULL,
  `Name` varchar(48) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Address` varchar(48) NOT NULL,
  `Phone_Number` varchar(16) NOT NULL,
  `Legal_Form` enum('A.E.','E.P.E.','I.K.E.','O.E.','E.E.','ATOMIKI','ASTIKI','AFANIS','SYNAITERISMOS','KOINOPRAKSIA','DIMOSIA') NOT NULL,
  `NACE_Code` char(6) NOT NULL,
  PRIMARY KEY (`TaxID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clinic`
--

LOCK TABLES `Clinic` WRITE;
/*!40000 ALTER TABLE `Clinic` DISABLE KEYS */;
INSERT INTO `Clinic` VALUES ('ALWP942048','Vet AUTH','pathologiakzs@gmail.com','Thessaloniki','2310994403','DIMOSIA','A21.21'),('CSOR930285','Central Vet Clinic','centralvet@gmail.com','Thessaloniki','2132897561','O.E.','A20.20'),('RTJK127880','Healthy Friends','general@healthyfriends.com','Athens','2346709467','O.E.','A89.09'),('SDGB329436','Medivet','medivet@otenet.gr','Ioannina','2365417890','O.E.','A67.54'),('SKGR786943','AniCura','anicura@vetlabs.com','Serres','2346854178','O.E.','A65.98');
/*!40000 ALTER TABLE `Clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnostic_Tests`
--

DROP TABLE IF EXISTS `Diagnostic_Tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Diagnostic_Tests` (
  `Date` date NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Brand` varchar(40) NOT NULL,
  `Result` enum('Negative','Positive','Inconclusive') NOT NULL,
  `AnimalID` char(10) NOT NULL,
  PRIMARY KEY (`Date`,`Name`,`AnimalID`),
  KEY `fk_Diagnostic_Tests_Animal1_idx` (`AnimalID`),
  CONSTRAINT `fk_Diagnostic_Tests_Animal1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnostic_Tests`
--

LOCK TABLES `Diagnostic_Tests` WRITE;
/*!40000 ALTER TABLE `Diagnostic_Tests` DISABLE KEYS */;
INSERT INTO `Diagnostic_Tests` VALUES ('1990-09-30','Test FIV-FELV','Witness','Negative','AQWE003123'),('2009-11-29','Test XYZ','Zoetis','Negative','KCUT679675'),('2019-04-25','Test 4DX','Pfizer','Positive','ASDF002002'),('2020-09-20','Test Leish','Megacor','Negative','ABCD001001'),('2025-10-02','Test Leucocat','Zoetis','Inconclusive','JBBA987390');
/*!40000 ALTER TABLE `Diagnostic_Tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Other_Treatments`
--

DROP TABLE IF EXISTS `Other_Treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Other_Treatments` (
  `Start_Date` date NOT NULL,
  `Substance` varchar(40) NOT NULL,
  `Dosage` varchar(40) NOT NULL,
  `Disease` varchar(40) NOT NULL,
  `End_Date` date DEFAULT NULL,
  `AnimalID` char(10) NOT NULL,
  `Vet_Signature` char(10) NOT NULL,
  PRIMARY KEY (`Start_Date`,`Substance`,`AnimalID`,`Vet_Signature`),
  KEY `fk_Other_Treatments_Animal1_idx` (`AnimalID`),
  KEY `fk_Other_Treatments_Veterinarian1_idx` (`Vet_Signature`),
  CONSTRAINT `fk_Other_Treatments_Animal1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `fk_Other_Treatments_Veterinarian1` FOREIGN KEY (`Vet_Signature`) REFERENCES `Veterinarian` (`Signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Other_Treatments`
--

LOCK TABLES `Other_Treatments` WRITE;
/*!40000 ALTER TABLE `Other_Treatments` DISABLE KEYS */;
INSERT INTO `Other_Treatments` VALUES ('1990-09-30','Amoxicillin','300mg/day','Bacterial Infection','1990-10-10','AQWE003123','BAKF763426'),('2009-11-29','Clindamycin','125mg/day','Fungal Infection','2009-12-29','KCUT679675','SFGU469368'),('2019-04-25','Domperidone','10ml/day','Leishmaniasis','2019-05-25','ASDF002002','VETS021523'),('2020-09-20','Allopurinol','100mg/day','Leishmaniasis',NULL,'ABCD001001','LSOW028520'),('2025-10-02','Hyaluronic Acid','200mg/day','Arthritis','2025-11-02','JBBA987390','FGHJ463189');
/*!40000 ALTER TABLE `Other_Treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owner`
--

DROP TABLE IF EXISTS `Owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Owner` (
  `OwnerID` char(10) NOT NULL,
  `Name` varchar(48) NOT NULL,
  `Address` varchar(48) NOT NULL,
  `Phone_Number` varchar(16) NOT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owner`
--

LOCK TABLES `Owner` WRITE;
/*!40000 ALTER TABLE `Owner` DISABLE KEYS */;
INSERT INTO `Owner` VALUES ('ABKP190236','George Papas','Thessaloniki','6995120036'),('ANZQ365422','Ioanna Papadopoulou','Athens','6978234560'),('APNW121314','Tasos Galazios','Loutron 12, Serres','6987230510'),('GHAH675652','Maria Eleutheriou','Parodos Laxana 8A, Kozani','6979578423'),('JBBA987390','Thomas Ghidrakis','Georgikis Sxolis 68, Thermi','6987120335');
/*!40000 ALTER TABLE `Owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Surgeries`
--

DROP TABLE IF EXISTS `Surgeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Surgeries` (
  `Date` date NOT NULL,
  `Operation` varchar(40) NOT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `Vet_Signature` char(10) NOT NULL,
  `AnimalID` char(10) NOT NULL,
  PRIMARY KEY (`Vet_Signature`,`AnimalID`,`Date`,`Operation`),
  KEY `fk_Surgeries_Animal1_idx` (`AnimalID`),
  CONSTRAINT `fk_Surgeries_Animal1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `fk_Surgeries_Veterinarian1` FOREIGN KEY (`Vet_Signature`) REFERENCES `Veterinarian` (`Signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Surgeries`
--

LOCK TABLES `Surgeries` WRITE;
/*!40000 ALTER TABLE `Surgeries` DISABLE KEYS */;
INSERT INTO `Surgeries` VALUES ('1990-09-30','Broken Right Leg','Cross-Fracture. Added restrainers. Will heal soon.','BAKF763426','AQWE003123'),('2025-10-02','Septum','Improvement over 90%.','FGHJ463189','JBBA987390'),('2020-09-20','Tumor Extraction','Went well. Removed 10g of tumor.','LSOW028520','ABCD001001'),('2009-11-29','Sterilization',NULL,'SFGU469368','KCUT679675'),('2010-10-29','Stitches','Very minor injury','SFGU469368','KCUT679675'),('2019-04-25','Heart Valve Replacement','Had to break 2 ribs. Full recovery in 2months.','VETS021523','ASDF002002');
/*!40000 ALTER TABLE `Surgeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veterinarian`
--

DROP TABLE IF EXISTS `Veterinarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veterinarian` (
  `Signature` char(10) NOT NULL,
  `Name` varchar(48) NOT NULL,
  `Phone_Number` varchar(16) NOT NULL,
  `Address` varchar(48) NOT NULL,
  `Specialty` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`Signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veterinarian`
--

LOCK TABLES `Veterinarian` WRITE;
/*!40000 ALTER TABLE `Veterinarian` DISABLE KEYS */;
INSERT INTO `Veterinarian` VALUES ('BAKF763426','Dr. Vakiani Foteini','2394028976','Lagadas Thessalonikis','Emergency Vet'),('FGHJ463189','Dr Kotanidis Georgios','2310468054','Thessaloniki','General'),('LSOW028520','Dr. Sotiriou A.','2310554321','Thessaloniki','Surgery'),('SFGU469368','Dr Adamantios Ioannis','2310260162','Athens','Dentist'),('VETS021523','Dr. Manou X.','2103344556','Athens','General');
/*!40000 ALTER TABLE `Veterinarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veterinarian_vaccinates_Animal`
--

DROP TABLE IF EXISTS `Veterinarian_vaccinates_Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veterinarian_vaccinates_Animal` (
  `AnimalID` char(10) NOT NULL,
  `Vet_Signature` char(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Brand` varchar(40) NOT NULL,
  `Batch_No` int NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Date` date NOT NULL,
  `Valid_Until` date NOT NULL,
  PRIMARY KEY (`AnimalID`,`Vet_Signature`,`Name`,`Date`),
  KEY `fk_Animal_has_Veterinarian_Veterinarian1_idx` (`Vet_Signature`),
  KEY `fk_Animal_has_Veterinarian_Animal1_idx` (`AnimalID`),
  CONSTRAINT `fk_Animal_has_Veterinarian_Animal1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `fk_Animal_has_Veterinarian_Veterinarian1` FOREIGN KEY (`Vet_Signature`) REFERENCES `Veterinarian` (`Signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veterinarian_vaccinates_Animal`
--

LOCK TABLES `Veterinarian_vaccinates_Animal` WRITE;
/*!40000 ALTER TABLE `Veterinarian_vaccinates_Animal` DISABLE KEYS */;
INSERT INTO `Veterinarian_vaccinates_Animal` VALUES ('ABCD001001','LSOW028520','Botulio','Vaccio',42311289,'2020-11-20','2020-10-20','2030-10-20'),('AQWE003123','BAKF763426','Vanguard CPV-Lepto','Pfizer',42537,'2026-09-13','2023-09-28','2024-09-28'),('ASDF002002','VETS021523','VanguardvDA2Pi','Pfizer',33207,'2025-10-26','2023-09-28','2024-09-28'),('JBBA987390','FGHJ463189','Versiguard Rabies','Zoetis',16522501,'2026-02-25','2024-09-28','2025-09-28'),('KCUT679675','SFGU469368','VanguardvDA2Pi','Zoetis',293314,'2026-09-28','2024-09-28','2025-09-28'),('KCUT679675','SFGU469368','VanguardvDA2Pi2','Zoetis',293314,'2026-09-28','2024-09-28','2025-12-28');
/*!40000 ALTER TABLE `Veterinarian_vaccinates_Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veterinarian_works_at_Clinic`
--

DROP TABLE IF EXISTS `Veterinarian_works_at_Clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veterinarian_works_at_Clinic` (
  `VetID` char(10) NOT NULL,
  `ClinicID` char(10) NOT NULL,
  `Weekly_Hours` int NOT NULL,
  PRIMARY KEY (`VetID`,`ClinicID`),
  KEY `fk_Veterinarian_has_Clinic_Clinic1_idx` (`ClinicID`),
  KEY `fk_Veterinarian_has_Clinic_Veterinarian1_idx` (`VetID`),
  CONSTRAINT `fk_Veterinarian_has_Clinic_Clinic1` FOREIGN KEY (`ClinicID`) REFERENCES `Clinic` (`TaxID`),
  CONSTRAINT `fk_Veterinarian_has_Clinic_Veterinarian1` FOREIGN KEY (`VetID`) REFERENCES `Veterinarian` (`Signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veterinarian_works_at_Clinic`
--

LOCK TABLES `Veterinarian_works_at_Clinic` WRITE;
/*!40000 ALTER TABLE `Veterinarian_works_at_Clinic` DISABLE KEYS */;
INSERT INTO `Veterinarian_works_at_Clinic` VALUES ('BAKF763426','RTJK127880',40),('LSOW028520','CSOR930285',30),('LSOW028520','SDGB329436',10),('VETS021523','ALWP942048',20),('VETS021523','SKGR786943',20);
/*!40000 ALTER TABLE `Veterinarian_works_at_Clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `need_to_vaccinate`
--

DROP TABLE IF EXISTS `need_to_vaccinate`;
/*!50001 DROP VIEW IF EXISTS `need_to_vaccinate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `need_to_vaccinate` AS SELECT 
 1 AS `AnimalID`,
 1 AS `Animal_Name`,
 1 AS `OwnerID`,
 1 AS `Owner_Name`,
 1 AS `Phone_Number`,
 1 AS `Name`,
 1 AS `Valid_Until`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `owners_and_animals`
--

DROP TABLE IF EXISTS `owners_and_animals`;
/*!50001 DROP VIEW IF EXISTS `owners_and_animals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `owners_and_animals` AS SELECT 
 1 AS `OwnerID`,
 1 AS `Owner_Name`,
 1 AS `Phone_Number`,
 1 AS `Animal_Name`,
 1 AS `Species`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `need_to_vaccinate`
--

/*!50001 DROP VIEW IF EXISTS `need_to_vaccinate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `need_to_vaccinate` AS select `Animal`.`AnimalID` AS `AnimalID`,`Animal`.`Name` AS `Animal_Name`,`Owner`.`OwnerID` AS `OwnerID`,`Owner`.`Name` AS `Owner_Name`,`Owner`.`Phone_Number` AS `Phone_Number`,`Veterinarian_vaccinates_Animal`.`Name` AS `Name`,`Veterinarian_vaccinates_Animal`.`Valid_Until` AS `Valid_Until` from ((`Veterinarian_vaccinates_Animal` join `Animal` on((`Veterinarian_vaccinates_Animal`.`AnimalID` = `Animal`.`AnimalID`))) join `Owner` on((`Animal`.`OwnerID` = `Owner`.`OwnerID`))) where (`Veterinarian_vaccinates_Animal`.`Valid_Until` between (curdate() - interval 30 day) and (curdate() + interval 30 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `owners_and_animals`
--

/*!50001 DROP VIEW IF EXISTS `owners_and_animals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `owners_and_animals` AS select `Owner`.`OwnerID` AS `OwnerID`,`Owner`.`Name` AS `Owner_Name`,`Owner`.`Phone_Number` AS `Phone_Number`,`Animal`.`Name` AS `Animal_Name`,`Animal`.`Species` AS `Species` from (`Owner` join `Animal` on((`Owner`.`OwnerID` = `Animal`.`OwnerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-19 14:58:17
