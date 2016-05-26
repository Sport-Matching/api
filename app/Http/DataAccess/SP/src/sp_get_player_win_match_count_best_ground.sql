
        SELECT count(*) FROM sp_get_matches_by_player(player_id) m
        INNER JOIN tournaments t ON t.id = (m.tournament).id
        WHERE sp_get_match_winner(m.id) = 1 AND sp_get_player_best_ground((m.player1).id) = t.ground_type
