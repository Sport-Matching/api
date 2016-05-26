
SELECT p1.name, p2.name,
  wp1.nb as p1_win1, wp1.total as p1_total1, wp1.result as p1_percent1,
  wp2.nb as p2_win1, wp2.total as p2_total1, wp2.result as p2_percent1,

  wp13.nb as p1_win3, wp13.total as p1_total3, wp13.result as p1_percent3,
  wp23.nb as p2_win3, wp23.total as p2_total3, wp23.result as p2_percent3,

  sp_get_player_age(m.player1_id) as j1_age,
  sp_get_player_age(m.player2_id) as j2_age,

  r1.rank,
  r2.rank,

  t.ground_type,

  sp_get_match_winner(m.id) -1 as result
FROM matches m
  INNER JOIN sp_get_player_win_last_month(m.player1_id, m.date) wp1 ON TRUE
  INNER JOIN sp_get_player_win_last_month(m.player2_id, m.date) wp2 ON TRUE
  INNER JOIN sp_get_player_win_three_month(m.player1_id, m.date) wp13 ON TRUE
  INNER JOIN sp_get_player_win_three_month(m.player2_id, m.date) wp23 ON TRUE
  INNER JOIN rankings r1 ON r1.player_id = m.player1_id
  INNER JOIN rankings r2 ON r2.player_id = m.player2_id
  INNER JOIN tournaments t ON t.id = m.tournament_id
  INNER JOIN players p1 ON p1.id = m.player1_id
  INNER JOIN players p2 ON p2.id = m.player2_id
WHERE m.date >= in_date;
