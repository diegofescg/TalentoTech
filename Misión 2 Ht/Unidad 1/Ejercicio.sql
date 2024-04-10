#Consultas sugeridas
SELECT * FROM invoice;
SELECT * FROM Employee;
SELECT BILLINGCOUNTRY, COUNT(INVOICEID) FROM INVOICE GROUP BY 1 ORDER BY 2 DESC;
select count(*) from track where GenreId = 1;
select * from invoice;

#Ejercicios
#¿Qué país tiene más facturas?
select BillingCountry, COUNT(*) as total_facturas 
from invoice group by BillingCountry order by total_facturas desc;

/*se quiere promocionar un nuevo festival musical, para ello es necesario
saber en qué ciudad hay mas facturas (invoices) . determinar en qué
ciudad la suma de facturas es la mayor.*/
#Consultar solo los maximos 
select BillingCity, count(*) as max_total_facturas 
from invoice group by BillingCity order by max_total_facturas desc limit 1;

SELECT BillingCity, SUM(Total) AS TotalFacturas
FROM invoice
GROUP BY BillingCity
ORDER BY TotalFacturas DESC
LIMIT 1;

SELECT BillingCity, COUNT(*) AS total_facturas, SUM(Total) AS total_vendido
FROM Invoice GROUP BY BillingCity ORDER BY total_facturas DESC, total_vendido DESC;

#Determinar quien es el mejor cliente (el que mas ha gastado en el sistema)
select C.FirstName, C.LastName, SUM(I.Total) as total_gastado
from Customer C join Invoice I on C.CustomerId = I.CustomerId
group by C.CustomerId, C.FirstName, C.LastName order by total_gastado desc  limit 1;

#Obtener una tabla con el correo, nombre y apellido de todos las personas
#que escuchan Rock. Retornar la lista por orden alfabético
select distinct c.email, c.firstname, c.lastname, g.name 
from customer c 
join invoice i on c.CustomerId =  i.CustomerId
join invoiceline iv on i.InvoiceId =  iv.InvoiceId
join track t on iv.TrackId =  t.TrackId
join genre g on t.GenreId =  g.GenreId
where g.name ='Rock'order by 1;

#Sacar una lista con todos los artistas que generan música rock  
select distinct ar.name, g.name
from artist ar
join album al on ar.ArtistId = al.ArtistId
join track t on al.AlbumId = t.AlbumId
join genre g on t.GenreId = g.GenreId
where g.name = 'Rock';

#Encontrar cual es el artista que más ha ganado de acuerdo al campo invoiceLines.
select ar.name, sum(iv.UnitPrice) as Total_Ganado
from invoiceline iv
join track t on iv.TrackId = t.TrackId
join album al on t.AlbumId = al.AlbumId
join artist ar on al.ArtistId = ar.ArtistId
group by 1 order by 2 desc limit 1;

#Encontrar cuanto gastaron en total en estados unidos en compras
select c.country, sum(iv.Total) as total_compras
from customer c
join invoice iv on c.CustomerId = iv.CustomerId
where c.Country ='USA';
 
#Encontrar cuánto gastaron los usuarios por género.
select g.name, sum(i.Total) as total_gastado 
from invoice i 
join invoiceline iv on i.InvoiceId = iv.InvoiceId
join track t on iv.TrackId = t.TrackId
join genre g on t.GenreId = g.GenreId
group by 1 order by 2;

#Generar una tabla con el conteo de usuarios por cada país.
select country, count(customerid) as total_usuarios from customer group by 1 order by 1;

#Encontrar cuantas canciones hay por cada género.
select g.name, count(t.genreid) as total_canciones
from genre g 
join track t on g.GenreId = t.GenreId
group by 1;
