SELECT ar.artiste AS artista, al.title AS album
FROM artistes AS ar
LEFT JOIN albums AS al ON ar.artiste_id = al.artiste_id
HAVING ar.artiste = 'Elis Regina'
ORDER BY album;
