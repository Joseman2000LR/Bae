DROP TABLE IF EXISTS DESARROLLADORA;

CREATE TABLE IF NOT EXISTS DESARROLLADORA (
    ID INTEGER PRIMARY KEY,
    NOMBRE TEXT
);

DROP TABLE IF EXISTS VIDEOJUEGO;

CREATE TABLE IF NOT EXISTS VIDEOJUEGO (
    CODIGO INTEGER PRIMARY KEY,
    TITULO TEXT,
    DESARROLLADORA_ID INTEGER,
    PLATAFORMA TEXT,
    PRECIO REAL,
    FOREIGN KEY (DESARROLLADORA_ID) REFERENCES DESARROLLADORA(ID)
);

INSERT INTO DESARROLLADORA (
    NOMBRE
) VALUES (
    'Nintendo'
),
(
    'Rockstar Games'
),
(
    'Naughty Dog'
),
(
    'Blizzard Entertainment'
),
(
    'CD Projekt Red'
),
(
    'Ubisoft'
),
(
    'Electronic Arts'
),
(
    'Square Enix'
),
(
    'Bethesda Softworks'
),
(
    'Capcom'
);

INSERT INTO VIDEOJUEGO (
    TITULO,
    DESARROLLADORA_ID,
    PLATAFORMA,
    PRECIO
) VALUES (
    'The Legend of Zelda: Breath of the Wild',
    1,
    'Nintendo Switch',
    59.99
),
(
    'Red Dead Redemption 2',
    2,
    'PlayStation 4',
    49.99
),
(
    'The Last of Us Part II',
    3,
    'PlayStation 4',
    59.99
),
(
    'Overwatch',
    4,
    'PC',
    39.99
),
(
    'Cyberpunk 2077',
    5,
    'PC',
    59.99
),
(
    'Super Mario Odyssey',
    1,
    'Nintendo Switch',
    49.99
),
(
    'Grand Theft Auto V',
    2,
    'Xbox One',
    29.99
),
(
    'Uncharted 4: A Thief''s End',
    3,
    'PlayStation 4',
    19.99
),
(
    'Diablo III',
    4,
    'PlayStation 4',
    29.99
),
(
    'The Witcher 3: Wild Hunt',
    5,
    'Xbox One',
    39.99
),
(
    'Animal Crossing: New Horizons',
    1,
    'Nintendo Switch',
    59.99
),
(
    'Bully',
    2,
    'PlayStation 2',
    14.99
),
(
    'Crash Bandicoot N. Sane Trilogy',
    3,
    'Xbox One',
    39.99
),
(
    'StarCraft II: Wings of Liberty',
    4,
    'PC',
    19.99
),
(
    'Gwent: The Witcher Card Game',
    5,
    'PC',
    0.00
),
(
    'Super Smash Bros. Ultimate',
    1,
    'Nintendo Switch',
    59.99
),
(
    'Max Payne 3',
    2,
    'PlayStation 3',
    19.99
),
(
    'Jak and Daxter: The Precursor Legacy',
    3,
    'PlayStation 2',
    9.99
),
(
    'Hearthstone',
    4,
    'PC',
    0.00
),
(
    'Cyberpunk 2077',
    5,
    'PlayStation 5',
    69.99
),
(
    'Assassin''s Creed Valhalla',
    6,
    'PlayStation 5',
    59.99
),
(
    'FIFA 22',
    7,
    'PlayStation 5',
    59.99
),
(
    'Final Fantasy VII Remake',
    8,
    'PlayStation 4',
    49.99
),
(
    'The Elder Scrolls V: Skyrim',
    9,
    'Xbox Series X',
    39.99
),
(
    'Resident Evil Village',
    10,
    'PlayStation 5',
    59.99
),
(
    'Far Cry 6',
    6,
    'Xbox Series X',
    59.99
),
(
    'Battlefield 2042',
    7,
    'PC',
    59.99
),
(
    'Kingdom Hearts III',
    8,
    'PlayStation 4',
    39.99
),
(
    'Fallout 4',
    9,
    'Xbox One',
    29.99
),
(
    'Street Fighter V',
    10,
    'PlayStation 4',
    19.99
);