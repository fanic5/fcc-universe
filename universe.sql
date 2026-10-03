--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: category; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(50) NOT NULL,
    rating integer NOT NULL,
    value numeric(6,2) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    planet_id integer
);


ALTER TABLE public.category OWNER TO freecodecamp;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO freecodecamp;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    discovery_year integer,
    diameter integer,
    mass_galaxy numeric(4,2),
    description text,
    is_observed boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    discovery_year integer,
    diameter integer,
    mass_moon numeric(4,2),
    description text,
    is_observed boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    discovery_year integer,
    diameter integer,
    mass_planet numeric(7,2),
    description text,
    is_observed boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    discovery_year integer,
    diameter integer,
    mass_star numeric(4,2),
    description text,
    is_observed boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.category VALUES (1, 'Habitable', 5, 99.99, true, true, 3);
INSERT INTO public.category VALUES (2, 'Gas Gigant', 3, 75.00, false, false, 5);
INSERT INTO public.category VALUES (3, 'Terrestrisch', 4, 80.00, true, false, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 105000, 1.50, 'Spiralgalaxie die das SONNENSYSTEM enthält.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1650, 220000, 1.23, 'Große Spiralgalaxie im Andromeda Haufen, etwa 2.54 ly entfernt', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1764, 60000, 0.05, 'Spiralgalaxie, Mitglied der lokalen Gruppe, sehr lichtschwach', true);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 1800, 120000, 0.90, 'Spiralgalaixe, mit aktiven Kern, stark in Radio- und Röntgenbereich', false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 1790, 240000, 2.50, 'Gigantische elliptische Galaxie, Host des berühmten Jet-Parameters', false);
INSERT INTO public.galaxy VALUES (6, 'L. Magellanic Cloud', 0, 14000, 0.10, 'Irreguläre Zwerggalxie, stark vom Sternentshungsgebiet geprägt.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 3474, NULL, 'Unser einziger natürlicher Satellit', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 22, NULL, 'Kleiner, schnell umkreisender Mond', true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 13, NULL, 'Sehr kleiner, rauer Mond', true, 4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 3643, NULL, 'Vulkanisch aktivster Mond im Sonnensystem', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 3122, NULL, 'Eisiger Ozean‑Kandidat', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymed', NULL, 5268, NULL, 'Größter Mond im Sonnensystem', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 4821, NULL, 'Stark verkraterter, eisiger Mond', true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 250, NULL, 'Kleiner unregelmäßiger Mond', true, 5);
INSERT INTO public.moon VALUES (9, 'Thebe', NULL, 100, NULL, 'Kleiner, unregelmäßiger Mond', true, 5);
INSERT INTO public.moon VALUES (10, 'Titan', NULL, 5151, NULL, 'Dickste Atmosphäre aller Monde, Stickstoff‑Regen', true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', NULL, 504, NULL, 'Wasser‑Eruptionsvulkanismus, möglicher Ozean', true, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', NULL, 396, NULL, 'Klein, stark verkrast', true, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', NULL, 1062, NULL, 'Eisiger Mond mit großen Kratern', true, 6);
INSERT INTO public.moon VALUES (14, 'Dione', NULL, 1122, NULL, 'Eisiger Mond mit „Kraterschluchten“', true, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', NULL, 1527, NULL, 'Zweitgrößter Saturnmond, dünne Atmosphäre', true, 6);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, 1578, NULL, 'Größter Mond des Uranus', true, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', NULL, 1523, NULL, 'Zweitgrößter Mond, stark verkrast', true, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', NULL, 1158, NULL, 'Eisiger Mond, Oberflächenfurchen', true, 7);
INSERT INTO public.moon VALUES (19, 'Triton', NULL, 2710, NULL, 'Retrograd umkreisender Mond, eisiger Vulkanismus', true, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', NULL, 340, NULL, 'Sehr exzentrischer Orbit, kleiner Mond', true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Merkur', 0, 4879, 0.06, 'Kleinster sonnennaher Planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 12104, 0.82, 'Dichter, erdähnlicher Planet mit dicker CO2-Atmosphäre', true, 1);
INSERT INTO public.planet VALUES (3, 'Erde', 0, 12742, 1.00, 'Unsere Erde', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0, 6779, 0.11, 'Roter Planet', true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, 139822, 317.83, 'Gasriese', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0, 116464, 95.16, 'Berühmt für ausgeprägtes Ringsystem', true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 0, 50724, 14.54, 'Eisriese', true, 1);
INSERT INTO public.planet VALUES (8, 'Neptun', 0, 49244, 17.14, 'Ähnlich Uranus, aber starkes Magnetfeld', true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2016, 11400, 1.27, 'Erdböser Exoplanet inde rhabitalen Zone des nächsten Sterns.', true, 2);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2020, 14800, 7.00, 'Super-Erde, etwas weiter von Proxima Centauri entfernt.', true, 2);
INSERT INTO public.planet VALUES (11, 'Proxima d', 2022, 9500, 0.25, 'Kleiner, felsiger Kandidat, noch nicht vollständig bestätigt', true, 2);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 2012, 12200, 4.30, 'Super-Erde, im inneren der habitalen Zone von Tau Ceti', true, 7);
INSERT INTO public.planet VALUES (13, 'Tau Ceti f', 2017, 13500, 5.40, 'Super-Erde, in habitabler Zone von Tau Ceti', true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 1391000, 1.00, 'G-2 V-Hauptreihenstern, Zentrum unseres Sonnensystems.', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1915, 200000, 0.12, 'Nächster Stern zur Erde, roter Zwerg, Teil des Alpha-Centauri-Systems.', true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1800, 1640000000, 11.60, 'Roter Überriese im Orion, stark variabel und massereich', true, 1);
INSERT INTO public.star VALUES (4, 'Vega', 1850, 2362000, 2.14, 'A0 V-Hauptreihenstern, oft genutztes photometrisches Referenzobjekt.', true, 2);
INSERT INTO public.star VALUES (5, 'M31 Hubble Var', 1935, 30000, 0.60, 'Cepheiden-Variable, wichtig für Entfernungsbestimmungen.', true, 2);
INSERT INTO public.star VALUES (6, 'RMC-127', 1975, 13000000, 18.00, 'Wolf-Rayet-Stern ind er Lage der Magellanic Cloud, stark massenabtragend.', true, 6);
INSERT INTO public.star VALUES (7, 'Tau Ceti', 2004, 1220000, 0.78, 'G8.5 V-Stern, einer der sonnennächsten und gut untersucht.', true, 1);
INSERT INTO public.star VALUES (8, 'Tau Ceti B', 2004, 800000, 0.65, 'Zweiter Stern im Tau‑Ceti‑System, ein roter Zwerg.', true, 1);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.category_category_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: category category_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

