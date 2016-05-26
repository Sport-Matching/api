
        SELECT m.id, p1, p2, m.date, ARRAY[s1, s2, s3, s4, s5], t
        FROM matches m
        LEFT JOIN players p1 ON p1.id = m.player1_id
        LEFT JOIN players p2 ON p2.id = m.player2_id
        LEFT JOIN tournaments t ON t.id = m.tournament_id
        LEFT JOIN sets s1 ON s1.id = m.set1_id
        LEFT JOIN sets s2 ON s2.id = m.set2_id
        LEFT JOIN sets s3 ON s3.id = m.set3_id
        LEFT JOIN sets s4 ON s4.id = m.set4_id
        LEFT JOIN sets s5 ON s5.id = m.set5_id
        WHERE m.player1_id = player_id
