-- name: UserLogin :one
SELECT UserID,
    UserName
FROM Users
WHERE UserEmail = ?
    AND UserPassword = ?
LIMIT 1;
-- name: ArtistLogin :one
SELECT ArtistID,
    ArtistName
FROM Artist
WHERE ArtistEmail = ?
    AND ArtistPassword = ?
LIMIT 1;
-- name: RegisterUser :execresult
INSERT INTO Users (
        UserEmail,
        UserName,
        UserPassword
    )
VALUES (?, ?, ?);
-- name: UpdateUserPassword :exec
UPDATE Users
SET UserPassword = ?
WHERE UserID = ?;
-- name: DeleteUser :exec
DELETE FROM Users
WHERE UserEmail = ?;
-- name: AllCommissions :many
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
-- name: GetArtistNamesByCommissions :many
SELECT ArtistName
FROM Artist
WHERE ArtistID IN (
        SELECT Artist_ArtistID
        FROM Commissions
    );