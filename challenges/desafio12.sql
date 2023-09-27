SELECT ar.artiste AS artista, 
	CASE 
		WHEN COUNT(fs.song_id) >= 5 THEN 'A'
		WHEN COUNT(fs.song_id) BETWEEN 3 AND 4 THEN 'B'
		WHEN COUNT(fs.song_id) BETWEEN 1 AND 2 THEN 'C'
		ELSE '-'
	END AS ranking
FROM artistes AS ar
LEFT JOIN albums AS al ON al.artiste_id = ar.artiste_id
LEFT JOIN songs AS s ON s.album_id = al.album_id
LEFT JOIN favorites_songs AS fs ON fs.song_id = s.song_id
GROUP BY ar.artiste
ORDER BY 
	CASE
		WHEN COUNT(fs.song_id) >= 5 THEN 'A'
		WHEN COUNT(fs.song_id) BETWEEN 3 AND 4 THEN 'B'
		WHEN COUNT(fs.song_id) BETWEEN 1 AND 2 THEN 'C'
		ELSE 'D'
	END, artiste;
