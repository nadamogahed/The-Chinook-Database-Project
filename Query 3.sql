SELECT a.Name Name,
       sum(i.UnitPrice)AmountSpent,
       c.CustomerId,
       c.FirstName|| " " || c.LastName Customer_Name
FROM Artist a
JOIN Album b ON a.ArtistId = b.ArtistId
JOIN Track t ON b.AlbumId = t.AlbumId
JOIN InvoiceLine i ON i.TrackId = t.TrackId
JOIN Invoice n ON n.InvoiceId = i.InvoiceId
JOIN Customer c ON c.CustomerId = n.CustomerId
WHERE a.Name = "Iron Maiden"
GROUP BY c.FirstName
ORDER BY AmountSpent DESC
LIMIT 5