
DECLARE
BEGIN
        SELECT id INTO ground_id FROM ground_types gt WHERE gt.name = ground_name;
        IF ground_id IS NULL
        THEN
            INSERT INTO ground_types ("name") VALUES(ground_name) RETURNING id INTO ground_id;
        END IF;
END
