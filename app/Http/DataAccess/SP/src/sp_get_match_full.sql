
BEGIN
        SELECT m.* INTO match FROM matches m WHERE id = match_id;
        SELECT array_agg(s.*) INTO sets FROM sets s WHERE match.set1_id = s.id
                                           OR match.set2_id = s.id
                                           OR match.set3_id = s.id
                                           OR match.set4_id = s.id
                                           OR match.set5_id = s.id;
END
