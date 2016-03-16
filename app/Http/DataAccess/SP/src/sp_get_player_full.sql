
        SELECT
                p AS player,
                sp_get_player_win_match_count(p.id) AS match_win_count,
                sp_get_player_win_match_count_best_ground(p.id) AS match_win_count_best_ground,
                sp_get_player_win_percent(p.id) AS match_win_percent,
                sp_get_player_avg_game_per_match(p.id) AS match_avg_game
        FROM players p
        WHERE p.id = player_id
