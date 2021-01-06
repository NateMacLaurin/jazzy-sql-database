CREATE TABLE "artist" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(80) not null,
    "birthdate" date
);

CREATE TABLE "song" (
	"id" SERIAL PRIMARY KEY,
	"title" varchar(255) not null,
	"length" varchar(10),
	"released" date
);

SELECT * FROM "artist";
SELECT * FROM "song";

INSERT INTO "artist" ("id", "name", "birthdate")
VALUES(DEFAULT, 'Ella Fitzgerald', '04-25-1917'),
      (DEFAULT, 'Dave Brubeck', '12-06-1920'),
      (DEFAULT, 'Miles Davis', '05-26-1926'),
      (DEFAULT, 'Esperanza Spalding', '10-18-1984');
	  
INSERT INTO "song" ("id", "title", "length", "released")
VALUES(DEFAULT, 'Take Five', '5:24', '1959-09-29'),
      (DEFAULT, 'So What', '9:22', '1959-08-17'),
      (DEFAULT, 'Black Gold', '5:17', '2012-02-01');

--artist GET query
SELECT * FROM "artist" ORDER BY "birthdate" DESC;

--artist POST query
INSERT INTO "artist" ("name", "birthdate")
VALUES ($1, $2);

--song GET query
SELECT * FROM "song" ORDER BY "title" ASC;

--song POST query
INSERT INTO "song" ("title", "length", "released")
VALUES ($1, $2, $3);