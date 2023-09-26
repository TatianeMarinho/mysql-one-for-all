SELECT
    COUNT(*) AS cancoes,
    (SELECT COUNT(DISTINCT artiste_id) FROM songs) AS artistas,
    (SELECT COUNT(DISTINCT album_id) FROM songs) AS albuns
FROM SpotifyClone.songs;
