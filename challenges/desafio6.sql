SELECT 
    ROUND(MIN(s.price), 2) AS faturamento_minimo, 
    ROUND(MAX(s.price), 2) AS faturamento_maximo,
    ROUND(AVG(s.price), 2) AS faturamento_medio,  
    ROUND(SUM(s.price ), 2) AS faturamento_total
FROM subscription AS s
INNER JOIN users AS u ON s.subscription_id = u.subscription_id;
