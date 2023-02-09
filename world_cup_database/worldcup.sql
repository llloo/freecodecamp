--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 4, 2, 38, 39);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 2, 0, 40, 41);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 2, 1, 39, 41);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 1, 0, 38, 40);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 3, 2, 39, 42);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 2, 0, 41, 43);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 2, 1, 40, 44);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 2, 0, 38, 45);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 2, 1, 41, 46);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 1, 0, 43, 47);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 3, 2, 40, 48);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 2, 0, 44, 49);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 2, 1, 39, 50);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 2, 1, 42, 51);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 2, 1, 45, 52);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 4, 3, 38, 53);
INSERT INTO public.games VALUES (17, 2014, 'Final', 1, 0, 54, 53);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 3, 0, 55, 44);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 1, 0, 53, 55);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 7, 1, 54, 44);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 1, 0, 55, 56);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 1, 0, 53, 40);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 2, 1, 44, 46);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 1, 0, 54, 38);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 2, 1, 44, 57);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 2, 0, 46, 45);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 2, 0, 38, 58);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 2, 1, 54, 59);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 2, 1, 55, 49);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 2, 1, 56, 60);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 1, 0, 53, 47);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 2, 1, 40, 61);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (38, 'France');
INSERT INTO public.teams VALUES (39, 'Croatia');
INSERT INTO public.teams VALUES (40, 'Belgium');
INSERT INTO public.teams VALUES (41, 'England');
INSERT INTO public.teams VALUES (42, 'Russia');
INSERT INTO public.teams VALUES (43, 'Sweden');
INSERT INTO public.teams VALUES (44, 'Brazil');
INSERT INTO public.teams VALUES (45, 'Uruguay');
INSERT INTO public.teams VALUES (46, 'Colombia');
INSERT INTO public.teams VALUES (47, 'Switzerland');
INSERT INTO public.teams VALUES (48, 'Japan');
INSERT INTO public.teams VALUES (49, 'Mexico');
INSERT INTO public.teams VALUES (50, 'Denmark');
INSERT INTO public.teams VALUES (51, 'Spain');
INSERT INTO public.teams VALUES (52, 'Portugal');
INSERT INTO public.teams VALUES (53, 'Argentina');
INSERT INTO public.teams VALUES (54, 'Germany');
INSERT INTO public.teams VALUES (55, 'Netherlands');
INSERT INTO public.teams VALUES (56, 'Costa Rica');
INSERT INTO public.teams VALUES (57, 'Chile');
INSERT INTO public.teams VALUES (58, 'Nigeria');
INSERT INTO public.teams VALUES (59, 'Algeria');
INSERT INTO public.teams VALUES (60, 'Greece');
INSERT INTO public.teams VALUES (61, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 61, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


