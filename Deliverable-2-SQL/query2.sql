-- π(AnimalID  (σDate=2025-11-12(VACCINATES) UNION σDate=2025-11-12(DIAGNOSTIC_TESTS) )

SELECT AnimalID
FROM Veterinarian_vaccinates_Animal
WHERE Date = '2024-09-28'
UNION
SELECT AnimalID
FROM Diagnostic_Tests
WHERE Date = '2024-09-28';
