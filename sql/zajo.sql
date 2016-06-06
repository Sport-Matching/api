-- CREATE OR REPLACE FUNCTION sp_get_player_win_number_last_month(in_id integer, in_date timestamp without time zone)
--   RETURNS integer as
-- $$
--
-- SELECT count(*)::int as percent
-- FROM matches m
-- WHERE m.date <= in_date AND m.date >= in_date - interval '1 month'
--       AND ((sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id) OR (sp_get_match_winner(m.id) = 2 AND m.player2_id = in_id))
--
-- $$
-- LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_number_last_month(in_id integer, in_date timestamp without time zone)
  RETURNS integer as
$$

SELECT count(*)::int as percent
FROM matches m
WHERE m.date <= in_date AND m.date >= in_date - interval '1 month'
      AND sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id

$$
LANGUAGE sql;





-- CREATE OR REPLACE FUNCTION sp_get_player_win_last_month(in_id integer, in_date timestamp without time zone, OUT nb integer, OUT total integer, OUT result integer)
--   RETURNS RECORD as
-- $$
--
-- SELECT sp_get_player_win_number_last_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_last_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
-- FROM matches m
-- WHERE m.date <= in_date AND m.date >= (in_date - interval '1 month') AND (m.player1_id = in_id OR m.player2_id = in_id);
--
-- $$
-- LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_last_month(in_id integer, in_date timestamp without time zone, OUT nb integer, OUT total integer, OUT result integer)
  RETURNS RECORD as
$$

SELECT sp_get_player_win_number_last_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_last_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
FROM matches m
WHERE m.date <= in_date AND m.date >= (in_date - interval '1 month')
AND m.player1_id = in_id;

$$
LANGUAGE sql;


CREATE OR REPLACE FUNCTION sp_get_player_age(in_id integer, OUT age integer)
  RETURNS integer AS
$$
SELECT (now()::date - birthdate::date)::int FROM players WHERE id = in_id;
$$
LANGUAGE sql;



-- CREATE OR REPLACE FUNCTION sp_get_player_win_number_three_month(in_id integer, in_date timestamp without time zone)
--   RETURNS integer as
-- $$
--
-- SELECT count(*)::int as percent
-- FROM matches m
-- WHERE m.date <= in_date AND m.date >= in_date - interval '3 month'
--       AND ((sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id) OR (sp_get_match_winner(m.id) = 2 AND m.player2_id = in_id))
--
-- $$
-- LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_number_three_month(in_id integer, in_date timestamp without time zone)
  RETURNS integer as
$$

SELECT count(*)::int as percent
FROM matches m
WHERE m.date <= in_date AND m.date >= in_date - interval '3 month'
      AND sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id
$$
LANGUAGE sql;


-- CREATE OR REPLACE FUNCTION sp_get_player_win_three_month(in_id integer, in_date timestamp without time zone, OUT nb integer, OUT total integer, OUT result integer)
--   RETURNS RECORD as
-- $$
--
-- SELECT sp_get_player_win_number_three_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_three_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
-- FROM matches m
-- WHERE m.date <= in_date AND m.date >= (in_date - interval '3 month') AND (m.player1_id = in_id OR m.player2_id = in_id);
--
-- $$
-- LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_three_month(in_id integer, in_date timestamp without time zone, OUT nb integer, OUT total integer, OUT result integer)
  RETURNS RECORD as
$$

SELECT sp_get_player_win_number_three_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_three_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
FROM matches m
WHERE m.date <= in_date AND m.date >= (in_date - interval '3 month')
AND m.player1_id = in_id;

$$
LANGUAGE sql;


CREATE OR REPLACE FUNCTION sp_export(in_date date,
  OUT j1 character varying,
  OUT j2 character varying,
  OUT j1_g1 int,
  OUT j1_t1 int,
  OUT j1_p1 int,
  OUT j2_g1 int,
  OUT j2_t1 int,
  OUT j2_p1 int,
  OUT j1_w3 int,
  OUT j1_t3 int,
  OUT j1_p3 int,
  OUT j2_w3 int,
  OUT j2_t3 int,
  OUT j2_p3 int,
  OUT j1_age int,
  OUT j2_age int,
  OUT j1_rank int,
  OUT j2_rank int,
  OUT ground int,
  OUT result int
) RETURNS setof record AS
$$
SELECT DISTINCT p1.name, p2.name,
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
  INNER JOIN rankings r1 ON r1.player_id = m.player1_id AND r1.year = 2016
  INNER JOIN rankings r2 ON r2.player_id = m.player2_id AND r2.year = 2016
  INNER JOIN tournaments t ON t.id = m.tournament_id
  INNER JOIN players p1 ON p1.id = m.player1_id
  INNER JOIN players p2 ON p2.id = m.player2_id
WHERE m.date >= in_date;
$$
LANGUAGE sql;




CREATE OR REPLACE FUNCTION sp_export_players(in_j1 character varying, in_j2 character varying, in_date date,
  OUT name text,
  OUT w1 int,
  OUT t1 int,
  OUT p1 int,
  OUT w3 int,
  OUT t3 int,
  OUT p3 int,
  OUT age int,
  OUT rank int)
  RETURNS setof record as
$$
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
  INNER JOIN rankings r1 ON r1.player_id = p1.id AND r1.year = 2016
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
  INNER JOIN rankings r1 ON r1.player_id = p1.id AND r1.year = 2016
WHERE p1.name = in_j2;
$$
LANGUAGE sql;



CREATE OR REPLACE FUNCTION sp_export2(in_date date,
  OUT j1 character varying,
  OUT j2 character varying,
  OUT j1_g1 int,
  OUT j1_t1 int,
  OUT j1_p1 int,
  OUT j2_g1 int,
  OUT j2_t1 int,
  OUT j2_p1 int,
  OUT j1_w3 int,
  OUT j1_t3 int,
  OUT j1_p3 int,
  OUT j2_w3 int,
  OUT j2_t3 int,
  OUT j2_p3 int,
  OUT j1_age int,
  OUT j2_age int,
  OUT j1_rank int,
  OUT j2_rank int,
  OUT ground int,
  OUT result character VARYING
) RETURNS setof record AS
$$
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

  CASE WHEN sp_get_match_winner(m.id) = 1 THEN p1.name ELSE p2.name END
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
$$
LANGUAGE sql;
