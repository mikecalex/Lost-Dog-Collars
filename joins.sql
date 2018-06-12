
#Collars for which we can identify an owner

SELECT lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

#Collars for which we cannot identify an owner

SELECT DISTINCT lost_dog_collars.dog_name FROM lost_dog_collars
WHERE NOT EXISTS (SELECT * FROM dog_owners
                  WHERE dog_owners.dog_name = lost_dog_collars.dog_name);

#See all collars with owner if one matches

SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM dog_owners
  FULL OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name) WHERE lost_dog_collars.dog_name IS NOT NULL;

#See all owners, with collars in lost and found, if one matches

SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  FULL OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name) WHERE dog_owners.name IS NOT NULL;
