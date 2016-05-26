
        SELECT sp_get_set_winner(s.id) AS winner FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
                OR s.id  = m.set2_id
                OR s.id  = m.set3_id
                OR s.id  = m.set4_id
                OR s.id  = m.set5_id
        WHERE m.id = match_id
        GROUP BY winner
        ORDER BY count(*) DESC
        LIMIT 1
