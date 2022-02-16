SELECT a.ArtistId,
       a.Name,
       count(t.Name) Songs
FROM Artist a
JOIN Album b ON a.ArtistId = b.ArtistId
JOIN Track t ON b.AlbumId = t.AlbumId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = "Rock"
GROUP BY a.Name
ORDER BY Songs DESC
LIMIT 10