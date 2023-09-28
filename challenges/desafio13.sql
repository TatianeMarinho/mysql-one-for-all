SELECT
    CASE
        WHEN age <= 30 THEN 'Até 30 anos'
        WHEN age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(*) AS total_pessoas_usuarias,
    CAST(SUM(IFNULL(total_favoritadas, 0)) AS SIGNED) AS total_favoritadas
FROM (
    SELECT
        u.user_id,
        age,
        COUNT(fs.song_id) AS total_favoritadas
    FROM
        users AS u
    LEFT JOIN
        favorites_songs AS fs ON u.user_id = fs.user_id
    GROUP BY
        u.user_id, age
) AS user_favorites
GROUP BY
    faixa_etaria
ORDER BY
    CASE
        WHEN faixa_etaria = 'Até 30 anos' THEN 1
        WHEN faixa_etaria = 'Entre 31 e 60 anos' THEN 2
        ELSE 3
    END;
