-- @block
SELECT *
FROM Artist;
-- @block
SELECT *
FROM Users;
-- @block
SELECT *
FROM Commissions;
-- @block
SELECT *
FROM Payments;
-- @block
SELECT UserID,
    UserName
FROM Users
WHERE UserEmail = "oliviatayer@email.com"
    AND UserPassword = "password141"
LIMIT 1;
-- @block
INSERT INTO Payments (
        CommisionID,
        PaymentDate,
        PaymentAmount,
        PaymentMethod
    )
VALUES (4, NOW(), 100, 'Gopay');
-- @block
SELECT Commissions.CommissionID,
    Commissions.CommissionDetails,
    Commissions.Price,
    Artist.ArtistName,
    Users.UserName,
    Payments.PaymentMethod
FROM Commissions
    JOIN Artist ON Commissions.Artist_ArtistID = Artist.ArtistID
    JOIN Users ON Commissions.User_UserID = Users.UserID
    JOIN Payments ON Commissions.CommissionID = Payments.CommisionID;
-- @block
SELECT ArtistName
FROM Artist
WHERE ArtistID IN (
        SELECT Artist_ArtistID
        FROM Commissions
    );
-- @block
INSERT INTO Users (UserName, UserEmail, UserPassword)
VALUES ("Testing", "testing@email.com", "testing"),
    ("Testing2", "testing2@email.com", "testing2"),
    ("Testing3", "testing3@email.com", "testing3"),
    ("Testing4", "testing4@email.com", "testing4"),
    ("Testing5", "testing5@email.com", "testing5"),
    ("Testing6", "testing6@email.com", "testing6"),
    ("Testing7", "testing7@email.com", "testing7"),
    ("Testing8", "testing8@email.com", "testing8"),
    ("Testing9", "testing9@email.com", "testing9"),
    ("Testing10", "testing10@email.com", "testing10");