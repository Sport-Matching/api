
        SELECT (CASE WHEN s.player1_score > s.player2_score THEN 1 ELSE 2 END)  FROM sets s
        WHERE s.id = set_id
        LIMIT 1
