SELECT FirstName,
       LastName,
       sum(Total) AS Total
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY invoice.CustomerId
ORDER BY 3 DESC
LIMIT 10;

SELECT Customer.Email,
       Customer.FirstName,
       Customer.LastName,
       count(Genre.Name) AS Number_of_Songs
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Rock"
GROUP BY 1,
         2,
         3
ORDER BY 4 DESC
LIMIT 10;


SELECT Artist.ArtistId,
       Artist.Name,
       count(Title) AS songs
FROM Album
JOIN Track ON Album.AlbumId = Track.AlbumId
JOIN Genre ON Track.GenreId = Genre.GenreId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
WHERE Genre.Name = "Rock"
GROUP BY 1,
         2
ORDER BY 3 DESC
LIMIT 10;


SELECT Artist.Name,
       SUM(InvoiceLine.Quantity * InvoiceLine.UnitPrice) AS AmountSpent
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Track.GenreId = Genre.GenreId
JOIN Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
WHERE Genre.Name = "Rock"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;