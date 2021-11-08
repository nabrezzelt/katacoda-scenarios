DROP TABLE IF EXISTS "persons";

CREATE TABLE "persons" (
  id SERIAL PRIMARY KEY,
  name varchar(255) default NULL,  
  ZipCode int default NULL
);

INSERT INTO persons (name, ZipCode)
VALUES
  ('Hans Wurst',12790),
  ('Hans Dampf',58183),
  ('Karl Napf',844168);
