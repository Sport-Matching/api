SELECT p1.name AS player1,
    p2.name AS player1,
    sp_get_match_winner(m.id) - 1 AS winner
FROM matches m
LEFT JOIN players p1 ON p1.id = m.player1_id
LEFT JOIN players p2 ON p2.id = m.player2_id
WHERE m.date::date > '2015-01-01'::date




SELECT p1.name AS player1,
    p2.name AS player2,
    s1.player1_score + COALESCE(s2.player1_score, 0) + COALESCE(s3.player1_score, 0) + COALESCE(s4.player1_score, 0) + COALESCE(s5.player1_score, 0) AS player1_score,
    s1.player2_score + COALESCE(s2.player2_score, 0) + COALESCE(s3.player2_score, 0) + COALESCE(s4.player2_score, 0) + COALESCE(s5.player2_score, 0) AS player2_score,
    sp_get_match_winner(m.id) - 1 AS winner
FROM matches m
LEFT JOIN players p1 ON p1.id = m.player1_id
LEFT JOIN players p2 ON p2.id = m.player2_id
LEFT JOIN sets s1 ON s1.id = m.set1_id
LEFT JOIN sets s2 ON s2.id = m.set2_id
LEFT JOIN sets s3 ON s3.id = m.set3_id
LEFT JOIN sets s4 ON s4.id = m.set4_id
LEFT JOIN sets s5 ON s5.id = m.set5_id
WHERE m.date::date > '2015-01-01'::date
