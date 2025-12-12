CREATE TABLE IF NOT EXISTS Media_Type
(
  id SERIAL PRIMARY KEY,
  type varchar(45) NOT NULL,
  file_extension varchar(10)
);

INSERT INTO Media_Type( id, type ) VALUES (0,'No File');
INSERT INTO Media_Type( type, file_extension ) VALUES ('MP3','mp3');
INSERT INTO Media_Type( type, file_extension ) VALUES ('OGG','ogg');
INSERT INTO Media_Type( type, file_extension ) VALUES ('Flac','flac');
INSERT INTO Media_Type( type, file_extension ) VALUES ('WAV','wav');
INSERT INTO Media_Type( type, file_extension ) VALUES ('mp4','mp4');

CREATE TABLE IF NOT EXISTS Artist
(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL,
  rating int,
  otf_rating int,
  youtube_id varchar(500),
  navidrome_id varchar(500)
);

INSERT INTO Artist( id, name, rating, otf_rating ) VALUES (0,'No Artist',0,0);

CREATE TABLE IF NOT EXISTS Album
(
  id SERIAL PRIMARY KEY,
  name varchar(200) NOT NULL,
  artist_id int NOT NULL REFERENCES artist(id),
  release_date date,
  release_year int,
  number_of_disks int,
  track_count int,
  rating int,
  otf_rating int,
  youtube_id varchar(500),
  navidrome_id varchar(500)
);

INSERT INTO Album( id, name, artist_id, rating, otf_rating ) 
  VALUES
  (0,'No Album',0,0,0);

CREATE TABLE IF NOT EXISTS Song
(
  id SERIAL PRIMARY KEY,
  title varchar(2000) NOT NULL,
  comment varchar(30000),
  song varchar(2000),
  year int,
  release_date date,
  track_number int,
  arranger varchar(200),
  bpm int,
  rating int,
  otf_rating int,
  duration int,
  disk_number int,
  score int,
  lyrics varchar(30000),
  youtube_id varchar(500),
  youtube_like_status varchar(20),
  navidrome_id varchar(500),
  filename varchar(500),
  artist_id int NOT NULL REFERENCES artist(id),
  album_id int REFERENCES album(id),
  media_type_id int4 NOT NULL REFERENCES media_type(id)
);