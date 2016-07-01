CREATE OR REPLACE FUNCTION sp_get_player_win_number_last_month(in_id integer, in_date timestamp without time zone)
  RETURNS integer as
$$

SELECT count(*)::int as percent
FROM matches m
WHERE m.date <= in_date AND m.date >= in_date - interval '1 month'
      AND sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id

$$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_number_last_six_month(in_id integer, in_date timestamp without time zone)
  RETURNS integer as
$$

SELECT count(*)::int as percent
FROM matches m
WHERE m.date <= in_date AND m.date >= in_date - interval '6 month'
      AND sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id

$$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_last_six_month(in_id integer, in_date timestamp without time zone, OUT nb integer, OUT total integer, OUT result integer)
  RETURNS RECORD as
$$

SELECT sp_get_player_win_number_last_six_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_last_six_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
FROM matches m
WHERE m.date <= in_date AND m.date >= (in_date - interval '6 month')
      AND m.player1_id = in_id;

$$
LANGUAGE sql;

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

CREATE OR REPLACE FUNCTION sp_get_player_win_number_three_month(in_id integer, in_date timestamp without time zone)
  RETURNS integer as
$$

SELECT count(*)::int as percent
FROM matches m
WHERE m.date <= in_date AND m.date >= in_date - interval '3 month'
      AND sp_get_match_winner(m.id) = 1 AND m.player1_id = in_id
$$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION sp_get_player_win_three_month(in_id integer, in_date timestamp without time zone, OUT nb integer, OUT total integer, OUT result integer)
  RETURNS RECORD as
$$

SELECT sp_get_player_win_number_three_month(in_id, in_date) as nb, count(*)::int as total, (sp_get_player_win_number_three_month(in_id, in_date)* 100 / CASE count(*) WHEN 0 THEN 1 ELSE count(*) END)::int as result
FROM matches m
WHERE m.date <= in_date AND m.date >= (in_date - interval '3 month')
AND m.player1_id = in_id;

$$
LANGUAGE sql;


