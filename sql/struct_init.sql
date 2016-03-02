--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-03-02 12:36:14 CET

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
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 17585)
-- Name: players; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    birthdate timestamp without time zone NOT NULL,
    sex bit(1) NOT NULL,
    country character varying(128) NOT NULL,
    weight integer NOT NULL,
    size integer NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 17614)
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
-- TOC entry 177 (class 1259 OID 17593)
-- Name: tournaments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tournaments (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    ground_type integer NOT NULL,
    year integer NOT NULL
);


--
-- TOC entry 195 (class 1255 OID 18724)
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
        WHERE m.player1_id = player_id OR m.player2_id = player_id
$$;


--
-- TOC entry 179 (class 1259 OID 17601)
-- Name: matches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE matches (
    id integer NOT NULL,
    player1_id integer NOT NULL,
    player2_id integer NOT NULL,
    set1_id integer NOT NULL,
    set2_id integer,
    set3_id integer,
    set4_id integer,
    set5_id integer,
    date timestamp without time zone NOT NULL,
    tournament_id integer NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 17599)
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 178
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE matches_id_seq OWNED BY matches.id;


--
-- TOC entry 174 (class 1259 OID 17583)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 174
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- TOC entry 180 (class 1259 OID 17607)
-- Name: pronostics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pronostics (
    match_id integer NOT NULL,
    match_winner_number integer,
    set1_winner_number integer
);


--
-- TOC entry 173 (class 1259 OID 17578)
-- Name: rankings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rankings (
    player_id integer NOT NULL,
    rank integer NOT NULL,
    year integer NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 17612)
-- Name: sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 181
-- Name: sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sets_id_seq OWNED BY sets.id;


--
-- TOC entry 176 (class 1259 OID 17591)
-- Name: tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tournaments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 176
-- Name: tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tournaments_id_seq OWNED BY tournaments.id;


--
-- TOC entry 1946 (class 2604 OID 17604)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches ALTER COLUMN id SET DEFAULT nextval('matches_id_seq'::regclass);


--
-- TOC entry 1944 (class 2604 OID 17588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- TOC entry 1947 (class 2604 OID 17617)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sets ALTER COLUMN id SET DEFAULT nextval('sets_id_seq'::regclass);


--
-- TOC entry 1945 (class 2604 OID 17596)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tournaments ALTER COLUMN id SET DEFAULT nextval('tournaments_id_seq'::regclass);


--
-- TOC entry 1955 (class 2606 OID 17606)
-- Name: matches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- TOC entry 1951 (class 2606 OID 17590)
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- TOC entry 1957 (class 2606 OID 17611)
-- Name: pronostics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pronostics
    ADD CONSTRAINT pronostics_pkey PRIMARY KEY (match_id);


--
-- TOC entry 1949 (class 2606 OID 17582)
-- Name: rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rankings
    ADD CONSTRAINT rankings_pkey PRIMARY KEY (player_id, year);


--
-- TOC entry 1959 (class 2606 OID 17619)
-- Name: sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 17598)
-- Name: tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 17625)
-- Name: matches_player1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_player1_id_fkey FOREIGN KEY (player1_id) REFERENCES players(id) ON DELETE CASCADE;


--
-- TOC entry 1962 (class 2606 OID 17630)
-- Name: matches_player2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_player2_id_fkey FOREIGN KEY (player2_id) REFERENCES players(id) ON DELETE CASCADE;


--
-- TOC entry 1963 (class 2606 OID 17635)
-- Name: matches_set1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set1_id_fkey FOREIGN KEY (set1_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 1964 (class 2606 OID 17640)
-- Name: matches_set2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set2_id_fkey FOREIGN KEY (set2_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 1965 (class 2606 OID 17645)
-- Name: matches_set3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set3_id_fkey FOREIGN KEY (set3_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 1966 (class 2606 OID 17650)
-- Name: matches_set4_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set4_id_fkey FOREIGN KEY (set4_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 1967 (class 2606 OID 17655)
-- Name: matches_set5_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_set5_id_fkey FOREIGN KEY (set5_id) REFERENCES sets(id) ON DELETE CASCADE;


--
-- TOC entry 1968 (class 2606 OID 17660)
-- Name: matches_tournament_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_tournament_id_fkey FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE;


--
-- TOC entry 1969 (class 2606 OID 17665)
-- Name: pronostics_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pronostics
    ADD CONSTRAINT pronostics_match_id_fkey FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE;


--
-- TOC entry 1960 (class 2606 OID 17620)
-- Name: rankings_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rankings
    ADD CONSTRAINT rankings_player_id_fkey FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE;


-- Completed on 2016-03-02 12:36:14 CET

--
-- PostgreSQL database dump complete
--

