CREATE DATABASE CatalogOfThings;
Use CatalogOfThings;

CREATE TABLE item (
    id INT PRIMARY KEY,
    title VAERCHAR(255),
    publish_date Date DATE,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    archived BOOLEAN,
    label_id INT, -- Add a foreign key for the label (one-to-many relationship)
    genre_id INT, -- Add a foreign key for the genre (one-to-many relationship)
    author_id INT, -- Add a foreign key for the author (one-to-many relationship)
    FOREIGN KEY (label_id) REFERENCES labels (id)  
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
);

--create music album table--

CREATE TABLE music_album(
    id INT NOT NULL,
    on_spotify BOOLEAN,
    FOREIGN KEY (id) REFERENCES item (id)
);

--Create Genre table--
CREATE TABLE IF NOT EXISTS GENRE(
    ID INTEGER,
    NAME CHAR(32) NOT NULL,
    ITEMS INT REFERENCES (books, MUSIC_ALBUM, games),
    PRIMARY KEY(ID, items)
)

-- Create the games table--
CREATE TABLE games (
    CREATE TABLE game(
        id INT NOT NULL,
        multiplayer BOOLEAN,
        last_played_at DATE,
        FOREIGN KEY (id) REFERENCES item (id)
    );
);

-- Create authors table--
CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

-- Create book table--
CREATE TABLE book(
    id INT NOT NULL,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    FOREIGN KEY (id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);