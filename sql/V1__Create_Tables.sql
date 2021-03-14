CREATE TABLE IF NOT EXISTS medialib.Media_Type
(
  id SERIAL PRIMARY KEY,
  type varchar(45) NOT NULL,
  file_extension varchar(10)
);

INSERT INTO medialib.Media_Type( id, type ) VALUES (0,'No File');
INSERT INTO medialib.Media_Type( type, file_extension ) VALUES ('MP3','mp3');
INSERT INTO medialib.Media_Type( type, file_extension ) VALUES ('OGG','ogg');

CREATE TABLE IF NOT EXISTS medialib.Artist
(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL,
  rating int,
  youtube_id varchar(500)
);

INSERT INTO medialib.Artist( id, name, rating ) VALUES (0,'No Artist',0);


CREATE TABLE IF NOT EXISTS medialib.Album
(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL,
  artist_id int NOT NULL REFERENCES medialib.artist(id),
  release_date date,
  release_year int,
  number_of_disks int,
  track_count int,
  rating int,
  youtube_id varchar(500)
);

INSERT INTO medialib.Album( id, name, artist_id, rating ) 
  VALUES
  (0,'No Album',0,0);

CREATE TABLE IF NOT EXISTS medialib.Song
(
  id SERIAL PRIMARY KEY,
  title varchar(200) NOT NULL,
  comment varchar(200),
  song varchar(200),
  year int,
  release_date date,
  track_number int,
  arranger varchar(200),
  bpm int,
  rating int,
  duration int,
  disk_number int,
  score int,
  youtube_id varchar(500),
  filename varchar(500) NOT NULL,
  artist_id int NOT NULL REFERENCES medialib.artist(id),
  album_id int REFERENCES medialib.album(id),
  media_type_id int4 NOT NULL REFERENCES medialib.media_type(id)
);