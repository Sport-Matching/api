
        SELECT t.ground_type FROM matches m
        INNER JOIN tournaments t ON t.id = m.tournament_id
        WHERE m.player1_id = player_id AND sp_get_match_winner(m.id) = 1
        GROUP BY t.ground_type
        ORDER BY count(*) DESC
        LIMIT 1
