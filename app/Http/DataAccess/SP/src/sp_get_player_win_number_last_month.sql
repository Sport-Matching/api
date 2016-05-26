

SELECT count(*)::int as percent
FROM matches m
WHERE m.date <= in_date AND m.date >= in_date - interval '1 month'
      AND ((sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id) OR (sp_get_match_winner(m.id) = 2 AND m.player2_id = in_id))

