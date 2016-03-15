
        SELECT count(*) FROM sp_get_matches_by_player(player_id) m WHERE sp_get_match_winner(m.id) = 1
