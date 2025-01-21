-- Skapa tabellen Kunder
CREATE TABLE Kunder (
    Kund_ID INT PRIMARY KEY,             -- Prim�rnyckel
    F�rnamn VARCHAR(50) NOT NULL,        -- F�rnamn
    Efternamn VARCHAR(50) NOT NULL,      -- Efternamn
    Personnummer BIGINT UNIQUE NOT NULL, -- Unikt personnummer
    Telefonnummer INT                    -- Telefonnummer
);

-- Skapa tabellen Konton
CREATE TABLE Konton (
    Konto_ID INT PRIMARY KEY,            -- Prim�rnyckel
    Kontonamn VARCHAR(50) NOT NULL,      -- Namn p� kontot
    Kontotyp VARCHAR(50) NOT NULL,       -- Typ av konto
    Kund_ID INT NOT NULL,                -- Fr�mmande nyckel kopplad till Kunder
    Saldo DECIMAL(15, 2) NOT NULL,       -- Saldo p� kontot
    CONSTRAINT FK_Kund_Konto FOREIGN KEY (Kund_ID) REFERENCES Kunder(Kund_ID)
);

-- Skapa tabellen Transaktioner
CREATE TABLE Transaktioner (
    Transaktions_ID INT PRIMARY KEY,     -- Prim�rnyckel
    Konto_ID INT NOT NULL,               -- Fr�mmande nyckel kopplad till Konton
    Belopp INT NOT NULL,                 -- Transaktionsbelopp
    Tid DATETIME NOT NULL,               -- Tidpunkt f�r transaktionen
    Transaktionstyp VARCHAR(50) NOT NULL, -- Typ av transaktion (t.ex. ins�ttning, uttag)
    CONSTRAINT FK_Konto_Transaktion FOREIGN KEY (Konto_ID) REFERENCES Konton(Konto_ID)
);
