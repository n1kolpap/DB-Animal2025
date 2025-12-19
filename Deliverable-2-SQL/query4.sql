-- π(Veterinarian.Name,Specialty  (σClinicID=CSOR930285(WORKS_AT) JOIN VETERINARIAN)

SELECT Veterinarian.Name,Veterinarian.Specialty
FROM Veterinarian JOIN Veterinarian_works_at_Clinic ON Veterinarian.Signature = Veterinarian_works_at_Clinic.VetID
WHERE Veterinarian_works_at_Clinic.ClinicID = 'CSOR930285';
