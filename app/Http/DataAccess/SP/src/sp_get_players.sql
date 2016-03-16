
        SELECT p FROM players p
        WHERE sp_search(p.name, query)
        ORDER BY p.name
