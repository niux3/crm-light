--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-0+deb11u1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-0+deb11u1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO renaud;

--
-- Name: companies_civilities; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.companies_civilities (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.companies_civilities OWNER TO renaud;

--
-- Name: companies_civilities_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.companies_civilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_civilities_id_seq OWNER TO renaud;

--
-- Name: companies_civilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.companies_civilities_id_seq OWNED BY public.companies_civilities.id;


--
-- Name: companies_companies; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.companies_companies (
    id integer NOT NULL,
    name character varying,
    enseigne character varying,
    slug character varying,
    email character varying,
    blacklist boolean,
    date_blacklist timestamp without time zone,
    description_blacklist text,
    website character varying,
    created_date timestamp without time zone,
    phone character varying,
    fax character varying,
    siren character varying,
    siret character varying,
    description text,
    capital integer,
    ca_year integer,
    naf character varying,
    created timestamp without time zone,
    updated timestamp without time zone,
    address text,
    len_employees integer
);


ALTER TABLE public.companies_companies OWNER TO renaud;

--
-- Name: companies_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.companies_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_companies_id_seq OWNER TO renaud;

--
-- Name: companies_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.companies_companies_id_seq OWNED BY public.companies_companies.id;


--
-- Name: companies_employees; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.companies_employees (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    slug character varying,
    email character varying,
    blacklist boolean,
    date_blacklist timestamp without time zone,
    description_blacklist text,
    website character varying,
    linkedin character varying,
    mobile character varying,
    phone character varying,
    description text,
    created timestamp without time zone,
    updated timestamp without time zone,
    company_id integer,
    civility_id integer,
    function_id integer,
    sector_activity_id integer,
    address text
);


ALTER TABLE public.companies_employees OWNER TO renaud;

--
-- Name: companies_employees_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.companies_employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_employees_id_seq OWNER TO renaud;

--
-- Name: companies_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.companies_employees_id_seq OWNED BY public.companies_employees.id;


--
-- Name: companies_functions; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.companies_functions (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.companies_functions OWNER TO renaud;

--
-- Name: companies_functions_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.companies_functions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_functions_id_seq OWNER TO renaud;

--
-- Name: companies_functions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.companies_functions_id_seq OWNED BY public.companies_functions.id;


--
-- Name: companies_sector_of_activities; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.companies_sector_of_activities (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.companies_sector_of_activities OWNER TO renaud;

--
-- Name: companies_sector_of_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.companies_sector_of_activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_sector_of_activities_id_seq OWNER TO renaud;

--
-- Name: companies_sector_of_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.companies_sector_of_activities_id_seq OWNED BY public.companies_sector_of_activities.id;


--
-- Name: marketing_compaigns; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.marketing_compaigns (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.marketing_compaigns OWNER TO renaud;

--
-- Name: marketing_compaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.marketing_compaigns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_compaigns_id_seq OWNER TO renaud;

--
-- Name: marketing_compaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.marketing_compaigns_id_seq OWNED BY public.marketing_compaigns.id;


--
-- Name: marketing_diffusions_lists; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.marketing_diffusions_lists (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    data character varying,
    created timestamp without time zone,
    updated timestamp without time zone,
    campaign_id integer
);


ALTER TABLE public.marketing_diffusions_lists OWNER TO renaud;

--
-- Name: marketing_diffusions_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.marketing_diffusions_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_diffusions_lists_id_seq OWNER TO renaud;

--
-- Name: marketing_diffusions_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.marketing_diffusions_lists_id_seq OWNED BY public.marketing_diffusions_lists.id;


--
-- Name: marketing_emails; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.marketing_emails (
    id integer NOT NULL,
    template_html character varying,
    template_text character varying,
    created timestamp without time zone,
    updated timestamp without time zone,
    campaign_id integer
);


ALTER TABLE public.marketing_emails OWNER TO renaud;

--
-- Name: marketing_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.marketing_emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_emails_id_seq OWNER TO renaud;

--
-- Name: marketing_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.marketing_emails_id_seq OWNED BY public.marketing_emails.id;


--
-- Name: pages_pages; Type: TABLE; Schema: public; Owner: renaud
--

CREATE TABLE public.pages_pages (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    body text,
    is_online boolean,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.pages_pages OWNER TO renaud;

--
-- Name: pages_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: renaud
--

CREATE SEQUENCE public.pages_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_pages_id_seq OWNER TO renaud;

--
-- Name: pages_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renaud
--

ALTER SEQUENCE public.pages_pages_id_seq OWNED BY public.pages_pages.id;


--
-- Name: companies_civilities id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_civilities ALTER COLUMN id SET DEFAULT nextval('public.companies_civilities_id_seq'::regclass);


--
-- Name: companies_companies id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_companies ALTER COLUMN id SET DEFAULT nextval('public.companies_companies_id_seq'::regclass);


--
-- Name: companies_employees id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees ALTER COLUMN id SET DEFAULT nextval('public.companies_employees_id_seq'::regclass);


--
-- Name: companies_functions id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_functions ALTER COLUMN id SET DEFAULT nextval('public.companies_functions_id_seq'::regclass);


--
-- Name: companies_sector_of_activities id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_sector_of_activities ALTER COLUMN id SET DEFAULT nextval('public.companies_sector_of_activities_id_seq'::regclass);


--
-- Name: marketing_compaigns id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_compaigns ALTER COLUMN id SET DEFAULT nextval('public.marketing_compaigns_id_seq'::regclass);


--
-- Name: marketing_diffusions_lists id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_diffusions_lists ALTER COLUMN id SET DEFAULT nextval('public.marketing_diffusions_lists_id_seq'::regclass);


--
-- Name: marketing_emails id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_emails ALTER COLUMN id SET DEFAULT nextval('public.marketing_emails_id_seq'::regclass);


--
-- Name: pages_pages id; Type: DEFAULT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.pages_pages ALTER COLUMN id SET DEFAULT nextval('public.pages_pages_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.alembic_version (version_num) FROM stdin;
2727ff7cba92
\.


--
-- Data for Name: companies_civilities; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.companies_civilities (id, name, slug, created, updated) FROM stdin;
1	Monsieur	monsieur	2025-01-21 16:13:20.508026	2025-01-21 16:13:20.508031
2	Madame	madame	2025-01-21 16:13:26.868493	2025-01-21 16:13:26.868497
\.


--
-- Data for Name: companies_companies; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.companies_companies (id, name, enseigne, slug, email, blacklist, date_blacklist, description_blacklist, website, created_date, phone, fax, siren, siret, description, capital, ca_year, naf, created, updated, address, len_employees) FROM stdin;
1	SAS Les Filles & Les Garçons de la Tech	\N	sas-les-filles-les-garcons-de-la-tech	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:20.524328	2025-01-21 16:13:20.524331	Toulouse, Occitanie, France,Toulouse,FR	1
2	https://www.atawiz.fr	\N	https-www-atawiz-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:26.882995	2025-01-21 16:13:26.883	Île-de-France, France	1
3	SAVANE CONSULTING	\N	savane-consulting	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:26.90611	2025-01-21 16:13:26.906114	Paris (75)	1
4	ZSoft	\N	zsoft	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:26.942965	2025-01-21 16:13:26.942977	92300 Levallois-Perret	1
5	https://empiric.com	\N	https-empiric-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:26.977271	2025-01-21 16:13:26.977275	Greater Strasbourg Metropolitan Area	1
6	https://www.coexya.eu/	\N	https-www-coexya-eu	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:26.999323	2025-01-21 16:13:26.999327	69000 Lyon	1
7	Prerequis	\N	prerequis	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.01518	2025-01-21 16:13:27.015183	92130 Issy-les-Moulineaux	1
8	http://www.wekey.fr	\N	http-www-wekey-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.031313	2025-01-21 16:13:27.031316	Niort, Nouvelle-Aquitaine, France	1
9	https://www.rheso.tech/	\N	https-www-rheso-tech	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.047936	2025-01-21 16:13:27.047939	Marseille, Provence-Alpes-Côte d'Azur, France	1
10	PROPULSE IT	\N	propulse-it	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.064457	2025-01-21 16:13:27.064459	Paris, Île-de-France, France	1
11	accure	\N	accure	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.080755	2025-01-21 16:13:27.080758	Paris, Île-de-France, France	1
12	https://bloomays.com	\N	https-bloomays-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.097427	2025-01-21 16:13:27.09743	Paris (75)	1
13	Insitoo Freelances	\N	insitoo-freelances	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.114686	2025-01-21 16:13:27.114689	59000 Lille	1
14	Management Square	\N	management-square	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.131102	2025-01-21 16:13:27.131105	92100 Boulogne-Billancourt	1
15	https://app.cherry-pick.io	\N	https-app-cherry-pick-io	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.148734	2025-01-21 16:13:27.148737	Paris, Île-de-France, France	1
16	CCL CONSULTING	\N	ccl-consulting	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.171284	2025-01-21 16:13:27.171298	Greater Paris Metropolitan Region	1
17	Swan (France)	\N	swan-france	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.213818	2025-01-21 16:13:27.213823	168 Rue Saint-Maur, 75011 Paris, France,Paris,FR	1
18		\N		\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.229215	2025-01-21 16:13:27.229218	Paris (75)	1
19	Etixway	\N	etixway	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.245744	2025-01-21 16:13:27.245747	59000 Lille	1
20	https://www.seatpi.com	\N	https-www-seatpi-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.273013	2025-01-21 16:13:27.273023	La Défense (92)	1
21	Groupe SYD	\N	groupe-syd	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.31052	2025-01-21 16:13:27.310525	Nantes, Pays de la Loire, France	1
22	SEA TPI	\N	sea-tpi	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.331057	2025-01-21 16:13:27.331063	La Défense (92)	1
23	http://www.deodis.fr	\N	http-www-deodis-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.356913	2025-01-21 16:13:27.356919	34000 Montpellier	1
24	Keyce Academy	\N	keyce-academy	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.38312	2025-01-21 16:13:27.383126	97200 Fort-de-France	1
25	MEETSHAKE	\N	meetshake	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:27.409992	2025-01-21 16:13:27.409999	92130 Issy-les-Moulineaux	1
26	DGTL Performance	\N	dgtl-performance	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.689262	2025-01-21 16:13:37.689273	Rennes, Brittany, France	1
27	Infotel	\N	infotel	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.721709	2025-01-21 16:13:37.721714	Paris (75)	1
28	Atawiz	\N	atawiz	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.739392	2025-01-21 16:13:37.739397	Île-de-France, France	1
29	https://www.adsearch.fr	\N	https-www-adsearch-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.776982	2025-01-21 16:13:37.776992	Condé-sur-Vire, Normandy, France	1
30	DCS EASYWARE	\N	dcs-easyware	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.815991	2025-01-21 16:13:37.816004	92230 Gennevilliers	1
31	Frisbee Profiling	\N	frisbee-profiling	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.841447	2025-01-21 16:13:37.841451	Paris (75)	1
32	Harnham	\N	harnham	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.882374	2025-01-21 16:13:37.882388	Paris, Île-de-France, France	1
33	Oiko gestion	\N	oiko-gestion	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.921243	2025-01-21 16:13:37.92126	Lyon, Auvergne-Rhone-Alpes, France,Lyon,FR	1
34	Trustt	\N	trustt	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.955696	2025-01-21 16:13:37.955703	Rennes, Brittany, France,Rennes,FR	1
35	https://www.cybelangel.com	\N	https-www-cybelangel-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:37.984529	2025-01-21 16:13:37.984534	Paris (75)	1
36	https://www.swan.io	\N	https-www-swan-io	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.003779	2025-01-21 16:13:38.003784	168 Rue Saint-Maur, 75011 Paris, France,Paris,FR	1
37	Siderlog	\N	siderlog	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.029709	2025-01-21 16:13:38.029714	44000 Nantes	1
38	CELAD	\N	celad	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.055509	2025-01-21 16:13:38.055514	06410 Biot	1
39	WORKSOFT	\N	worksoft	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.080778	2025-01-21 16:13:38.080787	Aix-en-Provence, Provence-Alpes-Côte d'Azur, France	1
40	Cenareo	\N	cenareo	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.109497	2025-01-21 16:13:38.109502	Toulouse, Occitanie, France	1
41	https://www.noveogroup.com	\N	https-www-noveogroup-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.142256	2025-01-21 16:13:38.142261	Paris, Île-de-France, France	1
42	OCSI Group	\N	ocsi-group	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.159398	2025-01-21 16:13:38.159402	Toulouse, Occitanie, France	1
43	http://www.urbanlinker.com	\N	http-www-urbanlinker-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.176507	2025-01-21 16:13:38.176509	Nantes, Pays de la Loire, France	1
44	iPepper Group	\N	ipepper-group	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.194034	2025-01-21 16:13:38.194036	Aix-en-Provence, Provence-Alpes-Côte d'Azur, France	1
45	Marlin Green	\N	marlin-green	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.209052	2025-01-21 16:13:38.209054	Paris (75)	1
46	http://www.groupedigit.com	\N	http-www-groupedigit-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:38.221311	2025-01-21 16:13:38.221314	76140 Le Petit-Quevilly	1
47	http://www.groupe-creative.fr	\N	http-www-groupe-creative-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:50.962633	2025-01-21 16:13:50.962636	44000 Nantes	1
48	KARMA PARTNERS	\N	karma-partners	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:50.980807	2025-01-21 16:13:50.980812	06560 Valbonne	1
49	https://www.kicklox.com	\N	https-www-kicklox-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:50.995757	2025-01-21 16:13:50.995762	Paris, Île-de-France, France	1
50	https://www.mirakl.com	\N	https-www-mirakl-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.015541	2025-01-21 16:13:51.015545	12 Rue de Lübeck, 75116 Paris, France,Paris,FR	1
51	INOVELYA	\N	inovelya	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.030251	2025-01-21 16:13:51.030256	Nice (06)	1
52	https://www.techyourside.com	\N	https-www-techyourside-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.049054	2025-01-21 16:13:51.049058	Paris, Île-de-France, France	1
53	Nextep HR	\N	nextep-hr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.062937	2025-01-21 16:13:51.062943	Capinghem, Hauts-de-France, France	1
54	Noveo, LLP	\N	noveo-llp	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.077375	2025-01-21 16:13:51.077379	Paris, Île-de-France, France	1
55	Talent Brut	\N	talent-brut	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.098694	2025-01-21 16:13:51.098699	78180 Montigny-le-Bretonneux	1
56	QIMA Limited	\N	qima-limited	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.111149	2025-01-21 16:13:51.111152	Lille, Hauts-de-France, France	1
57	Tomorhow for WOM	\N	tomorhow-for-wom	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.12707	2025-01-21 16:13:51.127072	Lyon, Auvergne-Rhône-Alpes, France	1
58	Revolt.eco	\N	revolt-eco	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.160323	2025-01-21 16:13:51.160334	Paris, Île-de-France, France	1
59	ami Consulting	\N	ami-consulting	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.204373	2025-01-21 16:13:51.204381	Lille, Hauts-de-France, France	1
60	http://www.havana-it.com	\N	http-www-havana-it-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.237198	2025-01-21 16:13:51.237203	Lacaussade, Nouvelle-Aquitaine, France	1
61	StrangeBee	\N	strangebee	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.259111	2025-01-21 16:13:51.259115	25 Rue de Tolbiac, 75013 Paris, France,Paris,FR	1
62	https://www.dominoconsulting.fr	\N	https-www-dominoconsulting-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.275805	2025-01-21 16:13:51.27581	Capinghem, Hauts-de-France, France	1
63	hn services	\N	hn-services	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.291509	2025-01-21 16:13:51.291513	Paris (75)	1
64	DSI GROUP	\N	dsi-group	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.310054	2025-01-21 16:13:51.310057	Le Plessis-Robinson (92)	1
65	Groupe ITEA-Rh	\N	groupe-itea-rh	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.323725	2025-01-21 16:13:51.323727	Sélestat, Grand Est, France	1
66	Adsearch	\N	adsearch	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.342125	2025-01-21 16:13:51.342129	Nanterre, Île-de-France, France	1
67	https://www.anywr-group.com/	\N	https-www-anywr-group-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.356237	2025-01-21 16:13:51.356241	59000 Lille	1
68	http://www.prerequis.com	\N	http-www-prerequis-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.376598	2025-01-21 16:13:51.376602	Paris (75)	1
69	LeHibou	\N	lehibou	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:51.397686	2025-01-21 16:13:51.39769	Angers	1
70	Groupe SII	\N	groupe-sii	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.144103	2025-01-21 16:13:58.144107	Le Mans, Pays de la Loire, France	1
71	Scalian	\N	scalian	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.162975	2025-01-21 16:13:58.162979	Lille, Hauts-de-France, France	1
72	ALTAIDE	\N	altaide	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.176902	2025-01-21 16:13:58.176905	France	1
73	TapNation	\N	tapnation	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.188199	2025-01-21 16:13:58.188202	France	1
74	Anywr Canada	\N	anywr-canada	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.197916	2025-01-21 16:13:58.197918	Paris (75)	1
75	Média-Participations	\N	media-participations	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.208047	2025-01-21 16:13:58.20805	Paris, Île-de-France, France	1
76	http://www.reboot-conseil.com	\N	http-www-reboot-conseil-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.218174	2025-01-21 16:13:58.218177	Strasbourg, Grand Est, France	1
77	Charly Recruteurs Engagés	\N	charly-recruteurs-engages	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.241675	2025-01-21 16:13:58.241684	Aix-en-Provence, Provence-Alpes-Côte d'Azur, France	1
78	TRSB	\N	trsb	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.275895	2025-01-21 16:13:58.275901	69000 Lyon	1
79	Agence Cube	\N	agence-cube	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.300263	2025-01-21 16:13:58.300266	Paris, Île-de-France, France	1
80	https://www.charly.co/	\N	https-www-charly-co	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.308685	2025-01-21 16:13:58.308688	Aix-en-Provence, Provence-Alpes-Côte d'Azur, France	1
81	https://www.deletec.fr	\N	https-www-deletec-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.325291	2025-01-21 16:13:58.325293	Paris, Île-de-France, France	1
82	https://site.mosica.fr	\N	https-site-mosica-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.334131	2025-01-21 16:13:58.334134	Niort, Nouvelle-Aquitaine, France	1
83	Kidizz	\N	kidizz	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.343227	2025-01-21 16:13:58.343229	Île-de-France, France	1
84	https://syd.fr/	\N	https-syd-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.350392	2025-01-21 16:13:58.350395	Nantes, Pays de la Loire, France	1
85	Bloomays	\N	bloomays	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.35998	2025-01-21 16:13:58.359982	Paris (75)	1
86	https://www.tap-nation.io	\N	https-www-tap-nation-io	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.371542	2025-01-21 16:13:58.371547	France	1
87	https://htechsupports.com	\N	https-htechsupports-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.380552	2025-01-21 16:13:58.380554	Écully, Auvergne-Rhône-Alpes, France	1
88	Millenials.io	\N	millenials-io	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.392002	2025-01-21 16:13:58.392005	69000 Lyon	1
89	Innova Solutions	\N	innova-solutions	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.402131	2025-01-21 16:13:58.402134	Paris, Île-de-France, France	1
90	IDEAL MATCH	\N	ideal-match	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.412359	2025-01-21 16:13:58.412361	Limonest, Auvergne-Rhône-Alpes, France	1
91	https://www.naxxum.com 	\N	https-www-naxxum-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:13:58.424166	2025-01-21 16:13:58.424168	Paris, Île-de-France, France	1
92	https://www.hoxtonpartners.com	\N	https-www-hoxtonpartners-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.10193	2025-01-21 16:14:14.101935	Paris (75)	1
93	ABIOXIR	\N	abioxir	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.109654	2025-01-21 16:14:14.109656	06800 Cagnes-sur-Mer	1
94	http://www.zsoft-consulting.com	\N	http-www-zsoft-consulting-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.12171	2025-01-21 16:14:14.121712	92300 Levallois-Perret	1
95	OOSTAOO CONSULTING	\N	oostaoo-consulting	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.12968	2025-01-21 16:14:14.129684	Île-de-France, France	1
96	DIGIT	\N	digit	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.140423	2025-01-21 16:14:14.140426	76140 Le Petit-Quevilly	1
97	http://www.ltd-international.com	\N	http-www-ltd-international-com	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.148737	2025-01-21 16:14:14.14874	Paris, Île-de-France, France	1
98	EXteam	\N	exteam	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.156059	2025-01-21 16:14:14.156061	Paris (75)	1
99	ALXDR	\N	alxdr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.166229	2025-01-21 16:14:14.166232	Paris, Île-de-France, France	1
100	ABYLSEN STRA	\N	abylsen-stra	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.182505	2025-01-21 16:14:14.182516	Lille, Hauts-de-France, France	1
101	https://ocsigroup.fr	\N	https-ocsigroup-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.213936	2025-01-21 16:14:14.213949	Nantes, Pays de la Loire, France	1
102	Urban Radar	\N	urban-radar	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.252982	2025-01-21 16:14:14.252989	14 Rue Alexandre Parodi, 75010 Paris, France,Paris,FR	1
103	AKERWISE	\N	akerwise	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.273381	2025-01-21 16:14:14.273385	44000 Nantes	1
104	Mirakl	\N	mirakl	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.288086	2025-01-21 16:14:14.28809	France	1
105	Aleysia	\N	aleysia	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.301771	2025-01-21 16:14:14.301774	Lyon, Auvergne-Rhône-Alpes, France	1
106	http://www.selfing.fr	\N	http-www-selfing-fr	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.314732	2025-01-21 16:14:14.314736	59790 Ronchin	1
107	Coexya	\N	coexya	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:14.326872	2025-01-21 16:14:14.326875	69000 Lyon	1
108	5 com consulting	\N	5-com-consulting	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:20.670848	2025-01-21 16:14:20.670854	Boulogne Billancourt	1
109	esmoz	\N	esmoz	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-21 16:14:27.709013	2025-01-21 16:14:27.709019	Levallois Perret	1
\.


--
-- Data for Name: companies_employees; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.companies_employees (id, firstname, lastname, slug, email, blacklist, date_blacklist, description_blacklist, website, linkedin, mobile, phone, description, created, updated, company_id, civility_id, function_id, sector_activity_id, address) FROM stdin;
1	Renaud	Bourdeau	renaud-bourdeau	renaudbourdeau@gmail.com	f	\N	\N	\N	https://www.linkedin.com/in/fabien-amico-8bb85227	\N	\N	\N	2025-01-21 16:13:20.538986	2025-01-21 16:13:20.53899	1	1	1	\N	\N
2	Damla	Karabag	damla-karabag	dkarabag@atawiz.fr	f	\N	\N	\N	https://www.linkedin.com/in/damla-karabag-142a74104	\N	\N	\N	2025-01-21 16:13:26.891718	2025-01-21 16:13:26.891724	2	2	2	\N	\N
3	Solene	Baranek	solene-baranek	solene.baranek@savane-consulting.com	f	\N	\N	\N	https://www.linkedin.com/in/solène-baranek-06152522	\N	\N	\N	2025-01-21 16:13:26.914546	2025-01-21 16:13:26.914551	3	2	3	\N	\N
4	Omar	Fakir	omar-fakir	omar.fakir@zsoft-consulting.com	f	\N	\N	\N	https://www.linkedin.com/in/ofakir	\N	\N	\N	2025-01-21 16:13:26.960457	2025-01-21 16:13:26.960466	4	1	4	\N	\N
5	Yannis	Hannachi	yannis-hannachi	yannis.hannachi@empiric.com	f	\N	\N	\N	https://www.linkedin.com/in/yannis-hannachi-64304725a	\N	\N	\N	2025-01-21 16:13:26.985022	2025-01-21 16:13:26.985028	5	1	5	\N	\N
6	Alexia	Pitiot	alexia-pitiot	alexia.pitiot@coexya.eu	f	\N	\N	\N	https://www.linkedin.com/in/alexia-pitiot-42600174	\N	\N	\N	2025-01-21 16:13:27.007671	2025-01-21 16:13:27.007675	6	2	6	\N	\N
7	Julie	Cossic	julie-cossic	jcossic@prerequis.com	f	\N	\N	\N	https://www.linkedin.com/in/julie-cossic-a050ba1a4	\N	\N	\N	2025-01-21 16:13:27.021233	2025-01-21 16:13:27.021237	7	2	6	\N	\N
8	Marine	Lapeyronnie	marine-lapeyronnie	marine.lapeyronnie@wekey.fr	f	\N	\N	\N	https://www.linkedin.com/in/marine-lapeyronnie-b919a1a3	\N	\N	\N	2025-01-21 16:13:27.037193	2025-01-21 16:13:27.037196	8	2	7	\N	\N
9	Johana	Nang-Bekale	johana-nang-bekale	johana@rheso.tech	f	\N	\N	\N	https://www.linkedin.com/in/johana-rotszyld-nang-bekale-17264717	\N	\N	\N	2025-01-21 16:13:27.053857	2025-01-21 16:13:27.053861	9	2	8	\N	\N
10	Laurent	Duhal	laurent-duhal	lduhal@propulse-it.fr	f	\N	\N	\N	https://www.linkedin.com/in/laurent-duhal-501365	\N	\N	\N	2025-01-21 16:13:27.070318	2025-01-21 16:13:27.070321	10	1	9	\N	\N
11	Antoine	Durand	antoine-durand	adurand@accure.fr	f	\N	\N	\N	https://www.linkedin.com/in/antoined4	\N	\N	\N	2025-01-21 16:13:27.08657	2025-01-21 16:13:27.086573	11	1	10	\N	\N
12	Johan	Moscardo	johan-moscardo	johan.moscardo@bloomays.com	f	\N	\N	\N	https://www.linkedin.com/in/johan-moscardo-3928641b7	\N	\N	\N	2025-01-21 16:13:27.10409	2025-01-21 16:13:27.104094	12	1	11	\N	\N
13	Elise	Bonnet	elise-bonnet	elise.bonnet@insitoo.com	f	\N	\N	\N	https://www.linkedin.com/in/elise-bonnet-560996200	\N	\N	\N	2025-01-21 16:13:27.120509	2025-01-21 16:13:27.120512	13	2	12	\N	\N
14	Ikram	Houssa	ikram-houssa	ikram.houssa@management-square.com	f	\N	\N	\N	https://www.linkedin.com/in/ikram-houssa	\N	\N	\N	2025-01-21 16:13:27.137183	2025-01-21 16:13:27.137186	14	2	13	\N	\N
15	Yanis	Boutajar	yanis-boutajar	yanis@cherry-pick.io	f	\N	\N	\N	https://www.linkedin.com/in/yanis-boutajar-912913197	\N	\N	\N	2025-01-21 16:13:27.155007	2025-01-21 16:13:27.15501	15	1	14	\N	\N
16	Roxane	Laborde	roxane-laborde	rlaborde@ccl-consulting.fr	f	\N	\N	\N	https://www.linkedin.com/in/roxanelaborde	\N	\N	\N	2025-01-21 16:13:27.190038	2025-01-21 16:13:27.190054	16	2	15	\N	\N
17	Nicolas	Benady	nicolas-benady	nicolas.benady@swan.io	f	\N	\N	\N	https://www.linkedin.com/in/nicolasbenady	\N	\N	\N	2025-01-21 16:13:27.222587	2025-01-21 16:13:27.222591	17	1	16	\N	\N
18	Olivia	Martinie	olivia-martinie	olivia@kleever.com	f	\N	\N	\N	https://www.linkedin.com/in/olivia-martinie	\N	\N	\N	2025-01-21 16:13:27.23532	2025-01-21 16:13:27.235323	18	2	2	\N	\N
19	Meriem	Zaboub	meriem-zaboub	meriem.zaboub@etixway.com	f	\N	\N	\N	https://www.linkedin.com/in/meriem-zaboub-8a1087134	\N	\N	\N	2025-01-21 16:13:27.250994	2025-01-21 16:13:27.250997	19	2	17	\N	\N
20	Malik	Talaoughanim	malik-talaoughanim	malik.talaoughanim@seatpi.com	f	\N	\N	\N	https://www.linkedin.com/in/malik-t-28629bb1	\N	\N	\N	2025-01-21 16:13:27.288744	2025-01-21 16:13:27.288754	20	1	18	\N	\N
21	Julie	Bouete	julie-bouete	julie.bouete@syd.fr	f	\N	\N	\N	https://www.linkedin.com/in/julie-bouete-a21330110	\N	\N	\N	2025-01-21 16:13:27.32039	2025-01-21 16:13:27.320395	21	2	19	\N	\N
22	Charlotte	Plessias	charlotte-plessias	charlotte.plessias@seatpi.com	f	\N	\N	\N	https://www.linkedin.com/in/charlotte-plessias-611161131	\N	\N	\N	2025-01-21 16:13:27.341172	2025-01-21 16:13:27.341179	22	2	6	\N	\N
23	Fany	Rasamimanana	fany-rasamimanana	fany.rasamimanana@deodis.com	f	\N	\N	\N	https://www.linkedin.com/in/fany-rasamimanana-03a2a215b	\N	\N	\N	2025-01-21 16:13:27.367277	2025-01-21 16:13:27.367283	23	2	20	\N	\N
24	Benoit	Taillefer	benoit-taillefer	b.taillefer@keyce.fr	f	\N	\N	\N	https://www.linkedin.com/in/benoit-taillefer	\N	\N	\N	2025-01-21 16:13:27.392912	2025-01-21 16:13:27.392917	24	1	21	\N	\N
25	Sarah	Cossa	sarah-cossa	sarah.cossa@meetshake.io	f	\N	\N	\N	https://www.linkedin.com/in/sarah-cossa-b03445160	\N	\N	\N	2025-01-21 16:13:27.419881	2025-01-21 16:13:27.419886	25	2	22	\N	\N
26	Bastien	Poirier	bastien-poirier	bastien.poirier@inexsya.com	f	\N	\N	\N	https://www.linkedin.com/in/bastienpoirier	\N	\N	\N	2025-01-21 16:13:37.660596	2025-01-21 16:13:37.660601	18	1	23	\N	\N
27	Alexis	Dardaine	alexis-dardaine	alexis.dardaine@dgtl-performance.com	f	\N	\N	\N	https://www.linkedin.com/in/alexis-dardaine-875831141	\N	\N	\N	2025-01-21 16:13:37.705883	2025-01-21 16:13:37.705891	26	1	24	\N	\N
28	Eric	Fabretti	eric-fabretti	eric.fabretti@infotel.com	f	\N	\N	\N	https://www.linkedin.com/in/eric-fabretti-064122117	\N	\N	\N	2025-01-21 16:13:37.730151	2025-01-21 16:13:37.730156	27	1	25	\N	\N
29	Smail	Aissaoui	smail-aissaoui	saissaoui@atawiz.fr	f	\N	\N	\N	https://www.linkedin.com/in/smaïl-aïssaoui	\N	\N	\N	2025-01-21 16:13:37.757068	2025-01-21 16:13:37.757085	28	1	9	\N	\N
30	Marine	Merlet	marine-merlet	marine.merlet@adsearch.fr	f	\N	\N	\N	https://www.linkedin.com/in/marine-merlet-01b804187	\N	\N	\N	2025-01-21 16:13:37.792893	2025-01-21 16:13:37.792901	29	2	6	\N	\N
31	Laetitia	Daniel	laetitia-daniel	l.daniel@dcsit-group.com	f	\N	\N	\N	https://www.linkedin.com/in/laetitiadaniel	\N	\N	\N	2025-01-21 16:13:37.828075	2025-01-21 16:13:37.82808	30	2	26	\N	\N
32	Sandrine	Ricard	sandrine-ricard	s.ricard@frisbee-profiling.fr	f	\N	\N	\N	https://www.linkedin.com/in/sandrinericard	\N	\N	\N	2025-01-21 16:13:37.849589	2025-01-21 16:13:37.849593	31	2	27	\N	\N
33	Cécilia	Bellaïche	cecilia-bellaiche	cecilia.bellaiche@millenials.io	f	\N	\N	\N	https://www.linkedin.com/in/cécilia-bellaïche-🚀-369548174	\N	\N	\N	2025-01-21 16:13:37.864082	2025-01-21 16:13:37.864087	18	2	28	\N	\N
34	Guillian	Eller	guillian-eller	guillianeller@harnham.com	f	\N	\N	\N	https://www.linkedin.com/in/guillianeller	\N	\N	\N	2025-01-21 16:13:37.900271	2025-01-21 16:13:37.900282	32	1	29	\N	\N
35	Henri	Haquin	henri-haquin	henri.haquin@oikogestion.fr	f	\N	\N	\N	https://www.linkedin.com/in/henri-haquin-6b3bbb10	\N	\N	\N	2025-01-21 16:13:37.935709	2025-01-21 16:13:37.935717	33	1	25	\N	\N
36	Nadia	Gabriel	nadia-gabriel	nadia@trustt.io	f	\N	\N	\N	https://www.linkedin.com/in/nadia-gabriel	\N	\N	\N	2025-01-21 16:13:37.967911	2025-01-21 16:13:37.967917	34	2	30	\N	\N
37	Pierre	Guaine	pierre-guaine	pierre.guaine@cybelangel.com	f	\N	\N	\N	https://www.linkedin.com/in/pierreguaine	\N	\N	\N	2025-01-21 16:13:37.994079	2025-01-21 16:13:37.994084	35	1	31	\N	\N
38	Amelie	Berille	amelie-berille	amelie.berille@swan.io	f	\N	\N	\N	https://www.linkedin.com/in/amelie-berille	\N	\N	\N	2025-01-21 16:13:38.013392	2025-01-21 16:13:38.013398	36	2	2	\N	\N
39	Claudine	Claudine	claudine-claudine	couvrard@siderlog.fr	f	\N	\N	\N	https://www.linkedin.com/in/ouvrard-claudine-a14a6a45	\N	\N	\N	2025-01-21 16:13:38.039654	2025-01-21 16:13:38.03966	37	2	32	\N	\N
40	Angelique	Metter	angelique-metter	angelique.metter@celad.com	f	\N	\N	\N	https://www.linkedin.com/in/angélique-metter-826b77121	\N	\N	\N	2025-01-21 16:13:38.06549	2025-01-21 16:13:38.065495	38	2	33	\N	\N
41	Laurent	Rogan	laurent-rogan	laurent@worksoft.fr	f	\N	\N	\N	https://www.linkedin.com/in/laurentrogan	\N	\N	\N	2025-01-21 16:13:38.093676	2025-01-21 16:13:38.093682	39	1	9	\N	\N
42	Marion	Fouquet	marion-fouquet	marion.fouquet@cenareo.com	f	\N	\N	\N	https://www.linkedin.com/in/marion-fouquet-847281148	\N	\N	\N	2025-01-21 16:13:38.118718	2025-01-21 16:13:38.118723	40	2	34	\N	\N
43	Camille	Boillot	camille-boillot	camille.boillot@insitoo.com	f	\N	\N	\N	https://www.linkedin.com/in/camille-boillot	\N	\N	\N	2025-01-21 16:13:38.128343	2025-01-21 16:13:38.128348	18	2	12	\N	\N
44	Alexis	Ribard	alexis-ribard	alexis.ribard@noveogroup.com	f	\N	\N	\N	https://www.linkedin.com/in/alexisribard	\N	\N	\N	2025-01-21 16:13:38.151046	2025-01-21 16:13:38.15105	41	1	35	\N	\N
45	Veronique	Adam	veronique-adam	veronique.adam@ocsigroup.fr	f	\N	\N	\N	https://www.linkedin.com/in/veronique-adam-63506a20	\N	\N	\N	2025-01-21 16:13:38.166776	2025-01-21 16:13:38.166779	42	2	19	\N	\N
46	Ayann	Porta	ayann-porta	ayann@urbanlinker.com	f	\N	\N	\N	https://www.linkedin.com/in/ayann-porta	\N	\N	\N	2025-01-21 16:13:38.18256	2025-01-21 16:13:38.182563	43	1	36	\N	\N
47	Matthieu	Meusnier-Delaye	matthieu-meusnier-delaye	mmeusnier@ipepper.fr	f	\N	\N	\N	https://www.linkedin.com/in/matthieu-meusnier-delaye	\N	\N	\N	2025-01-21 16:13:38.199635	2025-01-21 16:13:38.199638	44	1	37	\N	\N
48	Lolita	Gomez	lolita-gomez	lgomez@k2partnering.com	f	\N	\N	\N	https://www.linkedin.com/in/lolita-sonia-gomez-b26531219	\N	\N	\N	2025-01-21 16:13:38.214996	2025-01-21 16:13:38.214999	45	2	38	\N	\N
49	Lolly	Hardy	lolly-hardy	lhardy@groupedigit.com	f	\N	\N	\N	https://www.linkedin.com/in/lolly-hardy-886591225	\N	\N	\N	2025-01-21 16:13:38.235785	2025-01-21 16:13:38.235796	46	2	6	\N	\N
50	Laure	Meunier	laure-meunier	laure.meunier@groupe-creative.fr	f	\N	\N	\N	https://www.linkedin.com/in/meunierlaure	\N	\N	\N	2025-01-21 16:13:50.969607	2025-01-21 16:13:50.969611	47	2	39	\N	\N
51	Anouchka	Gravenhorst	anouchka-gravenhorst	agravenhorst@karma-partners.com	f	\N	\N	\N	https://www.linkedin.com/in/anouchka-gravenhorst	\N	\N	\N	2025-01-21 16:13:50.988147	2025-01-21 16:13:50.988151	48	2	40	\N	\N
52	Melissa	Ndengue	melissa-ndengue	melissa.ndengue@kicklox.com	f	\N	\N	\N	https://www.linkedin.com/in/melissa-ndengue-9a50ab17b	\N	\N	\N	2025-01-21 16:13:51.002865	2025-01-21 16:13:51.002869	49	2	2	\N	\N
53	Florent	Chupin	florent-chupin	florent.chupin@mirakl.com	f	\N	\N	\N	https://www.linkedin.com/in/florent-chupin	\N	\N	\N	2025-01-21 16:13:51.02239	2025-01-21 16:13:51.022394	50	1	41	\N	\N
54	Osith	Edouard	osith-edouard	oedouard@inovelya.com	f	\N	\N	\N	https://www.linkedin.com/in/osithedouard	\N	\N	\N	2025-01-21 16:13:51.037157	2025-01-21 16:13:51.03716	51	1	6	\N	\N
55	Tarik	Kalai	tarik-kalai	tarik@techyourside.com	f	\N	\N	\N	https://www.linkedin.com/in/tarik-el-kalai-228a8a54	\N	\N	\N	2025-01-21 16:13:51.055905	2025-01-21 16:13:51.055909	52	1	42	\N	\N
56	Patricia	Bibou	patricia-bibou	pbibou@dominoconsulting.fr	f	\N	\N	\N	https://www.linkedin.com/in/patricia-ayankin	\N	\N	\N	2025-01-21 16:13:51.070187	2025-01-21 16:13:51.070191	53	2	6	\N	\N
57	Agathe	Vincent	agathe-vincent	agathe.vincent@noveogroup.com	f	\N	\N	\N	https://www.linkedin.com/in/agathe-vincent-noveo	\N	\N	\N	2025-01-21 16:13:51.085177	2025-01-21 16:13:51.085182	54	2	7	\N	\N
58	Guillaume	Aubin	guillaume-aubin	guillaume@talent-brut.fr	f	\N	\N	\N	https://www.linkedin.com/in/aubinguillaume	\N	\N	\N	2025-01-21 16:13:51.105071	2025-01-21 16:13:51.105074	55	1	43	\N	\N
59	Damien	Pacaud	damien-pacaud	damien.pacaud@qima.com	f	\N	\N	\N	https://www.linkedin.com/in/damienpacaud	\N	\N	\N	2025-01-21 16:13:51.117432	2025-01-21 16:13:51.117435	56	1	23	\N	\N
60	Thomas	Regnault	thomas-regnault	thomas.regnault@wom-recrutement.com	f	\N	\N	\N	https://www.linkedin.com/in/thomas-regnault-81036818b	\N	\N	\N	2025-01-21 16:13:51.13364	2025-01-21 16:13:51.133643	57	1	44	\N	\N
61	Fabien	Defouilhoux	fabien-defouilhoux	fabien@revolt.eco	f	\N	\N	\N	https://www.linkedin.com/in/fabien-defouilhoux	\N	\N	\N	2025-01-21 16:13:51.17895	2025-01-21 16:13:51.178961	58	1	45	\N	\N
62	Lily	Saada	lily-saada	l.saada@ami-consulting.co	f	\N	\N	\N	https://www.linkedin.com/in/lily-saada-3b87b890	\N	\N	\N	2025-01-21 16:13:51.21805	2025-01-21 16:13:51.218058	59	2	46	\N	\N
63	Jules	Romeyer	jules-romeyer	j.romeyer@havana-it.com	f	\N	\N	\N	https://www.linkedin.com/in/jules-romeyer-5a73a9222	\N	\N	\N	2025-01-21 16:13:51.246353	2025-01-21 16:13:51.246358	60	1	47	\N	\N
64	Mathilde	Dommery	mathilde-dommery	mathilde.dommery@strangebee.com	f	\N	\N	\N	https://www.linkedin.com/in/mathildedommery	\N	\N	\N	2025-01-21 16:13:51.267196	2025-01-21 16:13:51.2672	61	2	48	\N	\N
65	Charlotte	Decorde	charlotte-decorde	cdecorde@dominoconsulting.fr	f	\N	\N	\N	https://www.linkedin.com/in/charlotte-decorde-95b425218	\N	\N	\N	2025-01-21 16:13:51.283601	2025-01-21 16:13:51.283605	62	2	6	\N	\N
66	Julian	Perquis	julian-perquis	jperquis@hn-services.com	f	\N	\N	\N	https://www.linkedin.com/in/julianperquis	\N	\N	\N	2025-01-21 16:13:51.298743	2025-01-21 16:13:51.298747	63	1	7	\N	\N
67	Bassem	Mahmoud	bassem-mahmoud	bassem.mahmoud@group-dsi.com	f	\N	\N	\N	https://www.linkedin.com/in/bassem-mahmoud-33275936	\N	\N	\N	2025-01-21 16:13:51.316873	2025-01-21 16:13:51.316876	64	1	49	\N	\N
68	Laura	Hager	laura-hager	laura.hager@itea-rh.fr	f	\N	\N	\N	https://www.linkedin.com/in/laura-hager-41a43110b	\N	\N	\N	2025-01-21 16:13:51.330724	2025-01-21 16:13:51.330728	65	2	7	\N	\N
69	Antoine	Legaud	antoine-legaud	antoine.legaud@adsearch.fr	f	\N	\N	\N	https://www.linkedin.com/in/antoine-legaud-974092227	\N	\N	\N	2025-01-21 16:13:51.349134	2025-01-21 16:13:51.349137	66	1	50	\N	\N
70	Meriam	Gouram	meriam-gouram	meriam.gouram@anywr-group.com	f	\N	\N	\N	https://www.linkedin.com/in/meriam-gouram-636006201	\N	\N	\N	2025-01-21 16:13:51.363508	2025-01-21 16:13:51.363512	67	2	6	\N	\N
71	Anne	Jamet	anne-jamet	ajamet@prerequis.com	f	\N	\N	\N	https://www.linkedin.com/in/anne-jamet-10b7a9203	\N	\N	\N	2025-01-21 16:13:51.384001	2025-01-21 16:13:51.384004	68	2	51	\N	\N
72	Benjamin	Lebailly	benjamin-lebailly	b.lebailly@lehibou.com	f	\N	\N	\N	https://www.linkedin.com/in/benjamin-lebailly-41838032	\N	\N	\N	2025-01-21 16:13:51.404976	2025-01-21 16:13:51.404979	69	1	52	\N	\N
73	Geoffroy	Anglas	geoffroy-anglas	geoffroy.anglas@ocsigroup.fr	f	\N	\N	\N	https://www.linkedin.com/in/geoffroy-anglas-554235173	\N	\N	\N	2025-01-21 16:13:51.413109	2025-01-21 16:13:51.413113	42	1	44	\N	\N
74	Charles	Mauclair	charles-mauclair	charles.mauclair@sii-group.com	f	\N	\N	\N	https://www.linkedin.com/in/charlesmauclair	\N	\N	\N	2025-01-21 16:13:58.15116	2025-01-21 16:13:58.151167	70	1	53	\N	\N
75	Jean-manuel	Silva	jean-manuel-silva	jean-manuel.silva@scalian.com	f	\N	\N	\N	https://www.linkedin.com/in/jean-manuel-silva-0bb58257	\N	\N	\N	2025-01-21 16:13:58.169053	2025-01-21 16:13:58.169058	71	1	54	\N	\N
76	Sonia dujardin	Delacour	sonia-dujardin-delacour	sonia@altaide.com	f	\N	\N	\N	https://www.linkedin.com/in/sonia-dujardin-delacour-✅-14097b43	\N	\N	\N	2025-01-21 16:13:58.181312	2025-01-21 16:13:58.181315	72	2	55	\N	\N
77	Herve	Montoute	herve-montoute	herve@tap-nation.io	f	\N	\N	\N	https://www.linkedin.com/in/hervemontoute	\N	\N	\N	2025-01-21 16:13:58.192312	2025-01-21 16:13:58.192314	73	1	56	\N	\N
78	Julien	Geffriaud	julien-geffriaud	julien.geffriaud@anywr-group.com	f	\N	\N	\N	https://www.linkedin.com/in/juliengeffriaud	\N	\N	\N	2025-01-21 16:13:58.202034	2025-01-21 16:13:58.202037	74	1	57	\N	\N
79	Fatima	Mezrag	fatima-mezrag	f.mezrag@media-participations.com	f	\N	\N	\N	https://www.linkedin.com/in/fatima-mezrag-79b49213a	\N	\N	\N	2025-01-21 16:13:58.211955	2025-01-21 16:13:58.211958	75	2	58	\N	\N
80	Pauline	Pfister	pauline-pfister	pauline.pfister@reboot-conseil.com	f	\N	\N	\N	https://www.linkedin.com/in/pauline-pfister-7b846b9b	\N	\N	\N	2025-01-21 16:13:58.222318	2025-01-21 16:13:58.222321	76	1	59	\N	\N
81	Lucas	Teffene	lucas-teffene	l.teffene@charly.co	f	\N	\N	\N	https://www.linkedin.com/in/lucasteffene	\N	\N	\N	2025-01-21 16:13:58.256958	2025-01-21 16:13:58.25697	77	1	60	\N	\N
82	Lea	Nakache	lea-nakache	lea.nakache@trsb.net	f	\N	\N	\N	https://www.linkedin.com/in/léa-nakache-733821218	\N	\N	\N	2025-01-21 16:13:58.282913	2025-01-21 16:13:58.28292	78	2	61	\N	\N
83	Guillaume	Roussel	guillaume-roussel	guillaume.roussel@meetshake.io	f	\N	\N	\N	https://www.linkedin.com/in/guillaume-roussel-6470a0259	\N	\N	\N	2025-01-21 16:13:58.293363	2025-01-21 16:13:58.293367	18	1	62	\N	\N
84	Thomas	Groc	thomas-groc	thomas.groc@cube.fr	f	\N	\N	\N	https://www.linkedin.com/in/thomasgroc	\N	\N	\N	2025-01-21 16:13:58.304675	2025-01-21 16:13:58.304678	79	1	63	\N	\N
85	Anaelle	Topornicki	anaelle-topornicki	a.topornicki@charly.co	f	\N	\N	\N	https://www.linkedin.com/in/anaelle-topornicki-83b53818a	\N	\N	\N	2025-01-21 16:13:58.312671	2025-01-21 16:13:58.312673	80	2	6	\N	\N
86	Clément	Nicolas	clement-nicolas	nicolas@infodis.net	f	\N	\N	\N	https://www.linkedin.com/in/clément-nicolas-85429697	\N	\N	\N	2025-01-21 16:13:58.319548	2025-01-21 16:13:58.319551	18	1	64	\N	\N
87	Joel	Naim	joel-naim	joel.naim@deletec.fr	f	\N	\N	\N	https://www.linkedin.com/in/joel-naim-15649975	\N	\N	\N	2025-01-21 16:13:58.328761	2025-01-21 16:13:58.328763	81	1	65	\N	\N
88	Damien	Sergent	damien-sergent	damien.sergent@mosica.fr	f	\N	\N	\N	https://www.linkedin.com/in/damien-sergent	\N	\N	\N	2025-01-21 16:13:58.337826	2025-01-21 16:13:58.337828	82	1	66	\N	\N
89	Nicolas	Sarramagna	nicolas-sarramagna	nicolas@kidizz.com	f	\N	\N	\N	https://www.linkedin.com/in/nicolas-sarramagna	\N	\N	\N	2025-01-21 16:13:58.346641	2025-01-21 16:13:58.346643	83	1	67	\N	\N
90	Sophie	Thierry	sophie-thierry	sophie.thierry@syd.fr	f	\N	\N	\N	https://www.linkedin.com/in/sophie-thierry-0b88551a3	\N	\N	\N	2025-01-21 16:13:58.35427	2025-01-21 16:13:58.354273	84	2	6	\N	\N
91	Jessica	Djeziri	jessica-djeziri	jessica.djeziri@bloomays.com	f	\N	\N	\N	https://www.linkedin.com/in/jessicadjeziri	\N	\N	\N	2025-01-21 16:13:58.363581	2025-01-21 16:13:58.363584	85	2	68	\N	\N
92	Kamel	Haddad	kamel-haddad	kamel@tap-nation.io	f	\N	\N	\N	https://www.linkedin.com/in/kamelhaddad	\N	\N	\N	2025-01-21 16:13:58.376225	2025-01-21 16:13:58.376229	86	1	69	\N	\N
93	Jesal	Parekh	jesal-parekh	jesalp@htechsupports.com	f	\N	\N	\N	https://www.linkedin.com/in/jesal-parekh-994044200	\N	\N	\N	2025-01-21 16:13:58.38548	2025-01-21 16:13:58.385484	87	1	51	\N	\N
94	Melanie	Philippe	melanie-philippe	melanie.philippe@millenials.io	f	\N	\N	\N	https://www.linkedin.com/in/mélanie-philippe-🚀-98655794	\N	\N	\N	2025-01-21 16:13:58.395789	2025-01-21 16:13:58.395792	88	2	70	\N	\N
95	Simran	Kakkar	simran-kakkar	simran.kakkar@innovasolutions.com	f	\N	\N	\N	https://www.linkedin.com/in/simran-kakkar-3578a5227	\N	\N	\N	2025-01-21 16:13:58.406477	2025-01-21 16:13:58.406481	89	2	71	\N	\N
96	Mariame	Diomande	mariame-diomande	mariame.diomande@idealmatch.fr	f	\N	\N	\N	https://www.linkedin.com/in/mariame-diomande-ideal-match	\N	\N	\N	2025-01-21 16:13:58.416364	2025-01-21 16:13:58.416367	90	2	72	\N	\N
97	Marwa	Telmoudi	marwa-telmoudi	mtelmoudi@naxxum.fr	f	\N	\N	\N	https://www.linkedin.com/in/marwa-telmoudi-423480158	\N	\N	\N	2025-01-21 16:13:58.42792	2025-01-21 16:13:58.427923	91	2	73	\N	\N
98	Luca	Bonino	luca-bonino	l.bonino@hoxtonpartners.com	f	\N	\N	\N	https://www.linkedin.com/in/luca-bonino007	\N	\N	\N	2025-01-21 16:14:14.106036	2025-01-21 16:14:14.106039	92	1	74	\N	\N
99	Marvin	Pognart	marvin-pognart	m.pognart@abioxir.fr	f	\N	\N	\N	https://www.linkedin.com/in/marvin-pognart-ba634093	\N	\N	\N	2025-01-21 16:14:14.114604	2025-01-21 16:14:14.114609	93	1	66	\N	\N
100	Madjda	Dadi	madjda-dadi	madjda.dadi@zsoft-consulting.com	f	\N	\N	\N	https://www.linkedin.com/in/mejda-dadi	\N	\N	\N	2025-01-21 16:14:14.125351	2025-01-21 16:14:14.125353	94	2	75	\N	\N
101	Cécilia	Icard	cecilia-icard	icard.cecilia@oostaoo.com	f	\N	\N	\N	https://www.linkedin.com/in/cécilia-icard-dev	\N	\N	\N	2025-01-21 16:14:14.134176	2025-01-21 16:14:14.134179	95	2	7	\N	\N
102	Chloe	Gilbert	chloe-gilbert	cgilbert@groupedigit.com	f	\N	\N	\N	https://www.linkedin.com/in/chloé-gilbert-b8253a164	\N	\N	\N	2025-01-21 16:14:14.144346	2025-01-21 16:14:14.14435	96	2	76	\N	\N
103	Martyna	Traciak	martyna-traciak	m.traciak@ltd-international.com	f	\N	\N	\N	https://www.linkedin.com/in/martyna-traciak-108b9821b	\N	\N	\N	2025-01-21 16:14:14.152448	2025-01-21 16:14:14.15245	97	2	6	\N	\N
104	Elodie	Lemoine	elodie-lemoine	elodie.lemoine@exteam.fr	f	\N	\N	\N	https://www.linkedin.com/in/el-lemoine	\N	\N	\N	2025-01-21 16:14:14.159479	2025-01-21 16:14:14.159481	98	2	76	\N	\N
105	Baptiste	Alexandre	baptiste-alexandre	baptiste.alexandre@alxdr.com	f	\N	\N	\N	https://www.linkedin.com/in/baptistealexandre	\N	\N	\N	2025-01-21 16:14:14.170123	2025-01-21 16:14:14.170126	99	1	77	\N	\N
106	Laurent	Olivier	laurent-olivier	laurent.olivier@abylsen.com	f	\N	\N	\N	https://www.linkedin.com/in/laurent-olivier-530a11145	\N	\N	\N	2025-01-21 16:14:14.197338	2025-01-21 16:14:14.197351	100	1	3	\N	\N
107	Sarath	Moutairou	sarath-moutairou	sarath.moutairou@ocsigroup.fr	f	\N	\N	\N	https://www.linkedin.com/in/sarath-moutairou-aaa5381a3	\N	\N	\N	2025-01-21 16:14:14.226849	2025-01-21 16:14:14.226857	101	2	6	\N	\N
108	Kevin	Ing	kevin-ing	king@hn-services.com	f	\N	\N	\N	https://www.linkedin.com/in/kevin-ing-38570b107	\N	\N	\N	2025-01-21 16:14:14.244341	2025-01-21 16:14:14.244348	18	1	78	\N	\N
109	Nicolas	Pestana	nicolas-pestana	nicolas@urbanradar.io	f	\N	\N	\N	https://www.linkedin.com/in/npestana	\N	\N	\N	2025-01-21 16:14:14.261001	2025-01-21 16:14:14.261007	102	1	23	\N	\N
110	Jean-sebastien	Guillore	jean-sebastien-guillore	jsguillore@akerwise.fr	f	\N	\N	\N	https://www.linkedin.com/in/jean-sébastien-guilloré-55b4a220	\N	\N	\N	2025-01-21 16:14:14.279292	2025-01-21 16:14:14.279296	103	1	79	\N	\N
111	Amelie	Richardson	amelie-richardson	amelie.richardson@mirakl.com	f	\N	\N	\N	https://www.linkedin.com/in/amélie-richardson-b3212114	\N	\N	\N	2025-01-21 16:14:14.292964	2025-01-21 16:14:14.292967	104	2	80	\N	\N
112	Stephane	Marguin	stephane-marguin	stephane.marguin@aleysia.com	f	\N	\N	\N	https://www.linkedin.com/in/stéphane-marguin-29938650	\N	\N	\N	2025-01-21 16:14:14.306598	2025-01-21 16:14:14.306601	105	1	81	\N	\N
113	Quentin	Nicolas	quentin-nicolas	quentin.nicolas@selfing.fr	f	\N	\N	\N	https://www.linkedin.com/in/quentin-nicolas-a26164185	\N	\N	\N	2025-01-21 16:14:14.319775	2025-01-21 16:14:14.319779	106	1	82	\N	\N
114	Celine	Leroux	celine-leroux	celine.leroux@coexya.eu	f	\N	\N	\N	https://www.linkedin.com/in/celine-leroux-25348ba7	\N	\N	\N	2025-01-21 16:14:14.331838	2025-01-21 16:14:14.331842	107	2	83	\N	\N
115	Fabien	Amico	fabien-amico	fabien@fgtech.fr	f	\N	\N	\N	https://www.linkedin.com/in/fabien-amico-8bb85227	\N	\N	\N	2025-01-21 16:14:14.337493	2025-01-21 16:14:14.337496	1	1	1	\N	\N
116	Jennifer	Quillent	jennifer-quillent	jennifer.quillent@5com-consulting.fr	f	\N	\N	\N	https://www.linkedin.com/in/jennifer-quillent-95b06a11b/	\N	\N	\N	2025-01-21 16:14:20.676554	2025-01-21 16:14:20.676558	108	2	1	\N	\N
117	Martin	Bollack	martin-bollack	hello@esmoz.fr	f	\N	\N	\N	https://www.linkedin.com/in/martinbollack/	\N	\N	\N	2025-01-21 16:14:27.716335	2025-01-21 16:14:27.71634	109	1	1	\N	\N
\.


--
-- Data for Name: companies_functions; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.companies_functions (id, name, slug, created, updated) FROM stdin;
1	Co-fondateur CEO	co-fondateur-ceo	2025-01-21 16:13:20.516132	2025-01-21 16:13:20.516136
2	Talent Acquisition Manager	talent-acquisition-manager	2025-01-21 16:13:26.87598	2025-01-21 16:13:26.875987
3	Responsable Ressources Humaines	responsable-ressources-humaines	2025-01-21 16:13:26.899736	2025-01-21 16:13:26.89974
4	IT Talent & Business Manager	it-talent-business-manager	2025-01-21 16:13:26.929413	2025-01-21 16:13:26.929426
5	Talent Acquisition Partner	talent-acquisition-partner	2025-01-21 16:13:26.970272	2025-01-21 16:13:26.970279
6	Chargée de Recrutement	chargee-de-recrutement	2025-01-21 16:13:26.993357	2025-01-21 16:13:26.993362
7	Responsable RH	responsable-rh	2025-01-21 16:13:27.026741	2025-01-21 16:13:27.026745
8	Talent Acquisition Manager Freelancing	talent-acquisition-manager-freelancing	2025-01-21 16:13:27.043204	2025-01-21 16:13:27.043208
9	CEO	ceo	2025-01-21 16:13:27.059916	2025-01-21 16:13:27.059919
10	accure	accure	2025-01-21 16:13:27.076057	2025-01-21 16:13:27.076061
11	Talent & Operations Manager	talent-operations-manager	2025-01-21 16:13:27.092771	2025-01-21 16:13:27.092775
12	Talent Recruiter IT	talent-recruiter-it	2025-01-21 16:13:27.109916	2025-01-21 16:13:27.109919
13	Talent Acquisition Officer	talent-acquisition-officer	2025-01-21 16:13:27.126369	2025-01-21 16:13:27.126373
14	Chargé de recrutement IT	charge-de-recrutement-it	2025-01-21 16:13:27.144011	2025-01-21 16:13:27.144015
15	CCL CONSULTING	ccl-consulting	2025-01-21 16:13:27.160697	2025-01-21 16:13:27.1607
16	CEO & cofounder	ceo-cofounder	2025-01-21 16:13:27.205673	2025-01-21 16:13:27.205687
17	Chargée de recrutement IT	chargee-de-recrutement-it	2025-01-21 16:13:27.240994	2025-01-21 16:13:27.240998
18	Chargé de recrutement et marque employeur	charge-de-recrutement-et-marque-employeur	2025-01-21 16:13:27.262649	2025-01-21 16:13:27.262659
19	DRH	drh	2025-01-21 16:13:27.302539	2025-01-21 16:13:27.30255
20	Talent Acquisition recruiter - ESM / Régions	talent-acquisition-recruiter-esm-regions	2025-01-21 16:13:27.349845	2025-01-21 16:13:27.349851
21	Directeur général délégué	directeur-general-delegue	2025-01-21 16:13:27.376016	2025-01-21 16:13:27.376023
22	Digital & IT Talent Acquisition Manager	digital-it-talent-acquisition-manager	2025-01-21 16:13:27.402228	2025-01-21 16:13:27.402235
23	Chief Technology Officer	chief-technology-officer	2025-01-21 16:13:37.650686	2025-01-21 16:13:37.650694
24	CEO & Consultant Stratégie Data &  Power BI	ceo-consultant-strategie-data-power-bi	2025-01-21 16:13:37.676238	2025-01-21 16:13:37.67625
25	Directeur général	directeur-general	2025-01-21 16:13:37.715221	2025-01-21 16:13:37.715227
26	Responsable RH Régionale	responsable-rh-regionale	2025-01-21 16:13:37.804722	2025-01-21 16:13:37.804729
27	Fondatrice dirigeante	fondatrice-dirigeante	2025-01-21 16:13:37.835804	2025-01-21 16:13:37.835808
28	Senior Talent Acquisition Specialist 🦄	senior-talent-acquisition-specialist	2025-01-21 16:13:37.856369	2025-01-21 16:13:37.856374
29	Harnham	harnham	2025-01-21 16:13:37.871073	2025-01-21 16:13:37.871077
30	CEO & cofounder SaaS Trustt.io - CRM - Founder MonVanityIdeal +300K membres	ceo-cofounder-saas-trustt-io-crm-founder-monvanityideal-300k-membres	2025-01-21 16:13:37.947039	2025-01-21 16:13:37.947048
31	Senior Tech Talent Acquisition Manager	senior-tech-talent-acquisition-manager	2025-01-21 16:13:37.97758	2025-01-21 16:13:37.977586
32	Responsable RH, com, et mark	responsable-rh-com-et-mark	2025-01-21 16:13:38.022553	2025-01-21 16:13:38.022561
33	Responsable recrutement et développement RH Grand Est/Franche-Comté	responsable-recrutement-et-developpement-rh-grand-est-franche-comte	2025-01-21 16:13:38.048183	2025-01-21 16:13:38.048189
34	Head of People & Corporate Social Responsibility (RSE)	head-of-people-corporate-social-responsibility-rse	2025-01-21 16:13:38.10276	2025-01-21 16:13:38.102764
35	Technical Project Director	technical-project-director	2025-01-21 16:13:38.1355	2025-01-21 16:13:38.135505
36	Urban Linker	urban-linker	2025-01-21 16:13:38.172166	2025-01-21 16:13:38.172169
37	Directeur Général chez Ipepper	directeur-general-chez-ipepper	2025-01-21 16:13:38.189596	2025-01-21 16:13:38.189599
38	Associate Technical Recruiter	associate-technical-recruiter	2025-01-21 16:13:38.204692	2025-01-21 16:13:38.204694
39	Responsable RH et RSE	responsable-rh-et-rse	2025-01-21 16:13:50.956501	2025-01-21 16:13:50.956506
40	Responsable Recrutement IT / RH & Communication	responsable-recrutement-it-rh-communication	2025-01-21 16:13:50.975542	2025-01-21 16:13:50.975545
41	Tech Talent Acquisition Specialist	tech-talent-acquisition-specialist	2025-01-21 16:13:51.009677	2025-01-21 16:13:51.009681
42	CTO	cto	2025-01-21 16:13:51.043143	2025-01-21 16:13:51.043146
43	Talent Brut	talent-brut	2025-01-21 16:13:51.0923	2025-01-21 16:13:51.092305
44	Chargé de Recrutement	charge-de-recrutement	2025-01-21 16:13:51.122581	2025-01-21 16:13:51.122585
45	Co-Founder	co-founder	2025-01-21 16:13:51.146982	2025-01-21 16:13:51.146993
46	Principal Chief Executive Officer	principal-chief-executive-officer	2025-01-21 16:13:51.193954	2025-01-21 16:13:51.193963
47	Chargé de Recrutement et de Communication	charge-de-recrutement-et-de-communication	2025-01-21 16:13:51.229556	2025-01-21 16:13:51.229564
48	Head of People	head-of-people	2025-01-21 16:13:51.253302	2025-01-21 16:13:51.253306
49	Talent Acquisition Manager - Expert Recrutement IT	talent-acquisition-manager-expert-recrutement-it	2025-01-21 16:13:51.304778	2025-01-21 16:13:51.304784
50	Talent Specialist Management de Transition	talent-specialist-management-de-transition	2025-01-21 16:13:51.336916	2025-01-21 16:13:51.33692
51	Chargée de Recrutement IT	chargee-de-recrutement-it	2025-01-21 16:13:51.370845	2025-01-21 16:13:51.370849
52	Directeur général adjoint LeHibou - En charge du développement des Régions et de la plateforme	directeur-general-adjoint-lehibou-en-charge-du-developpement-des-regions-et-de-la-plateforme	2025-01-21 16:13:51.391179	2025-01-21 16:13:51.391183
53	Président du collège ESN-ICT - Administrateur du syndicat	president-du-college-esn-ict-administrateur-du-syndicat	2025-01-21 16:13:58.139227	2025-01-21 16:13:58.139233
54	DRH - DAF	drh-daf	2025-01-21 16:13:58.158567	2025-01-21 16:13:58.158572
55	Directrice Associée / Head Technical Recruiter	directrice-associee-head-technical-recruiter	2025-01-21 16:13:58.173703	2025-01-21 16:13:58.173707
56	Co-founder	co-founder	2025-01-21 16:13:58.184972	2025-01-21 16:13:58.184975
57	VP, Intenal IT & Data	vp-intenal-it-data	2025-01-21 16:13:58.195538	2025-01-21 16:13:58.19554
58	Head of People / DRH / HRD	head-of-people-drh-hrd	2025-01-21 16:13:58.205391	2025-01-21 16:13:58.205394
59	Senior Talent Acquisition Specialist	senior-talent-acquisition-specialist	2025-01-21 16:13:58.215199	2025-01-21 16:13:58.215201
60	Directeur Général	directeur-general	2025-01-21 16:13:58.232084	2025-01-21 16:13:58.232098
61	Talent Acquisition Manager IT	talent-acquisition-manager-it	2025-01-21 16:13:58.269773	2025-01-21 16:13:58.269782
62	Digital & IT Talent Acquisition	digital-it-talent-acquisition	2025-01-21 16:13:58.288345	2025-01-21 16:13:58.288349
63	SFPN	sfpn	2025-01-21 16:13:58.297065	2025-01-21 16:13:58.297069
64	Chargé de recrutement	charge-de-recrutement	2025-01-21 16:13:58.315677	2025-01-21 16:13:58.315681
65	Responsable Assistance Technique	responsable-assistance-technique	2025-01-21 16:13:58.322756	2025-01-21 16:13:58.322759
66	Responsable technique	responsable-technique	2025-01-21 16:13:58.331557	2025-01-21 16:13:58.331559
67	LINKIZZ	linkizz	2025-01-21 16:13:58.340777	2025-01-21 16:13:58.340779
68	Chief People Officer and Subject Matter Expert	chief-people-officer-and-subject-matter-expert	2025-01-21 16:13:58.357706	2025-01-21 16:13:58.357708
69	VP of Engineering	vp-of-engineering	2025-01-21 16:13:58.367115	2025-01-21 16:13:58.367119
70	⭐ Talent Acquisition Specialist 🦄	talent-acquisition-specialist	2025-01-21 16:13:58.389419	2025-01-21 16:13:58.389422
71	Innova Solutions	innova-solutions	2025-01-21 16:13:58.399114	2025-01-21 16:13:58.399118
72	Founder	founder	2025-01-21 16:13:58.409732	2025-01-21 16:13:58.409734
73	Responsable RH chez Naxxum	responsable-rh-chez-naxxum	2025-01-21 16:13:58.421296	2025-01-21 16:13:58.421299
74	IT Recruiter	it-recruiter	2025-01-21 16:14:14.095901	2025-01-21 16:14:14.095903
75	Responsable recrutement	responsable-recrutement	2025-01-21 16:14:14.119366	2025-01-21 16:14:14.119369
76	Responsable des ressources humaines	responsable-des-ressources-humaines	2025-01-21 16:14:14.137395	2025-01-21 16:14:14.137397
77	ALXDR Software Engineering	alxdr-software-engineering	2025-01-21 16:14:14.163266	2025-01-21 16:14:14.163269
78	Chargé de Recrutement IT - Jeunes Diplômés	charge-de-recrutement-it-jeunes-diplomes	2025-01-21 16:14:14.236343	2025-01-21 16:14:14.23635
79	Dirigeant	dirigeant	2025-01-21 16:14:14.268272	2025-01-21 16:14:14.268278
80	Chief People Officer	chief-people-officer	2025-01-21 16:14:14.284664	2025-01-21 16:14:14.284667
81	Fondateur et directeur	fondateur-et-directeur	2025-01-21 16:14:14.297241	2025-01-21 16:14:14.297245
82	Responsable Recrutement	responsable-recrutement	2025-01-21 16:14:14.310764	2025-01-21 16:14:14.310769
83	Responsable RH Groupe	responsable-rh-groupe	2025-01-21 16:14:14.323904	2025-01-21 16:14:14.323907
\.


--
-- Data for Name: companies_sector_of_activities; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.companies_sector_of_activities (id, name, slug, created, updated) FROM stdin;
\.


--
-- Data for Name: marketing_compaigns; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.marketing_compaigns (id, name, slug, created, updated) FROM stdin;
\.


--
-- Data for Name: marketing_diffusions_lists; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.marketing_diffusions_lists (id, name, slug, data, created, updated, campaign_id) FROM stdin;
\.


--
-- Data for Name: marketing_emails; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.marketing_emails (id, template_html, template_text, created, updated, campaign_id) FROM stdin;
\.


--
-- Data for Name: pages_pages; Type: TABLE DATA; Schema: public; Owner: renaud
--

COPY public.pages_pages (id, name, slug, body, is_online, created, updated) FROM stdin;
\.


--
-- Name: companies_civilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.companies_civilities_id_seq', 2, true);


--
-- Name: companies_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.companies_companies_id_seq', 109, true);


--
-- Name: companies_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.companies_employees_id_seq', 117, true);


--
-- Name: companies_functions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.companies_functions_id_seq', 83, true);


--
-- Name: companies_sector_of_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.companies_sector_of_activities_id_seq', 1, false);


--
-- Name: marketing_compaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.marketing_compaigns_id_seq', 1, false);


--
-- Name: marketing_diffusions_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.marketing_diffusions_lists_id_seq', 1, false);


--
-- Name: marketing_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.marketing_emails_id_seq', 1, false);


--
-- Name: pages_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renaud
--

SELECT pg_catalog.setval('public.pages_pages_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: companies_civilities companies_civilities_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_civilities
    ADD CONSTRAINT companies_civilities_pkey PRIMARY KEY (id);


--
-- Name: companies_companies companies_companies_name_key; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_companies
    ADD CONSTRAINT companies_companies_name_key UNIQUE (name);


--
-- Name: companies_companies companies_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_companies
    ADD CONSTRAINT companies_companies_pkey PRIMARY KEY (id);


--
-- Name: companies_companies companies_companies_slug_key; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_companies
    ADD CONSTRAINT companies_companies_slug_key UNIQUE (slug);


--
-- Name: companies_employees companies_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees
    ADD CONSTRAINT companies_employees_pkey PRIMARY KEY (id);


--
-- Name: companies_employees companies_employees_slug_key; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees
    ADD CONSTRAINT companies_employees_slug_key UNIQUE (slug);


--
-- Name: companies_functions companies_functions_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_functions
    ADD CONSTRAINT companies_functions_pkey PRIMARY KEY (id);


--
-- Name: companies_sector_of_activities companies_sector_of_activities_name_key; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_sector_of_activities
    ADD CONSTRAINT companies_sector_of_activities_name_key UNIQUE (name);


--
-- Name: companies_sector_of_activities companies_sector_of_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_sector_of_activities
    ADD CONSTRAINT companies_sector_of_activities_pkey PRIMARY KEY (id);


--
-- Name: marketing_compaigns marketing_compaigns_name_key; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_compaigns
    ADD CONSTRAINT marketing_compaigns_name_key UNIQUE (name);


--
-- Name: marketing_compaigns marketing_compaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_compaigns
    ADD CONSTRAINT marketing_compaigns_pkey PRIMARY KEY (id);


--
-- Name: marketing_compaigns marketing_compaigns_slug_key; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_compaigns
    ADD CONSTRAINT marketing_compaigns_slug_key UNIQUE (slug);


--
-- Name: marketing_diffusions_lists marketing_diffusions_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_diffusions_lists
    ADD CONSTRAINT marketing_diffusions_lists_pkey PRIMARY KEY (id);


--
-- Name: marketing_emails marketing_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_emails
    ADD CONSTRAINT marketing_emails_pkey PRIMARY KEY (id);


--
-- Name: pages_pages pages_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.pages_pages
    ADD CONSTRAINT pages_pages_pkey PRIMARY KEY (id);


--
-- Name: companies_employees companies_employees_civility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees
    ADD CONSTRAINT companies_employees_civility_id_fkey FOREIGN KEY (civility_id) REFERENCES public.companies_civilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: companies_employees companies_employees_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees
    ADD CONSTRAINT companies_employees_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: companies_employees companies_employees_function_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees
    ADD CONSTRAINT companies_employees_function_id_fkey FOREIGN KEY (function_id) REFERENCES public.companies_functions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: companies_employees companies_employees_sector_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.companies_employees
    ADD CONSTRAINT companies_employees_sector_activity_id_fkey FOREIGN KEY (sector_activity_id) REFERENCES public.companies_sector_of_activities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: marketing_diffusions_lists marketing_diffusions_lists_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_diffusions_lists
    ADD CONSTRAINT marketing_diffusions_lists_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.marketing_compaigns(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: marketing_emails marketing_emails_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: renaud
--

ALTER TABLE ONLY public.marketing_emails
    ADD CONSTRAINT marketing_emails_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.marketing_compaigns(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

