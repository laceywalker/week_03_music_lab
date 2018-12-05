DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT2
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  name_of_album VARCHAR(255),
  year_released INT2
  artist_id INT4 REFERENCES artists(id)
);
