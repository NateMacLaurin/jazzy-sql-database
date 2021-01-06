--Create 2 tables as defined in the ERC
CREATE TABLE "artist" (
    "id" SERIAL PRIMARY KEY,
    "artist_name" varchar(80) not null,
    "year_born" date
);

CREATE TABLE "song" (
	"id" SERIAL PRIMARY KEY,
	"title" varchar(255) not null,
	"length" varchar(10),
	"released" date
);

--Added test selectors
SELECT * FROM "artist";
SELECT * FROM "song";

--Add static data from server.js
INSERT INTO "artist" ("id", "artist_name", "year_born")
VALUES(DEFAULT, 'Ella Fitzgerald', '04-25-1917'),
      (DEFAULT, 'Dave Brubeck', '12-06-1920'),
      (DEFAULT, 'Miles Davis', '05-26-1926'),
      (DEFAULT, 'Esperanza Spalding', '10-18-1984');
	  
INSERT INTO "song" ("id", "title", "length", "released")
VALUES(DEFAULT, 'Take Five', '5:24', '1959-09-29'),
      (DEFAULT, 'So What', '9:22', '1959-08-17'),
      (DEFAULT, 'Black Gold', '5:17', '2012-02-01');