
DECLARE
BEGIN
        SELECT id INTO tournament_id FROM tournaments t WHERE t.name = tournament_name AND t.year = tournament_year;
        IF tournament_id IS NULL
        THEN
            INSERT INTO tournaments ("name", "ground_type", "year") VALUES(tournament_name, tournament_ground, tournament_year) RETURNING id INTO tournament_id;
        END IF;
END
