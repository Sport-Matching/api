
SELECT 
  p1.name,
  wp1.nb as p1_win1, wp1.total as p1_total1, wp1.result as p1_percent1,
  wp13.nb as p1_win3, wp13.total as p1_total3, wp13.result as p1_percent3,
  sp_get_player_age(p1.id) as j1_age,
  r1.rank
FROM players p1
  INNER JOIN players p2 ON TRUE
  INNER JOIN sp_get_player_win_last_month(p1.id, in_date) wp1 ON TRUE
  INNER JOIN sp_get_player_win_three_month(p1.id, in_date) wp13 ON TRUE
  INNER JOIN rankings r1 ON r1.player_id = p1.id
WHERE p1.name = in_j1
UNION
SELECT 
  p1.name,
  wp1.nb as p1_win1, wp1.total as p1_total1, wp1.result as p1_percent1,
  wp13.nb as p1_win3, wp13.total as p1_total3, wp13.result as p1_percent3,
  sp_get_player_age(p1.id) as j1_age,
  r1.rank
FROM players p1
  INNER JOIN players p2 ON TRUE
  INNER JOIN sp_get_player_win_last_month(p1.id, in_date) wp1 ON TRUE
  INNER JOIN sp_get_player_win_three_month(p1.id, in_date) wp13 ON TRUE
  INNER JOIN rankings r1 ON r1.player_id = p1.id
WHERE p1.name = in_j2;
