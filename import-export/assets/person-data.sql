CREATE DATABASE "sample";

\c sample

DROP TABLE IF EXISTS "persons";

CREATE TABLE "persons" (
  id SERIAL PRIMARY KEY,
  name varchar(255) default NULL,  
  ZipCode int default NULL
);

INSERT INTO persons (name, ZipCode)
VALUES
  ('Hans Wurst;',60437),
  ('Hans Dampf',10117),
  ('Karl Napf',60439);
