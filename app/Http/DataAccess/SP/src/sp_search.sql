
	SELECT unaccent(_text) ILIKE '%' || unaccent(_query) || '%'
