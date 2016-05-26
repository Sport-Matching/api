
DECLARE
all_count int;
win_count int;
BEGIN
        SELECT count(*) INTO all_count FROM matches m WHERE m.player1_id = player_id;
        SELECT count(*) INTO win_count FROM matches m WHERE m.player1_id = player_id AND sp_get_match_winner(m.id) = 1;
        percent := CASE WHEN all_count = 0 THEN 0 ELSE win_count::float / all_count::float * 100.0 END;
END
