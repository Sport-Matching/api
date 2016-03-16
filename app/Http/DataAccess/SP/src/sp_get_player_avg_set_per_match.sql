
        SELECT sum(1)::float / (SELECT count(*) FROM sp_get_matches_by_player(player_id))::float
        FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
                         OR s.id = m.set2_id
                         OR s.id = m.set3_id
                         OR s.id = m.set4_id
                         OR s.id = m.set5_id
        WHERE m.player1_id = player_id
