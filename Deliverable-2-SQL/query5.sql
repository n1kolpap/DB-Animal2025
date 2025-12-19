-- π(AnimalID (σSpecies=Dog(ANIMAL) INTERSECTION σColor=Black(ANIMAL))
-- It was brown originally, but we don't have brown dog

SELECT AnimalID
FROM Animal
WHERE Color = 'Black';
