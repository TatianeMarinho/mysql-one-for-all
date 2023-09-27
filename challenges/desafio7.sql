SELECT ar.artiste AS artista, al.title AS album, COUNT(fo.artiste_id) AS pessoas_seguidoras
FROM artistes AS ar
LEFT JOIN albums AS al ON ar.artiste_id = al.artiste_id
LEFT JOIN followed AS fo ON ar.artiste_id = fo.artiste_id
GROUP BY ar.artiste_id, al.album_id, al.title
ORDER BY pessoas_seguidoras DESC, artista, album;
