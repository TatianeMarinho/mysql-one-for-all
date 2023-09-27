SELECT u.`name` AS pessoa_usuaria,
    CASE
        WHEN MAX(h.date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM users AS u
LEFT JOIN historic AS h ON u.user_id = h.user_id
GROUP BY u.user_id, u.`name`
ORDER BY pessoa_usuaria;
