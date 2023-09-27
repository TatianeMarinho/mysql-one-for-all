SELECT
  u.name AS pessoa_usuaria,
  COUNT(h.song_id) AS musicas_ouvidas,
  ROUND(SUM(s.length_second / 60), 2) AS total_minutos
FROM
  users AS u
LEFT JOIN
  historic AS h ON u.user_id = h.user_id
LEFT JOIN
  songs AS s ON h.song_id = s.song_id
GROUP BY
  u.name
ORDER BY
  u.name ASC;
