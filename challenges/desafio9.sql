SELECT COUNT(h.user_id) AS musicas_no_historico
FROM historic AS h
RIGHT JOIN users AS u ON u.user_id = h.user_id
WHERE u.`name` = 'Barbara Liskov';
