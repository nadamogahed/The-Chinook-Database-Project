SELECT a.Name Name,
       count(i.InvoiceId) puchases
FROM Artist a
JOIN Album b ON a.ArtistId = b.ArtistId
JOIN Track t ON b.AlbumId = t.AlbumId
JOIN InvoiceLine i ON i.TrackId = t.TrackId
GROUP BY a.Name
ORDER BY puchases DESC
LIMIT 5