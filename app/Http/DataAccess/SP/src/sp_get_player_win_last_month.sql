

SELECT sp_get_player_win_number_last_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_last_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
FROM matches m
WHERE m.date <= in_date AND m.date >= (in_date - interval '1 month') AND (m.player1_id = in_id OR m.player2_id = in_id);

