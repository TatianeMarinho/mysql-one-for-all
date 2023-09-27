SELECT al.title AS album, COUNT(fs.song_id) AS favoritadas
FROM favorites_songs AS fs
LEFT JOIN songs AS s ON s.song_id = fs.song_id
LEFT JOIN albums AS al ON al.album_id = s.album_id
GROUP BY al.title
ORDER BY favoritadas DESC, album
LIMIT 3;
