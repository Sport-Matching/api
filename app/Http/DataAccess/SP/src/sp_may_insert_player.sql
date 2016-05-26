
DECLARE
BEGIN
        SELECT id INTO player_id FROM players p WHERE p.name = player_name;
        IF player_id IS NULL
        THEN
            INSERT INTO players (name, birthdate, sex, country, weight, size, picture_url)
            VALUES(player_name, player_birthdate, player_sex, player_country, player_weight, player_size, player_picture_url) RETURNING id INTO player_id;
        END IF;
END
