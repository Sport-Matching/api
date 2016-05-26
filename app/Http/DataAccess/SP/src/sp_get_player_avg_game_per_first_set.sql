
        SELECT sum(s.player1_score + s.player2_score)::float / count(*)::float
        FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
        WHERE m.player1_id = player_id
