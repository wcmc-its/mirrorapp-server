

CREATE TABLE "buildings" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"campus_id" INTEGER,
"name"
);
INSERT INTO "buildings" VALUES (1, 1, 'Rider Building');


CREATE TABLE "campuses" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"name" TEXT,
"weight" INTEGER DEFAULT 0
);
INSERT INTO "campuses" VALUES (1, 'University Park', -1);
INSERT INTO "campuses" VALUES (2, 'Other campus', 0);


CREATE TABLE "devices" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"room_id" INTEGER,
"name" TEXT,
"model" TEXT DEFAULT 'AppleTV3,2',
"host" TEXT
);
INSERT INTO "devices" VALUES (1, 1, 'UP Rider 202K', 'AppleTV3,2', 'appletv.dns.example.com');


CREATE TABLE "rooms" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"building_id" INTEGER,
"name" TEXT
);
INSERT INTO "rooms" VALUES (1, 1, '202K');
