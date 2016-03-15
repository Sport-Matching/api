
DECLARE
all_count int;
win_count int;
BEGIN
        SELECT count(*) INTO all_count FROM matches m WHERE m.player1_id = player_id AND date_part('year', m.date) = year;
        SELECT count(*) INTO win_count FROM matches m WHERE m.player1_id = player_id AND date_part('year', m.date) = year AND sp_get_match_winner(m.id) = 1;
        percent := win_count::float / all_count::float * 100.0;
END
