
        SELECT count(*)::float / (SELECT count(*) FROM sp_get_matches_by_player(player_id))::float * 100.0 FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
        WHERE m.player1_id = player_id AND sp_get_set_winner(s.id) = 1
