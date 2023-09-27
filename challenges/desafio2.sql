SELECT
    COUNT(DISTINCT s.song_id) AS cancoes,
    (SELECT COUNT(DISTINCT artiste_id) FROM artistes) AS artistas,
    COUNT(DISTINCT s.album_id) AS albuns
FROM songs AS s;
