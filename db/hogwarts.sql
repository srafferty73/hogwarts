DROP TABLE hogwarts;
DROP TABLE houses;

CREATE TABLE houses (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  logo_url VARCHAR(255)
);

CREATE TABLE hogwarts (
  id serial4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT4 REFERENCES houses(id),
  age int2
);
