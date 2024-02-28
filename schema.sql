CREATE TABLE Users (
    UserID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserEmail VARCHAR(255) NOT NULL UNIQUE,
    UserName VARCHAR(255) NOT NULL,
    UserPassword VARCHAR(255) NOT NULL
);
CREATE TABLE Artist (
    ArtistID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ArtistName VARCHAR(255) NOT NULL,
    ArtistEmail VARCHAR(255) NOT NULL UNIQUE,
    ArtistPassword VARCHAR(255) NOT NULL,
    Bio TEXT NOT NULL
);
CREATE TABLE Commissions (
    CommissionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Artist_ArtistID INT NOT NULL,
    User_UserID INT NOT NULL,
    CommissionDetails TEXT NOT NULL,
    CommissionDate DATETIME NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Deadline DATE NOT NULL,
    FOREIGN KEY (Artist_ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (User_UserID) REFERENCES Users(UserID)
);
CREATE TABLE Payments (
    PaymentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CommisionID INT NOT NULL,
    PaymentDate DATETIME NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod ENUM('Gopay', 'Ovo', 'Dana') NOT NULL,
    FOREIGN KEY (CommisionID) REFERENCES Commissions(CommissionID)
);