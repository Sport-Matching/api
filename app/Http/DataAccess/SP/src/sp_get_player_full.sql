
        SELECT
                p AS player,
                (SELECT count(*) FROM sp_get_matches_by_player(player_id)) AS match_count,
                sp_get_player_win_match_count(p.id) AS match_win_count,
                sp_get_player_win_match_count_best_ground(p.id) AS match_win_count_best_ground,
                sp_get_player_win_percent(p.id) AS match_win_percent,
                sp_get_player_avg_game_per_match(p.id) AS match_avg_game,
                sp_get_player_avg_game_per_first_set(p.id) AS match_first_set_avg_game,
                sp_get_player_avg_set_per_match(p.id) AS match_avg_set,
                sp_get_player_win_first_set_count(p.id) AS match_first_set_win_percent,
                '[{"player1_score":0, "player2_score":2, "percent": 42.42}]'::json AS set_result_percent
        FROM players p
        WHERE p.id = player_id
