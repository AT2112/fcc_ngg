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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (22, 'user_1695671087616', 2, 100);
INSERT INTO public.users VALUES (21, 'user_1695671087617', 5, 100);
INSERT INTO public.users VALUES (23, 'Kal', 1, 13);
INSERT INTO public.users VALUES (33, 'user_1695672847458', 2, 281);
INSERT INTO public.users VALUES (32, 'user_1695672847459', 5, 195);
INSERT INTO public.users VALUES (25, 'user_1695672518006', 2, 137);
INSERT INTO public.users VALUES (24, 'user_1695672518007', 5, 101);
INSERT INTO public.users VALUES (35, 'user_1695672879762', 2, 899);
INSERT INTO public.users VALUES (27, 'user_1695672553961', 2, 120);
INSERT INTO public.users VALUES (26, 'user_1695672553962', 5, 107);
INSERT INTO public.users VALUES (34, 'user_1695672879763', 5, 151);
INSERT INTO public.users VALUES (29, 'user_1695672591177', 2, 453);
INSERT INTO public.users VALUES (28, 'user_1695672591178', 5, 150);
INSERT INTO public.users VALUES (31, 'user_1695672797773', 2, 671);
INSERT INTO public.users VALUES (30, 'user_1695672797774', 5, 178);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 35, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

