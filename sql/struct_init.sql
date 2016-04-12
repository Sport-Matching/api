--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.7
-- Dumped by pg_dump version 9.4.7
-- Started on 2016-04-12 17:09:33 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11893)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 20301)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 17601)
-- Name: matches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE matches (
    id integer NOT NULL,
    player1_id integer NOT NULL,
    player2_id integer,
    set1_id integer NOT NULL,
    set2_id integer,
    set3_id integer,
    set4_id integer,
    set5_id integer,
    date timestamp without time zone NOT NULL,
    tournament_id integer NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 17614)
-- Name: sets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sets (
    id integer NOT NULL,
    player1_score integer NOT NULL,
    player2_score integer NOT NULL,
    player1_tie_break integer NOT NULL,
    player2_tie_break integer NOT NULL
);


--
-- TOC entry 201 (class 1255 OID 20264)
-- Name: sp_get_match_full(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_match_full(match_id integer, OUT match matches, OUT sets sets[]) RETURNS record
    LANGUAGE plpgsql
    AS $$
BEGIN
        SELECT m.* INTO match FROM matches m WHERE id = match_id;
        SELECT array_agg(s.*) INTO sets FROM sets s WHERE match.set1_id = s.id
                                           OR match.set2_id = s.id
                                           OR match.set3_id = s.id
                                           OR match.set4_id = s.id
                                           OR match.set5_id = s.id;
END
$$;


--
-- TOC entry 200 (class 1255 OID 18725)
-- Name: sp_get_match_winner(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_match_winner(match_id integer, OUT number integer) RETURNS integer
    LANGUAGE sql
    AS $$
        SELECT sp_get_set_winner(s.id) AS winner FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
                OR s.id  = m.set2_id
                OR s.id  = m.set3_id
                OR s.id  = m.set4_id
                OR s.id  = m.set5_id
        WHERE m.id = match_id
        GROUP BY winner
        ORDER BY count(*) DESC
        LIMIT 1
$$;


--
-- TOC entry 176 (class 1259 OID 17585)
-- Name: players; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    birthdate timestamp without time zone NOT NULL,
    sex bit(1) NOT NULL,
    country character varying(128) NOT NULL,
    weight integer NOT NULL,
    size integer NOT NULL,
    picture_url character varying(256)
);


--
-- TOC entry 178 (class 1259 OID 17593)
-- Name: tournaments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tournaments (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    ground_type integer NOT NULL,
    year integer NOT NULL
);


--
-- TOC entry 199 (class 1255 OID 18724)
-- Name: sp_get_matches_by_player(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_matches_by_player(player_id integer, OUT id integer, OUT player1 players, OUT player2 players, OUT date timestamp without time zone, OUT sets sets[], OUT tournament tournaments) RETURNS SETOF record
    LANGUAGE sql
    AS $$
        SELECT m.id, p1, p2, m.date, ARRAY[s1, s2, s3, s4, s5], t
        FROM matches m
        LEFT JOIN players p1 ON p1.id = m.player1_id
        LEFT JOIN players p2 ON p2.id = m.player2_id
        LEFT JOIN tournaments t ON t.id = m.tournament_id
        LEFT JOIN sets s1 ON s1.id = m.set1_id
        LEFT JOIN sets s2 ON s2.id = m.set2_id
        LEFT JOIN sets s3 ON s3.id = m.set3_id
        LEFT JOIN sets s4 ON s4.id = m.set4_id
        LEFT JOIN sets s5 ON s5.id = m.set5_id
        WHERE m.player1_id = player_id
$$;


--
-- TOC entry 220 (class 1255 OID 20801)
-- Name: sp_get_matches_vs(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_matches_vs(_player1_id integer, _player2_id integer, OUT id integer, OUT player1 players, OUT player2 players, OUT date timestamp without time zone, OUT sets sets[], OUT tournament tournaments) RETURNS SETOF record
    LANGUAGE sql
    AS $$
        SELECT m.id, p1, p2, m.date, ARRAY[s1, s2, s3, s4, s5], t
        FROM matches m
        LEFT JOIN players p1 ON p1.id = m.player1_id
        LEFT JOIN players p2 ON p2.id = m.player2_id
        LEFT JOIN tournaments t ON t.id = m.tournament_id
        LEFT JOIN sets s1 ON s1.id = m.set1_id
        LEFT JOIN sets s2 ON s2.id = m.set2_id
        LEFT JOIN sets s3 ON s3.id = m.set3_id
        LEFT JOIN sets s4 ON s4.id = m.set4_id
        LEFT JOIN sets s5 ON s5.id = m.set5_id
        WHERE m.player1_id = _player1_id AND m.player2_id = _player2_id
$$;


--
-- TOC entry 216 (class 1255 OID 20330)
-- Name: sp_get_player_avg_game_per_first_set(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_avg_game_per_first_set(player_id integer, OUT avg double precision) RETURNS double precision
    LANGUAGE sql
    AS $$
        SELECT sum(s.player1_score + s.player2_score)::float / count(*)::float
        FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
        WHERE m.player1_id = player_id
$$;


--
-- TOC entry 215 (class 1255 OID 20325)
-- Name: sp_get_player_avg_game_per_match(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_avg_game_per_match(player_id integer, OUT avg double precision) RETURNS double precision
    LANGUAGE sql
    AS $$
        SELECT sum(s.player1_score + s.player2_score)::float / (SELECT count(*) FROM sp_get_matches_by_player(player_id))::float
        FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
                         OR s.id = m.set2_id
                         OR s.id = m.set3_id
                         OR s.id = m.set4_id
                         OR s.id = m.set5_id
        WHERE m.player1_id = player_id
$$;


--
-- TOC entry 217 (class 1255 OID 20334)
-- Name: sp_get_player_avg_set_per_match(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_avg_set_per_match(player_id integer, OUT avg double precision) RETURNS double precision
    LANGUAGE sql
    AS $$
        SELECT sum(1)::float / (SELECT count(*) FROM sp_get_matches_by_player(player_id))::float
        FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
                         OR s.id = m.set2_id
                         OR s.id = m.set3_id
                         OR s.id = m.set4_id
                         OR s.id = m.set5_id
        WHERE m.player1_id = player_id
$$;


--
-- TOC entry 202 (class 1255 OID 18849)
-- Name: sp_get_player_best_ground(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_best_ground(player_id integer, OUT ground_type integer) RETURNS integer
    LANGUAGE sql
    AS $$
        SELECT t.ground_type FROM matches m
        INNER JOIN tournaments t ON t.id = m.tournament_id
        WHERE m.player1_id = player_id AND sp_get_match_winner(m.id) = 1
        GROUP BY t.ground_type
        ORDER BY count(*) DESC
        LIMIT 1
$$;


--
-- TOC entry 219 (class 1255 OID 20347)
-- Name: sp_get_player_full(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_full(player_id integer, OUT player players, OUT match_count bigint, OUT match_win_count bigint, OUT match_win_count_best_ground bigint, OUT match_win_percent double precision, OUT match_avg_game double precision, OUT match_first_set_avg_game double precision, OUT match_avg_set double precision, OUT match_first_set_win_percent double precision, OUT set_result_percent json) RETURNS record
    LANGUAGE sql
    AS $$
        SELECT
                p AS player,
                (SELECT count(*) FROM sp_get_matches_by_player(player_id)) AS match_count,
                sp_get_player_win_match_count(p.id) AS match_win_count,
                sp_get_player_win_match_count_best_ground(p.id) AS match_win_count_best_ground,
                sp_get_player_win_percent(p.id) AS match_win_percent,
                sp_get_player_avg_game_per_match(p.id) AS match_avg_game,
                sp_get_player_avg_game_per_first_set(p.id) AS match_first_set_avg_game,
                sp_get_player_avg_set_per_match(p.id) AS match_avg_set,
                sp_get_player_win_first_set_count(p.id) AS match_first_set_win_percent,
                '[{"player1_score":0, "player2_score":2, "percent": 42.42}]'::json AS set_result_percent
        FROM players p
        WHERE p.id = player_id
$$;


--
-- TOC entry 218 (class 1255 OID 20343)
-- Name: sp_get_player_win_first_set_count(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_win_first_set_count(player_id integer, OUT percent double precision) RETURNS double precision
    LANGUAGE sql
    AS $$
        SELECT count(*)::float / (SELECT count(*) FROM sp_get_matches_by_player(player_id))::float * 100.0 FROM matches m
        LEFT JOIN sets s ON s.id = m.set1_id
        WHERE m.player1_id = player_id AND sp_get_set_winner(s.id) = 1
$$;


--
-- TOC entry 206 (class 1255 OID 20294)
-- Name: sp_get_player_win_match_count(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_win_match_count(player_id integer, OUT count bigint) RETURNS bigint
    LANGUAGE sql
    AS $$
        SELECT count(*) FROM sp_get_matches_by_player(player_id) m WHERE sp_get_match_winner(m.id) = 1
$$;


--
-- TOC entry 207 (class 1255 OID 20299)
-- Name: sp_get_player_win_match_count_best_ground(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_win_match_count_best_ground(player_id integer, OUT count bigint) RETURNS bigint
    LANGUAGE sql
    AS $$
        SELECT count(*) FROM sp_get_matches_by_player(player_id) m
        INNER JOIN tournaments t ON t.id = (m.tournament).id
        WHERE sp_get_match_winner(m.id) = 1 AND sp_get_player_best_ground((m.player1).id) = t.ground_type
$$;


--
-- TOC entry 214 (class 1255 OID 20316)
-- Name: sp_get_player_win_percent(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_player_win_percent(player_id integer, OUT percent double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
all_count int;
win_count int;
BEGIN
        SELECT count(*) INTO all_count FROM matches m WHERE m.player1_id = player_id;
        SELECT count(*) INTO win_count FROM matches m WHERE m.player1_id = player_id AND sp_get_match_winner(m.id) = 1;
        percent := CASE WHEN all_count = 0 THEN 0 ELSE win_count::float / all_count::float * 100.0 END;
END
$$;


--
-- TOC entry 213 (class 1255 OID 20310)
-- Name: sp_get_players(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_players(query character varying, OUT players players) RETURNS SETOF players
    LANGUAGE sql
    AS $$
        SELECT p FROM players p
        WHERE sp_search(p.name, query)
        ORDER BY p.name
$$;


--
-- TOC entry 198 (class 1255 OID 18726)
-- Name: sp_get_set_winner(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_set_winner(set_id integer, OUT number integer) RETURNS integer
    LANGUAGE sql
    AS $$
        SELECT (CASE WHEN s.player1_score > s.player2_score THEN 1 ELSE 2 END)  FROM sets s
        WHERE s.id = set_id
        LIMIT 1
$$;


--
-- TOC entry 203 (class 1255 OID 19799)
-- Name: sp_may_insert_ground(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_may_insert_ground(ground_name character varying, OUT ground_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
        SELECT id INTO ground_id FROM ground_types gt WHERE gt.name = ground_name;
        IF ground_id IS NULL
        THEN
            INSERT INTO ground_types ("name") VALUES(ground_name) RETURNING id INTO ground_id;
        END IF;
END
$$;


--
-- TOC entry 205 (class 1255 OID 19827)
-- Name: sp_may_insert_player(character varying, timestamp without time zone, bit, character varying, integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_may_insert_player(player_name character varying, player_birthdate timestamp without time zone, player_sex bit, player_country character varying, player_weight integer, player_size integer, player_picture_url character varying, OUT player_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
        SELECT id INTO player_id FROM players p WHERE p.name = player_name;
        IF player_id IS NULL
        THEN
            INSERT INTO players (name, birthdate, sex, country, weight, size, picture_url)
            VALUES(player_name, player_birthdate, player_sex, player_country, player_weight, player_size, player_picture_url) RETURNING id INTO player_id;
        END IF;
END
$$;


--
-- TOC entry 204 (class 1255 OID 19803)
-- Name: sp_may_insert_tournament(character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_may_insert_tournament(tournament_name character varying, tournament_ground integer, tournament_year integer, OUT tournament_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
        SELECT id INTO tournament_id FROM tournaments t WHERE t.name = tournament_name AND t.year = tournament_year;
        IF tournament_id IS NULL
        THEN
            INSERT INTO tournaments ("name", "ground_type", "year") VALUES(tournament_name, tournament_ground, tournament_year) RETURNING id INTO tournament_id;
        END IF;
END
$$;


--
-- TOC entry 212 (class 1255 OID 20308)
-- Name: sp_search(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_search(_text character varying, _query character varying, OUT _res boolean) RETURNS boolean
    LANGUAGE sql COST 1
    AS $$
	SELECT unaccent(_text) ILIKE '%' || unaccent(_query) || '%'
$$;


--
-- TOC entry 185 (class 1259 OID 19784)
-- Name: ground_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ground_types (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 19782)
-- Name: ground_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ground_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 184
-- Name: ground_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ground_types_id_seq OWNED BY ground_types.id;


--
-- TOC entry 179 (class 1259 OID 17599)
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 179
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE matches_id_seq OWNED BY matches.id;


--
-- TOC entry 175 (class 1259 OID 17583)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 175
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- TOC entry 181 (class 1259 OID 17607)
-- Name: pronostics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pronostics (
    match_id integer NOT NULL,
    match_winner_number integer,
    set1_winner_number integer
);


--
-- TOC entry 174 (class 1259 OID 17578)
-- Name: rankings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rankings (
    player_id integer NOT NULL,
    rank integer NOT NULL,
    year integer NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 17612)
-- Name: sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 182
-- Name: sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sets_id_seq OWNED BY sets.id;


--
-- TOC entry 177 (class 1259 OID 17591)
-- Name: tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tournaments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 177
-- Name: tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tournaments_id_seq OWNED BY tournaments.id;


--
-- TOC entry 1980 (class 2604 OID 19787)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ground_types ALTER COLUMN id SET DEFAULT nextval('ground_types_id_seq'::regclass);


--
-- TOC entry 1978 (class 2604 OID 17604)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches ALTER COLUMN id SET DEFAULT nextval('matches_id_seq'::regclass);


--
-- TOC entry 1976 (class 2604 OID 17588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- TOC entry 1979 (class 2604 OID 17617)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sets ALTER COLUMN id SET DEFAULT nextval('sets_id_seq'::regclass);


--
-- TOC entry 1977 (class 2604 OID 17596)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tournaments ALTER COLUMN id SET DEFAULT nextval('tournaments_id_seq'::regclass);


--
-- TOC entry 1994 (class 2606 OID 19789)
-- Name: ground_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ground_types
    ADD CONSTRAINT ground_types_pkey PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 17606)
-- Name: matches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- TOC entry 1984 (class 2606 OID 17590)
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 17611)
-- Name: pronostics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pronostics
    ADD CONSTRAINT pronostics_pkey PRIMARY KEY (match_id);


--
-- TOC entry 1982 (class 2606 OID 17582)
-- Name: rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rankings
    ADD CONSTRAINT rankings_pkey PRIMARY KEY (player_id, year);


--
-- TOC entry 1992 (class 2606 OID 17619)
-- Name: sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);


--
-- TOC entry 1986 (class 2606 OID 17598)
-- Name: tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (id);


--
-- TOC entry 1996 (class 2606 OID 17625)
-- Name: matches_player1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_player1_id_fkey FOREIGN KEY (player1_id) REFERENCES players(id) ON DELETE CASCADE;


--
-- TOC entry 1997 (class 2606 OID 17630)
-- Name: matches_player2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_player2_id_fkey FOREIGN KEY (player2_id) REFERENCES players(id) ON DELETE CASCADE;


--
-- TOC entry 1998 (class 2606 OID 17635)
-- Name: matches_set1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set1_id_fkey FOREIGN KEY (set1_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 1999 (class 2606 OID 17640)
-- Name: matches_set2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set2_id_fkey FOREIGN KEY (set2_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 2000 (class 2606 OID 17645)
-- Name: matches_set3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set3_id_fkey FOREIGN KEY (set3_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 2001 (class 2606 OID 17650)
-- Name: matches_set4_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set4_id_fkey FOREIGN KEY (set4_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 2002 (class 2606 OID 17655)
-- Name: matches_set5_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set5_id_fkey FOREIGN KEY (set5_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 2003 (class 2606 OID 17660)
-- Name: matches_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE;


--
-- TOC entry 2004 (class 2606 OID 17665)
-- Name: pronostics_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pronostics
    ADD CONSTRAINT pronostics_match_id_fkey FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE;


--
-- TOC entry 1995 (class 2606 OID 17620)
-- Name: rankings_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rankings
    ADD CONSTRAINT rankings_player_id_fkey FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE;


-- Completed on 2016-04-12 17:09:33 CEST

--
-- PostgreSQL database dump complete
--

