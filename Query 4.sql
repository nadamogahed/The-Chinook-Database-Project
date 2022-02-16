WITH popular AS
  (SELECT count(n.BillingCountry) Purchases,
          n.BillingCountry Country,
          g.Name Name,
          g.GenreId GenreId
   FROM Genre g
   JOIN Track t ON g.GenreId = t.GenreId
   JOIN InvoiceLine i ON t.TrackId = i.TrackId
   JOIN Invoice n ON n.InvoiceId = i.InvoiceId
   GROUP BY n.BillingCountry,
            g.Name
   ORDER BY BillingCountry,
            Name)
SELECT p.Purchases,
       p.Country|| ' - ' || p.Name AS Country_GenreName,
       p.GenreId
FROM popular p
WHERE p.Purchases =
    (SELECT max(Purchases)
     FROM popular
     WHERE p.Country = Country
     GROUP BY Country)
ORDER BY p.Country