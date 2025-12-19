-- π(Animal.Name,Species,Color,Owner.Name( σ(OwnerID=AZ190236(OWNER) JOIN (ANIMAL) )

SELECT Animal.Name AS Animal_Name, Animal.Species , Animal.Color, Owner.Name AS Owner_Name
FROM Owner
    JOIN Animal ON Owner.OwnerID = Animal.OwnerID
WHERE Owner.OwnerID = 'ANZQ365422';