CREATE OR REPLACE FUNCTION sp_export(in_date date, in_ground1 int, in_ground2 int,
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
WHERE m.date >= in_date AND (t.ground_type = in_ground1 OR t.ground_type = in_ground2);
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


CREATE OR REPLACE FUNCTION sp_get_match_points(in_id int,
  OUT j1 bigint,
  OUT j2 bigint)
  RETURNS record AS
$$
SELECT sum(s.player1_score), sum(s.player2_score)
FROM matches m
  LEFT JOIN sets s ON s.id = m.set1_id
                      OR s.id = m.set2_id
                      OR s.id = m.set3_id
                      OR s.id = m.set4_id
                      OR s.id = m.set5_id
  LEFT JOIN players p1 ON p1.id = m.player1_id
  LEFT JOIN players p2 ON p2.id = m.player2_id
WHERE m.id = in_id
$$
LANGUAGE sql;



CREATE INDEX date_index ON matches (date);
CREATE INDEX date_player_index ON matches(date, player1_id);
CREATE INDEX j1_j2 ON matches(player1_id, player2_id);

CREATE OR REPLACE FUNCTION sp_get_match_points_period(in_from date, in_to date, in_player_id int,
  OUT j1 bigint,
  OUT j2 bigint,
  OUT average bigint,
  OUT average_opponent bigint)
  RETURNS record AS
$$
SELECT sum(s.player1_score), sum(s.player2_score), sum(s.player1_score) / count(s.*), sum(s.player2_score) / count(s.*)
FROM matches m
  LEFT JOIN sets s ON s.id = m.set1_id
                      OR s.id = m.set2_id
                      OR s.id = m.set3_id
                      OR s.id = m.set4_id
                      OR s.id = m.set5_id
WHERE m.date BETWEEN in_from AND in_to AND m.player1_id = in_player_id;
$$
LANGUAGE sql;



/*CREATE OR REPLACE FUNCTION sp_export_full(in_date date,
  OUT j1 character varying,
  OUT j2 character varying,
  OUT j1_g1 int,
  OUT j1_t1 int,
  OUT j2_g1 int,
  OUT j2_t1 int,
  OUT j1_w3 int,
  OUT j1_t3 int,
  OUT j2_w3 int,
  OUT j2_t3 int,
  OUT j1_age int,
  OUT j2_age int,
  OUT j1_games_3 bigint,
  OUT j1_games_opponents_3 bigint,
  OUT j2_games_3 bigint,
  OUT j2_games_opponents_3 bigint,
  OUT j1_rank int,
  OUT j2_rank int,
  OUT ground int,
  OUT result int
) RETURNS setof record AS
$$
SELECT p1.name, p2.name,
  wp1.nb as p1_win1, wp1.total as p1_total1,
  wp2.nb as p2_win1, wp2.total as p2_total1,

  wp13.nb as p1_win3, wp13.total as p1_total3,
  wp23.nb as p2_win3, wp23.total as p2_total3,

  sp_get_player_age(m.player1_id) as j1_age,
  sp_get_player_age(m.player2_id) as j2_age,

  mp.j1 as j1_games,
  mp.j2 as j1_vs_games,
  mp2.j1 as j2_games,
  mp2.j2 as j2_vs_games,

  r1.rank,
  r2.rank,

  t.ground_type,

  CASE WHEN sp_get_match_winner(m.id) = 1 THEN 0 ELSE 1 END
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
  INNER JOIN sp_get_match_points_period((in_date - interval '3 MONTHS')::date, in_date, m.player1_id) mp ON TRUE
  INNER JOIN sp_get_match_points_period((in_date - interval '3 MONTHS')::date, in_date, m.player2_id) mp2 ON TRUE
WHERE m.date >= in_date;
$$
LANGUAGE sql;*/


CREATE TABLE save(match_id int,
  j1 character varying,
  j2 character varying,
  percent_victory_j1_1month int,
  percent_victory_j2_1month int,
  percent_victory_j1_3months int,
  percent_victory_j2_3months int,
  percent_victory_j1_6months int,
  percent_victory_j2_6months int,
  j1_age int,
  j2_age int,
  average_games_j1_3months bigint,
  average_games_opponents_j1_3months bigint,
  average_games_j2_3months bigint,
  average_games_opponents_j2_3months bigint,
  history_win_j1 bigint,
  history_win_j2 bigint,
  j1_rank int,
  j2_rank int,
  ground int,
  result int
);

ALTER TABLE save ADD CONSTRAINT unicity UNIQUE (match_id,
j1,
j2,
percent_victory_j1_1month,
percent_victory_j2_1month,
percent_victory_j1_3months,
percent_victory_j2_3months,
percent_victory_j1_6months,
percent_victory_j2_6months,
j1_age,
j2_age,
average_games_j1_3months,
average_games_opponents_j1_3months,
average_games_j2_3months,
average_games_opponents_j2_3months,
history_win_j1,
history_win_j2,
j1_rank,
j2_rank,
ground,
result);

CREATE OR REPLACE FUNCTION sp_export_full_beta(in_date date,
  OUT j1 character varying,
  OUT j2 character varying,
  OUT percent_victory_j1_1month int,
  OUT percent_victory_j2_1month int,
  OUT percent_victory_j1_3months int,
  OUT percent_victory_j2_3months int,
  OUT percent_victory_j1_6months int,
  OUT percent_victory_j2_6months int,
  OUT j1_age int,
  OUT j2_age int,
  OUT average_games_j1_3months bigint,
  OUT average_games_opponents_j1_3months bigint,
  OUT average_games_j2_3months bigint,
  OUT average_games_opponents_j2_3months bigint,
  OUT history_win_j1 bigint,
  OUT history_win_j2 bigint,
  OUT j1_rank int,
  OUT j2_rank int,
  OUT ground int,
  OUT result int
) RETURNS setof record AS
$$
SELECT DISTINCT p1.name, p2.name,
  wp1.result as percent_victory_j1_1month,
  wp2.result as percent_victory_j2_1month,

  wp13.result as percent_victory_j1_3months,
  wp23.result as percent_victory_j2_3months,

  wp16.result as percent_victory_j1_6months,
  wp26.result as percent_victory_j2_6months,

  sp_get_player_age(m.player1_id) as j1_age,
  sp_get_player_age(m.player2_id) as j2_age,

  coalesce(mp.average,0) as average_games_j1_3months,
  coalesce(mp.average_opponent,0) as average_games_opponents_j1_3months,
  coalesce(mp2.average,0) as average_games_j2_3months,
  coalesce(mp2.average_opponent,0) as average_games_opponents_j2_3months,

  (SELECT count(*) FROM matches mms
  WHERE mms.player1_id = m.player1_id AND mms.player2_id = m.player2_id AND sp_get_match_winner(m.id) = 1
        AND mms.date <= m.date)
  as history_win_j1,
  (SELECT count(*) FROM matches mms
  WHERE mms.player1_id = m.player1_id AND mms.player2_id = m.player2_id AND sp_get_match_winner(m.id) = 2
        AND mms.date <= m.date)
    as history_win_j2,

  r1.rank,
  r2.rank,

  t.ground_type,

  sp_get_match_winner(m.id) -1 as result
FROM matches m
  INNER JOIN sp_get_player_win_last_month(m.player1_id, m.date) wp1 ON TRUE
  INNER JOIN sp_get_player_win_last_month(m.player2_id, m.date) wp2 ON TRUE
  INNER JOIN sp_get_player_win_three_month(m.player1_id, m.date) wp13 ON TRUE
  INNER JOIN sp_get_player_win_three_month(m.player2_id, m.date) wp23 ON TRUE
  INNER JOIN sp_get_player_win_last_six_month(m.player1_id, m.date) wp16 ON TRUE
  INNER JOIN sp_get_player_win_last_six_month(m.player2_id, m.date) wp26 ON TRUE
  INNER JOIN rankings r1 ON r1.player_id = m.player1_id AND r1.year = 2016
  INNER JOIN rankings r2 ON r2.player_id = m.player2_id AND r2.year = 2016
  INNER JOIN tournaments t ON t.id = m.tournament_id
  INNER JOIN players p1 ON p1.id = m.player1_id
  INNER JOIN players p2 ON p2.id = m.player2_id
  INNER JOIN sp_get_match_points_period((in_date - interval '3 MONTHS')::date, in_date, m.player1_id) mp ON TRUE
  INNER JOIN sp_get_match_points_period((in_date - interval '3 MONTHS')::date, in_date, m.player2_id) mp2 ON TRUE
WHERE m.date >= in_date;
$$
LANGUAGE sql;


CREATE OR REPLACE FUNCTION sp_export_save(in_date date
) RETURNS void AS
$$
BEGIN
  INSERT INTO save (SELECT
                      DISTINCT ON (p1.name, p2.name, percent_victory_j1_1month, percent_victory_j2_1month,
                        percent_victory_j1_3months, percent_victory_j2_3months, percent_victory_j1_6months, percent_victory_j2_6months,
                        j1_age, j2_age, average_games_j1_3months, average_games_opponents_j1_3months, average_games_j2_3months, average_games_opponents_j2_3months,
                        history_win_j1, history_win_j2, j1_rank, j2_rank, ground, result)
                      m.id as id, p1.name as j1, p2.name asj2,
                      wp1.result as percent_victory_j1_1month,
                      wp2.result as percent_victory_j2_1month,

                      wp13.result as percent_victory_j1_3months,
                      wp23.result as percent_victory_j2_3months,

                      wp16.result as percent_victory_j1_6months,
                      wp26.result as percent_victory_j2_6months,

                      sp_get_player_age(m.player1_id) as j1_age,
                      sp_get_player_age(m.player2_id) as j2_age,

                      coalesce(mp.average,0) as average_games_j1_3months,
                      coalesce(mp.average_opponent,0) as average_games_opponents_j1_3months,
                      coalesce(mp2.average,0) as average_games_j2_3months,
                      coalesce(mp2.average_opponent,0) as average_games_opponents_j2_3months,

                      (SELECT count(*) FROM matches mms
                      WHERE mms.player1_id = m.player1_id AND mms.player2_id = m.player2_id AND sp_get_match_winner(m.id) = 1
                      AND mms.date <= m.date)
                        as history_win_j1,
                      (SELECT count(*) FROM matches mms
                      WHERE mms.player1_id = m.player1_id AND mms.player2_id = m.player2_id AND sp_get_match_winner(m.id) = 2
                      AND mms.date <= m.date)
                        as history_win_j2,

                      r1.rank as j1_rank,
                      r2.rank as j2_rank,

                      t.ground_type as ground,

                      sp_get_match_winner(m.id) -1 as result
                    FROM matches m
                      INNER JOIN sp_get_player_win_last_month(m.player1_id, m.date) wp1 ON TRUE
                      INNER JOIN sp_get_player_win_last_month(m.player2_id, m.date) wp2 ON TRUE
                      INNER JOIN sp_get_player_win_three_month(m.player1_id, m.date) wp13 ON TRUE
                      INNER JOIN sp_get_player_win_three_month(m.player2_id, m.date) wp23 ON TRUE
                      INNER JOIN sp_get_player_win_last_six_month(m.player1_id, m.date) wp16 ON TRUE
                      INNER JOIN sp_get_player_win_last_six_month(m.player2_id, m.date) wp26 ON TRUE
                      INNER JOIN rankings r1 ON r1.player_id = m.player1_id AND r1.year = 2016
                      INNER JOIN rankings r2 ON r2.player_id = m.player2_id AND r2.year = 2016
                      INNER JOIN tournaments t ON t.id = m.tournament_id
                      INNER JOIN players p1 ON p1.id = m.player1_id
                      INNER JOIN players p2 ON p2.id = m.player2_id
                      INNER JOIN sp_get_match_points_period((in_date - interval '3 MONTHS')::date, in_date, m.player1_id) mp ON TRUE
                      INNER JOIN sp_get_match_points_period((in_date - interval '3 MONTHS')::date, in_date, m.player2_id) mp2 ON TRUE
                    WHERE m.date >= in_date);
END
$$
LANGUAGE plpgsql;