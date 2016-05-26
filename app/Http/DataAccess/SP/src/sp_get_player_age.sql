
SELECT (now()::date - birthdate::date)::int FROM players WHERE id = in_id;
