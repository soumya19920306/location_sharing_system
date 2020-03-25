--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: shared_places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shared_places (
    id bigint NOT NULL,
    user_id integer,
    shared_to character varying,
    shared_latitude numeric(11,8),
    shared_longitude numeric(11,8),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.shared_places OWNER TO postgres;

--
-- Name: shared_places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shared_places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shared_places_id_seq OWNER TO postgres;

--
-- Name: shared_places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shared_places_id_seq OWNED BY public.shared_places.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    username character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: shared_places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shared_places ALTER COLUMN id SET DEFAULT nextval('public.shared_places_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-03-20 18:38:41.880258	2020-03-20 18:38:41.880258
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20200320183810
20200321204043
\.


--
-- Data for Name: shared_places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shared_places (id, user_id, shared_to, shared_latitude, shared_longitude, created_at, updated_at) FROM stdin;
8	1	public	22.62604366	88.43016744	2020-03-24 19:53:21.334365	2020-03-24 19:53:21.334365
9	1	public	22.62578618	88.43093991	2020-03-24 19:55:44.900143	2020-03-24 19:55:44.900143
10	1	2	22.62537025	88.43121886	2020-03-24 19:55:51.553424	2020-03-24 19:55:51.553424
11	1	3	22.62537025	88.43121886	2020-03-24 19:55:51.567766	2020-03-24 19:55:51.567766
12	2	public	22.61911132	88.42072606	2020-03-25 04:37:05.116778	2020-03-25 04:37:05.116778
13	2	1	22.62208237	88.42830062	2020-03-25 04:37:13.518957	2020-03-25 04:37:13.518957
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, username) FROM stdin;
1	a@test.com	$2a$11$./997QAiVQg/IYZlRYFnJe1qIBQQ59Fu42qoY.kYZQfDoD5lBZ.wO	\N	\N	\N	2020-03-20 19:27:28.825563	2020-03-20 19:27:28.825563	test1
2	b@test.com	$2a$11$FR/pVTwRhHZqyzmOXRLgC.AmEjmNslTGn3SxDh/x4grfFEGpYz/Tq	\N	\N	\N	2020-03-20 19:27:29.538724	2020-03-20 19:27:29.538724	test2
3	c@test.com	$2a$11$tC0RCdwYWMAZ7DnTlOXBNOTqBUJIgJak2r6/HzXQnrg0NzA6d/SPi	\N	\N	\N	2020-03-20 19:27:29.725221	2020-03-20 19:27:29.725221	test3
5	soumya@test.com	$2a$11$Hb3KEu42pdw1lhAvdVLxweAsrUv63Fe9YiRYBvdirtGKqVftUtnZ6	\N	\N	\N	2020-03-25 15:35:14.686337	2020-03-25 15:35:14.686337	Soumya
\.


--
-- Name: shared_places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shared_places_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shared_places shared_places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shared_places
    ADD CONSTRAINT shared_places_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

