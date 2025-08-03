CREATE TABLE Classes (
    class VARCHAR(50) PRIMARY KEY,
    type VARCHAR(2),
    country VARCHAR(20),
    numGuns TINYINT NULL,
    bore REAL NULL,
    displacement INT NULL
);

CREATE TABLE Ships (
    name VARCHAR(50) PRIMARY KEY,
    class VARCHAR(50),
    launched SMALLINT NULL,
    FOREIGN KEY (class) REFERENCES Classes(class)
);

CREATE TABLE Battles (
    name VARCHAR(20) PRIMARY KEY,
    `date` DATETIME
);

CREATE TABLE Outcomes (
    ship VARCHAR(50),
    battle VARCHAR(20),
    result VARCHAR(10),
    PRIMARY KEY (ship, battle),
    FOREIGN KEY (ship) REFERENCES Ships(name),
    FOREIGN KEY (battle) REFERENCES Battles(name)
);
