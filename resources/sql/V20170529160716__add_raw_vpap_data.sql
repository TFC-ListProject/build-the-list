DROP TABLE IF EXISTS raw_district_house_candidates;
CREATE TABLE raw_district_house_candidates (
    firstname varchar(255),
    lastname varchar(255),
    party varchar(255),
    percentage numeric,
    numvotes integer,
    dollars integer,
    wasincumbent boolean,
    waswinner boolean,
    withdrew boolean,
    year integer,
    district integer,
    electiontype varchar(255),
    state varchar(2)
);

DROP TABLE IF EXISTS raw_statewide_candidates;
CREATE TABLE raw_statewide_candidates (
    district integer,
    electionname varchar(255),
    vpapelectionid integer,
    candidatename varchar(255),
    candidateparty varchar(255),
    numvotes integer,
    percentage numeric,
    state varchar(2)
);

COPY raw_district_house_candidates (firstname, lastname, party, percentage, numvotes, dollars, wasincumbent, waswinner, withdrew, year, district, electiontype, state) FROM stdin;
Jim	Scott	D	\N	\N	36305	t	\N	f	2013	53	regular	va
Greg	Habeeb	R	63.52	6569	129434	f	t	f	2011	8	special	va
Ginger	Mumpower	D	36.23	3747	34186	f	f	f	2011	8	special	va
Greg	Habeeb	R	96.54	14882	118904	t	t	f	2011	8	regular	va
Morgan	Griffith	R	\N	\N	106335	f	\N	t	2011	8	regular	va
Greg	Habeeb	R	95.63	20058	173551	t	t	f	2013	8	regular	va
Keegan	Sturdivant	L	\N	\N	0	f	\N	t	2013	8	regular	va
Greg	Habeeb	R	100.0	16684	223480	t	t	f	2015	8	regular	va
Allen Wayne	Dudley	R	56.14	10699	65808	t	t	f	1997	9	regular	va
Mary	Harkins	D	41.24	7860	112984	f	f	f	1997	9	regular	va
Charles J	Jordan	I	2.6	496	0	f	f	f	1997	9	regular	va
Allen Wayne	Dudley	R	76.66	12154	39402	t	t	f	1999	9	regular	va
Donald F	Taylor	I	23.3	3694	4846	f	f	f	1999	9	regular	va
Allen Wayne	Dudley	R	84.0	15418	14574	t	t	f	2001	9	regular	va
Donald F	Taylor	I	16.0	3039	0	f	f	f	2001	9	regular	va
Allen Wayne	Dudley	R	58.87	10261	73104	t	t	f	2003	9	regular	va
Mark H	Newbill	D	41.12	7167	96559	f	f	f	2003	9	regular	va
Allen Wayne	Dudley	R	52.64	11639	127958	t	t	f	2005	9	regular	va
Eric H	Ferguson	D	47.12	10419	202072	f	f	f	2005	9	regular	va
Charles	Poindexter	R	46.44	10102	460400	f	t	f	2007	9	regular	va
Eric H	Ferguson	D	43.91	9553	550990	f	f	f	2007	9	regular	va
Jerry W	Boothe	I	9.56	2080	2527	f	f	f	2007	9	regular	va
Allen Wayne	Dudley	R	\N	\N	30090	t	\N	f	2007	9	regular	va
Charles	Poindexter	R	79.03	16534	92276	t	t	f	2009	9	regular	va
Sherman David	Witcher	Ind. Green	20.71	4332	0	f	f	f	2009	9	regular	va
Charles	Poindexter	R	52.61	13189	1004021	t	t	f	2011	9	regular	va
Ward	Armstrong	D	47.23	11840	1419758	f	f	f	2011	9	regular	va
Charles	Poindexter	R	98.07	17216	76541	t	t	f	2013	9	regular	va
Charles	Poindexter	R	100.0	16086	64386	t	t	f	2015	9	regular	va
Barnie K	Day	D	54.6	4145	3968	f	t	f	1997	10	special	va
D Philip	Plaster	R	45.4	3452	0	f	f	f	1997	10	special	va
Barnie K	Day	D	70.97	8438	39793	t	t	f	1997	10	regular	va
Gina Martin	Manley	Va.	29.02	3450	2805	f	f	f	1997	10	regular	va
Roscoe	Reynolds	D	\N	\N	5556	f	\N	t	1997	10	regular	va
Barnie K	Day	D	67.99	10732	151214	t	t	f	1999	10	regular	va
Jonathan	Large	R	32.01	5053	71917	f	f	f	1999	10	regular	va
Ward	Armstrong	D	53.0	10050	129559	t	t	f	2001	10	regular	va
Brett	Geisler	R	47.0	8873	71031	f	f	f	2001	10	regular	va
Barnie K	Day	D	\N	\N	22863	f	\N	f	2001	10	regular	va
Thomas M Jr	Jackson	D	\N	\N	41101	f	\N	f	2001	10	regular	va
Ward	Armstrong	D	99.96	13693	70773	t	t	f	2003	10	regular	va
Ward	Armstrong	D	63.39	11371	300090	t	t	f	2005	10	regular	va
David	Young	R	36.53	6553	71918	f	f	f	2005	10	regular	va
Ward	Armstrong	D	98.59	15212	657809	t	t	f	2007	10	regular	va
Ward	Armstrong	D	56.46	9084	643805	t	t	f	2009	10	regular	va
Edward	Creed	R	43.44	6990	11190	f	f	f	2009	10	regular	va
Joseph	Prater	I	\N	\N	200	f	\N	f	2009	10	regular	va
Randy	Minchew	R	58.38	8140	374490	f	t	f	2011	10	regular	va
David	Butler	D	41.52	5789	170380	f	f	f	2011	10	regular	va
Randy	Minchew	R	57.01	12950	492958	t	t	f	2013	10	regular	va
Monte	Johnson	D	42.8	9723	163259	f	f	f	2013	10	regular	va
Randy	Minchew	R	62.1	10415	152286	t	t	f	2015	10	regular	va
Peter	Rush	D	37.9	6355	21405	f	f	f	2015	10	regular	va
Ward	Armstrong	D	84.07	12908	63471	t	t	f	1997	11	regular	va
Carl B	Craig	I	5.6	860	110	f	f	f	1997	11	regular	va
Clarence F	Shelton	Va.	10.3	1581	728	f	f	f	1997	11	regular	va
Ward	Armstrong	D	99.55	10210	74808	t	t	f	1999	11	regular	va
Clifton A III	Woodrum	D	99.0	10783	81533	t	t	f	2001	11	regular	va
C	Cranwell	D	\N	\N	285981	f	\N	f	2001	11	regular	va
Onzlee	Ware	D	99.94	6403	75798	f	t	f	2003	11	regular	va
Clifton A III	Woodrum	D	\N	\N	11308	t	\N	f	2003	11	regular	va
Onzlee	Ware	D	99.26	10736	140188	t	t	f	2005	11	regular	va
Onzlee	Ware	D	62.1	4696	130323	t	t	f	2007	11	regular	va
Delvis Omar	McCadden	I	37.32	2822	27132	f	f	f	2007	11	regular	va
Onzlee	Ware	D	60.29	7519	111270	t	t	f	2009	11	regular	va
Troy	Bird	R	39.56	4934	4803	f	f	f	2009	11	regular	va
Onzlee	Ware	D	97.26	9885	77026	t	t	f	2011	11	regular	va
Onzlee	Ware	D	97.25	13529	44497	t	t	f	2013	11	regular	va
Sam	Rasoul	D	70.2	5129	50614	f	t	f	2014	11	special	va
Octavia	Johnson	R	29.6	2166	72968	f	f	f	2014	11	special	va
Caleb	Coulter	R	\N	\N	2285	f	\N	f	2014	11	special	va
Kimble Jr	Reynolds	I	\N	\N	0	f	\N	t	2014	11	special	va
Sam	Rasoul	D	100.0	11216	143834	t	t	f	2015	11	regular	va
Jim	Shuler	D	99.78	10151	58468	t	t	f	1997	12	regular	va
K Duane	Davis	Va.	\N	\N	0	f	\N	t	1997	12	regular	va
Jim	Shuler	D	81.38	9202	70626	t	t	f	1999	12	regular	va
Franklin Michael	Baker	I	18.57	2100	42	f	f	f	1999	12	regular	va
Creigh	Deeds	D	78.0	12595	82055	t	t	f	2001	12	regular	va
Kathleen	Orion	I	22.0	3611	2498	f	f	f	2001	12	regular	va
Jim	Shuler	D	70.77	7284	173043	f	t	f	2002	12	special	va
Larry J	Linkous	R	29.21	3006	21156	f	f	f	2002	12	special	va
Jim	Shuler	D	99.89	9867	69764	t	t	f	2003	12	regular	va
Jim	Shuler	D	78.26	14238	85806	t	t	f	2005	12	regular	va
Donnie	Kern	I	20.14	3664	1250	f	f	f	2005	12	regular	va
Jim	Shuler	D	99.45	12145	123967	t	t	f	2007	12	regular	va
Jim	Shuler	D	72.24	12716	113712	t	t	f	2009	12	regular	va
Paul Michael	Cornett	I	27.26	4799	30	f	f	f	2009	12	regular	va
Joseph	Yost	R	51.6	8104	342963	f	t	f	2011	12	regular	va
Don	Langrehr	D	48.28	7582	106321	f	f	f	2011	12	regular	va
Jim	Shuler	D	\N	\N	29675	t	\N	f	2011	12	regular	va
Joseph	Yost	R	52.31	9541	624145	t	t	f	2013	12	regular	va
James	Harder	D	47.42	8650	419091	f	f	f	2013	12	regular	va
Joseph	Yost	R	58.39	9245	290633	t	t	f	2015	12	regular	va
Laurie	Buchwald	D	41.61	6587	99066	f	f	f	2015	12	regular	va
Bob	Marshall	R	85.15	14104	23541	t	t	f	1997	13	regular	va
James L	Vencill	I	14.82	2455	4616	f	f	f	1997	13	regular	va
Bob	Marshall	R	60.52	8778	53690	t	t	f	1999	13	regular	va
Denise	Oppenhagen	D	39.48	5726	61238	f	f	f	1999	13	regular	va
Bob	Marshall	R	63.0	11551	57273	t	t	f	2001	13	regular	va
Louis R Jr	Brooks	D	37.0	6863	34074	f	f	f	2001	13	regular	va
Bob	Marshall	R	98.78	12629	35714	t	t	f	2003	13	regular	va
Bob	Marshall	R	55.46	15752	170015	t	t	f	2005	13	regular	va
Bruce Edgerly	Roemmelt	D	44.22	12559	211829	f	f	f	2005	13	regular	va
Bob	Marshall	R	58.29	14826	139934	t	t	f	2007	13	regular	va
Bruce Edgerly	Roemmelt	D	41.59	10579	134307	f	f	f	2007	13	regular	va
Bob	Marshall	R	61.31	22982	190451	t	t	f	2009	13	regular	va
John	Bell	D	38.61	14472	607956	f	f	f	2009	13	regular	va
Bob	Marshall	R	59.59	6008	129576	t	t	f	2011	13	regular	va
Carl	Genthner	D	40.31	4064	58667	f	f	f	2011	13	regular	va
Bob	Marshall	R	51.33	8946	124746	t	t	f	2013	13	regular	va
Atif	Qarni	D	48.47	8448	363035	f	f	f	2013	13	regular	va
Donna	Sellinger	D	\N	\N	0	f	\N	t	2013	13	regular	va
Bob	Marshall	R	56.1	7147	113504	t	t	f	2015	13	regular	va
Don	Shaw	D	43.9	5592	221479	f	f	f	2015	13	regular	va
C	Cranwell	D	51.5	11198	394004	t	t	f	1997	14	regular	va
Al	Bedrosian	R	48.48	10540	31520	f	f	f	1997	14	regular	va
C	Cranwell	D	63.2	13403	618694	t	t	f	1999	14	regular	va
Al	Bedrosian	R	36.79	7801	44391	f	f	f	1999	14	regular	va
Danny	Marshall	R	61.0	11652	121672	f	t	f	2001	14	regular	va
Joyce Elizabeth	Glaise	D	39.0	7613	16913	f	f	f	2001	14	regular	va
Whitt	Clement	D	\N	\N	99872	t	\N	f	2001	14	regular	va
Danny	Marshall	R	99.92	6177	26269	t	t	f	2003	14	regular	va
Danny	Marshall	R	99.48	10593	45429	t	t	f	2005	14	regular	va
Danny	Marshall	R	51.88	8375	513824	t	t	f	2007	14	regular	va
Adam J	Tomer	D	47.98	7746	520573	f	f	f	2007	14	regular	va
Danny	Marshall	R	64.11	10313	315981	t	t	f	2009	14	regular	va
F Seward Jr	Anderson	D	35.78	5755	177040	f	f	f	2009	14	regular	va
Danny	Marshall	R	98.9	12921	101674	t	t	f	2011	14	regular	va
Danny	Marshall	R	58.69	12336	284358	t	t	f	2013	14	regular	va
Gary	Miller	D	38.0	7988	192271	f	f	f	2013	14	regular	va
Mary Scott	Martin	I	3.24	681	1481	f	f	f	2013	14	regular	va
Danny	Marshall	R	100.0	9821	147847	t	t	f	2015	14	regular	va
Raymond R Jr	Guest	R	99.31	12894	1767	t	t	f	1997	15	regular	va
Allen L	Louderback	R	98.95	12529	14337	f	t	f	1999	15	regular	va
Raymond R Jr	Guest	R	\N	\N	0	t	\N	f	1999	15	regular	va
Phoebe M	Orebaugh	R	\N	\N	0	f	\N	t	1999	15	regular	va
Allen L	Louderback	R	63.0	12429	59998	t	t	f	2001	15	regular	va
Bradley G	Pollack	I	37.0	7242	44395	f	f	f	2001	15	regular	va
Allen L	Louderback	R	63.11	12494	49741	t	t	f	2003	15	regular	va
Thomas A	Lewis	D	36.76	7277	4980	f	f	f	2003	15	regular	va
Todd	Gilbert	R	60.83	13259	95858	f	t	f	2005	15	regular	va
James K	Blubaugh	D	33.72	7351	74058	f	f	f	2005	15	regular	va
Allen L	Louderback	R	\N	\N	60322	t	\N	f	2005	15	regular	va
Todd	Gilbert	R	98.05	15156	24614	t	t	f	2007	15	regular	va
Jack	Proctor	I	\N	\N	0	f	\N	t	2007	15	regular	va
Todd	Gilbert	R	69.27	16168	112547	t	t	f	2009	15	regular	va
John D	Lesinski	D	30.65	7155	90393	f	f	f	2009	15	regular	va
Todd	Gilbert	R	97.85	13617	71070	t	t	f	2011	15	regular	va
Todd	Gilbert	R	96.59	17376	339429	t	t	f	2013	15	regular	va
Todd	Gilbert	R	100.0	16102	139507	t	t	f	2015	15	regular	va
Clifton A III	Woodrum	D	99.88	13819	47494	t	t	f	1997	16	regular	va
Clifton A III	Woodrum	D	84.85	12799	79223	t	t	f	1999	16	regular	va
Alexi	Sadjadi	I	15.15	2286	11612	f	f	f	1999	16	regular	va
Robert	Hurt	R	65.0	11853	54519	f	t	f	2001	16	regular	va
Randy	Collins	D	35.0	6382	2206	f	f	f	2001	16	regular	va
Robert	Hurt	R	61.64	8744	122347	t	t	f	2003	16	regular	va
Kimble Jr	Reynolds	D	38.36	5441	58623	f	f	f	2003	16	regular	va
Robert	Hurt	R	99.05	12821	68976	t	t	f	2005	16	regular	va
Don	Merricks	R	64.0	10744	86622	f	t	f	2007	16	regular	va
Andy	Parker	D	35.94	6034	54323	f	f	f	2007	16	regular	va
Robert	Hurt	R	\N	\N	144617	t	\N	t	2007	16	regular	va
Don	Merricks	R	99.51	13074	43597	t	t	f	2009	16	regular	va
Don	Merricks	R	99.07	14343	70070	t	t	f	2011	16	regular	va
Les	Adams	R	63.09	13292	142704	f	t	f	2013	16	regular	va
Elizabeth	Jones	D	36.73	7740	86338	f	f	f	2013	16	regular	va
Don	Merricks	R	\N	\N	72796	t	\N	f	2013	16	regular	va
Les	Adams	R	100.0	12538	68029	t	t	f	2015	16	regular	va
A Victor	Thomas	D	99.98	11031	41470	t	t	f	1997	17	regular	va
A Victor	Thomas	D	99.94	9857	34094	t	t	f	1999	17	regular	va
A Victor	Thomas	D	99.0	16977	36977	t	t	f	2001	17	regular	va
William H Jr	Fralin	R	62.05	9890	223600	f	t	f	2003	17	regular	va
Linda	Wyatt	D	31.82	5072	51360	f	f	f	2003	17	regular	va
Gary M	Bowman	I	6.12	975	5691	f	f	f	2003	17	regular	va
A Victor	Thomas	D	\N	\N	13098	t	\N	f	2003	17	regular	va
William H Jr	Fralin	R	97.58	18843	78663	t	t	f	2005	17	regular	va
William H Jr	Fralin	R	75.11	10875	45788	t	t	f	2007	17	regular	va
Alexander Henry	Ballin	I	24.65	3569	3008	f	f	f	2007	17	regular	va
Bill	Cleaveland	R	61.96	14004	181538	f	t	f	2009	17	regular	va
Gwendolyn W	Mason	D	37.93	8573	270324	f	f	f	2009	17	regular	va
William H Jr	Fralin	R	\N	\N	103150	t	\N	f	2009	17	regular	va
Christopher	Head	R	65.47	11852	72056	f	t	f	2011	17	regular	va
Freeda	Cathcart	D	34.29	6207	16141	f	f	f	2011	17	regular	va
Bill	Cleaveland	R	\N	\N	75713	t	\N	f	2011	17	regular	va
Christopher	Head	R	62.0	15222	175036	t	t	f	2013	17	regular	va
Freeda	Cathcart	D	37.72	9262	202107	f	f	f	2013	17	regular	va
Christopher	Head	R	100.0	15091	123401	t	t	f	2015	17	regular	va
Creigh	Deeds	D	85.28	12414	43537	t	t	f	1997	18	regular	va
Billy Eli	Fishpaw	I	14.38	2093	155	f	f	f	1997	18	regular	va
Creigh	Deeds	D	74.34	12010	127162	t	t	f	1999	18	regular	va
Michael M	Collins	R	25.65	4143	54417	f	f	f	1999	18	regular	va
Clay	Athey	R	54.0	10746	67930	f	t	f	2001	18	regular	va
Peter B	Schwartz	D	37.0	7375	202992	f	f	f	2001	18	regular	va
Jerry M	Wood	I	8.0	1650	13831	f	f	f	2001	18	regular	va
Jay	Katzen	R	\N	\N	4136	t	\N	t	2001	18	regular	va
Clay	Athey	R	99.93	13634	45854	t	t	f	2003	18	regular	va
Clay	Athey	R	97.35	16651	30997	t	t	f	2005	18	regular	va
Clay	Athey	R	98.11	13100	51372	t	t	f	2007	18	regular	va
Clay	Athey	R	82.38	16071	83532	t	t	f	2009	18	regular	va
Todd M	Jack	Const.	17.04	3324	1473	f	f	f	2009	18	regular	va
Michael	Webert	R	69.46	9749	183503	f	t	f	2011	18	regular	va
Bob	Zwick	D	30.38	4264	4529	f	f	f	2011	18	regular	va
Clay	Athey	R	\N	\N	42649	t	\N	f	2011	18	regular	va
Michael	Webert	R	63.26	15549	177902	t	t	f	2013	18	regular	va
Colin	Harris	D	36.53	8979	163108	f	f	f	2013	18	regular	va
Michael	Webert	R	100.0	13996	48624	t	t	f	2015	18	regular	va
Lacey	Putney	I	78.39	13195	11799	t	t	f	1997	19	regular	va
Eric D	Thompson	I	21.59	3635	451	f	f	f	1997	19	regular	va
Lacey	Putney	I	80.86	12842	37199	t	t	f	1999	19	regular	va
Eric D	Thompson	I	19.11	3035	532	f	f	f	1999	19	regular	va
Lacey	Putney	I	98.0	13285	14358	t	t	f	2001	19	regular	va
Lacey	Putney	I	73.55	11393	31656	t	t	f	2003	19	regular	va
Arthur Monroe	Lipscomb	D	26.45	4123	9350	f	f	f	2003	19	regular	va
Lacey	Putney	I	99.14	19149	32779	t	t	f	2005	19	regular	va
Lacey	Putney	I	72.56	11908	90940	t	t	f	2007	19	regular	va
Lewis	Medlin	D	27.2	4464	15492	f	f	f	2007	19	regular	va
Lacey	Putney	I	64.13	15297	174466	t	t	f	2009	19	regular	va
Lewis	Medlin	D	20.63	4922	33338	f	f	f	2009	19	regular	va
William III	Smith	Const.	15.1	3602	3034	f	f	f	2009	19	regular	va
Lacey	Putney	I	41.61	8883	156044	t	t	f	2011	19	regular	va
Jerry	Johnson	R	31.74	6775	2499	f	f	f	2011	19	regular	va
Lewis	Medlin	D	26.56	5670	43467	f	f	f	2011	19	regular	va
Terry	Austin	R	69.95	16156	112614	f	t	f	2013	19	regular	va
Lewis	Medlin	D	29.66	6849	48009	f	f	f	2013	19	regular	va
Lacey	Putney	I	\N	\N	86235	t	\N	f	2013	19	regular	va
Joshua	Ball	Const.	\N	\N	0	f	\N	t	2013	19	regular	va
Terry	Austin	R	100.0	12272	71696	t	t	f	2015	19	regular	va
Whitt	Clement	D	99.95	9952	82477	t	t	f	1997	20	regular	va
Whitt	Clement	D	99.87	5348	89041	t	t	f	1999	20	regular	va
Christopher B	Saxman	R	65.0	12683	102782	f	t	f	2001	20	regular	va
Tracy	Pyles	D	35.0	6918	20126	f	f	f	2001	20	regular	va
Charles W	Curry	R	\N	\N	2889	f	\N	t	2001	20	regular	va
Christopher B	Saxman	R	99.06	11732	41329	t	t	f	2003	20	regular	va
Christopher B	Saxman	R	68.38	14252	108993	t	t	f	2005	20	regular	va
Bruce A	Elder	D	31.46	6558	32327	f	f	f	2005	20	regular	va
Christopher B	Saxman	R	97.98	10648	78118	t	t	f	2007	20	regular	va
Dickie	Bell	R	71.17	15086	55020	f	t	f	2009	20	regular	va
Erik	Curren	D	28.74	6092	45237	f	f	f	2009	20	regular	va
Christopher B	Saxman	R	\N	\N	154450	t	\N	f	2009	20	regular	va
Dickie	Bell	R	71.05	9522	82869	t	t	f	2011	20	regular	va
Laura	Kleiner	D	28.84	3865	16474	f	f	f	2011	20	regular	va
Dickie	Bell	R	95.93	16712	73359	t	t	f	2013	20	regular	va
Dickie	Bell	R	75.85	10758	89183	t	t	f	2015	20	regular	va
Will	Hammer	L	24.15	3425	1585	f	f	f	2015	20	regular	va
Frank	Wagner	R	98.85	10105	39261	t	t	f	1997	21	regular	va
Frank	Wagner	R	96.7	7185	48870	t	t	f	1999	21	regular	va
John J III	Welch	R	61.44	2533	89418	f	t	f	2001	21	special	va
Alan P	Holmes	D	38.13	1572	159683	f	f	f	2001	21	special	va
John J III	Welch	R	97.06	10563	58728	t	t	f	2001	21	regular	va
Frank	Wagner	R	\N	\N	10402	f	\N	t	2001	21	regular	va
John J III	Welch	R	61.91	3713	82644	t	t	f	2003	21	regular	va
Tim	Jackson	D	38.02	2280	9699	f	f	f	2003	21	regular	va
John J III	Welch	R	94.34	10676	83893	t	t	f	2005	21	regular	va
Robert W	Mathieson	D	57.51	4443	758412	f	t	f	2007	21	regular	va
John J III	Welch	R	42.08	3251	675302	t	f	f	2007	21	regular	va
Ron	Villanueva	R	49.94	7673	501844	f	t	f	2009	21	regular	va
Robert W	Mathieson	D	49.85	7659	799297	t	f	f	2009	21	regular	va
Ron	Villanueva	R	57.28	6194	351101	t	t	f	2011	21	regular	va
Adrianne	Bennett	D	42.54	4600	218396	f	f	f	2011	21	regular	va
Ron	Villanueva	R	54.37	10642	271924	t	t	f	2013	21	regular	va
Susan	Hippen	D	45.44	8895	88318	f	f	f	2013	21	regular	va
Ron	Villanueva	R	56.87	6345	287504	t	t	f	2015	21	regular	va
Susan	Hippen	D	43.13	4812	86221	f	f	f	2015	21	regular	va
Kathy	Byron	R	59.04	10232	133846	f	t	f	1997	22	regular	va
Kaye Sweeney	Lipscomb	D	40.87	7082	181707	f	f	f	1997	22	regular	va
Joyce	Crouch	R	\N	\N	1575	t	\N	f	1997	22	regular	va
Kathy	Byron	R	63.86	7880	53286	t	t	f	1999	22	regular	va
Jason	Campbell	D	35.98	4440	1662	f	f	f	1999	22	regular	va
Kathy	Byron	R	56.0	11564	115758	t	t	f	2001	22	regular	va
W Shelton III	Miles	I	44.0	8968	69044	f	f	f	2001	22	regular	va
Kathy	Byron	R	99.95	12946	24195	t	t	f	2003	22	regular	va
Kathy	Byron	R	99.01	15341	38047	t	t	f	2005	22	regular	va
Kathy	Byron	R	98.99	8783	66935	t	t	f	2007	22	regular	va
Kathy	Byron	R	99.0	18107	143782	t	t	f	2009	22	regular	va
Kathy	Byron	R	97.69	12922	136230	t	t	f	2011	22	regular	va
Kathy	Byron	R	66.26	15025	241361	t	t	f	2013	22	regular	va
Katie	Cyphert	D	33.57	7612	192335	f	f	f	2013	22	regular	va
Kathy	Byron	R	100.0	9228	138335	t	t	f	2015	22	regular	va
L Preston Jr	Bryant	R	62.75	9839	78542	t	t	f	1997	23	regular	va
James B	Feinman	D	37.11	5818	138730	f	f	f	1997	23	regular	va
L Preston Jr	Bryant	R	97.16	9187	22207	t	t	f	1999	23	regular	va
L Preston Jr	Bryant	R	98.09	13396	18063	t	t	f	2001	23	regular	va
L Preston Jr	Bryant	R	97.14	11052	46228	t	t	f	2003	23	regular	va
L Preston Jr	Bryant	R	96.85	12444	284583	t	t	f	2005	23	regular	va
Shannon R	Valentine	D	57.5	7887	230949	f	t	f	2006	23	special	va
Michael B	Harrington	R	42.41	5817	202948	f	f	f	2006	23	special	va
Shannon R	Valentine	D	95.61	4551	133805	t	t	f	2007	23	regular	va
Scott	Garrett	R	50.41	10813	491760	f	t	f	2009	23	regular	va
Shannon R	Valentine	D	49.44	10604	558832	t	f	f	2009	23	regular	va
Scott	Garrett	R	92.27	11978	143830	t	t	f	2011	23	regular	va
Scott	Garrett	R	75.45	17080	173235	t	t	f	2013	23	regular	va
Jonathan	Parrish	L	22.34	5058	4352	f	f	f	2013	23	regular	va
Scott	Garrett	R	100.0	7390	156587	t	t	f	2015	23	regular	va
Edward	Polloway	I	8.7	743	0	f	f	f	2015	23	regular	va
Leo C Jr	Wardrup	R	98.72	11321	55092	t	t	f	1997	83	regular	va
Leo C Jr	Wardrup	R	60.5	6717	138687	t	t	f	1999	83	regular	va
Samuel W Jr	Meekins	D	39.37	4371	118369	f	f	f	1999	83	regular	va
Leo C Jr	Wardrup	R	58.0	9241	142487	t	t	f	2001	83	regular	va
Afshin	Farashahi	D	42.0	6557	24611	f	f	f	2001	83	regular	va
Leo C Jr	Wardrup	R	97.46	6790	105287	t	t	f	2003	83	regular	va
Leo C Jr	Wardrup	R	60.02	9239	229375	t	t	f	2005	83	regular	va
Georgia	Allen	D	39.87	6137	40843	f	f	f	2005	83	regular	va
Joseph	Bouchard	D	50.59	4824	545965	f	t	f	2007	83	regular	va
Chris	Stolle	R	49.22	4693	643943	f	f	f	2007	83	regular	va
Leo C Jr	Wardrup	R	\N	\N	111859	t	\N	f	2007	83	regular	va
Robert	Rummells	R	\N	\N	0	f	\N	t	2007	83	regular	va
Chris	Stolle	R	59.51	9347	780095	f	t	f	2009	83	regular	va
Joseph	Bouchard	D	40.4	6346	763352	t	f	f	2009	83	regular	va
Chris	Stolle	R	96.57	7150	98914	t	t	f	2011	83	regular	va
Chris	Stolle	R	96.87	15426	138282	t	t	f	2013	83	regular	va
Chris	Stolle	R	100.0	10233	143328	t	t	f	2015	83	regular	va
Bob	McDonnell	R	98.53	10105	47720	t	t	f	1997	84	regular	va
Bob	McDonnell	R	55.27	6347	469725	t	t	f	1999	84	regular	va
Frank	Drew	D	44.61	5122	516717	f	f	f	1999	84	regular	va
Bob	McDonnell	R	98.12	10727	110802	t	t	f	2001	84	regular	va
Bob	McDonnell	R	96.39	4329	140438	t	t	f	2003	84	regular	va
Sal	Iaquinto	R	55.5	8271	211222	f	t	f	2005	84	regular	va
Supriya	Christopher	D	44.32	6605	213144	f	f	f	2005	84	regular	va
Bob	McDonnell	R	\N	\N	76644	t	\N	t	2005	84	regular	va
Tanya	Bullock	R	\N	\N	6085	f	\N	t	2005	84	regular	va
Sal	Iaquinto	R	96.78	4419	127713	t	t	f	2007	84	regular	va
Sal	Iaquinto	R	98.15	11967	121707	t	t	f	2009	84	regular	va
Sal	Iaquinto	R	96.33	5170	87117	t	t	f	2011	84	regular	va
Glenn	Davis	R	57.34	10101	284897	f	t	f	2013	84	regular	va
Brent N	McKenzie	D	42.44	7476	58396	f	f	f	2013	84	regular	va
Sal	Iaquinto	R	\N	\N	142040	t	\N	f	2013	84	regular	va
Glenn	Davis	R	100.0	6810	164127	t	t	f	2015	84	regular	va
Bob	Tata	R	98.8	15533	25377	t	t	f	1997	85	regular	va
Bob	Tata	R	97.6	11322	53084	t	t	f	1999	85	regular	va
Bob	Tata	R	98.83	16837	40456	t	t	f	2001	85	regular	va
Bob	Tata	R	73.46	7622	90570	t	t	f	2003	85	regular	va
Eric A	Potter	I	26.38	2737	25395	f	f	f	2003	85	regular	va
Bob	Tata	R	98.32	16694	86452	t	t	f	2005	85	regular	va
Bob	Tata	R	96.37	6100	93342	t	t	f	2007	85	regular	va
Bob	Tata	R	81.12	15035	65204	t	t	f	2009	85	regular	va
French D Jr	Mackes	Const.	18.41	3413	447	f	f	f	2009	85	regular	va
Bob	Tata	R	96.91	6612	84267	t	t	f	2011	85	regular	va
Scott	Taylor	R	56.27	11041	240967	f	t	f	2013	85	regular	va
Bill	Dale	D	43.46	8528	74810	f	f	f	2013	85	regular	va
Bob	Tata	R	\N	\N	23440	t	\N	f	2013	85	regular	va
Scott	Taylor	R	100.0	9406	77311	t	t	f	2015	85	regular	va
Donald L	Williams	D	49.9	2473	250558	f	t	f	1997	86	regular	va
Beverly B	Graeber	R	49.74	2465	172206	f	f	f	1997	86	regular	va
George H Jr	Heilig	D	49.9	2473	26384	t	f	f	1997	86	regular	va
Donald L	Williams	D	55.1	2672	396682	t	t	f	1999	86	regular	va
Beverly B	Graeber	R	44.77	2171	283009	f	f	f	1999	86	regular	va
Tom	Rust	R	63.0	9175	230658	f	t	f	2001	86	regular	va
James	Kelly	D	37.0	5388	17223	f	f	f	2001	86	regular	va
Tom	Rust	R	63.77	6221	198089	t	t	f	2003	86	regular	va
James	Kelly	D	36.09	3510	17295	f	f	f	2003	86	regular	va
Tom	Rust	R	92.09	10443	135684	t	t	f	2005	86	regular	va
Tom	Rust	R	52.76	6309	749479	t	t	f	2007	86	regular	va
Jay	Donahue	D	47.09	5632	488999	f	f	f	2007	86	regular	va
Tom	Rust	R	53.83	8256	702206	t	t	f	2009	86	regular	va
Stevens R	Miller	D	46.0	7054	632677	f	f	f	2009	86	regular	va
Tom	Rust	R	95.88	9215	248119	t	t	f	2011	86	regular	va
Tom	Rust	R	50.08	10410	860985	t	t	f	2013	86	regular	va
Jennifer	Boysko	D	49.92	10378	517269	f	f	f	2013	86	regular	va
Jennifer	Boysko	D	54.5	8283	693914	f	t	f	2015	86	regular	va
Danny	Vargas	R	42.04	6390	1076222	f	f	f	2015	86	regular	va
Paul	Brubaker	I	3.46	526	21235	f	f	f	2015	86	regular	va
Tom	Rust	R	\N	\N	196050	t	\N	f	2015	86	regular	va
Thelma D	Drake	R	65.26	6012	98625	t	t	f	1997	87	regular	va
Todd	Fiorella	D	34.46	3175	87590	f	f	f	1997	87	regular	va
Thelma D	Drake	R	97.74	6218	77557	t	t	f	1999	87	regular	va
Thelma D	Drake	R	66.0	8267	130740	t	t	f	2001	87	regular	va
Warren	Stewart	D	34.0	4336	11787	f	f	f	2001	87	regular	va
Donald L	Williams	D	\N	\N	57252	f	\N	f	2001	87	regular	va
Thelma D	Drake	R	97.11	6009	130343	t	t	f	2003	87	regular	va
Paula	Miller	D	50.5	3862	192316	f	t	f	2004	87	special	va
Michael L	Ball	R	49.3	3765	91324	f	f	f	2004	87	special	va
Paula	Miller	D	50.14	6296	297701	t	t	f	2005	87	regular	va
Michael L	Ball	R	37.5	4708	193405	f	f	f	2005	87	regular	va
John A	Coggeshall	I	12.04	1512	25600	f	f	f	2005	87	regular	va
Thelma D	Drake	R	\N	\N	97053	f	\N	t	2005	87	regular	va
Paula	Miller	D	54.04	5248	435153	t	t	f	2007	87	regular	va
Henry C III	Giffin	R	45.78	4446	290225	f	f	f	2007	87	regular	va
Paula	Miller	D	56.62	6693	215563	t	t	f	2009	87	regular	va
John	Amiral	R	43.24	5111	201238	f	f	f	2009	87	regular	va
David	Ramadan	R	49.93	5435	607486	f	t	f	2011	87	regular	va
Mike	Kondratick	D	49.46	5384	232283	f	f	f	2011	87	regular	va
Paula	Miller	D	\N	\N	33678	t	\N	f	2011	87	regular	va
David	Ramadan	R	50.26	10274	786179	t	t	f	2013	87	regular	va
John	Bell	D	49.35	10087	1024971	f	f	f	2013	87	regular	va
John	Bell	D	49.93	8203	568952	f	t	f	2015	87	regular	va
Chuong	Nguyen	R	47.98	7883	520097	f	f	f	2015	87	regular	va
Brian	Suojanen	L	2.09	343	4138	f	f	f	2015	87	regular	va
David	Ramadan	R	\N	\N	294749	t	\N	f	2015	87	regular	va
Jack	Tiwari	D	\N	\N	3495	f	\N	t	2015	87	regular	va
Thomas W Jr	Moss	D	72.8	9655	344498	t	t	f	1997	88	regular	va
G R	West	I	26.86	3563	5809	f	f	f	1997	88	regular	va
Thomas W Jr	Moss	D	57.88	6700	441073	t	t	f	1999	88	regular	va
Rowena	Fullinwider	R	42.02	4864	153611	f	f	f	1999	88	regular	va
G R	West	I	\N	\N	1453	f	\N	t	1999	88	regular	va
Mark	Cole	R	66.0	9926	102831	f	t	f	2001	88	regular	va
William L	Jones	D	34.0	5144	124995	f	f	f	2001	88	regular	va
Mark	Cole	R	71.2	6652	82314	t	t	f	2003	88	regular	va
Charles A	Feldbush	D	28.74	2685	5159	f	f	f	2003	88	regular	va
Mark	Cole	R	62.47	10904	79711	t	t	f	2005	88	regular	va
Charles A	Feldbush	D	37.46	6539	15870	f	f	f	2005	88	regular	va
Hap	Conners	I	\N	\N	0	f	\N	f	2005	88	regular	va
Mark	Cole	R	62.23	8894	229808	t	t	f	2007	88	regular	va
Carlos	Del Toro	D	37.63	5377	499835	f	f	f	2007	88	regular	va
Mark	Cole	R	97.01	15925	58876	t	t	f	2009	88	regular	va
Mark	Cole	R	93.1	11372	33572	t	t	f	2011	88	regular	va
Mark	Cole	R	61.35	13322	34010	t	t	f	2013	88	regular	va
Kathleen T	O'Halloran	D	38.41	8340	16019	f	f	f	2013	88	regular	va
Mark	Cole	R	100.0	11123	33054	t	t	f	2015	88	regular	va
Jerrauld	Jones	D	97.45	7726	28956	t	t	f	1997	89	regular	va
Jerrauld	Jones	D	96.67	5052	82044	t	t	f	1999	89	regular	va
Jerrauld	Jones	D	98.11	12572	55703	t	t	f	2001	89	regular	va
Thomas W Jr	Moss	D	\N	\N	51881	f	\N	f	2001	89	regular	va
Kenneth	Alexander	D	73.0	3927	43671	f	t	f	2002	89	special	va
Linda	Horsey	R	21.0	1122	48563	f	f	f	2002	89	special	va
Sherry D	Battle	I	6.0	348	49998	f	f	f	2002	89	special	va
Kenneth	Alexander	D	97.75	5436	18167	t	t	f	2003	89	regular	va
Jerrauld	Jones	D	\N	\N	0	f	\N	t	2003	89	regular	va
Kenneth	Alexander	D	76.01	10973	47402	t	t	f	2005	89	regular	va
Joshua	Behr	R	23.14	3341	3220	f	f	f	2005	89	regular	va
Kenneth	Alexander	D	96.62	5265	48461	t	t	f	2007	89	regular	va
Kenneth	Alexander	D	81.02	10659	90623	t	t	f	2009	89	regular	va
Anthony	Triplin	I	18.61	2448	46585	f	f	f	2009	89	regular	va
Kenneth	Alexander	D	96.82	5821	65986	t	t	f	2011	89	regular	va
Daun	Hester	D	93.66	1124	17633	f	t	f	2012	89	special	va
James J	St John	I	0.55	66	110	f	f	f	2012	89	special	va
Lionell Jr	Spruill	I	\N	\N	5735	f	\N	f	2012	89	special	va
Daun	Hester	D	96.85	14892	26235	t	t	f	2013	89	regular	va
Kimberly	Adams	I	\N	\N	1260	f	\N	f	2013	89	regular	va
Kenneth	Alexander	D	\N	\N	141115	f	\N	t	2013	89	regular	va
Daun	Hester	D	100.0	7078	36327	t	t	f	2015	89	regular	va
William P Jr	Robinson	D	84.66	7649	70478	t	t	f	1997	90	regular	va
William P Jr	Robinson	D	49.96	4735	155116	t	t	f	1999	90	regular	va
Michael L	Ball	R	42.47	4025	34157	f	f	f	1999	90	regular	va
Darrin W	Mackinnon	I	7.38	699	3795	f	f	f	1999	90	regular	va
Winsome E	Sears	R	53.0	6696	78381	f	t	f	2001	90	regular	va
William P Jr	Robinson	D	47.0	6017	156377	t	f	f	2001	90	regular	va
Algie	Howell	D	99.38	3850	27100	f	t	f	2003	90	regular	va
Winsome E	Sears	R	\N	\N	39816	t	\N	f	2003	90	regular	va
Algie	Howell	D	96.97	9269	57484	t	t	f	2005	90	regular	va
Algie	Howell	D	97.08	3619	34204	t	t	f	2007	90	regular	va
Algie	Howell	D	66.64	7398	93431	t	t	f	2009	90	regular	va
Jason	Call	R	33.08	3672	58614	f	f	f	2009	90	regular	va
Algie	Howell	D	97.08	4193	105237	t	t	f	2011	90	regular	va
Jason	Call	I	\N	\N	0	f	\N	t	2011	90	regular	va
Algie	Howell	D	97.43	13217	79333	t	t	f	2013	90	regular	va
Joe	Lindsey	D	80.39	1730	23777	f	t	f	2014	90	special	va
Marcus	Calabrese	R	19.33	416	2949	f	f	f	2014	90	special	va
Joe	Lindsey	D	100.0	6351	43178	t	t	f	2015	90	regular	va
Irving Vincent Jr	Behm	D	70.31	10609	55566	t	t	f	1997	91	regular	va
Raymond S Jr	Erickson	R	29.45	4443	5016	f	f	f	1997	91	regular	va
Phillip E	Larrabee	R	39.42	4892	338464	f	t	f	1999	91	regular	va
James R	Joseph	D	29.0	3599	360516	f	f	f	1999	91	regular	va
Ross A II	Kearney	I	27.16	3371	32408	f	f	f	1999	91	regular	va
Rudy	Langford	I	4.28	531	3844	f	f	f	1999	91	regular	va
Irving Vincent Jr	Behm	D	\N	\N	2561	t	\N	f	1999	91	regular	va
Tom	Gear	R	97.14	15126	39057	f	t	f	2001	91	regular	va
Tom	Gear	R	94.88	6056	90051	t	t	f	2003	91	regular	va
Tom	Gear	R	59.43	11057	239437	t	t	f	2005	91	regular	va
Randall Adkins	Gilliland	I	39.87	7418	236799	f	f	f	2005	91	regular	va
Tom	Gear	R	93.15	9156	109540	t	t	f	2007	91	regular	va
Tom	Gear	R	48.32	9581	223204	t	t	f	2009	91	regular	va
Samuel L Jr	Eure	D	18.97	3761	19724	f	f	f	2009	91	regular	va
Gordon	Helsel	I	32.6	6465	185891	f	f	f	2009	91	regular	va
Olaf F Jr	Gebhart	D	\N	\N	5282	f	\N	f	2009	91	regular	va
Gordon	Helsel	R	98.0	2117	17828	f	t	f	2011	91	special	va
Gordon	Helsel	R	95.62	8983	24923	t	t	f	2011	91	regular	va
Tom	Gear	R	\N	\N	16552	f	\N	f	2011	91	regular	va
Gordon	Helsel	R	92.03	17395	69277	t	t	f	2013	91	regular	va
Gordon	Helsel	R	100.0	7173	74964	t	t	f	2015	91	regular	va
Mary T	Christian	D	98.78	10736	32834	t	t	f	1997	92	regular	va
Mary T	Christian	D	79.03	6500	65506	t	t	f	1999	92	regular	va
Timothy L	Lynch	R	20.15	1657	765	f	f	f	1999	92	regular	va
Mary T	Christian	D	68.0	9733	82100	t	t	f	2001	92	regular	va
Alvin	Bryant	R	32.0	4657	74036	f	f	f	2001	92	regular	va
Jeion	Ward	D	54.15	4549	123939	f	t	f	2003	92	regular	va
Alvin	Bryant	R	45.54	3826	81663	f	f	f	2003	92	regular	va
Mary T	Christian	D	\N	\N	18433	t	\N	f	2003	92	regular	va
Jeion	Ward	D	78.5	10811	65803	t	t	f	2005	92	regular	va
Anthony C	Williams	I	20.96	2886	4087	f	f	f	2005	92	regular	va
Jeion	Ward	D	94.61	4472	74220	t	t	f	2007	92	regular	va
Jeion	Ward	D	96.79	11443	70825	t	t	f	2009	92	regular	va
Jeion	Ward	D	96.0	8800	75322	t	t	f	2011	92	regular	va
Jeion	Ward	D	97.17	17353	77579	t	t	f	2013	92	regular	va
Jeion	Ward	D	100.0	6688	114248	t	t	f	2015	92	regular	va
Phillip A	Hamilton	R	99.94	9862	55117	t	t	f	1997	93	regular	va
Phillip A	Hamilton	R	96.29	6412	68728	t	t	f	1999	93	regular	va
Phillip A	Hamilton	R	97.13	10260	108387	t	t	f	2001	93	regular	va
Phillip A	Hamilton	R	95.95	3391	138434	t	t	f	2003	93	regular	va
Phillip A	Hamilton	R	94.77	10362	210036	t	t	f	2005	93	regular	va
David	Casey	L	\N	\N	14	f	\N	f	2005	93	regular	va
Walter	Skeeter	I	\N	\N	0	f	\N	f	2005	93	regular	va
Phillip A	Hamilton	R	93.19	6032	350158	t	t	f	2007	93	regular	va
Robin	Abbott	D	53.95	7631	572074	f	t	f	2009	93	regular	va
Phillip A	Hamilton	R	45.61	6451	715082	t	f	f	2009	93	regular	va
Christia	Rey	D	\N	\N	3844	f	\N	t	2009	93	regular	va
Mike	Watson	R	51.7	8188	534669	f	t	f	2011	93	regular	va
Robin	Abbott	D	48.09	7615	451212	t	f	f	2011	93	regular	va
Monty	Mason	D	52.06	12132	794695	f	t	f	2013	93	regular	va
Mike	Watson	R	47.61	11094	1051731	t	f	f	2013	93	regular	va
Monty	Mason	D	54.78	8910	741434	t	t	f	2015	93	regular	va
Lara	Overy	R	45.22	7354	713500	f	f	f	2015	93	regular	va
Mike	Mullin	D	53.53	20417	230209	f	t	f	2016	93	special	va
Heather	Cordasco	R	46.23	17634	146954	f	f	f	2016	93	special	va
Alan	Diamonstein	D	55.05	8986	509699	t	t	f	1997	94	regular	va
S Allen III	Face	R	44.94	7336	89321	f	f	f	1997	94	regular	va
Alan	Diamonstein	D	52.11	7037	588827	t	t	f	1999	94	regular	va
Patricia B	Stall	R	44.32	5985	136065	f	f	f	1999	94	regular	va
Jessica P	Hughes	I	3.47	468	2638	f	f	f	1999	94	regular	va
Glenn	Oder	R	54.0	9691	169452	f	t	f	2001	94	regular	va
John	Miller	D	46.0	8349	88483	f	f	f	2001	94	regular	va
Alan	Diamonstein	D	\N	\N	60205	t	\N	t	2001	94	regular	va
Patricia B	Stall	R	\N	\N	12722	f	\N	t	2001	94	regular	va
Glenn	Oder	R	92.89	3369	48267	t	t	f	2003	94	regular	va
Glenn	Oder	R	96.15	14385	91225	t	t	f	2005	94	regular	va
Glenn	Oder	R	74.32	9646	141344	t	t	f	2007	94	regular	va
William Donald	Pelkey	I	25.06	3253	730	f	f	f	2007	94	regular	va
Glenn	Oder	R	67.62	11740	261412	t	t	f	2009	94	regular	va
Gary	West	D	32.22	5594	82900	f	f	f	2009	94	regular	va
David	Yancey	R	59.93	9251	241785	f	t	f	2011	94	regular	va
Gary	West	D	39.94	6165	120256	f	f	f	2011	94	regular	va
Glenn	Oder	R	\N	\N	166444	t	\N	f	2011	94	regular	va
David	Yancey	R	51.15	11001	1041247	t	t	f	2013	94	regular	va
Robert	Farinholt	D	48.63	10458	744062	f	f	f	2013	94	regular	va
David	Yancey	R	57.56	8140	653837	t	t	f	2015	94	regular	va
Shelly	Simonds	D	42.44	6002	436850	f	f	f	2015	94	regular	va
Flora D	Crittenden	D	98.83	9873	16504	t	t	f	1997	95	regular	va
Flora D	Crittenden	D	97.03	6077	10883	t	t	f	1999	95	regular	va
Flora D	Crittenden	D	70.0	10732	53717	t	t	f	2001	95	regular	va
Raymond	Johnson	R	30.0	4562	35967	f	f	f	2001	95	regular	va
Mamye	BaCote	D	64.68	5353	77608	f	t	f	2003	95	regular	va
Raymond	Johnson	R	34.85	2884	49204	f	f	f	2003	95	regular	va
Flora D	Crittenden	D	\N	\N	24994	t	\N	f	2003	95	regular	va
Mamye	BaCote	D	71.55	10867	100093	t	t	f	2005	95	regular	va
Sean V	Devlin	R	28.21	4284	16546	f	f	f	2005	95	regular	va
Mamye	BaCote	D	93.92	5109	68638	t	t	f	2007	95	regular	va
Mamye	BaCote	D	95.99	11837	74956	t	t	f	2009	95	regular	va
Mamye	BaCote	D	76.73	7142	80680	t	t	f	2011	95	regular	va
Glenn	McGuire	L	22.71	2114	747	f	f	f	2011	95	regular	va
Mamye	BaCote	D	76.49	12803	61036	t	t	f	2013	95	regular	va
John	Bloom	R	23.28	3897	7900	f	f	f	2013	95	regular	va
Cia	Price	D	76.8	6106	49338	f	t	f	2015	95	regular	va
Pricillia	Burnett	Ind. Green	23.2	1845	4264	f	f	f	2015	95	regular	va
Mamye	BaCote	D	\N	\N	30748	t	\N	f	2015	95	regular	va
Jo Ann	Davis	R	48.7	10020	101524	f	t	f	1997	96	regular	va
Shirley	Cooper	D	46.98	9667	239253	t	f	f	1997	96	regular	va
R A II	Russell	I	4.13	850	351	f	f	f	1997	96	regular	va
Jo Ann	Davis	R	71.1	13113	85615	t	t	f	1999	96	regular	va
Christopher A	Mayer	D	28.82	5315	27773	f	f	f	1999	96	regular	va
Carol K	Santoro	D	\N	\N	9895	f	\N	t	1999	96	regular	va
Melanie Rapp	Beale	R	51.12	5049	162159	f	t	f	2000	96	special	va
Patrick R	Pettitt	D	48.79	4819	135678	f	f	f	2000	96	special	va
Melanie Rapp	Beale	R	46.0	9888	153804	t	t	f	2001	96	regular	va
Patrick R	Pettitt	D	38.0	8175	99940	f	f	f	2001	96	regular	va
Robert L	Stermer	L	1.0	208	2134	f	f	f	2001	96	regular	va
H Richard	Ashe	I	15.0	3144	32672	f	f	f	2001	96	regular	va
Jo Ann	Davis	R	\N	\N	11113	f	\N	t	2001	96	regular	va
Melanie Rapp	Beale	R	54.11	7780	14760	t	t	f	2003	96	regular	va
Phillip R	Forgit	D	45.7	6571	177141	f	f	f	2003	96	regular	va
Melanie Rapp	Beale	R	92.1	18586	39361	t	t	f	2005	96	regular	va
Brenda	Pogge	R	56.85	9839	205227	f	t	f	2007	96	regular	va
Troy J	Farlow	D	36.59	6333	163623	f	f	f	2007	96	regular	va
Pamela	Pouchot	I	6.14	1063	0	f	f	f	2007	96	regular	va
Melanie Rapp	Beale	R	\N	\N	47907	t	\N	f	2007	96	regular	va
Richard	Vandermark	I	\N	\N	119	f	\N	t	2007	96	regular	va
Brenda	Pogge	R	94.43	21400	88513	t	t	f	2009	96	regular	va
Brenda	Pogge	R	94.49	12644	76929	t	t	f	2011	96	regular	va
Brenda	Pogge	R	92.03	22015	67355	t	t	f	2013	96	regular	va
Brenda	Pogge	R	61.23	12010	95425	t	t	f	2015	96	regular	va
Brandon	Waltrip	I	38.77	7605	13781	f	f	f	2015	96	regular	va
George W	Grayson	D	53.93	13309	265487	t	t	f	1997	97	regular	va
David L	Sisk	R	45.85	11316	138323	f	f	f	1997	97	regular	va
George W	Grayson	D	96.5	15561	34391	t	t	f	1999	97	regular	va
Ryan	McDougle	R	54.0	11726	118698	f	t	f	2001	97	regular	va
John Willard Jr	Montgomery	D	46.0	10169	83198	f	f	f	2001	97	regular	va
Ryan	McDougle	R	99.41	13254	59782	t	t	f	2003	97	regular	va
Ryan	McDougle	R	97.91	18861	220430	t	t	f	2005	97	regular	va
Chris	Peace	R	50.8	4573	258061	f	t	f	2006	97	special	va
John Willard Jr	Montgomery	D	48.4	4354	272737	f	f	f	2006	97	special	va
Lee	Criscuolo	I	1.0	64	0	f	f	f	2006	97	special	va
Chris	Peace	R	98.46	14544	107969	t	t	f	2007	97	regular	va
Chris	Peace	R	97.85	20910	139195	t	t	f	2009	97	regular	va
Chris	Peace	R	97.6	15573	185116	t	t	f	2011	97	regular	va
Chris	Peace	R	95.17	24288	210578	t	t	f	2013	97	regular	va
Chris	Peace	R	78.79	15144	250647	t	t	f	2015	97	regular	va
Erica	Lawler	I	21.21	4076	2292	f	f	f	2015	97	regular	va
Harvey	Morgan	R	99.33	15604	32795	t	t	f	1997	98	regular	va
Harvey	Morgan	R	99.4	15282	39044	t	t	f	1999	98	regular	va
Harvey	Morgan	R	75.0	15089	151352	t	t	f	2001	98	regular	va
Kirk J	Havens	D	25.0	5141	28593	f	f	f	2001	98	regular	va
Harvey	Morgan	R	78.83	13286	91310	t	t	f	2003	98	regular	va
Michael C	Rowe	I	21.12	3563	5359	f	f	f	2003	98	regular	va
Harvey	Morgan	R	98.71	18488	124882	t	t	f	2005	98	regular	va
Harvey	Morgan	R	99.05	17848	127975	t	t	f	2007	98	regular	va
Harvey	Morgan	R	98.84	20178	103210	t	t	f	2009	98	regular	va
Keith	Hodges	R	78.31	16647	149281	f	t	f	2011	98	regular	va
Andrew	Shoukas	D	21.43	4556	2532	f	f	f	2011	98	regular	va
Harvey	Morgan	R	\N	\N	68864	t	\N	f	2011	98	regular	va
Keith	Hodges	R	75.41	17960	77356	t	t	f	2013	98	regular	va
Neena	Putt	I	24.17	5756	1912	f	f	f	2013	98	regular	va
Keith	Hodges	R	100.0	15039	59756	t	t	f	2015	98	regular	va
W Tayloe Jr	Murphy	D	98.61	14110	46223	t	t	f	1997	99	regular	va
Albert	Pollard	D	53.04	10174	492179	f	t	f	1999	99	regular	va
Henry L	Hull	R	46.79	8975	350748	f	f	f	1999	99	regular	va
W Tayloe Jr	Murphy	D	\N	\N	13278	t	\N	f	1999	99	regular	va
Albert	Pollard	D	62.0	12738	191774	t	t	f	2001	99	regular	va
Ronald A	Webb	R	38.0	7969	63899	f	f	f	2001	99	regular	va
Albert	Pollard	D	65.06	11258	157431	t	t	f	2003	99	regular	va
Shawn	Donahue	R	34.9	6039	94468	f	f	f	2003	99	regular	va
Rob	Wittman	R	61.54	13360	159809	f	t	f	2005	99	regular	va
Linda	Crandell	D	38.34	8323	28158	f	f	f	2005	99	regular	va
Albert	Pollard	D	\N	\N	64418	t	\N	f	2005	99	regular	va
Rob	Wittman	R	98.91	17903	61360	t	t	f	2007	99	regular	va
Albert	Pollard	D	57.57	6908	137447	f	t	f	2008	99	special	va
Lee Anne	Washington	R	42.39	5086	127489	f	f	f	2008	99	special	va
Albert	Pollard	D	52.19	11855	117652	t	t	f	2009	99	regular	va
Catherine	Crabill	R	47.65	10824	18542	f	f	f	2009	99	regular	va
Margaret	Ransone	R	69.09	14330	206185	f	t	f	2011	99	regular	va
Nick	Smith	D	30.68	6364	9826	f	f	f	2011	99	regular	va
Albert	Pollard	D	\N	\N	42127	t	\N	f	2011	99	regular	va
Margaret	Ransone	R	91.62	17839	67643	t	t	f	2013	99	regular	va
Margaret	Ransone	R	100.0	16861	101216	t	t	f	2015	99	regular	va
Kirk	Cox	R	98.74	20827	44186	t	t	f	1997	66	regular	va
Kirk	Cox	R	98.69	11260	52260	t	t	f	1999	66	regular	va
Kirk	Cox	R	98.29	19077	70115	t	t	f	2001	66	regular	va
Kirk	Cox	R	97.76	10896	103244	t	t	f	2003	66	regular	va
Kirk	Cox	R	96.84	21198	156691	t	t	f	2005	66	regular	va
Kirk	Cox	R	97.52	11049	174366	t	t	f	2007	66	regular	va
Kirk	Cox	R	97.03	21428	223593	t	t	f	2009	66	regular	va
Kirk	Cox	R	96.33	10681	409372	t	t	f	2011	66	regular	va
Kirk	Cox	R	94.69	20224	464917	t	t	f	2013	66	regular	va
Kirk	Cox	R	100.0	12683	489770	t	t	f	2015	66	regular	va
Roger J	McClure	R	56.11	10898	55538	t	t	f	1997	67	regular	va
James E III	Mitchell	D	43.84	8516	74627	f	f	f	1997	67	regular	va
Roger J	McClure	R	51.33	7413	116697	t	t	f	1999	67	regular	va
James E III	Mitchell	D	48.49	7004	187213	f	f	f	1999	67	regular	va
Gary A	Reese	R	61.0	10987	62659	f	t	f	2001	67	regular	va
Gayla	Schoenborn	D	39.0	7131	10234	f	f	f	2001	67	regular	va
Roger J	McClure	R	\N	\N	17819	t	\N	f	2001	67	regular	va
Gary A	Reese	R	98.0	9724	49034	t	t	f	2003	67	regular	va
Chuck	Caputo	D	53.98	10747	363988	f	t	f	2005	67	regular	va
Christopher	Craddock	R	39.56	7875	350406	f	f	f	2005	67	regular	va
Charles J Jr	Eby	L	2.44	485	5971	f	f	f	2005	67	regular	va
Chuck	Caputo	D	52.68	8334	626433	t	t	f	2007	67	regular	va
Marc R	Cadin	R	47.27	7477	374204	f	f	f	2007	67	regular	va
Jim	LeMunyon	R	52.65	10857	511147	f	t	f	2009	67	regular	va
Chuck	Caputo	D	47.25	9743	617704	t	f	f	2009	67	regular	va
Jim	LeMunyon	R	59.13	9172	410853	t	t	f	2011	67	regular	va
Eric	Clingan	D	40.74	6320	181146	f	f	f	2011	67	regular	va
Jim	LeMunyon	R	54.48	12787	372444	t	t	f	2013	67	regular	va
Hung	Nguyen	D	45.34	10642	145211	f	f	f	2013	67	regular	va
Jim	LeMunyon	R	100.0	11231	171334	t	t	f	2015	67	regular	va
Anne G	Rhodes	R	99.09	17190	36579	t	t	f	1997	68	regular	va
Anne G	Rhodes	R	98.52	7504	278556	t	t	f	1999	68	regular	va
Bradley P	Marrs	R	41.0	10788	224215	f	t	f	2001	68	regular	va
Edward B	Barber	D	35.0	9038	184322	f	f	f	2001	68	regular	va
John	Conrad	I	24.0	6406	158632	f	f	f	2001	68	regular	va
Anne G	Rhodes	R	\N	\N	18273	t	\N	f	2001	68	regular	va
Bradley P	Marrs	R	98.54	8412	136285	t	t	f	2003	68	regular	va
Katherine B	Waddell	I	49.93	13423	311475	f	t	f	2005	68	regular	va
Bradley P	Marrs	R	49.75	13376	327512	t	f	f	2005	68	regular	va
Manoli	Loupassi	R	54.06	8549	715507	f	t	f	2007	68	regular	va
Bill	Grogan	I	3.74	591	16088	f	f	f	2007	68	regular	va
Katherine B	Waddell	I	42.12	6661	364870	t	f	f	2007	68	regular	va
Manoli	Loupassi	R	69.74	17157	200277	t	t	f	2009	68	regular	va
Bill	Grogan	I	29.8	7332	16738	f	f	f	2009	68	regular	va
Manoli	Loupassi	R	92.96	10569	154441	t	t	f	2011	68	regular	va
Bill	Grogan	I	\N	\N	5091	f	\N	f	2011	68	regular	va
Manoli	Loupassi	R	62.71	20634	286922	t	t	f	2013	68	regular	va
Bill	Grogan	I	36.8	12108	42121	f	f	f	2013	68	regular	va
John	Maloney	I	\N	\N	9899	f	\N	t	2013	68	regular	va
Manoli	Loupassi	R	61.35	15715	277279	t	t	f	2015	68	regular	va
Bill	Grogan	D	36.76	9417	113790	f	f	f	2015	68	regular	va
Mike	Dickinson	I	1.89	484	0	f	f	f	2015	68	regular	va
Franklin P	Hall	D	99.98	8500	77934	t	t	f	1997	69	regular	va
Franklin P	Hall	D	99.68	2840	116344	t	t	f	1999	69	regular	va
Franklin P	Hall	D	99.33	10413	195255	t	t	f	2001	69	regular	va
Franklin P	Hall	D	99.36	5258	176518	t	t	f	2003	69	regular	va
Franklin P	Hall	D	77.81	11747	481797	t	t	f	2005	69	regular	va
L Shirley	Harvey	I	17.88	2719	83	f	f	f	2005	69	regular	va
Franklin P	Hall	D	82.8	4098	473127	t	t	f	2007	69	regular	va
Raymond J	Gargiulo	R	16.95	839	1482	f	f	f	2007	69	regular	va
Betsy	Carr	D	72.71	9652	230515	f	t	f	2009	69	regular	va
Ernesto	Sampson	R	21.65	2874	51830	f	f	f	2009	69	regular	va
L Shirley	Harvey	I	5.52	733	579	f	f	f	2009	69	regular	va
Franklin P	Hall	D	\N	\N	165958	t	\N	f	2009	69	regular	va
Betsy	Carr	D	97.9	7923	101086	t	t	f	2011	69	regular	va
Betsy	Carr	D	87.04	16992	156026	t	t	f	2013	69	regular	va
Bob	Barnett	I	12.59	2458	7282	f	f	f	2013	69	regular	va
Betsy	Carr	D	100.0	10990	128027	t	t	f	2015	69	regular	va
Dwight	Jones	D	99.04	7979	10717	t	t	f	1997	70	regular	va
Dwight	Jones	D	98.32	3516	16218	t	t	f	1999	70	regular	va
Dwight	Jones	D	99.39	10978	44900	t	t	f	2001	70	regular	va
Dwight	Jones	D	99.12	5548	19250	t	t	f	2003	70	regular	va
Dwight	Jones	D	98.72	13569	37862	t	t	f	2005	70	regular	va
Christopher	Danner	I	\N	\N	123	f	\N	f	2005	70	regular	va
Dwight	Jones	D	94.95	5355	42753	t	t	f	2007	70	regular	va
Delores	McQuinn	D	73.3	656	35712	f	t	f	2009	70	special	va
Delores	McQuinn	D	77.64	11297	52229	t	t	f	2009	70	regular	va
Henry Otis	Brown	I	21.7	3157	10813	f	f	f	2009	70	regular	va
Dwight	Jones	D	\N	\N	96279	f	\N	t	2009	70	regular	va
Delores	McQuinn	D	97.32	10293	31275	t	t	f	2011	70	regular	va
Delores	McQuinn	D	97.36	18422	31734	t	t	f	2013	70	regular	va
Delores	McQuinn	D	100.0	10676	31453	t	t	f	2015	70	regular	va
Viola	Baskerville	D	85.54	9846	32841	f	t	f	1997	71	regular	va
Bernard J	Artabazon	Va.	14.41	1659	0	f	f	f	1997	71	regular	va
Jean W	Cunningham	D	\N	\N	4670	t	\N	f	1997	71	regular	va
Viola	Baskerville	D	99.49	4111	27649	t	t	f	1999	71	regular	va
Viola	Baskerville	D	76.0	10515	73098	t	t	f	2001	71	regular	va
Chris	Elliott	R	24.0	3339	7563	f	f	f	2001	71	regular	va
Viola	Baskerville	D	99.73	6671	62413	t	t	f	2003	71	regular	va
Jennifer	McClellan	D	99.06	14699	102705	f	t	f	2005	71	regular	va
Viola	Baskerville	D	\N	\N	61051	t	\N	t	2005	71	regular	va
Jennifer	McClellan	D	97.45	4547	118847	t	t	f	2007	71	regular	va
Jennifer	McClellan	D	82.4	11628	172895	t	t	f	2009	71	regular	va
Silver	Persinger	I	17.05	2406	367	f	f	f	2009	71	regular	va
Jennifer	McClellan	D	97.89	7859	113757	t	t	f	2011	71	regular	va
Jennifer	McClellan	D	87.79	18219	133031	t	t	f	2013	71	regular	va
Matt	Fitch	R	11.89	2468	1520	f	f	f	2013	71	regular	va
Jennifer	McClellan	D	88.85	9809	136169	t	t	f	2015	71	regular	va
Steve	Imholt	I	11.15	1231	1364	f	f	f	2015	71	regular	va
John S	Reid	R	71.65	19908	40745	t	t	f	1997	72	regular	va
Shelby F	McCurnin	I	27.97	7773	14593	f	f	f	1997	72	regular	va
John S	Reid	R	82.66	12656	41434	t	t	f	1999	72	regular	va
John H III	Girardeau	L	17.13	2622	12302	f	f	f	1999	72	regular	va
John S	Reid	R	98.81	19902	53716	t	t	f	2001	72	regular	va
John S	Reid	R	93.05	7897	64582	t	t	f	2003	72	regular	va
John S	Reid	R	97.25	21585	83448	t	t	f	2005	72	regular	va
Jimmie	Massie	R	67.17	8502	366737	f	t	f	2007	72	regular	va
Thomas F	Herbert	D	32.7	4139	26153	f	f	f	2007	72	regular	va
John S	Reid	R	\N	\N	58382	t	\N	f	2007	72	regular	va
Jimmie	Massie	R	96.78	20058	249551	t	t	f	2009	72	regular	va
Jimmie	Massie	R	95.71	11327	302340	t	t	f	2011	72	regular	va
Jimmie	Massie	R	93.46	20784	265419	t	t	f	2013	72	regular	va
Jimmie	Massie	R	100.0	13664	288233	t	t	f	2015	72	regular	va
Eric I	Cantor	R	98.95	22519	92946	t	t	f	1997	73	regular	va
Eric I	Cantor	R	98.47	10030	201887	t	t	f	1999	73	regular	va
John	O'Bannon	R	86.97	2950	122589	f	t	f	2000	73	special	va
Sterling W	Hening	I	12.85	436	3637	f	f	f	2000	73	special	va
John	O'Bannon	R	98.74	19624	137190	t	t	f	2001	73	regular	va
Eric I	Cantor	R	\N	\N	94740	f	\N	t	2001	73	regular	va
John	O'Bannon	R	98.68	7864	93692	t	t	f	2003	73	regular	va
John	O'Bannon	R	72.42	16938	194879	t	t	f	2005	73	regular	va
Matthew T	Martin	L	27.1	6337	2526	f	f	f	2005	73	regular	va
John	O'Bannon	R	97.42	9101	172075	t	t	f	2007	73	regular	va
John	O'Bannon	R	62.3	14123	537552	t	t	f	2009	73	regular	va
Thomas J	Shields	D	37.57	8517	342899	f	f	f	2009	73	regular	va
John	O'Bannon	R	95.68	10195	200044	t	t	f	2011	73	regular	va
John	O'Bannon	R	93.75	19405	237469	t	t	f	2013	73	regular	va
John	O'Bannon	R	100.0	12514	303090	t	t	f	2015	73	regular	va
Donald	McEachin	D	79.51	12293	110818	t	t	f	1997	74	regular	va
Cherie	Phillips	I	20.28	3136	49	f	f	f	1997	74	regular	va
Donald	McEachin	D	98.89	8000	70656	t	t	f	1999	74	regular	va
Floyd H Sr	Miles	D	61.0	10451	55873	f	t	f	2001	74	regular	va
Terone B	Green	I	29.0	5016	84004	f	f	f	2001	74	regular	va
Victor A	Motley	I	9.0	1611	1555	f	f	f	2001	74	regular	va
Donald	McEachin	D	\N	\N	28058	t	\N	t	2001	74	regular	va
Floyd H Sr	Miles	D	99.33	6396	16612	t	t	f	2003	74	regular	va
Donald	McEachin	D	75.32	14247	109625	f	t	f	2005	74	regular	va
Shirley McCall	Goodall	I	24.4	4615	10512	f	f	f	2005	74	regular	va
Joe	Morrissey	D	97.46	7862	120893	f	t	f	2007	74	regular	va
Donald	McEachin	D	\N	\N	97631	t	\N	t	2007	74	regular	va
Brian	Taylor	I	\N	\N	0	f	\N	t	2007	74	regular	va
Joe	Morrissey	D	76.2	14605	185094	t	t	f	2009	74	regular	va
Michael	Gage	R	23.67	4537	10528	f	f	f	2009	74	regular	va
Joe	Morrissey	D	72.9	11717	208253	t	t	f	2011	74	regular	va
Dwayne	Whitehead	I	26.75	4299	5031	f	f	f	2011	74	regular	va
Joe	Morrissey	D	96.25	21440	187119	t	t	f	2013	74	regular	va
Lamont	Bagby	D	84.5	2192	30537	f	t	f	2015	74	special	va
Dave	Lambert	I	15.3	398	2207	f	f	f	2015	74	special	va
Joe	Morrissey	I	42.27	2840	17861	t	t	f	2015	74	special	va
Matt	Walton	R	24.14	1622	31603	f	f	f	2015	74	special	va
Kevin	Sullivan	D	33.37	2242	91167	f	f	f	2015	74	special	va
Lamont	Bagby	D	78.66	11452	14478	t	t	f	2015	74	regular	va
Dave	Lambert	I	21.34	3107	0	f	f	f	2015	74	regular	va
Joe	Morrissey	I	\N	\N	0	f	\N	t	2015	74	regular	va
J Paul Jr	Councill	D	99.98	10475	36044	t	t	f	1997	75	regular	va
J Paul Jr	Councill	D	99.94	11210	5352	t	t	f	1999	75	regular	va
J Paul Jr	Councill	D	98.91	12795	4102	t	t	f	2001	75	regular	va
J Paul Jr	Councill	D	71.33	9917	10967	t	t	f	2003	75	regular	va
John B III	Nicholson	I	28.66	3983	3952	f	f	f	2003	75	regular	va
Roslyn	Tyler	D	50.66	9237	120222	f	t	f	2005	75	regular	va
Carson	Saunders	R	48.92	8920	62715	f	f	f	2005	75	regular	va
J Paul Jr	Councill	D	\N	\N	8755	t	\N	f	2005	75	regular	va
Roslyn	Tyler	D	99.2	13009	61367	t	t	f	2007	75	regular	va
Roslyn	Tyler	D	97.26	12091	73547	t	t	f	2009	75	regular	va
Roslyn	Tyler	D	66.08	12613	139508	t	t	f	2011	75	regular	va
Al	Peschke	R	33.84	6460	17636	f	f	f	2011	75	regular	va
Roslyn	Tyler	D	62.39	12443	172452	t	t	f	2013	75	regular	va
Al	Peschke	R	37.46	7472	136959	f	f	f	2013	75	regular	va
Roslyn	Tyler	D	100.0	12396	85644	t	t	f	2015	75	regular	va
Chris	Jones	R	67.64	12999	127391	f	t	f	1997	76	regular	va
Michelle	Degnan	D	32.21	6189	35287	f	f	f	1997	76	regular	va
Robert E	Nelms	R	\N	\N	9014	t	\N	f	1997	76	regular	va
Linda J	Bracey	I	\N	\N	0	f	\N	t	1997	76	regular	va
Chris	Jones	R	98.77	10399	61736	t	t	f	1999	76	regular	va
Chris	Jones	R	71.0	15522	70856	t	t	f	2001	76	regular	va
Ira M	Steingold	D	29.0	6400	12208	f	f	f	2001	76	regular	va
Chris	Jones	R	99.13	9738	110175	t	t	f	2003	76	regular	va
Chris	Jones	R	78.1	17947	131243	t	t	f	2005	76	regular	va
James	Scheideman	Const.	21.58	4959	1947	f	f	f	2005	76	regular	va
Chris	Jones	R	97.96	9697	150769	t	t	f	2007	76	regular	va
Chris	Jones	R	99.2	21210	240399	t	t	f	2009	76	regular	va
Chris	Jones	R	94.98	5000	253753	t	t	f	2011	76	regular	va
Chris	Jones	R	96.42	20922	417900	t	t	f	2013	76	regular	va
James	Scheideman	Const.	\N	\N	0	f	\N	t	2013	76	regular	va
Chris	Jones	R	100.0	6044	338102	t	t	f	2015	76	regular	va
Lionell Sr	Spruill	D	98.88	11762	36063	t	t	f	1997	77	regular	va
Lionell Sr	Spruill	D	98.15	6989	47986	t	t	f	1999	77	regular	va
Lionell Sr	Spruill	D	98.74	13050	41346	t	t	f	2001	77	regular	va
Lionell Sr	Spruill	D	98.61	6498	51276	t	t	f	2003	77	regular	va
Lionell Sr	Spruill	D	98.72	13616	88880	t	t	f	2005	77	regular	va
Lionell Sr	Spruill	D	98.6	5210	143601	t	t	f	2007	77	regular	va
Lionell Sr	Spruill	D	98.21	12108	141787	t	t	f	2009	77	regular	va
Lionell Sr	Spruill	D	96.55	4536	93085	t	t	f	2011	77	regular	va
Lionell Sr	Spruill	D	97.36	15920	153686	t	t	f	2013	77	regular	va
Lionell Sr	Spruill	D	100.0	5692	112557	t	t	f	2015	77	regular	va
Cliff	Hayes	D	96.94	27116	10768	f	t	f	2016	77	special	va
Randy	Forbes	R	98.98	17895	99009	t	t	f	1997	78	regular	va
Harry	Blevins	R	83.85	6527	51314	f	t	f	1998	78	special	va
A Robinson	Winn	D	15.92	1239	0	f	f	f	1998	78	special	va
Harry	Blevins	R	98.04	10020	28598	t	t	f	1999	78	regular	va
John	Cosgrove	R	65.0	12639	74023	f	t	f	2001	78	regular	va
Jo Ann H	Huskey	D	35.0	6718	14752	f	f	f	2001	78	regular	va
Harry	Blevins	R	\N	\N	26416	t	\N	t	2001	78	regular	va
John	Cosgrove	R	97.52	5547	92519	t	t	f	2003	78	regular	va
John	Cosgrove	R	98.63	15854	80369	t	t	f	2005	78	regular	va
John	Cosgrove	R	61.66	5963	151626	t	t	f	2007	78	regular	va
Michael Lee	Meyer	D	38.24	3698	41083	f	f	f	2007	78	regular	va
John	Cosgrove	R	98.86	17661	136260	t	t	f	2009	78	regular	va
John	Cosgrove	R	93.08	3966	131334	t	t	f	2011	78	regular	va
Jay	Leftwich	R	57.11	13770	140095	f	t	f	2013	78	regular	va
Linda L	Bryant	D	39.11	9430	185170	f	f	f	2013	78	regular	va
Daniel J	Foster	L	3.69	889	2005	f	f	f	2013	78	regular	va
John	Cosgrove	R	\N	\N	135059	t	\N	t	2013	78	regular	va
Matt	Mattson	D	\N	\N	425	f	\N	t	2013	78	regular	va
Brent L	VanNorman	I	\N	\N	15781	f	\N	t	2013	78	regular	va
Jay	Leftwich	R	100.0	4689	83682	t	t	f	2015	78	regular	va
Johnny	Joannou	D	52.85	8780	167293	f	t	f	1997	79	regular	va
Daniel R	Evans	R	47.03	7813	112847	f	f	f	1997	79	regular	va
William S Jr	Moore	D	\N	\N	43564	t	\N	f	1997	79	regular	va
Johnny M	Clemons	I	\N	\N	1495	f	\N	t	1997	79	regular	va
Johnny	Joannou	D	96.16	8636	35749	t	t	f	1999	79	regular	va
Johnny	Joannou	D	68.0	12263	78049	t	t	f	2001	79	regular	va
Bob	McCreary	R	32.0	5852	30259	f	f	f	2001	79	regular	va
Johnny	Joannou	D	96.79	5968	19455	t	t	f	2003	79	regular	va
Johnny	Joannou	D	97.4	14720	40932	t	t	f	2005	79	regular	va
Johnny	Joannou	D	94.95	6696	270795	t	t	f	2007	79	regular	va
Johnny	Joannou	D	96.31	13324	37275	t	t	f	2009	79	regular	va
Johnny	Joannou	D	94.03	4883	30953	t	t	f	2011	79	regular	va
Johnny	Joannou	D	96.43	11445	34483	t	t	f	2013	79	regular	va
Steve	Heretick	D	100.0	4008	119097	f	t	f	2015	79	regular	va
Kenneth Ronald	Melvin	D	98.18	11155	34617	t	t	f	1997	80	regular	va
Kenneth Ronald	Melvin	D	96.15	5797	16673	t	t	f	1999	80	regular	va
Kenneth Ronald	Melvin	D	97.94	14290	40490	t	t	f	2001	80	regular	va
Kenneth Ronald	Melvin	D	97.91	7223	41798	t	t	f	2003	80	regular	va
Kenneth Ronald	Melvin	D	97.81	13680	76567	t	t	f	2005	80	regular	va
Kenneth Ronald	Melvin	D	95.61	5140	96940	t	t	f	2007	80	regular	va
Matthew	James	D	68.49	9818	58323	f	t	f	2009	80	regular	va
Jennifer	Lee	R	31.3	4486	30015	f	f	f	2009	80	regular	va
Kenneth Ronald	Melvin	D	\N	\N	57243	t	\N	f	2009	80	regular	va
Matthew	James	D	96.8	7675	18762	t	t	f	2011	80	regular	va
Matthew	James	D	97.59	17293	35406	t	t	f	2013	80	regular	va
Matthew	James	D	100.0	5667	50367	t	t	f	2015	80	regular	va
Glenn R	Croshaw	D	98.71	8672	74224	t	t	f	1997	81	regular	va
Terrie L	Suit	R	51.75	5295	388494	f	t	f	1999	81	regular	va
Glenn R	Croshaw	D	48.1	4922	418240	t	f	f	1999	81	regular	va
Terrie L	Suit	R	98.67	11445	92451	t	t	f	2001	81	regular	va
Terrie L	Suit	R	69.56	4679	195347	t	t	f	2003	81	regular	va
Lois S	Williams	D	25.02	1683	131180	f	f	f	2003	81	regular	va
Sharon	Bivens	I	5.38	362	427	f	f	f	2003	81	regular	va
Terrie L	Suit	R	97.44	11474	144398	t	t	f	2005	81	regular	va
Terrie L	Suit	R	96.48	4353	274771	t	t	f	2007	81	regular	va
Barry	Knight	R	82.86	2476	150061	f	t	f	2009	81	special	va
John	LaCombe	D	16.77	501	2335	f	f	f	2009	81	special	va
Jeff	Dente	I	\N	\N	0	f	\N	f	2009	81	special	va
Barry	Knight	R	98.59	12476	88703	t	t	f	2009	81	regular	va
Terrie L	Suit	R	\N	\N	95725	f	\N	f	2009	81	regular	va
Barry	Knight	R	96.12	4455	105739	t	t	f	2011	81	regular	va
Barry	Knight	R	95.36	14064	182871	t	t	f	2013	81	regular	va
Barry	Knight	R	69.64	5429	175135	t	t	f	2015	81	regular	va
Jeff	Staples	Green	30.36	2367	3161	f	f	f	2015	81	regular	va
Bob	Purkey	R	98.94	17607	21514	t	t	f	1997	82	regular	va
Bob	Purkey	R	65.04	11506	57155	t	t	f	1999	82	regular	va
Charles Stephen	Vinson	I	34.64	6128	12676	f	f	f	1999	82	regular	va
Bob	Purkey	R	98.71	17663	33748	t	t	f	2001	82	regular	va
Bob	Purkey	R	97.27	7347	28647	t	t	f	2003	82	regular	va
Bob	Purkey	R	70.87	14340	174009	t	t	f	2005	82	regular	va
Bob	Purkey	R	60.6	6287	94801	t	t	f	2007	82	regular	va
Robert R	MacIver	D	39.19	4066	43027	f	f	f	2007	82	regular	va
John Oscian Jr	Parmele	I	\N	\N	550	f	\N	t	2007	82	regular	va
Bob	Purkey	R	60.39	12768	145931	t	t	f	2009	82	regular	va
Peter W	Schmidt	D	35.12	7426	237376	f	f	f	2009	82	regular	va
John Oscian Jr	Parmele	I	4.45	940	1329	f	f	f	2009	82	regular	va
Bob	Purkey	R	97.16	7538	65472	t	t	f	2011	82	regular	va
Bill	DeSteph	R	59.78	13995	246406	f	t	f	2013	82	regular	va
Bill	Fleming	D	40.03	9372	168101	f	f	f	2013	82	regular	va
Bob	Purkey	R	\N	\N	78193	t	\N	f	2013	82	regular	va
Jason	Miyares	R	65.31	10046	266310	f	t	f	2015	82	regular	va
Bill	Fleming	D	34.69	5335	74779	f	f	f	2015	82	regular	va
Bill	DeSteph	R	\N	\N	121761	t	\N	t	2015	82	regular	va
L Karen	Darner	D	62.05	8745	37467	t	t	f	1997	49	regular	va
Sandra Kay	Bushue	R	37.9	5342	35964	f	f	f	1997	49	regular	va
L Karen	Darner	D	99.04	8661	18326	t	t	f	1999	49	regular	va
L Karen	Darner	D	69.0	7529	56041	t	t	f	2001	49	regular	va
Edgar	Gonzalez	R	31.0	3429	104135	f	f	f	2001	49	regular	va
John M	Nande	R	\N	\N	4127	f	\N	t	2001	49	regular	va
Adam	Ebbin	D	96.99	4383	114992	f	t	f	2003	49	regular	va
L Karen	Darner	D	\N	\N	14430	t	\N	f	2003	49	regular	va
Edgar	Gonzalez	R	\N	\N	2139	f	\N	t	2003	49	regular	va
Adam	Ebbin	D	96.89	9149	119604	t	t	f	2005	49	regular	va
Adam	Ebbin	D	79.7	4468	131948	t	t	f	2007	49	regular	va
Adam	Ebbin	D	95.75	8890	165944	t	t	f	2009	49	regular	va
Alfonso	Lopez	D	95.89	7005	95325	f	t	f	2011	49	regular	va
Adam	Ebbin	D	\N	\N	110392	t	\N	t	2011	49	regular	va
Alfonso	Lopez	D	77.98	13087	92322	t	t	f	2013	49	regular	va
Terry	Modglin	Ind. Green	20.88	3505	23475	f	f	f	2013	49	regular	va
Alfonso	Lopez	D	100.0	7904	153969	t	t	f	2015	49	regular	va
Harry J	Parrish	R	99.91	11333	5538	t	t	f	1997	50	regular	va
Harry J	Parrish	R	99.86	7733	12750	t	t	f	1999	50	regular	va
Harry J	Parrish	R	99.85	9178	14140	t	t	f	2001	50	regular	va
Harry J	Parrish	R	99.87	6381	13187	t	t	f	2003	50	regular	va
Harry J	Parrish	R	63.73	7513	313342	t	t	f	2005	50	regular	va
Donald	Shuemaker	D	35.67	4205	1973	f	f	f	2005	50	regular	va
Jackson	Miller	R	52.8	7900	163504	f	t	f	2006	50	special	va
Jeanette	Rishell	D	47.04	7039	114794	f	f	f	2006	50	special	va
Jackson	Miller	R	60.38	6170	194333	t	t	f	2007	50	regular	va
Jeanette	Rishell	D	39.47	4033	244484	f	f	f	2007	50	regular	va
Jackson	Miller	R	62.38	7651	349022	t	t	f	2009	50	regular	va
Jeanette	Rishell	D	37.55	4605	388049	f	f	f	2009	50	regular	va
Jackson	Miller	R	94.87	8003	109698	t	t	f	2011	50	regular	va
Jackson	Miller	R	54.85	9498	297038	t	t	f	2013	50	regular	va
Richard	Cabellos	D	44.87	7769	123582	f	f	f	2013	50	regular	va
Jackson	Miller	R	58.78	7820	146863	t	t	f	2015	50	regular	va
Kyle	McCullough	D	41.22	5484	4592	f	f	f	2015	50	regular	va
David G	Brickley	D	57.18	7510	159397	t	t	f	1997	51	regular	va
Debra A	Wilson	R	42.79	5621	24833	f	f	f	1997	51	regular	va
Michele	McQuigg	R	58.86	4348	56035	f	t	f	1998	51	special	va
John Jr	Harper	D	41.14	3040	20822	f	f	f	1998	51	special	va
Michele	McQuigg	R	55.56	5532	128189	t	t	f	1999	51	regular	va
Virginia M	Stephens	D	44.42	4423	64475	f	f	f	1999	51	regular	va
Michele	McQuigg	R	64.0	9621	78061	t	t	f	2001	51	regular	va
Denise	Oppenhagen	D	34.0	5064	27434	f	f	f	2001	51	regular	va
James E	Simpson	L	2.0	353	3744	f	f	f	2001	51	regular	va
Michele	McQuigg	R	99.91	8128	32925	t	t	f	2003	51	regular	va
Michele	McQuigg	R	53.86	8312	123899	t	t	f	2005	51	regular	va
Earnie	Porta	D	46.03	7105	165994	f	f	f	2005	51	regular	va
Paul F	Nichols	D	51.8	6343	322573	f	t	f	2007	51	regular	va
Faisal M	Gill	R	47.72	5844	241899	f	f	f	2007	51	regular	va
Michele	McQuigg	R	\N	\N	67636	t	\N	t	2007	51	regular	va
Jeffrey Robert	Dion	D	\N	\N	14853	f	\N	t	2007	51	regular	va
Rich	Anderson	R	50.78	7940	358868	f	t	f	2009	51	regular	va
Paul F	Nichols	D	49.06	7671	659280	t	f	f	2009	51	regular	va
Rich	Anderson	R	95.49	11296	88685	t	t	f	2011	51	regular	va
Rich	Anderson	R	53.67	13059	414429	t	t	f	2013	51	regular	va
Reed	Heddleston	D	46.12	11220	368248	f	f	f	2013	51	regular	va
Rich	Anderson	R	100.0	12688	94235	t	t	f	2015	51	regular	va
John A III	Rollison	R	65.11	7440	57703	t	t	f	1997	52	regular	va
George F	Delimba	D	34.88	3986	20779	f	f	f	1997	52	regular	va
John A III	Rollison	R	99.75	5930	42943	t	t	f	1999	52	regular	va
John A III	Rollison	R	59.0	6912	109649	t	t	f	2001	52	regular	va
Davon	Gray	D	41.0	4836	14371	f	f	f	2001	52	regular	va
Alan L	Levy	I	\N	\N	0	f	\N	t	2001	52	regular	va
Jeff	Frederick	R	56.7	5384	201993	f	t	f	2003	52	regular	va
Charles T	Taylor	D	43.18	4100	186253	f	f	f	2003	52	regular	va
Jeff	Frederick	R	51.11	7182	580788	t	t	f	2005	52	regular	va
Hilda M	Barg	D	48.69	6842	560198	f	f	f	2005	52	regular	va
Matthew J	Harrison	D	\N	\N	35812	f	\N	t	2005	52	regular	va
Jeff	Frederick	R	58.62	6864	586691	t	t	f	2007	52	regular	va
Christopher Keith	Brown	D	41.18	4822	451866	f	f	f	2007	52	regular	va
Luke	Torian	D	51.9	8267	418765	f	t	f	2009	52	regular	va
Rafael	Lopez	R	47.81	7616	130799	f	f	f	2009	52	regular	va
Jeff	Frederick	R	\N	\N	144103	t	\N	f	2009	52	regular	va
Amy Noone	Frederick	R	\N	\N	10299	f	\N	t	2009	52	regular	va
Luke	Torian	D	60.59	5156	202417	t	t	f	2011	52	regular	va
Cleveland	Anderson	R	39.1	3327	104165	f	f	f	2011	52	regular	va
Luke	Torian	D	94.6	10890	74499	t	t	f	2013	52	regular	va
Luke	Torian	D	100.0	7688	86130	t	t	f	2015	52	regular	va
Jim	Scott	D	98.37	13977	69198	t	t	f	1997	53	regular	va
Jim	Scott	D	59.62	7718	115309	t	t	f	1999	53	regular	va
Patrick A	Kelley	R	40.33	5221	37125	f	f	f	1999	53	regular	va
Jim	Scott	D	60.0	12659	158112	t	t	f	2001	53	regular	va
Dave	Snyder	R	40.0	8304	13326	f	f	f	2001	53	regular	va
Jim	Scott	D	97.81	11588	73304	t	t	f	2003	53	regular	va
Jim	Scott	D	95.46	16918	105382	t	t	f	2005	53	regular	va
Jim	Scott	D	97.09	10824	102898	t	t	f	2007	53	regular	va
Jim	Scott	D	61.35	13022	108884	t	t	f	2009	53	regular	va
Christopher	Merola	R	38.51	8173	26583	f	f	f	2009	53	regular	va
Jim	Scott	D	95.88	8670	100051	t	t	f	2011	53	regular	va
Marcus	Simon	D	66.71	13726	141309	f	t	f	2013	53	regular	va
Brad	Tidwell	R	28.99	5965	5533	f	f	f	2013	53	regular	va
Anthony	Tellez	L	4.14	852	1130	f	f	f	2013	53	regular	va
Marcus	Simon	D	100.0	9731	111360	t	t	f	2015	53	regular	va
Bobby	Orrock	R	99.59	14948	18107	t	t	f	1997	54	regular	va
Bobby	Orrock	R	99.3	13006	21060	t	t	f	1999	54	regular	va
Bobby	Orrock	R	98.11	13930	10424	t	t	f	2001	54	regular	va
Bobby	Orrock	R	98.33	10745	21852	t	t	f	2003	54	regular	va
Bobby	Orrock	R	96.33	15549	176038	t	t	f	2005	54	regular	va
Tom	Beals	D	\N	\N	0	f	\N	f	2005	54	regular	va
Bobby	Orrock	R	73.71	11451	94880	t	t	f	2007	54	regular	va
Kimbra	Kincheloe	I	26.18	4067	13098	f	f	f	2007	54	regular	va
Bobby	Orrock	R	97.93	17560	45883	t	t	f	2009	54	regular	va
Bobby	Orrock	R	73.16	11338	99938	t	t	f	2011	54	regular	va
Matthew	Simpson	I	25.0	3874	2915	f	f	f	2011	54	regular	va
Bobby	Orrock	R	90.59	15649	307018	t	t	f	2013	54	regular	va
Bobby	Orrock	R	100.0	11829	126746	t	t	f	2015	54	regular	va
Frank D	Hargrove	R	99.93	21477	681	t	t	f	1997	55	regular	va
Frank D	Hargrove	R	80.12	16283	2135	t	t	f	1999	55	regular	va
Douglas R	Dunkel	I	10.7	2174	1117	f	f	f	1999	55	regular	va
Albert B	Moore	I	9.17	1864	286	f	f	f	1999	55	regular	va
Frank D	Hargrove	R	99.76	19107	1737	t	t	f	2001	55	regular	va
Douglas R	Dunkel	I	\N	\N	217	f	\N	t	2001	55	regular	va
Frank D	Hargrove	R	99.75	10318	19502	t	t	f	2003	55	regular	va
Frank D	Hargrove	R	99.18	20759	102836	t	t	f	2005	55	regular	va
Frank D	Hargrove	R	97.64	12145	58558	t	t	f	2007	55	regular	va
John	Cox	R	75.53	20622	167949	f	t	f	2009	55	regular	va
Robert N	Barnette	D	24.16	6596	14232	f	f	f	2009	55	regular	va
Frank D	Hargrove	R	\N	\N	30805	t	\N	f	2009	55	regular	va
John	Cox	R	96.64	12783	73863	t	t	f	2011	55	regular	va
Buddy	Fowler	R	56.8	15334	76575	f	t	f	2013	55	regular	va
Toni	Radler	D	37.5	10123	81702	f	f	f	2013	55	regular	va
Chris	Sullivan	L	5.56	1500	2319	f	f	f	2013	55	regular	va
John	Cox	R	\N	\N	54676	t	\N	f	2013	55	regular	va
Buddy	Fowler	R	60.43	10870	142139	t	t	f	2015	55	regular	va
Toni	Radler	D	39.57	7118	85673	f	f	f	2015	55	regular	va
V Earl	Dickinson	D	99.87	17150	67444	t	t	f	1997	56	regular	va
V Earl	Dickinson	D	99.93	18875	83749	t	t	f	1999	56	regular	va
Bill	Janis	R	99.35	17620	66171	f	t	f	2001	56	regular	va
V Earl	Dickinson	D	\N	\N	28721	t	\N	f	2001	56	regular	va
Bill	Janis	R	57.77	10968	358161	t	t	f	2003	56	regular	va
Hunter H III	McGuire	D	42.2	7939	338255	f	f	f	2003	56	regular	va
Bill	Janis	R	63.0	17565	198990	t	t	f	2005	56	regular	va
Peter L	deFur	D	36.94	10299	123996	f	f	f	2005	56	regular	va
Bill	Janis	R	65.9	11440	133748	t	t	f	2007	56	regular	va
Will	Shaw	D	33.97	5897	17377	f	f	f	2007	56	regular	va
Bill	Janis	R	69.66	19989	228439	t	t	f	2009	56	regular	va
James O	Towey	D	30.22	8673	37967	f	f	f	2009	56	regular	va
Peter	Farrell	R	96.85	14520	116465	f	t	f	2011	56	regular	va
Peter	Farrell	R	96.01	20710	216478	t	t	f	2013	56	regular	va
Peter	Farrell	R	100.0	15126	147805	t	t	f	2015	56	regular	va
Mitchell V	Van Yahres	D	68.39	10097	61644	t	t	f	1997	57	regular	va
Donald T	Ubben	R	31.19	4605	23624	f	f	f	1997	57	regular	va
Mitchell V	Van Yahres	D	97.31	9931	46051	t	t	f	1999	57	regular	va
Mitchell V	Van Yahres	D	97.93	14266	51082	t	t	f	2001	57	regular	va
Mitchell V	Van Yahres	D	96.78	5644	57475	t	t	f	2003	57	regular	va
David	Toscano	D	75.23	14113	113600	f	t	f	2005	57	regular	va
Thomas W	McCrystal	R	24.56	4608	15261	f	f	f	2005	57	regular	va
Mitchell V	Van Yahres	D	\N	\N	20370	t	\N	f	2005	57	regular	va
David	Toscano	D	98.35	10164	135184	t	t	f	2007	57	regular	va
David	Toscano	D	78.18	14071	215577	t	t	f	2009	57	regular	va
Robert Brandon	Smith	I	21.38	3848	0	f	f	f	2009	57	regular	va
David	Toscano	D	80.44	10949	187019	t	t	f	2011	57	regular	va
Robert Brandon	Smith	I	19.1	2600	39	f	f	f	2011	57	regular	va
David	Toscano	D	97.97	19168	628583	t	t	f	2013	57	regular	va
David	Toscano	D	100.0	10459	437187	t	t	f	2015	57	regular	va
Paul	Harris	R	62.41	14244	218001	f	t	f	1997	58	regular	va
Bruce W	Kirtley	D	37.51	8561	166350	f	f	f	1997	58	regular	va
Peter T	Way	R	\N	\N	2296	t	\N	f	1997	58	regular	va
Paul	Harris	R	58.85	12036	194342	t	t	f	1999	58	regular	va
Edward M	Wayland	D	41.11	8407	85044	f	f	f	1999	58	regular	va
Rob	Bell	R	60.0	13627	189231	f	t	f	2001	58	regular	va
Charles S	Martin	D	40.0	9088	149639	f	f	f	2001	58	regular	va
Paul	Harris	R	\N	\N	35989	t	\N	f	2001	58	regular	va
Michael W	Brown	R	\N	\N	13119	f	\N	t	2001	58	regular	va
Rob	Bell	R	98.63	13267	135007	t	t	f	2003	58	regular	va
Rob	Bell	R	62.04	15831	320309	t	t	f	2005	58	regular	va
Stephen H	Koleszar	D	37.92	9676	59870	f	f	f	2005	58	regular	va
Rob	Bell	R	98.3	16220	232981	t	t	f	2007	58	regular	va
Rob	Bell	R	67.24	18402	769832	t	t	f	2009	58	regular	va
Cynthia	Neff	D	32.7	8948	274143	f	f	f	2009	58	regular	va
Rob	Bell	R	98.2	17227	457080	t	t	f	2011	58	regular	va
Rob	Bell	R	95.78	20191	224549	t	t	f	2013	58	regular	va
Rob	Bell	R	100.0	13926	584277	t	t	f	2015	58	regular	va
Watkins Jr	Abbitt	D	65.45	11329	112283	t	t	f	1997	59	regular	va
Daniel H	Gardner	R	34.54	5979	4468	f	f	f	1997	59	regular	va
Watkins Jr	Abbitt	D	99.9	14689	56095	t	t	f	1999	59	regular	va
Watkins Jr	Abbitt	I	63.0	11782	75857	t	t	f	2001	59	regular	va
Henry P	Hagenau	D	37.0	6829	3239	f	f	f	2001	59	regular	va
Watkins Jr	Abbitt	I	67.09	11834	111190	t	t	f	2003	59	regular	va
Allan M	Hale	D	32.87	5786	27628	f	f	f	2003	59	regular	va
Watkins Jr	Abbitt	I	98.97	16382	70229	t	t	f	2005	59	regular	va
Watkins Jr	Abbitt	I	60.24	13874	275298	t	t	f	2007	59	regular	va
Connie	Brennan	D	39.67	9136	345281	f	f	f	2007	59	regular	va
Watkins Jr	Abbitt	I	98.48	16896	97520	t	t	f	2009	59	regular	va
Matt	Fariss	R	52.98	11651	339491	f	t	f	2011	59	regular	va
Connie	Brennan	D	41.24	9069	181841	f	f	f	2011	59	regular	va
Linda	Wall	I	5.58	1228	1387	f	f	f	2011	59	regular	va
Watkins Jr	Abbitt	I	\N	\N	61595	t	\N	f	2011	59	regular	va
Ronald	Ferrin	R	\N	\N	0	f	\N	t	2011	59	regular	va
H Evans V	Thomas	R	\N	\N	13982	f	\N	t	2011	59	regular	va
Matt	Fariss	R	96.92	16953	93181	t	t	f	2013	59	regular	va
Matt	Fariss	R	100.0	9312	69631	t	t	f	2015	59	regular	va
William W Jr	Bennett	D	99.91	9276	27781	t	t	f	1997	60	regular	va
William W Jr	Bennett	D	99.85	10440	42717	t	t	f	1999	60	regular	va
Clarke N	Hogan	R	58.0	10241	150782	f	t	f	2001	60	regular	va
Brad	Wike	D	42.0	7338	70627	f	f	f	2001	60	regular	va
William W Jr	Bennett	D	\N	\N	18068	t	\N	f	2001	60	regular	va
Nancy R	Carwile	R	\N	\N	10643	f	\N	t	2001	60	regular	va
Clarke N	Hogan	R	66.43	10677	135195	t	t	f	2003	60	regular	va
Brad	Wike	D	33.57	5369	17539	f	f	f	2003	60	regular	va
Clarke N	Hogan	R	99.21	11074	63478	t	t	f	2005	60	regular	va
Clarke N	Hogan	R	99.39	11801	93991	t	t	f	2007	60	regular	va
James	Edmunds	R	96.1	10968	76293	f	t	f	2009	60	regular	va
Clarke N	Hogan	R	\N	\N	62025	t	\N	f	2009	60	regular	va
David M	Guill	D	\N	\N	3923	f	\N	t	2009	60	regular	va
James	Edmunds	R	99.09	13201	55558	t	t	f	2011	60	regular	va
James	Edmunds	R	64.2	12806	76906	t	t	f	2013	60	regular	va
Jasper	Hendricks	D	35.62	7105	8879	f	f	f	2013	60	regular	va
James	Edmunds	R	100.0	10768	51606	t	t	f	2015	60	regular	va
Ken	Hildebrandt	Ind. Green	\N	\N	0	f	\N	t	2015	60	regular	va
Frank	Ruff	R	97.87	10487	49738	t	t	f	1997	61	regular	va
Frank	Ruff	R	65.71	10551	167546	t	t	f	1999	61	regular	va
Earl O	Horne	D	34.28	5505	52786	f	f	f	1999	61	regular	va
Tommy	Wright	R	54.77	5097	114466	f	t	f	2000	61	special	va
Frank W	Bacon	D	45.18	4205	138019	f	f	f	2000	61	special	va
Tommy	Wright	R	60.0	10529	81131	t	t	f	2001	61	regular	va
William E	Keel	D	40.0	7118	16750	f	f	f	2001	61	regular	va
Frank	Ruff	R	\N	\N	15106	f	\N	t	2001	61	regular	va
Tommy	Wright	R	99.65	9975	13567	t	t	f	2003	61	regular	va
Tommy	Wright	R	97.1	12253	31530	t	t	f	2005	61	regular	va
Tommy	Wright	R	99.58	14279	36593	t	t	f	2007	61	regular	va
Tommy	Wright	R	99.27	14766	42815	t	t	f	2009	61	regular	va
Tommy	Wright	R	99.32	15578	59049	t	t	f	2011	61	regular	va
Tommy	Wright	R	98.55	16272	46510	t	t	f	2013	61	regular	va
Tommy	Wright	R	71.34	12413	67818	t	t	f	2015	61	regular	va
Greg	Marston	D	28.66	4987	18793	f	f	f	2015	61	regular	va
Riley	Ingram	R	99.64	13123	33388	t	t	f	1997	62	regular	va
Riley	Ingram	R	99.73	10940	36294	t	t	f	1999	62	regular	va
Riley	Ingram	R	97.87	14476	48213	t	t	f	2001	62	regular	va
Riley	Ingram	R	98.73	9720	79010	t	t	f	2003	62	regular	va
Riley	Ingram	R	97.0	15571	128363	t	t	f	2005	62	regular	va
Robert E	Kerney	D	\N	\N	932	f	\N	f	2005	62	regular	va
Riley	Ingram	R	98.16	10449	120156	t	t	f	2007	62	regular	va
Riley	Ingram	R	97.51	15514	113846	t	t	f	2009	62	regular	va
Riley	Ingram	R	95.81	8911	114900	t	t	f	2011	62	regular	va
Riley	Ingram	R	93.79	15148	128440	t	t	f	2013	62	regular	va
Brandon	Randall	D	\N	\N	0	f	\N	t	2013	62	regular	va
Riley	Ingram	R	59.57	7239	228027	t	t	f	2015	62	regular	va
Sheila	Bynum-Coleman	D	40.43	4914	21244	f	f	f	2015	62	regular	va
Jay W	DeBoer	D	99.34	9567	13614	t	t	f	1997	63	regular	va
Jay W	DeBoer	D	77.93	6025	37834	t	t	f	1999	63	regular	va
Gerald J	Berry	I	22.02	1702	3156	f	f	f	1999	63	regular	va
Fenton L Jr	Bland	D	53.0	8774	61321	f	t	f	2001	63	regular	va
Rosalyn	Dance	I	47.0	7926	54487	f	f	f	2001	63	regular	va
Jay W	DeBoer	D	\N	\N	2403	t	\N	f	2001	63	regular	va
Fenton L Jr	Bland	D	99.48	7305	21890	t	t	f	2003	63	regular	va
Rosalyn	Dance	D	69.0	4342	44917	f	t	f	2005	63	special	va
Andrea	Sims	R	27.0	1690	5238	f	f	f	2005	63	special	va
Michael W	Bratschi	I	4.0	271	1060	f	f	f	2005	63	special	va
Rosalyn	Dance	D	60.29	9456	64856	t	t	f	2005	63	regular	va
Diallo	Dphrepaulezz	I	39.0	6177	12924	f	f	f	2005	63	regular	va
Fenton L Jr	Bland	D	\N	\N	4150	f	\N	f	2005	63	regular	va
Deborah	Shands-Lee	Green	\N	\N	0	f	\N	t	2005	63	regular	va
Rosalyn	Dance	D	98.08	8684	85662	t	t	f	2007	63	regular	va
Rosalyn	Dance	D	96.42	12375	101763	t	t	f	2009	63	regular	va
Susan	McCammon	R	\N	\N	578	f	\N	t	2009	63	regular	va
Rosalyn	Dance	D	96.65	10775	108166	t	t	f	2011	63	regular	va
Rosalyn	Dance	D	95.72	15962	148315	t	t	f	2013	63	regular	va
Joe	Preston	D	78.61	1213	10241	f	t	f	2015	63	special	va
Mouse	Jones	I	18.47	285	219	f	f	f	2015	63	special	va
Lashrecse	Aird	D	100.0	9310	36998	f	t	f	2015	63	regular	va
Joe	Preston	D	\N	\N	10241	t	\N	t	2015	63	regular	va
William	Barlow	D	98.71	13605	10932	t	t	f	1997	64	regular	va
William	Barlow	D	64.58	9694	97463	t	t	f	1999	64	regular	va
Thomas A	Gaskell	R	31.79	4773	61061	f	f	f	1999	64	regular	va
George W	Stepp	I	3.5	526	1509	f	f	f	1999	64	regular	va
William	Barlow	D	59.0	13069	119876	t	t	f	2001	64	regular	va
Richard E Jr	Hill	R	41.0	8463	23470	f	f	f	2001	64	regular	va
George W	Grayson	D	\N	\N	12183	f	\N	f	2001	64	regular	va
William	Barlow	D	56.56	9365	153853	t	t	f	2003	64	regular	va
Troy H	Lapetina	R	43.37	7187	61913	f	f	f	2003	64	regular	va
William	Barlow	D	53.96	13008	136054	t	t	f	2005	64	regular	va
Troy H	Lapetina	R	44.58	10746	159687	f	f	f	2005	64	regular	va
Albert P Jr	Burckard	Green	1.27	305	747	f	f	f	2005	64	regular	va
William	Barlow	D	96.74	14445	28273	t	t	f	2007	64	regular	va
William	Barlow	D	50.68	13170	364544	t	t	f	2009	64	regular	va
Stan D	Clark	R	46.7	12138	252769	f	f	f	2009	64	regular	va
Albert P Jr	Burckard	Ind. Green	2.45	638	0	f	f	f	2009	64	regular	va
Rick	Morris	R	55.25	12960	467757	f	t	f	2011	64	regular	va
William	Barlow	D	44.62	10467	212975	t	f	f	2011	64	regular	va
Rick	Morris	R	94.7	20188	64940	t	t	f	2013	64	regular	va
Rick	Morris	R	100.0	15208	64369	t	t	f	2015	64	regular	va
John	Watkins	R	99.28	20514	57912	t	t	f	1997	65	regular	va
Lee	Ware	R	65.42	7479	160110	f	t	f	1998	65	special	va
Edward B	Barber	D	31.05	3550	0	f	f	f	1998	65	special	va
Jeffrey M.	Keegan	I	3.46	396	0	f	f	f	1998	65	special	va
Lee	Ware	R	77.07	10183	50540	t	t	f	1999	65	regular	va
Timothy R	Belton	L	22.83	3016	2725	f	f	f	1999	65	regular	va
Lee	Ware	R	75.0	18851	45549	t	t	f	2001	65	regular	va
Christine	Lowrie	D	23.0	5802	1298	f	f	f	2001	65	regular	va
John H III	Girardeau	L	2.0	498	828	f	f	f	2001	65	regular	va
Timothy R	Belton	L	\N	\N	399	f	\N	t	2001	65	regular	va
Lee	Ware	R	75.12	10131	76549	t	t	f	2003	65	regular	va
Robert E	Williams	D	24.85	3351	11092	f	f	f	2003	65	regular	va
Lee	Ware	R	96.88	23851	44456	t	t	f	2005	65	regular	va
Lee	Ware	R	98.03	14944	102017	t	t	f	2007	65	regular	va
Lee	Ware	R	71.47	21887	177764	t	t	f	2009	65	regular	va
Gary R	Reinhardt	I	28.35	8682	41287	f	f	f	2009	65	regular	va
Lee	Ware	R	97.6	14991	120466	t	t	f	2011	65	regular	va
Lee	Ware	R	67.6	19839	208567	t	t	f	2013	65	regular	va
William	Quarles	D	32.14	9431	120264	f	f	f	2013	65	regular	va
Lee	Ware	R	100.0	19842	197281	t	t	f	2015	65	regular	va
William C	Mims	R	71.11	16485	76930	t	t	f	1997	32	regular	va
Katherine	Fisher	D	28.69	6652	1191	f	f	f	1997	32	regular	va
Dick	Black	R	56.75	3874	41226	f	t	f	1998	32	special	va
Candyce P	Cassell	D	43.01	2936	45309	f	f	f	1998	32	special	va
Dick	Black	R	56.38	10585	135800	t	t	f	1999	32	regular	va
Kelly	Burk	D	43.43	8153	0	f	f	f	1999	32	regular	va
Dick	Black	R	58.0	10272	221357	t	t	f	2001	32	regular	va
Patricia H	Morrissey	D	42.0	7524	111921	f	f	f	2001	32	regular	va
Dick	Black	R	52.0	7675	41350	t	t	f	2003	32	regular	va
Patricia H	Morrissey	D	36.58	5399	230204	f	f	f	2003	32	regular	va
David G	McWatters	I	11.34	1674	16175	f	f	f	2003	32	regular	va
David E	Poisson	D	52.99	12468	327841	f	t	f	2005	32	regular	va
Dick	Black	R	46.87	11030	65291	t	f	f	2005	32	regular	va
David E	Poisson	D	52.85	10504	433236	t	t	f	2007	32	regular	va
Lynn	Chapman	R	47.08	9358	192182	f	f	f	2007	32	regular	va
Tag	Greason	R	57.47	14552	344938	f	t	f	2009	32	regular	va
David E	Poisson	D	42.41	10739	471568	t	f	f	2009	32	regular	va
Tag	Greason	R	95.6	10033	102858	t	t	f	2011	32	regular	va
Tag	Greason	R	51.35	11735	265428	t	t	f	2013	32	regular	va
Elizabeth	Miller	D	48.5	11084	122190	f	f	f	2013	32	regular	va
Tag	Greason	R	53.1	9734	440094	t	t	f	2015	32	regular	va
Elizabeth	Miller	D	46.9	8596	354047	f	f	f	2015	32	regular	va
Joe	May	R	59.61	11976	62549	t	t	f	1997	33	regular	va
Kenneth P	Halla	D	32.67	6563	94266	f	f	f	1997	33	regular	va
Robert E	Primack	I	7.65	1536	7641	f	f	f	1997	33	regular	va
Joe	May	R	98.83	14095	36823	t	t	f	1999	33	regular	va
Joe	May	R	98.12	17107	33239	t	t	f	2001	33	regular	va
Joe	May	R	98.1	16031	70800	t	t	f	2003	33	regular	va
Joe	May	R	91.77	20619	351349	t	t	f	2005	33	regular	va
Joe	May	R	59.81	14978	205306	t	t	f	2007	33	regular	va
Marty	Martinez	D	40.05	10029	113484	f	f	f	2007	33	regular	va
Joe	May	R	96.89	22489	175178	t	t	f	2009	33	regular	va
Mike	Turner	D	\N	\N	28469	f	\N	t	2009	33	regular	va
Joe	May	R	97.41	13027	114754	t	t	f	2011	33	regular	va
Dave	LaRock	R	53.59	13827	395787	f	t	f	2013	33	regular	va
Mary	Daniel	D	42.82	11048	394910	f	f	f	2013	33	regular	va
Patrick	Hagerty	L	3.4	876	433	f	f	f	2013	33	regular	va
Kathee	Myers	D	\N	\N	0	f	\N	t	2013	33	regular	va
Dave	LaRock	R	59.94	12004	276301	t	t	f	2015	33	regular	va
Chuck	Hedges	D	36.45	7300	63257	f	f	f	2015	33	regular	va
Mark	Anderson	L	3.61	723	1041	f	f	f	2015	33	regular	va
Vincent F Jr	Callahan	R	61.56	11932	205786	t	t	f	1997	34	regular	va
Carole Loop	Herrick	D	38.35	7433	12023	f	f	f	1997	34	regular	va
Vincent F Jr	Callahan	R	60.97	8912	257772	t	t	f	1999	34	regular	va
Carole Loop	Herrick	D	39.01	5701	23206	f	f	f	1999	34	regular	va
Vincent F Jr	Callahan	R	60.0	14113	243949	t	t	f	2001	34	regular	va
Dale A	Evans	D	40.0	9382	78482	f	f	f	2001	34	regular	va
Vincent F Jr	Callahan	R	98.39	12938	196084	t	t	f	2003	34	regular	va
Vincent F Jr	Callahan	R	94.87	16746	228221	t	t	f	2005	34	regular	va
Margaret E	Vanderhye	D	51.47	9161	662636	f	t	f	2007	34	regular	va
David M	Hunt	R	48.43	8621	541283	f	f	f	2007	34	regular	va
Vincent F Jr	Callahan	R	\N	\N	189447	t	\N	f	2007	34	regular	va
Barbara	Comstock	R	50.8	12636	673661	f	t	f	2009	34	regular	va
Margaret E	Vanderhye	D	49.1	12214	714066	t	f	f	2009	34	regular	va
Barbara	Comstock	R	54.81	11628	899609	t	t	f	2011	34	regular	va
Pamela B	Danner	D	45.12	9573	424703	f	f	f	2011	34	regular	va
Barbara	Comstock	R	50.64	14962	1390790	t	t	f	2013	34	regular	va
Kathleen	Murphy	D	49.21	14540	661282	f	f	f	2013	34	regular	va
Kathleen	Murphy	D	51.23	6419	389344	f	t	f	2015	34	special	va
Craig	Parisot	R	48.63	6093	259132	f	f	f	2015	34	special	va
Kathleen	Murphy	D	50.44	10820	893023	t	t	f	2015	34	regular	va
Craig	Parisot	R	49.56	10632	1116197	f	f	f	2015	34	regular	va
George E	Lovelace	D	51.56	3088	23794	f	t	f	1996	35	special	va
Michael J	Polychrones	R	44.25	2650	60584	f	f	f	1996	35	special	va
John	Buckley	I	4.12	247	0	f	f	f	1996	35	special	va
Jeannemarie	Davis	R	51.3	11233	130291	f	t	f	1997	35	regular	va
George E	Lovelace	D	46.59	10202	202795	t	f	f	1997	35	regular	va
Marta Soderberg	Howard	I	2.09	457	4041	f	f	f	1997	35	regular	va
Jeannemarie	Davis	R	60.01	9928	232754	t	t	f	1999	35	regular	va
George E	Lovelace	D	39.89	6599	97565	f	f	f	1999	35	regular	va
Jeannemarie	Davis	R	59.0	13906	144952	t	t	f	2001	35	regular	va
Samuel A	Bleicher	D	41.0	9630	83811	f	f	f	2001	35	regular	va
Steve	Shannon	D	51.9	9151	308852	f	t	f	2003	35	regular	va
Robert M	McDowell	R	48.08	8478	255724	f	f	f	2003	35	regular	va
Jeannemarie	Davis	R	\N	\N	28068	t	\N	t	2003	35	regular	va
Steve	Shannon	D	60.42	14625	498303	t	t	f	2005	35	regular	va
James E	Hyland	R	39.52	9566	230115	f	f	f	2005	35	regular	va
Steve	Shannon	D	63.36	11956	161882	t	t	f	2007	35	regular	va
Arthur	Purves	R	36.56	6900	9002	f	f	f	2007	35	regular	va
Mark	Keam	D	50.67	12606	553111	f	t	f	2009	35	regular	va
James E	Hyland	R	49.24	12252	261505	f	f	f	2009	35	regular	va
Steve	Shannon	D	\N	\N	0	t	\N	t	2009	35	regular	va
Mark	Keam	D	96.18	9636	152965	t	t	f	2011	35	regular	va
Mark	Keam	D	64.65	14632	126268	t	t	f	2013	35	regular	va
Leiann L	Luse	R	35.18	7961	3704	f	f	f	2013	35	regular	va
Mark	Keam	D	100.0	9203	76700	t	t	f	2015	35	regular	va
Ken	Plum	D	58.34	11924	83815	t	t	f	1997	36	regular	va
C D	McGuire	R	36.81	7523	11509	f	f	f	1997	36	regular	va
Gary	Alexander	I	4.8	981	4546	f	f	f	1997	36	regular	va
Ken	Plum	D	61.81	10430	152874	t	t	f	1999	36	regular	va
Michael N	Pocalyko	R	35.41	5975	88552	f	f	f	1999	36	regular	va
Peter L	Thomas	I	2.74	463	1875	f	f	f	1999	36	regular	va
Ken	Plum	D	98.79	16424	86274	t	t	f	2001	36	regular	va
Michael N	Pocalyko	R	\N	\N	307	f	\N	t	2001	36	regular	va
Ken	Plum	D	98.45	11803	101706	t	t	f	2003	36	regular	va
Ken	Plum	D	78.38	16103	177884	t	t	f	2005	36	regular	va
Donald	Ferguson	L	20.07	4124	22726	f	f	f	2005	36	regular	va
Ken	Plum	D	97.57	12101	159413	t	t	f	2007	36	regular	va
Ken	Plum	D	59.95	12893	207062	t	t	f	2009	36	regular	va
Hugh	Cannon	R	39.9	8581	33393	f	f	f	2009	36	regular	va
Mark	Whited	R	\N	\N	10421	f	\N	t	2009	36	regular	va
Ken	Plum	D	64.08	9522	297255	t	t	f	2011	36	regular	va
Hugh	Cannon	R	35.85	5327	26933	f	f	f	2011	36	regular	va
Ken	Plum	D	93.28	18426	132339	t	t	f	2013	36	regular	va
Ken	Plum	D	100.0	10344	120681	t	t	f	2015	36	regular	va
John H Jr	Rust	R	54.9	3136	0	f	t	f	1996	37	special	va
Julie	Lyman	D	44.9	2565	60841	f	f	f	1996	37	special	va
John H Jr	Rust	R	56.63	10687	86785	t	t	f	1997	37	regular	va
Lester P Jr	Schoene	D	43.28	8169	93528	f	f	f	1997	37	regular	va
John H Jr	Rust	R	99.07	11197	277005	t	t	f	1999	37	regular	va
Chap	Petersen	D	52.0	10899	172701	f	t	f	2001	37	regular	va
John H Jr	Rust	R	48.0	9959	282377	t	f	f	2001	37	regular	va
Chap	Petersen	D	59.49	9950	285826	t	t	f	2003	37	regular	va
John H Jr	Rust	R	40.45	6765	208504	f	f	f	2003	37	regular	va
David	Bulova	D	52.08	10731	369486	f	t	f	2005	37	regular	va
John	Mason	R	45.55	9385	409249	f	f	f	2005	37	regular	va
Scott	McPherson	L	1.48	305	4948	f	f	f	2005	37	regular	va
Daniel	Haugh	Green	0.49	100	0	f	f	f	2005	37	regular	va
Chap	Petersen	D	\N	\N	31050	t	\N	t	2005	37	regular	va
David	Bulova	D	98.07	13647	140794	t	t	f	2007	37	regular	va
David	Bulova	D	67.56	12209	129307	t	t	f	2009	37	regular	va
Anna M	Choi	Ind. Green	6.89	1245	0	f	f	f	2009	37	regular	va
Christopher F	DeCarlo	I	24.74	4471	3796	f	f	f	2009	37	regular	va
Terry J	Funkhouser	R	\N	\N	2218	f	\N	t	2009	37	regular	va
David	Bulova	D	59.54	7021	302599	t	t	f	2011	37	regular	va
Brian	Schoeneman	R	40.3	4752	195902	f	f	f	2011	37	regular	va
David	Bulova	D	60.93	11526	183744	t	t	f	2013	37	regular	va
Patrice M	Winter	R	38.87	7353	67542	f	f	f	2013	37	regular	va
David	Bulova	D	57.37	7065	280672	t	t	f	2015	37	regular	va
Sang	Yi	R	42.63	5249	230795	f	f	f	2015	37	regular	va
Robert D	Hull	D	59.44	9836	75283	t	t	f	1997	38	regular	va
Michael G	Davis	R	40.48	6698	2243	f	f	f	1997	38	regular	va
Robert D	Hull	D	59.41	8023	117794	t	t	f	1999	38	regular	va
Stephen F	Smith	R	40.51	5471	88375	f	f	f	1999	38	regular	va
Robert D	Hull	D	59.0	10301	120170	t	t	f	2001	38	regular	va
Danny R	Smith	R	37.0	6468	29936	f	f	f	2001	38	regular	va
Donna Jean	Audi	I	1.0	612	677	f	f	f	2001	38	regular	va
Robert D	Hull	D	98.62	9674	49840	t	t	f	2003	38	regular	va
Robert D	Hull	D	68.27	11139	76686	t	t	f	2005	38	regular	va
Leland	Cheung	R	27.88	4549	0	f	f	f	2005	38	regular	va
C W	Levy	Green	2.4	392	0	f	f	f	2005	38	regular	va
Robert D	Hull	D	97.94	9448	82876	t	t	f	2007	38	regular	va
Kaye	Kory	D	59.51	9621	189928	f	t	f	2009	38	regular	va
Danny R	Smith	R	40.23	6505	60887	f	f	f	2009	38	regular	va
Kaye	Kory	D	76.44	8106	104444	t	t	f	2011	38	regular	va
Jim	Leslie	Ind. Green	22.65	2402	0	f	f	f	2011	38	regular	va
Kaye	Kory	D	74.66	12534	40981	t	t	f	2013	38	regular	va
Jim	Leslie	Ind. Green	24.35	4087	0	f	f	f	2013	38	regular	va
Kaye	Kory	D	74.65	7819	33258	t	t	f	2015	38	regular	va
Jim	Leslie	Ind. Green	25.35	2655	0	f	f	f	2015	38	regular	va
Vivian	Watts	D	61.54	10519	58600	t	t	f	1997	39	regular	va
Matthew J	Kershes	R	34.31	5865	7568	f	f	f	1997	39	regular	va
C W	Levy	I	4.07	696	6	f	f	f	1997	39	regular	va
Vivian	Watts	D	55.69	7379	70105	t	t	f	1999	39	regular	va
Christopher T	Craig	R	42.93	5689	69489	f	f	f	1999	39	regular	va
C W	Levy	I	1.34	178	41	f	f	f	1999	39	regular	va
Vivian	Watts	D	54.0	10963	73279	t	t	f	2001	39	regular	va
Christopher T	Craig	R	45.0	9176	101729	f	f	f	2001	39	regular	va
W.T. "Bill"	Peabody	L	1.0	191	225	f	f	f	2001	39	regular	va
Vivian	Watts	D	98.03	10724	60553	t	t	f	2003	39	regular	va
Christopher T	Craig	R	\N	\N	4086	f	\N	t	2003	39	regular	va
Vivian	Watts	D	62.71	12086	215186	t	t	f	2005	39	regular	va
Michael J	Meunier	R	35.9	6918	216802	f	f	f	2005	39	regular	va
Richard	Herron	I	1.33	256	0	f	f	f	2005	39	regular	va
Vivian	Watts	D	78.27	10525	83779	t	t	f	2007	39	regular	va
Vivian	Watts	D	56.36	10391	90385	t	t	f	2009	39	regular	va
Joe	Bury	R	39.49	7281	28452	f	f	f	2009	39	regular	va
Matthew J	Cholko	L	3.15	580	8011	f	f	f	2009	39	regular	va
Jim	Leslie	Ind. Green	0.92	170	19	f	f	f	2009	39	regular	va
Vivian	Watts	D	76.19	11297	78696	t	t	f	2011	39	regular	va
Dimitri	Kolazas	Ind. Green	22.99	3409	200	f	f	f	2011	39	regular	va
Vivian	Watts	D	93.64	17380	105365	t	t	f	2013	39	regular	va
Joe	Bury	R	\N	\N	2151	f	\N	t	2013	39	regular	va
Vivian	Watts	D	100.0	10938	84483	t	t	f	2015	39	regular	va
James K	O'Brien	R	69.17	14738	65594	t	t	f	1997	40	regular	va
Robert C	Greene	D	30.75	6552	26907	f	f	f	1997	40	regular	va
James K	O'Brien	R	65.06	9772	89501	t	t	f	1999	40	regular	va
Gordon K	Meriwether	D	34.91	5243	54088	f	f	f	1999	40	regular	va
James K	O'Brien	R	99.08	14773	49124	t	t	f	2001	40	regular	va
Tim	Hugo	R	67.4	2927	86237	f	t	f	2002	40	special	va
Carol A	Hawn	D	30.3	1313	29317	f	f	f	2002	40	special	va
Mark Andrew	Calhoun	I	0.9	39	3594	f	f	f	2002	40	special	va
Joseph P	Oddo	I	1.4	59	1216	f	f	f	2002	40	special	va
Tim	Hugo	R	98.24	9400	131903	t	t	f	2003	40	regular	va
James K	O'Brien	R	\N	\N	21064	f	\N	t	2003	40	regular	va
Tim	Hugo	R	89.85	13076	152494	t	t	f	2005	40	regular	va
Tim	Hugo	R	57.14	8707	654734	t	t	f	2007	40	regular	va
Rex Alan	Simmons	D	42.79	6520	579125	f	f	f	2007	40	regular	va
Tim	Hugo	R	63.4	12056	354761	t	t	f	2009	40	regular	va
Susan Shedd	Conrad	D	36.48	6936	5137	f	f	f	2009	40	regular	va
Tim	Hugo	R	73.85	11565	457405	t	t	f	2011	40	regular	va
Dianne	Blais	I	25.68	4021	7745	f	f	f	2011	40	regular	va
Tim	Hugo	R	59.96	14887	587128	t	t	f	2013	40	regular	va
Jerry	Foltz	D	39.88	9903	134712	f	f	f	2013	40	regular	va
Tim	Hugo	R	65.29	10875	575458	t	t	f	2015	40	regular	va
Jerry	Foltz	D	34.71	5781	58187	f	f	f	2015	40	regular	va
James H II	Dillard	R	99.42	14292	10804	t	t	f	1997	41	regular	va
James H II	Dillard	R	58.52	7752	158275	t	t	f	1999	41	regular	va
Eileen	Filler-Corn	D	41.38	5482	173514	f	f	f	1999	41	regular	va
James H II	Dillard	R	84.0	16518	20053	t	t	f	2001	41	regular	va
Micah	Gray	L	16.0	3121	964	f	f	f	2001	41	regular	va
James H II	Dillard	R	63.55	8889	64451	t	t	f	2003	41	regular	va
Michael J	Golden	I	26.94	3768	14839	f	f	f	2003	41	regular	va
John M	Wolfe	I	9.25	1294	4814	f	f	f	2003	41	regular	va
Albert E	Strong	R	\N	\N	352	f	\N	t	2003	41	regular	va
Dave	Marsden	D	59.23	12908	534058	f	t	f	2005	41	regular	va
Michael J	Golden	R	40.59	8846	464759	f	f	f	2005	41	regular	va
James H II	Dillard	R	\N	\N	35492	t	\N	f	2005	41	regular	va
Bradley C	Davis	R	\N	\N	9873	f	\N	t	2005	41	regular	va
Benjamin Alex	Tribbett	D	\N	\N	8992	f	\N	t	2005	41	regular	va
Dave	Marsden	D	97.48	13187	123471	t	t	f	2007	41	regular	va
Dave	Marsden	D	49.63	10355	243981	t	t	f	2009	41	regular	va
Kerry	Bolognese	R	48.63	10146	115168	f	f	f	2009	41	regular	va
C Monique	Berry	Ind. Green	1.68	350	182	f	f	f	2009	41	regular	va
Brett	Coffee	R	\N	\N	4458	f	\N	t	2009	41	regular	va
Eileen	Filler-Corn	D	50.13	5758	391108	f	t	f	2010	41	special	va
Kerry	Bolognese	R	49.8	5721	174234	f	f	f	2010	41	special	va
Eileen	Filler-Corn	D	68.02	11959	136728	t	t	f	2011	41	regular	va
Michael	Kane	L	31.33	5509	1680	f	f	f	2011	41	regular	va
Fredy	Burgos	I	\N	\N	100	f	\N	t	2011	41	regular	va
Eileen	Filler-Corn	D	56.96	15030	240609	t	t	f	2013	41	regular	va
Fredy	Burgos	R	39.39	10392	211060	f	f	f	2013	41	regular	va
Christopher F	DeCarlo	I	3.58	944	175	f	f	f	2013	41	regular	va
Eileen	Filler-Corn	D	100.0	12175	121891	t	t	f	2015	41	regular	va
Dave	Albo	R	75.99	11200	57349	t	t	f	1997	42	regular	va
Ali	Ghaemi	D	23.83	3512	15645	f	f	f	1997	42	regular	va
Dave	Albo	R	99.32	9075	35717	t	t	f	1999	42	regular	va
Dave	Albo	R	61.0	11258	124890	t	t	f	2001	42	regular	va
David B	Collins	D	39.0	7173	74507	f	f	f	2001	42	regular	va
Dave	Albo	R	98.53	9325	101635	t	t	f	2003	42	regular	va
Dave	Albo	R	51.16	10257	540620	t	t	f	2005	42	regular	va
Gregory A	Werkheiser	D	47.7	9479	464195	f	f	f	2005	42	regular	va
Dave	Albo	R	87.65	9947	270013	t	t	f	2007	42	regular	va
Dave	Albo	R	56.56	11767	956217	t	t	f	2009	42	regular	va
Gregory A	Werkheiser	D	43.29	9006	778866	f	f	f	2009	42	regular	va
Dave	Albo	R	62.13	11835	415148	t	t	f	2011	42	regular	va
Jack	Dobbyn	D	37.79	7199	139656	f	f	f	2011	42	regular	va
Dave	Albo	R	59.83	15303	476687	t	t	f	2013	42	regular	va
Ed	Deitsch	D	40.06	10247	28541	f	f	f	2013	42	regular	va
Dave	Albo	R	63.44	10837	333461	t	t	f	2015	42	regular	va
Joana	Garcia	D	36.56	6245	50555	f	f	f	2015	42	regular	va
Gladys B	Keating	D	51.3	9304	142126	t	t	f	1997	43	regular	va
Thomas M	Bolvin	R	48.62	8818	77896	f	f	f	1997	43	regular	va
Thomas M	Bolvin	R	52.2	7230	192223	f	t	f	1999	43	regular	va
Gladys B	Keating	D	47.74	6612	195236	t	f	f	1999	43	regular	va
Thomas M	Bolvin	R	51.0	9550	189839	t	t	f	2001	43	regular	va
Mark	Sickles	D	49.0	9237	261127	f	f	f	2001	43	regular	va
Kenneth P	Halla	D	\N	\N	6889	f	\N	t	2001	43	regular	va
Mark	Sickles	D	53.79	7159	300430	f	t	f	2003	43	regular	va
Thomas M	Bolvin	R	46.12	6137	193113	t	f	f	2003	43	regular	va
Mark	Sickles	D	63.82	11630	272011	t	t	f	2005	43	regular	va
Ronald Michael Jr	Grignol	R	36.04	6571	51702	f	f	f	2005	43	regular	va
Mark	Sickles	D	97.06	9822	150429	t	t	f	2007	43	regular	va
Mark	Sickles	D	56.13	10363	240581	t	t	f	2009	43	regular	va
Timothy D	Nank	R	43.77	8081	135787	f	f	f	2009	43	regular	va
Mark	Sickles	D	95.8	10175	206297	t	t	f	2011	43	regular	va
Mark	Sickles	D	73.55	14799	282879	t	t	f	2013	43	regular	va
Glenda Gail	Parker	Ind. Green	25.3	5090	10070	f	f	f	2013	43	regular	va
Mark	Sickles	D	63.33	7696	197704	t	t	f	2015	43	regular	va
Anna	Urman	R	33.39	4058	42334	f	f	f	2015	43	regular	va
Paul	McIlvaine	I	3.28	398	2549	f	f	f	2015	43	regular	va
Toddy	Puller	D	74.02	11173	79817	t	t	f	1997	44	regular	va
Kip	Karl	I	25.7	3879	2541	f	f	f	1997	44	regular	va
Kristen J	Amundson	D	51.2	7065	296044	f	t	f	1999	44	regular	va
Scott T	Klein	R	48.75	6726	280522	f	f	f	1999	44	regular	va
Toddy	Puller	D	\N	\N	28864	t	\N	t	1999	44	regular	va
Kristen J	Amundson	D	51.0	9684	221847	t	t	f	2001	44	regular	va
Scott T	Klein	R	49.0	9331	194252	f	f	f	2001	44	regular	va
Kristen J	Amundson	D	56.33	7796	257925	t	t	f	2003	44	regular	va
David B	Kennedy	R	43.59	6033	63711	f	f	f	2003	44	regular	va
Scott T	Klein	R	\N	\N	0	f	\N	t	2003	44	regular	va
Louis Jr	Kobus	R	\N	\N	6704	f	\N	t	2003	44	regular	va
Kristen J	Amundson	D	58.9	10753	256898	t	t	f	2005	44	regular	va
Gregory B	Scoma	R	37.7	6883	23231	f	f	f	2005	44	regular	va
Glenda Gail	Parker	Ind. Green	3.28	598	40003	f	f	f	2005	44	regular	va
Marianne E	Volpe	L	\N	\N	1300	f	\N	f	2005	44	regular	va
Kristen J	Amundson	D	96.15	8287	194809	t	t	f	2007	44	regular	va
Scott	Surovell	D	53.36	9961	340293	f	t	f	2009	44	regular	va
James E	McConville	R	44.93	8387	256577	f	f	f	2009	44	regular	va
Glenda Gail	Parker	Ind. Green	1.64	306	1518	f	f	f	2009	44	regular	va
Kristen J	Amundson	D	\N	\N	144637	t	\N	f	2009	44	regular	va
Scott	Surovell	D	59.39	8738	299218	t	t	f	2011	44	regular	va
John	Barsa	R	39.03	5742	222427	f	f	f	2011	44	regular	va
Joe	Glean	I	1.52	223	189	f	f	f	2011	44	regular	va
Scott	Surovell	D	71.02	13438	199862	t	t	f	2013	44	regular	va
Joe	Glean	I	28.12	5321	5	f	f	f	2013	44	regular	va
Paul	Krizek	D	100.0	9606	115898	f	t	f	2015	44	regular	va
Scott	Surovell	D	\N	\N	165617	t	\N	t	2015	44	regular	va
Marian A	Van Landingham	D	66.78	12136	44559	t	t	f	1997	45	regular	va
Ross B	Bell	R	32.95	5988	8895	f	f	f	1997	45	regular	va
Marian A	Van Landingham	D	65.59	7307	49062	t	t	f	1999	45	regular	va
Ross B	Bell	R	34.15	3804	13804	f	f	f	1999	45	regular	va
Marian A	Van Landingham	D	96.51	20022	42274	t	t	f	2001	45	regular	va
Marian A	Van Landingham	D	63.62	8291	49978	t	t	f	2003	45	regular	va
Robert J	Test	R	36.21	4719	55732	f	f	f	2003	45	regular	va
David	Englin	D	67.63	17798	150584	f	t	f	2005	45	regular	va
Christopher J	Gregerson	R	32.16	8465	43117	f	f	f	2005	45	regular	va
Marian A	Van Landingham	D	\N	\N	39711	t	\N	f	2005	45	regular	va
David	Englin	D	64.19	10172	284058	t	t	f	2007	45	regular	va
Mark S	Allen	R	35.72	5660	246377	f	f	f	2007	45	regular	va
David	Englin	D	61.16	16452	272961	t	t	f	2009	45	regular	va
Victoria L	Vasques	R	38.7	10410	60078	f	f	f	2009	45	regular	va
David	Englin	D	93.97	11555	195867	t	t	f	2011	45	regular	va
Rob	Krupicka	D	75.65	6384	73409	f	t	f	2012	45	special	va
Tim	McGhee	R	20.58	1737	4636	f	f	f	2012	45	special	va
Justin	Malkin	L	3.41	288	18490	f	f	f	2012	45	special	va
Rob	Krupicka	D	73.73	21197	92987	t	t	f	2013	45	regular	va
Jeff	Engle	I	25.22	7252	11959	f	f	f	2013	45	regular	va
Mark	Levine	D	100.0	16055	121341	f	t	f	2015	45	regular	va
Rob	Krupicka	D	\N	\N	67793	t	\N	f	2015	45	regular	va
Brian	Moran	D	62.48	8266	53686	t	t	f	1997	46	regular	va
Marcantonio W	Barnes	R	37.32	4937	33817	f	f	f	1997	46	regular	va
Brian	Moran	D	91.89	5328	57307	t	t	f	1999	46	regular	va
Brian	Moran	D	70.0	10011	88299	t	t	f	2001	46	regular	va
Kamal	Nawash	R	28.0	3975	57057	f	f	f	2001	46	regular	va
James	Lowenstern	Green	3.0	385	2068	f	f	f	2001	46	regular	va
Brian	Moran	D	93.74	4176	138922	t	t	f	2003	46	regular	va
Brian	Moran	D	72.44	10153	213402	t	t	f	2005	46	regular	va
Matthew	Mueda	R	27.35	3833	13303	f	f	f	2005	46	regular	va
Brian	Moran	D	93.85	4624	304612	t	t	f	2007	46	regular	va
Charniele	Herring	D	50.17	1344	27902	f	t	f	2009	46	special	va
Joe	Murray	R	49.57	1328	5005	f	f	f	2009	46	special	va
Charniele	Herring	D	63.99	8778	111553	t	t	f	2009	46	regular	va
Sasha	Gong	R	35.93	4929	49433	f	f	f	2009	46	regular	va
Brian	Moran	D	\N	\N	671897	f	\N	t	2009	46	regular	va
Charniele	Herring	D	95.19	7664	70305	t	t	f	2011	46	regular	va
Charniele	Herring	D	95.66	15066	107979	t	t	f	2013	46	regular	va
Charniele	Herring	D	67.13	7507	219863	t	t	f	2015	46	regular	va
Sean	Lenehan	R	28.35	3170	27343	f	f	f	2015	46	regular	va
Andy	Bakker	L	4.52	505	3775	f	f	f	2015	46	regular	va
James F	Almand	D	99.28	12577	40245	t	t	f	1997	47	regular	va
James F	Almand	D	68.54	7861	53949	t	t	f	1999	47	regular	va
Robert A Jr	Metry	R	31.39	3600	5917	f	f	f	1999	47	regular	va
James F	Almand	D	66.0	13494	50343	t	t	f	2001	47	regular	va
Michael	Peck	R	31.0	6300	26430	f	f	f	2001	47	regular	va
Christine E	Austen	L	3.0	561	1599	f	f	f	2001	47	regular	va
Albert C	Eisenberg	D	65.45	8689	34329	f	t	f	2003	47	regular	va
Rodger Christian	Hoff	R	34.42	4569	69447	f	f	f	2003	47	regular	va
James F	Almand	D	\N	\N	15816	t	\N	f	2003	47	regular	va
Albert C	Eisenberg	D	97.11	18375	42290	t	t	f	2005	47	regular	va
Albert C	Eisenberg	D	96.99	9962	38707	t	t	f	2007	47	regular	va
Patrick	Hope	D	63.54	13540	73531	f	t	f	2009	47	regular	va
Eric James	Brescia	R	31.72	6758	28199	f	f	f	2009	47	regular	va
Joshua F	Ruebner	Green	4.6	981	2326	f	f	f	2009	47	regular	va
Albert C	Eisenberg	D	\N	\N	0	t	\N	f	2009	47	regular	va
Patrick	Hope	D	96.88	12101	121849	t	t	f	2011	47	regular	va
Patrick	Hope	D	76.37	20308	85605	t	t	f	2013	47	regular	va
Laura	Delhomme	L	22.85	6077	8191	f	f	f	2013	47	regular	va
Patrick	Hope	D	78.03	11656	71273	t	t	f	2015	47	regular	va
Janet	Murphy	I	21.97	3281	53	f	f	f	2015	47	regular	va
Bob	Brink	D	57.77	11510	44212	f	t	f	1997	48	regular	va
John	Massoud	R	35.91	7156	35511	f	f	f	1997	48	regular	va
Richard D	Smith	Va.	6.23	1242	3822	f	f	f	1997	48	regular	va
Julia A	Connally	D	\N	\N	9425	t	\N	f	1997	48	regular	va
Bob	Brink	D	62.78	9759	46142	t	t	f	1999	48	regular	va
John	Massoud	R	37.2	5783	30740	f	f	f	1999	48	regular	va
Bob	Brink	D	65.0	14652	57435	t	t	f	2001	48	regular	va
Victor K	Williams	R	35.0	8043	5215	f	f	f	2001	48	regular	va
Bob	Brink	D	60.86	9074	61339	t	t	f	2003	48	regular	va
Steve	Sass	R	39.04	5821	31544	f	f	f	2003	48	regular	va
Bob	Brink	D	97.48	19696	81727	t	t	f	2005	48	regular	va
Bob	Brink	D	97.24	10947	78079	t	t	f	2007	48	regular	va
Bob	Brink	D	62.32	15366	141497	t	t	f	2009	48	regular	va
Aaron E	Ringel	R	37.58	9265	31077	f	f	f	2009	48	regular	va
Bob	Brink	D	68.29	11492	97094	t	t	f	2011	48	regular	va
Janet	Murphy	Ind. Green	6.85	1153	200	f	f	f	2011	48	regular	va
Kathy	Mallard	I	24.25	4081	7691	f	f	f	2011	48	regular	va
Bob	Brink	D	94.69	22110	92924	t	t	f	2013	48	regular	va
Josh	Farrar	R	\N	\N	586	f	\N	t	2013	48	regular	va
Lindsey	Bolton	L	\N	\N	2215	f	\N	t	2013	48	regular	va
Rip	Sullivan	D	62.21	5972	146053	f	t	f	2014	48	special	va
Dave	Foster	R	37.71	3620	102770	f	f	f	2014	48	special	va
Rip	Sullivan	D	100.0	13141	112784	t	t	f	2015	48	regular	va
Jay	Katzen	R	63.09	11529	79391	t	t	f	1997	31	regular	va
Paul J	Asciolla	D	31.21	5703	33675	f	f	f	1997	31	regular	va
Robert A	Buchanan	I	5.6	1024	1551	f	f	f	1997	31	regular	va
Jay	Katzen	R	70.23	10570	275088	t	t	f	1999	31	regular	va
Meredith L	Gorfein	D	29.54	4446	14983	f	f	f	1999	31	regular	va
Terry	Kilgore	R	72.06	12130	63256	t	t	f	1997	1	regular	va
Jerry D	Taylor	D	27.94	4703	4895	f	f	f	1997	1	regular	va
Terry	Kilgore	R	99.91	13983	59713	t	t	f	1999	1	regular	va
Terry	Kilgore	R	99.8	12777	65249	t	t	f	2001	1	regular	va
Terry	Kilgore	R	99.91	14279	71283	t	t	f	2003	1	regular	va
Terry	Kilgore	R	68.72	6445	217381	t	t	f	2005	1	regular	va
Rex	McCarty	D	31.21	14194	66327	f	f	f	2005	1	regular	va
Terry	Kilgore	R	72.31	14374	292282	t	t	f	2007	1	regular	va
Jerry D	Taylor	D	27.62	5491	5022	f	f	f	2007	1	regular	va
Terry	Kilgore	R	98.93	13098	281987	t	t	f	2009	1	regular	va
Terry	Kilgore	R	98.65	16465	363815	t	t	f	2011	1	regular	va
Terry	Kilgore	R	98.27	14330	550168	t	t	f	2013	1	regular	va
Terry	Kilgore	R	100.0	16716	494777	t	t	f	2015	1	regular	va
Bud	Phillips	D	99.79	10876	9209	t	t	f	1997	2	regular	va
Bud	Phillips	D	75.7	14432	31973	t	t	f	1999	2	regular	va
Erick A	Bowman	R	24.29	4631	5191	f	f	f	1999	2	regular	va
Bud	Phillips	D	99.8	11330	6785	t	t	f	2001	2	regular	va
Bud	Phillips	D	99.74	13195	9232	t	t	f	2003	2	regular	va
Bud	Phillips	D	64.06	11864	105455	t	t	f	2005	2	regular	va
Linda	Tiller	R	35.91	6650	57474	f	f	f	2005	2	regular	va
Bud	Phillips	D	99.12	14385	34613	t	t	f	2007	2	regular	va
Bud	Phillips	D	90.13	11283	50426	t	t	f	2009	2	regular	va
Mark	Dudenhefer	R	56.02	5767	130778	f	t	f	2011	2	regular	va
Esteban	Garces	D	43.78	4507	140905	f	f	f	2011	2	regular	va
Bud	Phillips	D	\N	\N	28948	t	\N	f	2011	2	regular	va
Michael	Futrell	D	50.56	8189	97030	f	t	f	2013	2	regular	va
Mark	Dudenhefer	R	49.18	7966	241013	t	f	f	2013	2	regular	va
Mark	Dudenhefer	R	50.54	5839	452641	f	t	f	2015	2	regular	va
Josh	King	D	49.46	5714	181344	f	f	f	2015	2	regular	va
Michael	Futrell	D	\N	\N	36526	t	\N	t	2015	2	regular	va
Rod	Hall	D	\N	\N	25533	f	\N	t	2015	2	regular	va
Jackie T	Stump	D	91.67	8069	21507	t	t	f	1997	3	regular	va
Jackie T	Stump	D	99.97	12370	20218	t	t	f	1999	3	regular	va
Jackie T	Stump	D	99.8	10184	14564	t	t	f	2001	3	regular	va
Jackie T	Stump	D	99.82	13018	52569	t	t	f	2003	3	regular	va
Jackie T	Stump	D	99.62	10889	93452	t	t	f	2005	3	regular	va
Dan Carr II	Bowling	D	60.3	6575	119165	f	t	f	2006	3	special	va
Shea	Cook	R	28.1	3064	103503	f	f	f	2006	3	special	va
Gerald L	Elkins	I	9.1	999	26101	f	f	f	2006	3	special	va
R Brian	Wright	I	2.3	256	1098	f	f	f	2006	3	special	va
Dan Carr II	Bowling	D	98.82	10244	70871	t	t	f	2007	3	regular	va
Will	Morefield	R	57.1	8665	231799	f	t	f	2009	3	regular	va
Dan Carr II	Bowling	D	42.83	6499	134078	t	f	f	2009	3	regular	va
Will	Morefield	R	59.67	13316	217861	t	t	f	2011	3	regular	va
Vern	Presley	D	40.3	8994	58541	f	f	f	2011	3	regular	va
Will	Morefield	R	70.25	12291	151629	t	t	f	2013	3	regular	va
James M	O'Quinn	D	29.65	5188	4347	f	f	f	2013	3	regular	va
Will	Morefield	R	100.0	14325	110235	t	t	f	2015	3	regular	va
Joseph	Johnson	D	99.72	11337	5883	t	t	f	1997	4	regular	va
Joseph	Johnson	D	99.84	10221	11822	t	t	f	1999	4	regular	va
Joseph	Johnson	D	99.7	12671	9898	t	t	f	2001	4	regular	va
Joseph	Johnson	D	99.81	8595	12338	t	t	f	2003	4	regular	va
Joseph	Johnson	D	98.88	15418	12999	t	t	f	2005	4	regular	va
Joseph	Johnson	D	99.19	10583	18276	t	t	f	2007	4	regular	va
Joseph	Johnson	D	97.14	13032	17844	t	t	f	2009	4	regular	va
Joseph	Johnson	D	98.53	14487	22200	t	t	f	2011	4	regular	va
Ben	Chafin	R	97.91	13959	96687	f	t	f	2013	4	regular	va
Joseph	Johnson	D	\N	\N	15793	t	\N	f	2013	4	regular	va
Todd	Pillion	R	66.26	4570	199157	f	t	f	2014	4	special	va
Donnie	Rife	D	33.74	2327	14918	f	f	f	2014	4	special	va
Todd	Pillion	R	100.0	13797	22023	t	t	f	2015	4	regular	va
Ben	Chafin	R	\N	\N	42474	f	\N	t	2015	4	regular	va
John H Jr	Tate	D	51.33	8656	147108	t	t	f	1997	5	regular	va
Barnes L	Kidd	R	48.66	8205	75318	f	f	f	1997	5	regular	va
John H Jr	Tate	D	55.57	10410	291534	t	t	f	1999	5	regular	va
Jack S Jr	Hurley	R	44.43	8323	247731	f	f	f	1999	5	regular	va
Bill	Carrico	R	58.9	11561	86743	f	t	f	2001	5	regular	va
John H Jr	Tate	D	41.1	8072	172720	t	f	f	2001	5	regular	va
Bill	Carrico	R	54.94	9492	133981	t	t	f	2003	5	regular	va
Thomas B	Graham	D	45.06	7783	210972	f	f	f	2003	5	regular	va
Bill	Carrico	R	98.05	14043	72261	t	t	f	2005	5	regular	va
Bill	Carrico	R	55.43	9813	135868	t	t	f	2007	5	regular	va
Susie D	Garner	D	44.52	7881	105966	f	f	f	2007	5	regular	va
Thomas E	Williams	I	\N	\N	200	f	\N	t	2007	5	regular	va
Bill	Carrico	R	98.32	13724	62111	t	t	f	2009	5	regular	va
Israel	O'Quinn	R	69.29	12166	56555	f	t	f	2011	5	regular	va
Michael	Osborne	I	30.4	5338	3707	f	f	f	2011	5	regular	va
Bill	Carrico	R	\N	\N	66715	t	\N	t	2011	5	regular	va
Israel	O'Quinn	R	98.68	16771	143695	t	t	f	2013	5	regular	va
Israel	O'Quinn	R	100.0	12771	105218	t	t	f	2015	5	regular	va
Thomas M Jr	Jackson	D	99.34	12272	35051	t	t	f	1997	6	regular	va
Thomas M Jr	Jackson	D	99.55	14668	57275	t	t	f	1999	6	regular	va
Benny	Keister	D	51.0	10247	142725	t	t	f	2001	6	regular	va
Billy	Ashworth	R	49.0	8644	59553	f	f	f	2001	6	regular	va
Benny	Keister	D	50.13	8141	168352	t	t	f	2003	6	regular	va
Morgan Jr	Morris	R	49.4	8092	65775	f	f	f	2003	6	regular	va
Anne	Crockett-Stark	R	54.26	10705	228972	f	t	f	2005	6	regular	va
Benny	Keister	D	46.18	9112	185227	t	f	f	2005	6	regular	va
Anne	Crockett-Stark	R	55.64	9319	81409	t	t	f	2007	6	regular	va
William F Jr	Thomas	D	44.26	7412	91110	f	f	f	2007	6	regular	va
Anne	Crockett-Stark	R	65.17	11889	150267	t	t	f	2009	6	regular	va
A Carole	Pratt	D	34.71	6331	274655	f	f	f	2009	6	regular	va
Anne	Crockett-Stark	R	98.44	15047	41347	t	t	f	2011	6	regular	va
Jeff	Campbell	R	56.99	11576	548902	f	t	f	2013	6	regular	va
Jonathan L	McGrady	D	36.55	7425	475533	f	f	f	2013	6	regular	va
Barbara T	Hall	I	6.34	1288	735	f	f	f	2013	6	regular	va
Anne	Crockett-Stark	R	\N	\N	35294	t	\N	f	2013	6	regular	va
Jeff	Campbell	R	100.0	15921	72175	t	t	f	2015	6	regular	va
Thomas G Jr	Baker	R	99.98	10506	4771	t	t	f	1997	7	regular	va
Benny	Keister	D	53.22	7873	294178	f	t	f	1999	7	regular	va
Barbara M	Chrisley	R	35.65	5274	347419	f	f	f	1999	7	regular	va
Joseph H	McClung	I	3.72	551	1670	f	f	f	1999	7	regular	va
William R	Meyer	I	7.37	1090	200	f	f	f	1999	7	regular	va
Thomas G Jr	Baker	R	\N	\N	1771	t	\N	f	1999	7	regular	va
Dave	Nutter	R	52.0	8603	97118	f	t	f	2001	7	regular	va
Jim	Shuler	D	48.0	7821	189308	t	f	f	2001	7	regular	va
Barbara M	Chrisley	D	\N	\N	0	f	\N	t	2001	7	regular	va
Dave	Nutter	R	99.84	9076	42469	t	t	f	2003	7	regular	va
Dave	Nutter	R	61.96	10710	111621	t	t	f	2005	7	regular	va
Barbara M	Chrisley	D	37.94	6558	25799	f	f	f	2005	7	regular	va
Dave	Nutter	R	52.65	6664	150245	t	t	f	2007	7	regular	va
Peggy H	Frank	D	47.25	5980	162520	f	f	f	2007	7	regular	va
Dave	Nutter	R	60.09	10059	228268	t	t	f	2009	7	regular	va
Peggy H	Frank	D	39.84	6669	160761	f	f	f	2009	7	regular	va
Nick	Rush	R	97.41	13709	27711	f	t	f	2011	7	regular	va
Dave	Nutter	R	\N	\N	66845	t	\N	t	2011	7	regular	va
Nick	Rush	R	64.97	13238	117156	t	t	f	2013	7	regular	va
Mike	Abraham	D	34.89	7109	31228	f	f	f	2013	7	regular	va
Nick	Rush	R	100.0	14714	46722	t	t	f	2015	7	regular	va
S Vance Jr	Wilkins	R	83.48	12715	151774	t	t	f	1997	24	regular	va
Daniel A	Metraux	I	16.52	2516	340	f	f	f	1997	24	regular	va
S Vance Jr	Wilkins	R	99.25	6975	174048	t	t	f	1999	24	regular	va
S Vance Jr	Wilkins	R	99.74	12703	388683	t	t	f	2001	24	regular	va
Ben	Cline	R	57.44	10176	183346	f	f	f	2002	24	special	va
Mimi Milner	Elrod	D	42.52	7538	129336	f	f	f	2002	24	special	va
Ben	Cline	R	69.18	9568	34969	t	t	f	2003	24	regular	va
Eric W	Sheffield	I	30.81	4261	13146	f	f	f	2003	24	regular	va
S Vance Jr	Wilkins	R	\N	\N	133779	f	\N	f	2003	24	regular	va
Ben	Cline	R	61.21	11560	96592	t	t	f	2005	24	regular	va
Richard David	Cox	D	37.49	7080	124245	f	f	f	2005	24	regular	va
Ben	Cline	R	98.28	9429	59852	t	t	f	2007	24	regular	va
Ben	Cline	R	70.86	13723	148109	t	t	f	2009	24	regular	va
Jeff	Price	D	29.11	5637	20293	f	f	f	2009	24	regular	va
Ben	Cline	R	97.47	14250	106322	t	t	f	2011	24	regular	va
Ben	Cline	R	91.94	15950	106817	t	t	f	2013	24	regular	va
Ben	Cline	R	70.97	13488	155372	t	t	f	2015	24	regular	va
Ellen	Arthur	D	29.03	5517	47195	f	f	f	2015	24	regular	va
Steve	Landes	R	84.83	14144	21306	t	t	f	1997	25	regular	va
Sherry A	Stanley	I	15.16	2528	978	f	f	f	1997	25	regular	va
Steve	Landes	R	76.59	8063	39660	t	t	f	1999	25	regular	va
Sherry A	Stanley	I	23.39	2462	2871	f	f	f	1999	25	regular	va
Steve	Landes	R	99.03	16196	34336	t	t	f	2001	25	regular	va
Steve	Landes	R	99.03	11826	36322	t	t	f	2003	25	regular	va
Steve	Landes	R	97.86	16979	115065	t	t	f	2005	25	regular	va
Steve	Landes	R	98.42	11759	80988	t	t	f	2007	25	regular	va
Steve	Landes	R	73.18	16669	140472	t	t	f	2009	25	regular	va
Gregory	Marrow	D	26.75	6093	40566	f	f	f	2009	25	regular	va
Steve	Landes	R	97.66	12912	133633	t	t	f	2011	25	regular	va
Steve	Landes	R	96.4	19898	191769	t	t	f	2013	25	regular	va
Steve	Landes	R	66.28	12103	231392	t	t	f	2015	25	regular	va
Angela	Lynn	D	33.72	6158	67898	f	f	f	2015	25	regular	va
Glenn M	Weatherholtz	R	71.39	11301	20482	t	t	f	1997	26	regular	va
Ben	Fordney	D	23.09	3655	17184	f	f	f	1997	26	regular	va
Dale Anne	Diaz	I	5.46	864	1135	f	f	f	1997	26	regular	va
Glenn M	Weatherholtz	R	98.34	10917	8962	t	t	f	1999	26	regular	va
Glenn M	Weatherholtz	R	96.97	11479	16354	t	t	f	2001	26	regular	va
Glenn M	Weatherholtz	R	54.5	7108	93320	t	t	f	2003	26	regular	va
Lowell	Fulk	D	45.4	5923	91192	f	f	f	2003	26	regular	va
Matthew J	Lohr	R	53.58	8545	299947	f	t	f	2005	26	regular	va
Lowell	Fulk	D	46.06	7346	230617	f	f	f	2005	26	regular	va
Glenn M	Weatherholtz	R	\N	\N	9928	t	\N	f	2005	26	regular	va
John H III	Elledge	R	\N	\N	15751	f	\N	t	2005	26	regular	va
Matthew J	Lohr	R	71.07	8166	81481	t	t	f	2007	26	regular	va
Carolyn W	Frank	I	28.45	3269	4145	f	f	f	2007	26	regular	va
Matthew J	Lohr	R	73.04	11328	109535	t	t	f	2009	26	regular	va
A Gene Jr	Hart	D	26.89	4170	88352	f	f	f	2009	26	regular	va
Tony	Wilt	R	65.83	6209	135542	f	t	f	2010	26	special	va
Kai	Degner	D	29.9	2820	160317	f	f	f	2010	26	special	va
Carolyn W	Frank	I	4.15	391	19	f	f	f	2010	26	special	va
Tony	Wilt	R	95.81	8790	28102	t	t	f	2011	26	regular	va
Tony	Wilt	R	94.22	12452	46124	t	t	f	2013	26	regular	va
Tony	Wilt	R	100.0	6561	61965	t	t	f	2015	26	regular	va
Sam	Nixon	R	98.39	14237	11220	t	t	f	1997	27	regular	va
Sam	Nixon	R	69.3	5633	23763	t	t	f	1999	27	regular	va
Bradley E	Evans	I	30.34	2466	25	f	f	f	1999	27	regular	va
Sam	Nixon	R	98.18	16012	27095	t	t	f	2001	27	regular	va
Roxann	Robinson	R	92.54	17612	49147	t	t	f	2013	27	regular	va
Roxann	Robinson	R	58.54	10551	159032	t	t	f	2015	27	regular	va
Marty	Mooradian	D	41.46	7472	75882	f	f	f	2015	27	regular	va
Bill	Howell	R	98.24	15930	34606	t	t	f	1997	28	regular	va
Bill	Howell	R	80.08	11587	53595	t	t	f	1999	28	regular	va
Garrett T	Baker	I	19.62	2839	3906	f	f	f	1999	28	regular	va
Bill	Howell	R	64.0	10964	74058	t	t	f	2001	28	regular	va
Noreen C	Crowley	D	36.0	6196	12508	f	f	f	2001	28	regular	va
Bill	Howell	R	98.03	7373	234909	t	t	f	2003	28	regular	va
Bill	Howell	R	94.61	14801	258718	t	t	f	2005	28	regular	va
Bill	Howell	R	61.7	8726	660626	t	t	f	2007	28	regular	va
Clyde W	Matthews	D	34.83	4926	9604	f	f	f	2007	28	regular	va
Craig Edward	Ennis	Ind. Green	3.23	457	1247	f	f	f	2007	28	regular	va
Marvin	Dixon	D	\N	\N	75	f	\N	t	2007	28	regular	va
Bill	Howell	R	74.82	14909	509754	t	t	f	2009	28	regular	va
Craig Edward	Ennis	Ind. Green	24.46	4874	1668	f	f	f	2009	28	regular	va
George H	Schwartz	D	\N	\N	300	f	\N	t	2009	28	regular	va
Bill	Howell	R	91.77	9350	332552	t	t	f	2011	28	regular	va
Bill	Howell	R	90.77	14998	1014460	t	t	f	2013	28	regular	va
Bill	Howell	R	60.46	8060	1277626	t	t	f	2015	28	regular	va
Kandy	Hilliard	D	39.54	5272	88947	f	f	f	2015	28	regular	va
Beverly	Sherwood	R	99.93	14826	9202	t	t	f	1997	29	regular	va
Beverly	Sherwood	R	99.83	8660	15110	t	t	f	1999	29	regular	va
Beverly	Sherwood	R	78.0	13897	18945	t	t	f	2001	29	regular	va
Paul D	Blaker	I	22.0	4018	6990	f	f	f	2001	29	regular	va
Beverly	Sherwood	R	99.25	12471	39576	t	t	f	2003	29	regular	va
Beverly	Sherwood	R	98.48	16087	35114	t	t	f	2005	29	regular	va
Beverly	Sherwood	R	98.13	13664	66124	t	t	f	2007	29	regular	va
Sam	Nixon	R	96.72	5598	27860	t	t	f	2003	27	regular	va
Sam	Nixon	R	95.54	15611	83205	t	t	f	2005	27	regular	va
Sam	Nixon	R	96.34	7631	134202	t	t	f	2007	27	regular	va
Sam	Nixon	R	95.19	15938	226797	t	t	f	2009	27	regular	va
Mark Andrew	Jainchell	I	\N	\N	208	f	\N	f	2009	27	regular	va
Dennis	Parker	D	\N	\N	30020	f	\N	t	2009	27	regular	va
Roxann	Robinson	R	72.58	3427	130708	f	t	f	2010	27	special	va
William Paul	Brown	D	27.42	1295	14659	f	f	f	2010	27	special	va
Roxann	Robinson	R	93.93	8313	34535	t	t	f	2011	27	regular	va
Sheila	Bynum-Coleman	D	\N	\N	0	f	\N	t	2011	27	regular	va
Beverly	Sherwood	R	80.03	14908	77264	t	t	f	2009	29	regular	va
Aaron N	Tweedie	I	19.74	3677	1419	f	f	f	2009	29	regular	va
Beverly	Sherwood	R	98.04	9662	82827	t	t	f	2011	29	regular	va
Mark	Berg	R	64.97	12722	94138	f	t	f	2013	29	regular	va
Larry	Yates	I	34.21	6699	15538	f	f	f	2013	29	regular	va
Chris	Collins	R	100.0	9997	90858	f	t	f	2015	29	regular	va
Stubbs	Kristine	D	\N	\N	0	f	\N	f	2015	29	regular	va
John J III	Davies	D	52.08	9995	142561	t	t	f	1997	30	regular	va
J Michael	Sharman	R	47.92	9197	60788	f	f	f	1997	30	regular	va
George E Jr	Broman	R	50.62	9172	275427	f	t	f	1999	30	regular	va
Doris G	Lackey	D	38.07	6897	118553	f	f	f	1999	30	regular	va
J D	Callahan	I	11.3	2048	21721	f	f	f	1999	30	regular	va
John J III	Davies	D	\N	\N	7137	t	\N	f	1999	30	regular	va
George E Jr	Broman	R	99.93	13343	24226	t	t	f	2001	30	regular	va
Ed	Scott	R	87.39	10261	98409	f	t	f	2003	30	regular	va
Walton C	Thompson	I	12.1	1637	0	f	f	f	2003	30	regular	va
George E Jr	Broman	R	\N	\N	20995	t	\N	f	2003	30	regular	va
Ed	Scott	R	99.65	16025	221118	t	t	f	2005	30	regular	va
Ed	Scott	R	99.29	16503	48946	t	t	f	2007	30	regular	va
Ed	Scott	R	75.49	15959	80491	t	t	f	2009	30	regular	va
Matthew A	Carson	I	24.38	5154	1526	f	f	f	2009	30	regular	va
Thomas	Underwood	R	\N	\N	1000	f	\N	t	2009	30	regular	va
Ed	Scott	R	98.92	14914	62296	t	t	f	2011	30	regular	va
Ed	Scott	R	63.31	14061	217340	t	t	f	2013	30	regular	va
Traci	Dippert	D	36.52	8112	174003	f	f	f	2013	30	regular	va
Nick	Freitas	R	100.0	13563	36051	f	t	f	2015	30	regular	va
Stewart	Risher	D	\N	\N	1857	f	\N	t	2015	30	regular	va
Scott	Lingamfelter	R	56.0	8572	149915	f	t	f	2001	31	regular	va
Mickie	Krause	D	44.0	6783	87497	f	f	f	2001	31	regular	va
Diana C	Dutton	R	\N	\N	621	f	\N	t	2001	31	regular	va
Walter George	Longyear	R	\N	\N	19353	f	\N	t	2001	31	regular	va
Scott	Lingamfelter	R	54.99	6787	224504	t	t	f	2003	31	regular	va
David G	Brickley	D	45.01	5556	198673	f	f	f	2003	31	regular	va
Scott	Lingamfelter	R	95.56	11542	121550	t	t	f	2005	31	regular	va
Scott	Lingamfelter	R	55.29	7722	459828	t	t	f	2007	31	regular	va
William S Jr	Day	D	44.47	6210	509436	f	f	f	2007	31	regular	va
Scott	Lingamfelter	R	95.37	12704	133643	t	t	f	2009	31	regular	va
Scott	Lingamfelter	R	58.62	8435	239943	t	t	f	2011	31	regular	va
Roy	Coffey	D	41.21	5930	50641	f	f	f	2011	31	regular	va
Scott	Lingamfelter	R	50.4	11508	264393	t	t	f	2013	31	regular	va
Jeremy	McPike	D	49.4	11280	104651	f	f	f	2013	31	regular	va
Scott	Lingamfelter	R	53.43	9506	463876	t	t	f	2015	31	regular	va
Sara	Townsend	D	46.57	8287	272835	f	f	f	2015	31	regular	va
Rebecca	Colaw	D	\N	\N	8251	f	\N	f	2017	64	regular	va
Lashrecse	Aird	D	\N	\N	76002	t	\N	f	2017	63	regular	va
Riley	Ingram	R	\N	\N	59527	t	\N	f	2017	62	regular	va
Sheila	Bynum-Coleman	D	\N	\N	73578	f	\N	f	2017	62	regular	va
Tavorise	Marks	D	\N	\N	806	f	\N	t	2017	62	regular	va
Tommy	Wright	R	\N	\N	22590	t	\N	f	2017	61	regular	va
James	Edmunds	R	\N	\N	26269	t	\N	f	2017	60	regular	va
Jamaal	Johnston	D	\N	\N	1254	f	\N	f	2017	60	regular	va
Matt	Fariss	R	\N	\N	23303	t	\N	f	2017	59	regular	va
Tracy	Carver	D	\N	\N	200	f	\N	f	2017	59	regular	va
Marcus	Sutphin	Green	\N	\N	740	f	\N	f	2017	59	regular	va
Rob	Bell	R	\N	\N	371745	t	\N	f	2017	58	regular	va
Kellen	Squire	D	\N	\N	22116	f	\N	f	2017	58	regular	va
Mike	Allers	R	\N	\N	0	f	\N	t	2017	58	regular	va
David	Toscano	D	\N	\N	339086	t	\N	f	2017	57	regular	va
John	McGuire	R	\N	\N	88039	f	\N	f	2017	56	regular	va
Melissa	Dart	D	\N	\N	31581	f	\N	f	2017	56	regular	va
Peter	Farrell	R	\N	\N	91625	t	\N	t	2017	56	regular	va
Buddy	Fowler	R	\N	\N	44225	t	\N	f	2017	55	regular	va
Morgan	Goodman	D	\N	\N	8703	f	\N	f	2017	55	regular	va
Bobby	Orrock	R	\N	\N	188689	t	\N	f	2017	54	regular	va
Al	Durante	D	\N	\N	3089	f	\N	f	2017	54	regular	va
Rob	Bloxom	R	\N	\N	35169	t	\N	f	2017	100	regular	va
Willie	Randall	D	\N	\N	42932	f	\N	f	2017	100	regular	va
Margaret	Ransone	R	\N	\N	135453	t	\N	f	2017	99	regular	va
Francis	Edwards	D	\N	\N	12238	f	\N	f	2017	99	regular	va
Keith	Hodges	R	\N	\N	30650	t	\N	f	2017	98	regular	va
Sheila	Crowley	D	\N	\N	47356	f	\N	f	2017	98	regular	va
Chris	Peace	R	\N	\N	146565	t	\N	f	2017	97	regular	va
Cori	Johnson	D	\N	\N	5350	f	\N	f	2017	97	regular	va
Brenda	Pogge	R	\N	\N	44904	t	\N	f	2017	96	regular	va
Kelly	DeLucia	D	\N	\N	41293	f	\N	f	2017	96	regular	va
Cia	Price	D	\N	\N	24224	t	\N	f	2017	95	regular	va
David	Yancey	R	\N	\N	191678	t	\N	f	2017	94	regular	va
Zack	Wittkamp	D	\N	\N	34441	f	\N	f	2017	94	regular	va
Michael David	Bartley	L	\N	\N	0	f	\N	f	2017	94	regular	va
Heather	Cordasco	R	\N	\N	196719	f	\N	f	2017	93	regular	va
Mike	Mullin	D	\N	\N	357306	t	\N	f	2017	93	regular	va
Monty	Mason	D	\N	\N	19522	f	\N	t	2017	93	regular	va
Jeion	Ward	D	\N	\N	88471	t	\N	f	2017	92	regular	va
Gordon	Helsel	R	\N	\N	39900	t	\N	f	2017	91	regular	va
Michael	Wade	D	\N	\N	13179	f	\N	f	2017	91	regular	va
Joe	Lindsey	D	\N	\N	34050	t	\N	f	2017	90	regular	va
Jay	Jones	D	\N	\N	146127	f	\N	f	2017	89	regular	va
Terry	Hurst	L	\N	\N	2450	f	\N	f	2017	89	regular	va
Daun	Hester	D	\N	\N	26475	t	\N	t	2017	89	regular	va
Mark	Cole	R	\N	\N	16855	t	\N	f	2017	88	regular	va
Steve	Aycock	D	\N	\N	16264	f	\N	f	2017	88	regular	va
Gerald	Anderson	Green	\N	\N	1045	f	\N	f	2017	88	regular	va
Amanda	Blalock	I	\N	\N	0	f	\N	f	2017	88	regular	va
Subba	Kolla	R	\N	\N	286794	f	\N	f	2017	87	regular	va
John	Bell	D	\N	\N	241699	t	\N	f	2017	87	regular	va
Linda	Schulz	R	\N	\N	1745	f	\N	f	2017	86	regular	va
Jennifer	Boysko	D	\N	\N	116846	t	\N	f	2017	86	regular	va
Rocky	Holcomb	R	\N	\N	117223	t	\N	f	2017	85	regular	va
Cheryl	Turpin	D	\N	\N	237579	f	\N	f	2017	85	regular	va
Glenn	Davis	R	\N	\N	41118	t	\N	f	2017	84	regular	va
Veronica	Coleman	D	\N	\N	11644	f	\N	f	2017	84	regular	va
Chris	Stolle	R	\N	\N	71014	t	\N	f	2017	83	regular	va
David	Rose-Carmack	D	\N	\N	4483	f	\N	f	2017	83	regular	va
Jason	Miyares	R	\N	\N	87640	t	\N	f	2017	82	regular	va
Leigh Anne	Bowling	D	\N	\N	971	f	\N	f	2017	82	regular	va
Alvina	Torres	D	\N	\N	0	f	\N	f	2017	82	regular	va
Barry	Knight	R	\N	\N	430112	t	\N	f	2017	81	regular	va
Kimberly	Tucker	D	\N	\N	2954	f	\N	f	2017	81	regular	va
Marina	Hayslip	R	\N	\N	0	f	\N	f	2017	81	regular	va
Matthew	James	D	\N	\N	43600	t	\N	f	2017	80	regular	va
Steve	Heretick	D	\N	\N	41360	t	\N	f	2017	79	regular	va
Jay	Leftwich	R	\N	\N	70648	t	\N	f	2017	78	regular	va
Cliff	Hayes	D	\N	\N	36051	t	\N	f	2017	77	regular	va
Jeff	Staples	Green	\N	\N	674	f	\N	f	2017	77	regular	va
Lionell Sr	Spruill	D	\N	\N	48933	f	\N	t	2017	77	regular	va
Chris	Jones	R	\N	\N	408405	t	\N	f	2017	76	regular	va
Roslyn	Tyler	D	\N	\N	34664	t	\N	f	2017	75	regular	va
Lamont	Bagby	D	\N	\N	30468	t	\N	f	2017	74	regular	va
Preston	Brown	I	\N	\N	100	f	\N	f	2017	74	regular	va
John	O'Bannon	R	\N	\N	264176	t	\N	f	2017	73	regular	va
Debra	Rodman	D	\N	\N	61524	f	\N	f	2017	73	regular	va
Kevin	Gary	I	\N	\N	1000	f	\N	f	2017	73	regular	va
Eddie	Whitlock	R	\N	\N	80837	f	\N	f	2017	72	regular	va
Schuyler	VanValkenburg	D	\N	\N	76688	f	\N	f	2017	72	regular	va
Jimmie	Massie	R	\N	\N	239793	t	\N	t	2017	72	regular	va
Jeff	Bourne	D	\N	\N	65835	t	\N	f	2017	71	regular	va
Jennifer	McClellan	D	\N	\N	96249	f	\N	t	2017	71	regular	va
Delores	McQuinn	D	\N	\N	40645	t	\N	f	2017	70	regular	va
Betsy	Carr	D	\N	\N	67152	t	\N	f	2017	69	regular	va
Montigue	Magruder	Green	\N	\N	0	f	\N	f	2017	69	regular	va
Marcus	Simon	D	\N	\N	63986	t	\N	f	2017	53	regular	va
Mike	Casey	I	\N	\N	200	f	\N	f	2017	53	regular	va
Luke	Torian	D	\N	\N	57670	t	\N	f	2017	52	regular	va
Rich	Anderson	R	\N	\N	65573	t	\N	f	2017	51	regular	va
Hala	Ayala	D	\N	\N	50260	f	\N	f	2017	51	regular	va
Jackson	Miller	R	\N	\N	373994	f	\N	f	2017	50	regular	va
Lee	Carter	D	\N	\N	67823	f	\N	f	2017	50	regular	va
Ellennita	Hellmer	I	\N	\N	0	f	\N	f	2017	50	regular	va
Adam	Roosevelt	R	\N	\N	5955	f	\N	f	2017	49	regular	va
Alfonso	Lopez	D	\N	\N	80802	t	\N	f	2017	49	regular	va
Rip	Sullivan	D	\N	\N	59795	t	\N	f	2017	48	regular	va
Patrick	Hope	D	\N	\N	43027	t	\N	f	2017	47	regular	va
Charniele	Herring	D	\N	\N	89906	t	\N	f	2017	46	regular	va
Charles	Sumpter	D	\N	\N	3565	f	\N	t	2017	46	regular	va
Mark	Levine	D	\N	\N	65273	t	\N	f	2017	45	regular	va
Karen	Graf	D	\N	\N	9942	f	\N	t	2017	45	regular	va
Paul	Krizek	D	\N	\N	91152	t	\N	f	2017	44	regular	va
Mark	Sickles	D	\N	\N	75809	t	\N	f	2017	43	regular	va
Lolita	Mancheno-Smoak	R	\N	\N	1900	f	\N	f	2017	42	regular	va
Kathy	Tran	D	\N	\N	76862	f	\N	f	2017	42	regular	va
Dave	Albo	R	\N	\N	158234	t	\N	t	2017	42	regular	va
Eileen	Filler-Corn	D	\N	\N	217115	t	\N	f	2017	41	regular	va
Tim	Hugo	R	\N	\N	459826	t	\N	f	2017	40	regular	va
Donte	Tanner	D	\N	\N	62217	f	\N	f	2017	40	regular	va
Vivian	Watts	D	\N	\N	45468	t	\N	f	2017	39	regular	va
Paul	Haring	R	\N	\N	0	f	\N	f	2017	38	regular	va
Kaye	Kory	D	\N	\N	14197	t	\N	f	2017	38	regular	va
David	Bulova	D	\N	\N	71055	t	\N	f	2017	37	regular	va
Ken	Plum	D	\N	\N	60727	t	\N	f	2017	36	regular	va
Mark	Keam	D	\N	\N	42678	t	\N	f	2017	35	regular	va
Cheryl	Buford	R	\N	\N	17834	f	\N	f	2017	34	regular	va
Kathleen	Murphy	D	\N	\N	192601	t	\N	f	2017	34	regular	va
Puneet	Ahluwalia	R	\N	\N	0	f	\N	t	2017	34	regular	va
Dave	LaRock	R	\N	\N	40654	t	\N	f	2017	33	regular	va
Tia	Walbridge	D	\N	\N	35390	f	\N	f	2017	33	regular	va
Tag	Greason	R	\N	\N	196687	t	\N	f	2017	32	regular	va
David	Reid	D	\N	\N	112125	f	\N	f	2017	32	regular	va
Scott	Lingamfelter	R	\N	\N	257152	t	\N	f	2017	31	regular	va
Elizabeth	Guzman	D	\N	\N	86279	f	\N	f	2017	31	regular	va
Jatia	Wrighten	D	\N	\N	0	f	\N	t	2017	31	regular	va
Nick	Freitas	R	\N	\N	19060	t	\N	f	2017	30	regular	va
Ben	Hixon	D	\N	\N	12374	f	\N	f	2017	30	regular	va
Chris	Collins	R	\N	\N	36452	t	\N	f	2017	29	regular	va
Casey	Turben	D	\N	\N	3763	f	\N	f	2017	29	regular	va
Robert Michael Jr	Thomas	R	\N	\N	104076	f	\N	f	2017	28	regular	va
Joshua	Cole	D	\N	\N	15306	f	\N	f	2017	28	regular	va
Bill	Howell	R	\N	\N	321525	t	\N	t	2017	28	regular	va
Karen	Hyland	D	\N	\N	10075	f	\N	t	2017	28	regular	va
Roxann	Robinson	R	\N	\N	66268	t	\N	f	2017	27	regular	va
Larry	Barnett	D	\N	\N	20935	f	\N	f	2017	27	regular	va
Tony	Wilt	R	\N	\N	66254	t	\N	f	2017	26	regular	va
Brent	Finnegan	D	\N	\N	25892	f	\N	f	2017	26	regular	va
Steve	Landes	R	\N	\N	169571	t	\N	f	2017	25	regular	va
Angela	Lynn	D	\N	\N	22296	f	\N	f	2017	25	regular	va
Ben	Cline	R	\N	\N	64036	t	\N	f	2017	24	regular	va
John	Winfrey	I	\N	\N	4540	f	\N	f	2017	24	regular	va
Scott	Garrett	R	\N	\N	104259	t	\N	f	2017	23	regular	va
Natalie	Short	D	\N	\N	10953	f	\N	f	2017	23	regular	va
Kathy	Byron	R	\N	\N	89461	t	\N	f	2017	22	regular	va
Michael	Millner	L	\N	\N	0	f	\N	f	2017	22	regular	va
Ron	Villanueva	R	\N	\N	222123	t	\N	f	2017	21	regular	va
Kelly	Fowler	D	\N	\N	32289	f	\N	f	2017	21	regular	va
Dickie	Bell	R	\N	\N	57708	t	\N	f	2017	20	regular	va
Michele	Edwards	D	\N	\N	28331	f	\N	f	2017	20	regular	va
Will	Hammer	L	\N	\N	0	f	\N	f	2017	20	regular	va
Terry	Kilgore	R	\N	\N	226976	t	\N	f	2017	1	regular	va
Alicia	Kallen	D	\N	\N	5000	f	\N	f	2017	1	regular	va
Manoli	Loupassi	R	\N	\N	111930	t	\N	f	2017	68	regular	va
Dawn	Adams	D	\N	\N	42490	f	\N	f	2017	68	regular	va
Jim	LeMunyon	R	\N	\N	163181	t	\N	f	2017	67	regular	va
Karrie	Delaney	D	\N	\N	144874	f	\N	f	2017	67	regular	va
Kirk	Cox	R	\N	\N	432775	t	\N	f	2017	66	regular	va
Katie	Sponsler	D	\N	\N	6368	f	\N	f	2017	66	regular	va
Lee	Ware	R	\N	\N	139769	t	\N	f	2017	65	regular	va
Francis	Stevens	D	\N	\N	4289	f	\N	f	2017	65	regular	va
Emily	Brewer	R	\N	\N	51148	f	\N	f	2017	64	regular	va
Bob	Bloxom	R	77.29	10638	19197	t	t	f	1997	100	regular	va
Richard R	Andrews	I	22.71	3125	4083	f	f	f	1997	100	regular	va
Ed	Scott	R	\N	\N	88228	t	\N	f	2015	30	regular	va
Bob	Bloxom	R	100.0	11704	2577	t	t	f	1999	100	regular	va
Bob	Bloxom	R	99.58	8528	2273	t	t	f	2001	100	regular	va
Lynwood	Lewis	D	59.34	7438	265666	f	t	f	2003	100	regular	va
Thomas B Jr	Dix	R	40.65	5094	148281	f	f	f	2003	100	regular	va
Bob	Bloxom	R	\N	\N	28172	t	\N	f	2003	100	regular	va
Lynwood	Lewis	D	97.92	9794	732160	t	t	f	2005	100	regular	va
Lynwood	Lewis	D	98.98	12328	102018	t	t	f	2007	100	regular	va
Lynwood	Lewis	D	64.02	8476	203923	t	t	f	2009	100	regular	va
Melody H	Scalley	R	34.77	4604	53531	f	f	f	2009	100	regular	va
John W Jr	Smith	I	1.13	149	154	f	f	f	2009	100	regular	va
Lynwood	Lewis	D	98.05	12512	136614	t	t	f	2011	100	regular	va
Lynwood	Lewis	D	70.87	13100	206345	t	t	f	2013	100	regular	va
John W Jr	Smith	I	28.73	5310	159	f	f	f	2013	100	regular	va
Rob	Bloxom	R	60.29	6810	135805	f	t	f	2014	100	special	va
Willie	Randall	D	39.62	4475	195505	f	f	f	2014	100	special	va
Rob	Bloxom	R	57.96	8657	48355	t	t	f	2015	100	regular	va
Willie	Randall	D	42.04	6278	72171	f	f	f	2015	100	regular	va
Morgan	Griffith	R	99.92	15383	19196	t	t	f	1997	8	regular	va
Morgan	Griffith	R	99.83	11066	63465	t	t	f	1999	8	regular	va
Morgan	Griffith	R	70.0	17401	193843	t	t	f	2001	8	regular	va
Dana	Martin	D	30.0	7581	24831	f	f	f	2001	8	regular	va
Morgan	Griffith	R	59.25	10860	393245	t	t	f	2003	8	regular	va
Mark Q Sr	Emick	D	40.75	7469	128834	f	f	f	2003	8	regular	va
Morgan	Griffith	R	98.0	20483	239593	t	t	f	2005	8	regular	va
Morgan	Griffith	R	96.04	13670	396827	t	t	f	2007	8	regular	va
Morgan	Griffith	R	68.82	16790	408740	t	t	f	2009	8	regular	va
Edward Carter III	Turner	D	31.0	7563	80350	f	f	f	2009	8	regular	va
Virginia	Weisz	D	\N	\N	1369	f	\N	t	2009	8	regular	va
C W	Levy	I	3.0	154	1018	f	f	f	2001	38	regular	va
Terry	Austin	R	\N	\N	39854	t	\N	f	2017	19	regular	va
Reagan	Flaherty	D	\N	\N	6325	f	\N	t	2017	19	regular	va
Michael	Webert	R	\N	\N	32969	t	\N	f	2017	18	regular	va
Tristan	Shields	D	\N	\N	19842	f	\N	f	2017	18	regular	va
Will	King	Green	\N	\N	27619	f	\N	f	2017	18	regular	va
Christopher	Head	R	\N	\N	48530	t	\N	f	2017	17	regular	va
Djuna	Osborne	D	\N	\N	25057	f	\N	f	2017	17	regular	va
Les	Adams	R	\N	\N	46993	t	\N	f	2017	16	regular	va
Todd	Gilbert	R	\N	\N	166902	t	\N	f	2017	15	regular	va
Danny	Marshall	R	\N	\N	93377	t	\N	f	2017	14	regular	va
Bob	Marshall	R	\N	\N	57247	t	\N	f	2017	13	regular	va
Danica	Roem	D	\N	\N	65851	f	\N	f	2017	13	regular	va
Joseph	Yost	R	\N	\N	166797	t	\N	f	2017	12	regular	va
Chris	Hurst	D	\N	\N	170992	f	\N	f	2017	12	regular	va
Andrew	Schultz	D	\N	\N	0	f	\N	t	2017	12	regular	va
Sam	Rasoul	D	\N	\N	164700	t	\N	f	2017	11	regular	va
Randy	Minchew	R	\N	\N	44773	t	\N	f	2017	10	regular	va
Wendy	Gooditis	D	\N	\N	49959	f	\N	f	2017	10	regular	va
Charles	Poindexter	R	\N	\N	46868	t	\N	f	2017	9	regular	va
Stephanie	Cook	D	\N	\N	4414	f	\N	f	2017	9	regular	va
Justin	Washer	I	\N	\N	200	f	\N	f	2017	9	regular	va
Greg	Habeeb	R	\N	\N	136033	t	\N	f	2017	8	regular	va
Steve	McBride	D	\N	\N	23242	f	\N	f	2017	8	regular	va
Nick	Rush	R	\N	\N	40213	t	\N	f	2017	7	regular	va
Flo	Ketner	D	\N	\N	2274	f	\N	f	2017	7	regular	va
Jeff	Campbell	R	\N	\N	26642	t	\N	f	2017	6	regular	va
Israel	O'Quinn	R	\N	\N	65300	t	\N	f	2017	5	regular	va
Todd	Pillion	R	\N	\N	33148	t	\N	f	2017	4	regular	va
Will	Morefield	R	\N	\N	116822	t	\N	f	2017	3	regular	va
Bill	Bunch	D	\N	\N	600	f	\N	f	2017	3	regular	va
Laquan	Austion	R	\N	\N	56068	f	\N	f	2017	2	regular	va
Jennifer	Foy	D	\N	\N	37800	f	\N	f	2017	2	regular	va
Mark	Dudenhefer	R	\N	\N	22958	t	\N	t	2017	2	regular	va
\.


--
-- Data for Name: raw_statewide_candidates; Type: TABLE DATA; Schema: public; Owner: techforcampaigns
--

COPY raw_statewide_candidates (district, electionname, vpapelectionid, candidatename, candidateparty, numvotes, percentage, state) FROM stdin;
65	2012 US Senator - Regular General	6575	Tim Kaine	D	15455	36.71	va
23	2016 US President - Regular General	8666	Hillary Clinton	D	12296	31.46	va
23	2016 US President - Regular General	8666	Donald Trump	R	24239	62.01	va
23	2016 US President - Regular General	8666	Gary Johnson	L	1400	3.58	va
23	2016 US President - Regular General	8666	Jill Stein	Green	183	0.47	va
23	2016 US President - Regular General	8666	Evan McMullin	I	966	2.47	va
22	2016 US President - Regular General	8666	Hillary Clinton	D	11347	30.93	va
22	2016 US President - Regular General	8666	Donald Trump	R	23483	64.01	va
22	2016 US President - Regular General	8666	Gary Johnson	L	1020	2.78	va
22	2016 US President - Regular General	8666	Jill Stein	Green	181	0.49	va
22	2016 US President - Regular General	8666	Evan McMullin	I	654	1.78	va
21	2016 US President - Regular General	8666	Hillary Clinton	D	15534	48.57	va
21	2016 US President - Regular General	8666	Donald Trump	R	14401	45.03	va
21	2016 US President - Regular General	8666	Gary Johnson	L	1387	4.34	va
21	2016 US President - Regular General	8666	Jill Stein	Green	269	0.84	va
21	2016 US President - Regular General	8666	Evan McMullin	I	393	1.23	va
20	2016 US President - Regular General	8666	Hillary Clinton	D	12744	35.94	va
20	2016 US President - Regular General	8666	Donald Trump	R	20719	58.44	va
20	2016 US President - Regular General	8666	Gary Johnson	L	1180	3.33	va
20	2016 US President - Regular General	8666	Jill Stein	Green	291	0.82	va
20	2016 US President - Regular General	8666	Evan McMullin	I	520	1.47	va
19	2016 US President - Regular General	8666	Hillary Clinton	D	9169	24.85	va
19	2016 US President - Regular General	8666	Donald Trump	R	26234	71.1	va
19	2016 US President - Regular General	8666	Gary Johnson	L	920	2.49	va
19	2016 US President - Regular General	8666	Jill Stein	Green	181	0.49	va
19	2016 US President - Regular General	8666	Evan McMullin	I	389	1.05	va
18	2016 US President - Regular General	8666	Hillary Clinton	D	12695	33.58	va
18	2016 US President - Regular General	8666	Donald Trump	R	23100	61.1	va
18	2016 US President - Regular General	8666	Gary Johnson	L	1171	3.1	va
18	2016 US President - Regular General	8666	Jill Stein	Green	307	0.81	va
18	2016 US President - Regular General	8666	Evan McMullin	I	534	1.41	va
17	2016 US President - Regular General	8666	Hillary Clinton	D	12819	34.11	va
17	2016 US President - Regular General	8666	Donald Trump	R	22857	60.81	va
17	2016 US President - Regular General	8666	Gary Johnson	L	1193	3.17	va
17	2016 US President - Regular General	8666	Jill Stein	Green	243	0.65	va
17	2016 US President - Regular General	8666	Evan McMullin	I	472	1.26	va
16	2016 US President - Regular General	8666	Hillary Clinton	D	12020	36.09	va
16	2016 US President - Regular General	8666	Donald Trump	R	20385	61.21	va
16	2016 US President - Regular General	8666	Gary Johnson	L	542	1.63	va
16	2016 US President - Regular General	8666	Jill Stein	Green	121	0.36	va
16	2016 US President - Regular General	8666	Evan McMullin	I	232	0.7	va
15	2016 US President - Regular General	8666	Hillary Clinton	D	8318	23.75	va
15	2016 US President - Regular General	8666	Donald Trump	R	25184	71.91	va
15	2016 US President - Regular General	8666	Gary Johnson	L	873	2.49	va
15	2016 US President - Regular General	8666	Jill Stein	Green	213	0.61	va
15	2016 US President - Regular General	8666	Evan McMullin	I	432	1.23	va
14	2016 US President - Regular General	8666	Hillary Clinton	D	14741	44.24	va
14	2016 US President - Regular General	8666	Donald Trump	R	17752	53.28	va
14	2016 US President - Regular General	8666	Gary Johnson	L	492	1.48	va
14	2016 US President - Regular General	8666	Jill Stein	Green	142	0.43	va
14	2016 US President - Regular General	8666	Evan McMullin	I	191	0.57	va
13	2016 US President - Regular General	8666	Hillary Clinton	D	15206	54.45	va
13	2016 US President - Regular General	8666	Donald Trump	R	11193	40.08	va
13	2016 US President - Regular General	8666	Gary Johnson	L	865	3.1	va
13	2016 US President - Regular General	8666	Jill Stein	Green	227	0.81	va
13	2016 US President - Regular General	8666	Evan McMullin	I	434	1.55	va
12	2016 US President - Regular General	8666	Hillary Clinton	D	14530	47.03	va
12	2016 US President - Regular General	8666	Donald Trump	R	14002	45.32	va
12	2016 US President - Regular General	8666	Gary Johnson	L	1478	4.78	va
12	2016 US President - Regular General	8666	Jill Stein	Green	322	1.04	va
12	2016 US President - Regular General	8666	Evan McMullin	I	561	1.82	va
11	2016 US President - Regular General	8666	Hillary Clinton	D	16673	59.64	va
3	2013 Governor - Regular General	6292	Robert Sarvis	L	554	3.13	va
11	2016 US President - Regular General	8666	Donald Trump	R	9709	34.73	va
11	2016 US President - Regular General	8666	Gary Johnson	L	954	3.41	va
11	2016 US President - Regular General	8666	Jill Stein	Green	320	1.14	va
11	2016 US President - Regular General	8666	Evan McMullin	I	299	1.07	va
10	2016 US President - Regular General	8666	Hillary Clinton	D	18626	49.0	va
10	2016 US President - Regular General	8666	Donald Trump	R	17167	45.17	va
10	2016 US President - Regular General	8666	Gary Johnson	L	1258	3.31	va
10	2016 US President - Regular General	8666	Jill Stein	Green	289	0.76	va
10	2016 US President - Regular General	8666	Evan McMullin	I	668	1.76	va
9	2016 US President - Regular General	8666	Hillary Clinton	D	8682	25.72	va
9	2016 US President - Regular General	8666	Donald Trump	R	23983	71.05	va
9	2016 US President - Regular General	8666	Gary Johnson	L	639	1.89	va
9	2016 US President - Regular General	8666	Jill Stein	Green	145	0.43	va
9	2016 US President - Regular General	8666	Evan McMullin	I	304	0.9	va
8	2016 US President - Regular General	8666	Hillary Clinton	D	12413	32.18	va
8	2016 US President - Regular General	8666	Donald Trump	R	24060	62.38	va
8	2016 US President - Regular General	8666	Gary Johnson	L	1323	3.43	va
8	2016 US President - Regular General	8666	Jill Stein	Green	248	0.64	va
8	2016 US President - Regular General	8666	Evan McMullin	I	527	1.37	va
100	2016 US President - Regular General	8666	Hillary Clinton	D	15039	48.57	va
100	2016 US President - Regular General	8666	Donald Trump	R	14608	47.18	va
100	2016 US President - Regular General	8666	Gary Johnson	L	809	2.61	va
100	2016 US President - Regular General	8666	Jill Stein	Green	234	0.76	va
100	2016 US President - Regular General	8666	Evan McMullin	I	270	0.87	va
23	2012 US Senator - Regular General	6575	Tim Kaine	D	12811	37.95	va
23	2012 US Senator - Regular General	6575	George Allen	R	20880	61.84	va
22	2012 US Senator - Regular General	6575	Tim Kaine	D	13308	35.2	va
22	2012 US Senator - Regular General	6575	George Allen	R	24453	64.67	va
21	2012 US Senator - Regular General	6575	Tim Kaine	D	16823	53.31	va
21	2012 US Senator - Regular General	6575	George Allen	R	14693	46.56	va
20	2012 US Senator - Regular General	6575	Tim Kaine	D	15183	41.95	va
20	2012 US Senator - Regular General	6575	George Allen	R	20972	57.94	va
19	2012 US Senator - Regular General	6575	Tim Kaine	D	13738	37.35	va
19	2012 US Senator - Regular General	6575	George Allen	R	22996	62.52	va
18	2012 US Senator - Regular General	6575	Tim Kaine	D	15546	41.66	va
18	2012 US Senator - Regular General	6575	George Allen	R	21680	58.1	va
17	2012 US Senator - Regular General	6575	Tim Kaine	D	15895	41.49	va
17	2012 US Senator - Regular General	6575	George Allen	R	22358	58.35	va
16	2012 US Senator - Regular General	6575	Tim Kaine	D	14712	43.41	va
16	2012 US Senator - Regular General	6575	George Allen	R	19153	56.51	va
15	2012 US Senator - Regular General	6575	Tim Kaine	D	12463	35.12	va
15	2012 US Senator - Regular General	6575	George Allen	R	22949	64.67	va
14	2012 US Senator - Regular General	6575	Tim Kaine	D	17874	49.56	va
14	2012 US Senator - Regular General	6575	George Allen	R	18167	50.37	va
13	2012 US Senator - Regular General	6575	Tim Kaine	D	16194	55.35	va
13	2012 US Senator - Regular General	6575	George Allen	R	12990	44.4	va
12	2012 US Senator - Regular General	6575	Tim Kaine	D	17050	53.94	va
12	2012 US Senator - Regular General	6575	George Allen	R	14487	45.83	va
11	2012 US Senator - Regular General	6575	Tim Kaine	D	19366	66.28	va
11	2012 US Senator - Regular General	6575	George Allen	R	9809	33.57	va
10	2012 US Senator - Regular General	6575	Tim Kaine	D	15197	49.74	va
10	2012 US Senator - Regular General	6575	George Allen	R	15298	50.07	va
9	2012 US Senator - Regular General	6575	Tim Kaine	D	12670	37.15	va
9	2012 US Senator - Regular General	6575	George Allen	R	21393	62.73	va
8	2012 US Senator - Regular General	6575	Tim Kaine	D	15790	40.16	va
8	2012 US Senator - Regular General	6575	George Allen	R	23484	59.72	va
100	2012 US Senator - Regular General	6575	Tim Kaine	D	17386	54.67	va
100	2012 US Senator - Regular General	6575	George Allen	R	14378	45.21	va
100	2012 US President - Regular General	6598	Barack Obama	D	17548	53.74	va
100	2012 US President - Regular General	6598	Mitt Romney	R	14665	44.91	va
100	2012 US President - Regular General	6598	Gary Johnson	L	212	0.65	va
100	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	78	0.24	va
100	2012 US President - Regular General	6598	Jill Stein	Green	89	0.27	va
100	2013 Attorney General - Regular General	6525	Mark Obenshain	R	9761	51.09	va
100	2013 Attorney General - Regular General	6525	Mark Herring	D	9343	48.9	va
100	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7155	37.12	va
100	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12087	62.71	va
100	2013 Governor - Regular General	6292	Ken Cuccinelli	R	8840	45.56	va
100	2013 Governor - Regular General	6292	Terry McAuliffe	D	9293	47.89	va
100	2013 Governor - Regular General	6292	Robert Sarvis	L	1226	6.32	va
100	2014 US Senator - Regular General	7053	Mark Warner	D	9443	48.78	va
100	2014 US Senator - Regular General	7053	Robert Sarvis	L	581	3.0	va
100	2014 US Senator - Regular General	7053	Ed Gillespie	R	9323	48.16	va
8	2012 US President - Regular General	6598	Barack Obama	D	14669	36.94	va
8	2012 US President - Regular General	6598	Mitt Romney	R	24251	61.07	va
8	2012 US President - Regular General	6598	Gary Johnson	L	354	0.89	va
8	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	301	0.76	va
8	2012 US President - Regular General	6598	Jill Stein	Green	57	0.14	va
8	2013 Attorney General - Regular General	6525	Mark Obenshain	R	16260	66.07	va
8	2013 Attorney General - Regular General	6525	Mark Herring	D	8351	33.93	va
8	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13729	56.08	va
8	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10677	43.61	va
8	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14203	57.03	va
8	2013 Governor - Regular General	6292	Terry McAuliffe	D	8051	32.33	va
8	2013 Governor - Regular General	6292	Robert Sarvis	L	2387	9.58	va
8	2014 US Senator - Regular General	7053	Mark Warner	D	9536	39.01	va
8	2014 US Senator - Regular General	7053	Robert Sarvis	L	710	2.9	va
8	2014 US Senator - Regular General	7053	Ed Gillespie	R	14178	58.01	va
9	2012 US President - Regular General	6598	Barack Obama	D	11808	34.14	va
9	2012 US President - Regular General	6598	Mitt Romney	R	21666	62.64	va
9	2012 US President - Regular General	6598	Gary Johnson	L	178	0.51	va
9	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	846	2.45	va
9	2012 US President - Regular General	6598	Jill Stein	Green	45	0.13	va
9	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14351	69.09	va
9	2013 Attorney General - Regular General	6525	Mark Herring	D	6418	30.9	va
9	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12493	60.57	va
9	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8091	39.23	va
9	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13476	63.2	va
9	2013 Governor - Regular General	6292	Terry McAuliffe	D	6145	28.82	va
9	2013 Governor - Regular General	6292	Robert Sarvis	L	1603	7.52	va
9	2014 US Senator - Regular General	7053	Mark Warner	D	7350	35.86	va
9	2014 US Senator - Regular General	7053	Robert Sarvis	L	501	2.44	va
9	2014 US Senator - Regular General	7053	Ed Gillespie	R	12636	61.65	va
10	2012 US President - Regular General	6598	Barack Obama	D	14862	47.94	va
10	2012 US President - Regular General	6598	Mitt Romney	R	15585	50.27	va
10	2012 US President - Regular General	6598	Gary Johnson	L	303	0.98	va
10	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	88	0.28	va
10	2012 US President - Regular General	6598	Jill Stein	Green	83	0.27	va
10	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10686	50.22	va
10	2013 Attorney General - Regular General	6525	Mark Herring	D	10593	49.78	va
10	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10325	48.76	va
10	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10798	50.99	va
10	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10469	48.83	va
10	2013 Governor - Regular General	6292	Terry McAuliffe	D	9772	45.58	va
10	2013 Governor - Regular General	6292	Robert Sarvis	L	1154	5.38	va
10	2014 US Senator - Regular General	7053	Mark Warner	D	10253	45.0	va
10	2014 US Senator - Regular General	7053	Robert Sarvis	L	546	2.4	va
10	2014 US Senator - Regular General	7053	Ed Gillespie	R	11963	52.51	va
11	2012 US President - Regular General	6598	Barack Obama	D	18901	63.64	va
11	2012 US President - Regular General	6598	Mitt Romney	R	10021	33.74	va
11	2012 US President - Regular General	6598	Gary Johnson	L	326	1.1	va
11	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	261	0.88	va
11	2012 US President - Regular General	6598	Jill Stein	Green	129	0.43	va
11	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6513	40.46	va
11	2013 Attorney General - Regular General	6525	Mark Herring	D	9586	59.54	va
11	2013 Lt. Governor - Regular General	6523	E W Jackson	R	5358	33.52	va
11	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10565	66.1	va
11	2013 Governor - Regular General	6292	Ken Cuccinelli	R	5310	32.3	va
11	2013 Governor - Regular General	6292	Terry McAuliffe	D	9425	57.33	va
11	2013 Governor - Regular General	6292	Robert Sarvis	L	1564	9.51	va
11	2014 US Senator - Regular General	7053	Mark Warner	D	9870	63.01	va
11	2014 US Senator - Regular General	7053	Robert Sarvis	L	562	3.59	va
11	2014 US Senator - Regular General	7053	Ed Gillespie	R	5222	33.34	va
12	2012 US President - Regular General	6598	Barack Obama	D	16086	50.42	va
12	2012 US President - Regular General	6598	Mitt Romney	R	14868	46.61	va
12	2012 US President - Regular General	6598	Gary Johnson	L	568	1.78	va
12	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	197	0.62	va
12	2012 US President - Regular General	6598	Jill Stein	Green	111	0.35	va
12	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8972	50.46	va
12	2013 Attorney General - Regular General	6525	Mark Herring	D	8810	49.54	va
12	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7329	41.55	va
12	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10264	58.2	va
12	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7581	41.95	va
12	2013 Governor - Regular General	6292	Terry McAuliffe	D	8585	47.51	va
12	2013 Governor - Regular General	6292	Robert Sarvis	L	1802	9.97	va
12	2014 US Senator - Regular General	7053	Mark Warner	D	8851	52.24	va
12	2014 US Senator - Regular General	7053	Robert Sarvis	L	651	3.84	va
12	2014 US Senator - Regular General	7053	Ed Gillespie	R	7421	43.8	va
13	2012 US President - Regular General	6598	Barack Obama	D	16296	55.0	va
13	2012 US President - Regular General	6598	Mitt Romney	R	12892	43.51	va
13	2012 US President - Regular General	6598	Gary Johnson	L	250	0.84	va
13	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	61	0.21	va
13	2012 US President - Regular General	6598	Jill Stein	Green	63	0.21	va
13	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8078	49.46	va
13	2013 Attorney General - Regular General	6525	Mark Herring	D	8256	50.54	va
13	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7628	46.72	va
13	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8649	52.97	va
13	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7798	47.2	va
13	2013 Governor - Regular General	6292	Terry McAuliffe	D	7931	48.0	va
13	2013 Governor - Regular General	6292	Robert Sarvis	L	751	4.55	va
13	2014 US Senator - Regular General	7053	Mark Warner	D	7632	46.66	va
13	2014 US Senator - Regular General	7053	Robert Sarvis	L	368	2.25	va
13	2014 US Senator - Regular General	7053	Ed Gillespie	R	8350	51.05	va
14	2012 US President - Regular General	6598	Barack Obama	D	18211	49.52	va
14	2012 US President - Regular General	6598	Mitt Romney	R	18041	49.06	va
14	2012 US President - Regular General	6598	Gary Johnson	L	133	0.36	va
14	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	297	0.81	va
14	2012 US President - Regular General	6598	Jill Stein	Green	46	0.13	va
14	2013 Attorney General - Regular General	6525	Mark Obenshain	R	11851	58.92	va
14	2013 Attorney General - Regular General	6525	Mark Herring	D	8261	41.07	va
14	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10514	52.88	va
14	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9341	46.98	va
14	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11166	53.79	va
14	2013 Governor - Regular General	6292	Terry McAuliffe	D	8364	40.29	va
14	2013 Governor - Regular General	6292	Robert Sarvis	L	1176	5.67	va
14	2014 US Senator - Regular General	7053	Mark Warner	D	9862	47.62	va
14	2014 US Senator - Regular General	7053	Robert Sarvis	L	258	1.25	va
14	2014 US Senator - Regular General	7053	Ed Gillespie	R	10577	51.07	va
15	2012 US President - Regular General	6598	Barack Obama	D	12187	33.94	va
15	2012 US President - Regular General	6598	Mitt Romney	R	23061	64.22	va
15	2012 US President - Regular General	6598	Gary Johnson	L	307	0.85	va
15	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	140	0.39	va
15	2012 US President - Regular General	6598	Jill Stein	Green	107	0.3	va
15	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14805	69.07	va
15	2013 Attorney General - Regular General	6525	Mark Herring	D	6630	30.93	va
15	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13477	63.52	va
15	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	7693	36.26	va
15	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13732	63.44	va
15	2013 Governor - Regular General	6292	Terry McAuliffe	D	6688	30.9	va
15	2013 Governor - Regular General	6292	Robert Sarvis	L	1151	5.32	va
15	2014 US Senator - Regular General	7053	Mark Warner	D	5890	28.87	va
15	2014 US Senator - Regular General	7053	Robert Sarvis	L	427	2.09	va
15	2014 US Senator - Regular General	7053	Ed Gillespie	R	14067	68.95	va
16	2012 US President - Regular General	6598	Barack Obama	D	14635	42.54	va
16	2012 US President - Regular General	6598	Mitt Romney	R	18971	55.14	va
16	2012 US President - Regular General	6598	Gary Johnson	L	162	0.47	va
16	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	564	1.64	va
16	2012 US President - Regular General	6598	Jill Stein	Green	39	0.11	va
16	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12802	63.01	va
16	2013 Attorney General - Regular General	6525	Mark Herring	D	7515	36.99	va
16	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11067	54.82	va
16	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9072	44.94	va
16	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11951	57.83	va
16	2013 Governor - Regular General	6292	Terry McAuliffe	D	7277	35.21	va
16	2013 Governor - Regular General	6292	Robert Sarvis	L	1359	6.58	va
16	2014 US Senator - Regular General	7053	Mark Warner	D	8853	43.1	va
16	2014 US Senator - Regular General	7053	Robert Sarvis	L	337	1.64	va
16	2014 US Senator - Regular General	7053	Ed Gillespie	R	11337	55.19	va
17	2012 US President - Regular General	6598	Barack Obama	D	15030	38.68	va
17	2012 US President - Regular General	6598	Mitt Romney	R	23066	59.36	va
17	2012 US President - Regular General	6598	Gary Johnson	L	301	0.77	va
17	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	305	0.78	va
17	2012 US President - Regular General	6598	Jill Stein	Green	97	0.25	va
17	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15492	65.48	va
17	2013 Attorney General - Regular General	6525	Mark Herring	D	8166	34.52	va
17	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13107	55.65	va
17	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10377	44.06	va
17	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13582	56.91	va
17	2013 Governor - Regular General	6292	Terry McAuliffe	D	7885	33.04	va
17	2013 Governor - Regular General	6292	Robert Sarvis	L	2140	8.97	va
17	2014 US Senator - Regular General	7053	Mark Warner	D	9160	39.34	va
17	2014 US Senator - Regular General	7053	Robert Sarvis	L	663	2.85	va
17	2014 US Senator - Regular General	7053	Ed Gillespie	R	13439	57.71	va
18	2012 US President - Regular General	6598	Barack Obama	D	15136	40.17	va
18	2012 US President - Regular General	6598	Mitt Romney	R	21858	58.01	va
18	2012 US President - Regular General	6598	Gary Johnson	L	391	1.04	va
18	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	122	0.32	va
18	2012 US President - Regular General	6598	Jill Stein	Green	95	0.25	va
18	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14416	61.17	va
18	2013 Attorney General - Regular General	6525	Mark Herring	D	9152	38.83	va
18	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13684	58.25	va
18	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9744	41.48	va
18	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13919	58.61	va
18	2013 Governor - Regular General	6292	Terry McAuliffe	D	8579	36.12	va
18	2013 Governor - Regular General	6292	Robert Sarvis	L	1170	4.93	va
18	2014 US Senator - Regular General	7053	Mark Warner	D	7919	34.76	va
18	2014 US Senator - Regular General	7053	Robert Sarvis	L	509	2.23	va
18	2014 US Senator - Regular General	7053	Ed Gillespie	R	14325	62.88	va
19	2012 US President - Regular General	6598	Barack Obama	D	13131	35.58	va
19	2012 US President - Regular General	6598	Mitt Romney	R	23066	62.5	va
19	2012 US President - Regular General	6598	Gary Johnson	L	250	0.68	va
19	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	345	0.93	va
19	2012 US President - Regular General	6598	Jill Stein	Green	66	0.18	va
19	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15827	70.65	va
19	2013 Attorney General - Regular General	6525	Mark Herring	D	6575	29.35	va
19	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13312	59.66	va
19	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8950	40.11	va
19	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13946	61.46	va
19	2013 Governor - Regular General	6292	Terry McAuliffe	D	6548	28.86	va
19	2013 Governor - Regular General	6292	Robert Sarvis	L	2037	8.98	va
19	2014 US Senator - Regular General	7053	Mark Warner	D	8103	36.47	va
19	2014 US Senator - Regular General	7053	Robert Sarvis	L	596	2.68	va
19	2014 US Senator - Regular General	7053	Ed Gillespie	R	13505	60.79	va
20	2012 US President - Regular General	6598	Barack Obama	D	15111	41.37	va
20	2012 US President - Regular General	6598	Mitt Romney	R	20740	56.78	va
20	2012 US President - Regular General	6598	Gary Johnson	L	357	0.98	va
20	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	163	0.45	va
20	2012 US President - Regular General	6598	Jill Stein	Green	88	0.24	va
20	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13361	61.04	va
20	2013 Attorney General - Regular General	6525	Mark Herring	D	8528	38.96	va
20	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12240	56.6	va
20	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9330	43.15	va
20	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12033	54.14	va
20	2013 Governor - Regular General	6292	Terry McAuliffe	D	8320	37.43	va
20	2013 Governor - Regular General	6292	Robert Sarvis	L	1748	7.86	va
20	2014 US Senator - Regular General	7053	Mark Warner	D	8320	38.87	va
20	2014 US Senator - Regular General	7053	Robert Sarvis	L	749	3.5	va
20	2014 US Senator - Regular General	7053	Ed Gillespie	R	12315	57.53	va
21	2012 US President - Regular General	6598	Barack Obama	D	16631	51.59	va
21	2012 US President - Regular General	6598	Mitt Romney	R	15090	46.81	va
21	2012 US President - Regular General	6598	Gary Johnson	L	294	0.91	va
21	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	69	0.21	va
21	2012 US President - Regular General	6598	Jill Stein	Green	50	0.16	va
21	2013 Attorney General - Regular General	6525	Mark Obenshain	R	9438	50.35	va
21	2013 Attorney General - Regular General	6525	Mark Herring	D	9306	49.65	va
21	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8274	44.57	va
21	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10238	55.15	va
21	2013 Governor - Regular General	6292	Ken Cuccinelli	R	8576	45.04	va
21	2013 Governor - Regular General	6292	Terry McAuliffe	D	9343	49.07	va
21	2013 Governor - Regular General	6292	Robert Sarvis	L	1066	5.6	va
21	2014 US Senator - Regular General	7053	Mark Warner	D	9276	50.33	va
21	2014 US Senator - Regular General	7053	Robert Sarvis	L	469	2.54	va
21	2014 US Senator - Regular General	7053	Ed Gillespie	R	8675	47.07	va
22	2012 US President - Regular General	6598	Barack Obama	D	13040	34.02	va
22	2012 US President - Regular General	6598	Mitt Romney	R	24614	64.21	va
22	2012 US President - Regular General	6598	Gary Johnson	L	301	0.79	va
22	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	248	0.65	va
22	2012 US President - Regular General	6598	Jill Stein	Green	49	0.13	va
22	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14958	68.09	va
22	2013 Attorney General - Regular General	6525	Mark Herring	D	7011	31.91	va
22	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13431	61.4	va
22	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8401	38.4	va
22	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14087	63.24	va
22	2013 Governor - Regular General	6292	Terry McAuliffe	D	6728	30.2	va
22	2013 Governor - Regular General	6292	Robert Sarvis	L	1380	6.2	va
22	2014 US Senator - Regular General	7053	Mark Warner	D	7201	33.53	va
22	2014 US Senator - Regular General	7053	Robert Sarvis	L	466	2.17	va
22	2014 US Senator - Regular General	7053	Ed Gillespie	R	13787	64.2	va
23	2012 US President - Regular General	6598	Barack Obama	D	12402	36.33	va
23	2012 US President - Regular General	6598	Mitt Romney	R	21141	61.94	va
23	2012 US President - Regular General	6598	Gary Johnson	L	328	0.96	va
23	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	137	0.4	va
23	2012 US President - Regular General	6598	Jill Stein	Green	44	0.13	va
23	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15811	67.71	va
23	2013 Attorney General - Regular General	6525	Mark Herring	D	7540	32.29	va
23	2013 Lt. Governor - Regular General	6523	E W Jackson	R	14077	60.61	va
23	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9094	39.15	va
23	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14786	62.54	va
23	2013 Governor - Regular General	6292	Terry McAuliffe	D	7191	30.41	va
23	2013 Governor - Regular General	6292	Robert Sarvis	L	1541	6.52	va
23	2014 US Senator - Regular General	7053	Mark Warner	D	7997	34.18	va
23	2014 US Senator - Regular General	7053	Robert Sarvis	L	538	2.3	va
23	2014 US Senator - Regular General	7053	Ed Gillespie	R	14844	63.44	va
99	2016 US President - Regular General	8666	Hillary Clinton	D	13936	38.41	va
99	2016 US President - Regular General	8666	Donald Trump	R	21028	57.96	va
99	2016 US President - Regular General	8666	Gary Johnson	L	789	2.17	va
99	2016 US President - Regular General	8666	Jill Stein	Green	186	0.51	va
99	2016 US President - Regular General	8666	Evan McMullin	I	342	0.94	va
98	2016 US President - Regular General	8666	Hillary Clinton	D	11976	31.79	va
98	2016 US President - Regular General	8666	Donald Trump	R	24007	63.73	va
98	2016 US President - Regular General	8666	Gary Johnson	L	1138	3.02	va
98	2016 US President - Regular General	8666	Jill Stein	Green	224	0.59	va
98	2016 US President - Regular General	8666	Evan McMullin	I	322	0.85	va
97	2016 US President - Regular General	8666	Hillary Clinton	D	12511	27.27	va
97	2016 US President - Regular General	8666	Donald Trump	R	31272	68.17	va
97	2016 US President - Regular General	8666	Gary Johnson	L	1416	3.09	va
97	2016 US President - Regular General	8666	Jill Stein	Green	226	0.49	va
97	2016 US President - Regular General	8666	Evan McMullin	I	446	0.97	va
96	2016 US President - Regular General	8666	Hillary Clinton	D	17170	40.46	va
96	2016 US President - Regular General	8666	Donald Trump	R	22854	53.85	va
96	2016 US President - Regular General	8666	Gary Johnson	L	1434	3.38	va
96	2016 US President - Regular General	8666	Jill Stein	Green	295	0.7	va
96	2016 US President - Regular General	8666	Evan McMullin	I	682	1.61	va
95	2016 US President - Regular General	8666	Hillary Clinton	D	21016	72.89	va
95	2016 US President - Regular General	8666	Donald Trump	R	6637	23.02	va
95	2016 US President - Regular General	8666	Gary Johnson	L	673	2.33	va
95	2016 US President - Regular General	8666	Jill Stein	Green	236	0.82	va
95	2016 US President - Regular General	8666	Evan McMullin	I	269	0.93	va
94	2016 US President - Regular General	8666	Hillary Clinton	D	16478	49.21	va
94	2016 US President - Regular General	8666	Donald Trump	R	14830	44.29	va
94	2016 US President - Regular General	8666	Gary Johnson	L	1435	4.29	va
94	2016 US President - Regular General	8666	Jill Stein	Green	254	0.76	va
94	2016 US President - Regular General	8666	Evan McMullin	I	487	1.45	va
93	2016 US President - Regular General	8666	Hillary Clinton	D	19147	56.65	va
93	2016 US President - Regular General	8666	Donald Trump	R	12743	37.7	va
93	2016 US President - Regular General	8666	Gary Johnson	L	1126	3.33	va
93	2016 US President - Regular General	8666	Jill Stein	Green	292	0.86	va
93	2016 US President - Regular General	8666	Evan McMullin	I	489	1.45	va
92	2016 US President - Regular General	8666	Hillary Clinton	D	23139	74.96	va
92	2016 US President - Regular General	8666	Donald Trump	R	6502	21.06	va
92	2016 US President - Regular General	8666	Gary Johnson	L	715	2.32	va
92	2016 US President - Regular General	8666	Jill Stein	Green	255	0.83	va
92	2016 US President - Regular General	8666	Evan McMullin	I	258	0.84	va
91	2016 US President - Regular General	8666	Hillary Clinton	D	13578	40.63	va
91	2016 US President - Regular General	8666	Donald Trump	R	17934	53.66	va
91	2016 US President - Regular General	8666	Gary Johnson	L	1239	3.71	va
91	2016 US President - Regular General	8666	Jill Stein	Green	249	0.75	va
91	2016 US President - Regular General	8666	Evan McMullin	I	418	1.25	va
90	2016 US President - Regular General	8666	Hillary Clinton	D	20519	74.92	va
90	2016 US President - Regular General	8666	Donald Trump	R	5794	21.16	va
90	2016 US President - Regular General	8666	Gary Johnson	L	662	2.42	va
90	2016 US President - Regular General	8666	Jill Stein	Green	215	0.79	va
90	2016 US President - Regular General	8666	Evan McMullin	I	196	0.72	va
89	2016 US President - Regular General	8666	Hillary Clinton	D	21792	78.43	va
89	2016 US President - Regular General	8666	Donald Trump	R	4697	16.9	va
89	2016 US President - Regular General	8666	Gary Johnson	L	783	2.82	va
89	2016 US President - Regular General	8666	Jill Stein	Green	263	0.95	va
89	2016 US President - Regular General	8666	Evan McMullin	I	247	0.89	va
88	2016 US President - Regular General	8666	Hillary Clinton	D	14710	39.31	va
88	2016 US President - Regular General	8666	Donald Trump	R	20597	55.04	va
88	2016 US President - Regular General	8666	Gary Johnson	L	1193	3.19	va
88	2016 US President - Regular General	8666	Jill Stein	Green	311	0.83	va
88	2016 US President - Regular General	8666	Evan McMullin	I	608	1.62	va
87	2016 US President - Regular General	8666	Hillary Clinton	D	22634	59.64	va
87	2016 US President - Regular General	8666	Donald Trump	R	13272	34.97	va
87	2016 US President - Regular General	8666	Gary Johnson	L	1090	2.87	va
87	2016 US President - Regular General	8666	Jill Stein	Green	305	0.8	va
87	2016 US President - Regular General	8666	Evan McMullin	I	650	1.71	va
86	2016 US President - Regular General	8666	Hillary Clinton	D	19292	63.1	va
86	2016 US President - Regular General	8666	Donald Trump	R	9467	30.96	va
86	2016 US President - Regular General	8666	Gary Johnson	L	946	3.09	va
86	2016 US President - Regular General	8666	Jill Stein	Green	271	0.89	va
86	2016 US President - Regular General	8666	Evan McMullin	I	600	1.96	va
85	2016 US President - Regular General	8666	Hillary Clinton	D	14860	46.02	va
85	2016 US President - Regular General	8666	Donald Trump	R	15277	47.31	va
85	2016 US President - Regular General	8666	Gary Johnson	L	1438	4.45	va
85	2016 US President - Regular General	8666	Jill Stein	Green	325	1.01	va
85	2016 US President - Regular General	8666	Evan McMullin	I	393	1.22	va
84	2016 US President - Regular General	8666	Hillary Clinton	D	13355	44.22	va
84	2016 US President - Regular General	8666	Donald Trump	R	14921	49.4	va
84	2016 US President - Regular General	8666	Gary Johnson	L	1256	4.16	va
84	2016 US President - Regular General	8666	Jill Stein	Green	311	1.03	va
84	2016 US President - Regular General	8666	Evan McMullin	I	359	1.19	va
83	2016 US President - Regular General	8666	Hillary Clinton	D	13449	43.11	va
83	2016 US President - Regular General	8666	Donald Trump	R	15839	50.77	va
83	2016 US President - Regular General	8666	Gary Johnson	L	1314	4.21	va
83	2016 US President - Regular General	8666	Jill Stein	Green	263	0.84	va
83	2016 US President - Regular General	8666	Evan McMullin	I	331	1.06	va
99	2012 US Senator - Regular General	6575	Tim Kaine	D	18225	45.57	va
99	2012 US Senator - Regular General	6575	George Allen	R	21675	54.19	va
98	2012 US Senator - Regular General	6575	Tim Kaine	D	17206	41.08	va
98	2012 US Senator - Regular General	6575	George Allen	R	24613	58.77	va
97	2012 US Senator - Regular General	6575	Tim Kaine	D	14169	32.5	va
97	2012 US Senator - Regular General	6575	George Allen	R	29356	67.33	va
96	2012 US Senator - Regular General	6575	Tim Kaine	D	17861	43.76	va
96	2012 US Senator - Regular General	6575	George Allen	R	22890	56.08	va
95	2012 US Senator - Regular General	6575	Tim Kaine	D	23148	77.25	va
95	2012 US Senator - Regular General	6575	George Allen	R	6760	22.56	va
94	2012 US Senator - Regular General	6575	Tim Kaine	D	19150	53.92	va
94	2012 US Senator - Regular General	6575	George Allen	R	16300	45.89	va
93	2012 US Senator - Regular General	6575	Tim Kaine	D	21096	58.39	va
93	2012 US Senator - Regular General	6575	George Allen	R	14969	41.43	va
92	2012 US Senator - Regular General	6575	Tim Kaine	D	26612	79.05	va
92	2012 US Senator - Regular General	6575	George Allen	R	6983	20.74	va
91	2012 US Senator - Regular General	6575	Tim Kaine	D	15067	44.95	va
91	2012 US Senator - Regular General	6575	George Allen	R	18369	54.8	va
90	2012 US Senator - Regular General	6575	Tim Kaine	D	20206	79.3	va
90	2012 US Senator - Regular General	6575	George Allen	R	5245	20.59	va
89	2012 US Senator - Regular General	6575	Tim Kaine	D	20909	81.7	va
89	2012 US Senator - Regular General	6575	George Allen	R	4647	18.16	va
88	2012 US Senator - Regular General	6575	Tim Kaine	D	14982	44.33	va
88	2012 US Senator - Regular General	6575	George Allen	R	18735	55.43	va
87	2012 US Senator - Regular General	6575	Tim Kaine	D	13277	56.7	va
87	2012 US Senator - Regular General	6575	George Allen	R	10095	43.11	va
86	2012 US Senator - Regular General	6575	Tim Kaine	D	19327	60.91	va
86	2012 US Senator - Regular General	6575	George Allen	R	12336	38.88	va
85	2012 US Senator - Regular General	6575	Tim Kaine	D	16384	50.94	va
85	2012 US Senator - Regular General	6575	George Allen	R	15737	48.93	va
84	2012 US Senator - Regular General	6575	Tim Kaine	D	15165	50.44	va
84	2012 US Senator - Regular General	6575	George Allen	R	14855	49.41	va
83	2012 US Senator - Regular General	6575	Tim Kaine	D	14157	48.07	va
83	2012 US Senator - Regular General	6575	George Allen	R	15268	51.85	va
83	2012 US President - Regular General	6598	Barack Obama	D	13637	45.31	va
83	2012 US President - Regular General	6598	Mitt Romney	R	15954	53.01	va
83	2012 US President - Regular General	6598	Gary Johnson	L	293	0.97	va
83	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	64	0.21	va
83	2012 US President - Regular General	6598	Jill Stein	Green	65	0.22	va
83	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10663	55.09	va
83	2013 Attorney General - Regular General	6525	Mark Herring	D	8694	44.91	va
83	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8279	43.07	va
83	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10891	56.66	va
83	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9555	48.46	va
83	2013 Governor - Regular General	6292	Terry McAuliffe	D	8607	43.65	va
83	2013 Governor - Regular General	6292	Robert Sarvis	L	1471	7.46	va
83	2014 US Senator - Regular General	7053	Mark Warner	D	8578	44.45	va
83	2014 US Senator - Regular General	7053	Robert Sarvis	L	563	2.92	va
83	2014 US Senator - Regular General	7053	Ed Gillespie	R	10145	52.58	va
84	2012 US President - Regular General	6598	Barack Obama	D	15031	48.79	va
84	2012 US President - Regular General	6598	Mitt Romney	R	15292	49.64	va
84	2012 US President - Regular General	6598	Gary Johnson	L	291	0.94	va
84	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	52	0.17	va
84	2012 US President - Regular General	6598	Jill Stein	Green	58	0.19	va
84	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8928	53.31	va
84	2013 Attorney General - Regular General	6525	Mark Herring	D	7820	46.69	va
84	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7649	46.08	va
84	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8904	53.64	va
84	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7979	46.87	va
84	2013 Governor - Regular General	6292	Terry McAuliffe	D	7904	46.43	va
84	2013 Governor - Regular General	6292	Robert Sarvis	L	1091	6.41	va
84	2014 US Senator - Regular General	7053	Mark Warner	D	7853	46.29	va
84	2014 US Senator - Regular General	7053	Robert Sarvis	L	490	2.89	va
84	2014 US Senator - Regular General	7053	Ed Gillespie	R	8608	50.74	va
85	2012 US President - Regular General	6598	Barack Obama	D	16117	48.86	va
85	2012 US President - Regular General	6598	Mitt Romney	R	16271	49.33	va
85	2012 US President - Regular General	6598	Gary Johnson	L	372	1.13	va
85	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	71	0.22	va
85	2012 US President - Regular General	6598	Jill Stein	Green	79	0.24	va
85	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10142	53.51	va
85	2013 Attorney General - Regular General	6525	Mark Herring	D	8813	46.49	va
85	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8722	46.5	va
85	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9997	53.29	va
85	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9183	47.65	va
85	2013 Governor - Regular General	6292	Terry McAuliffe	D	8778	45.55	va
85	2013 Governor - Regular General	6292	Robert Sarvis	L	1251	6.49	va
85	2014 US Senator - Regular General	7053	Mark Warner	D	8742	46.97	va
85	2014 US Senator - Regular General	7053	Robert Sarvis	L	540	2.9	va
85	2014 US Senator - Regular General	7053	Ed Gillespie	R	9319	50.07	va
86	2012 US President - Regular General	6598	Barack Obama	D	19150	59.67	va
86	2012 US President - Regular General	6598	Mitt Romney	R	12421	38.7	va
86	2012 US President - Regular General	6598	Gary Johnson	L	318	0.99	va
86	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	46	0.14	va
86	2012 US President - Regular General	6598	Jill Stein	Green	84	0.26	va
86	2013 Attorney General - Regular General	6525	Mark Obenshain	R	7546	39.3	va
86	2013 Attorney General - Regular General	6525	Mark Herring	D	11654	60.7	va
86	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7113	37.11	va
86	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11968	62.45	va
86	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7091	36.53	va
86	2013 Governor - Regular General	6292	Terry McAuliffe	D	11088	57.13	va
86	2013 Governor - Regular General	6292	Robert Sarvis	L	1186	6.11	va
86	2014 US Senator - Regular General	7053	Mark Warner	D	10992	57.52	va
86	2014 US Senator - Regular General	7053	Robert Sarvis	L	513	2.68	va
86	2014 US Senator - Regular General	7053	Ed Gillespie	R	7583	39.68	va
87	2012 US President - Regular General	6598	Barack Obama	D	13329	56.2	va
87	2012 US President - Regular General	6598	Mitt Romney	R	10043	42.35	va
87	2012 US President - Regular General	6598	Gary Johnson	L	224	0.94	va
87	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	27	0.11	va
87	2012 US President - Regular General	6598	Jill Stein	Green	54	0.23	va
87	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8362	44.0	va
87	2013 Attorney General - Regular General	6525	Mark Herring	D	10642	56.0	va
87	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8068	42.49	va
87	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10850	57.14	va
87	2013 Governor - Regular General	6292	Ken Cuccinelli	R	8112	42.17	va
87	2013 Governor - Regular General	6292	Terry McAuliffe	D	10172	52.88	va
87	2013 Governor - Regular General	6292	Robert Sarvis	L	904	4.7	va
87	2014 US Senator - Regular General	7053	Mark Warner	D	9835	51.73	va
87	2014 US Senator - Regular General	7053	Robert Sarvis	L	467	2.46	va
87	2014 US Senator - Regular General	7053	Ed Gillespie	R	8696	45.73	va
88	2012 US President - Regular General	6598	Barack Obama	D	14607	42.66	va
88	2012 US President - Regular General	6598	Mitt Romney	R	19033	55.59	va
88	2012 US President - Regular General	6598	Gary Johnson	L	325	0.95	va
88	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	102	0.3	va
88	2012 US President - Regular General	6598	Jill Stein	Green	99	0.29	va
88	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12458	59.14	va
88	2013 Attorney General - Regular General	6525	Mark Herring	D	8606	40.86	va
88	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11787	55.94	va
88	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9209	43.71	va
88	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12103	56.77	va
88	2013 Governor - Regular General	6292	Terry McAuliffe	D	8071	37.86	va
88	2013 Governor - Regular General	6292	Robert Sarvis	L	1063	4.99	va
88	2014 US Senator - Regular General	7053	Mark Warner	D	8078	37.7	va
88	2014 US Senator - Regular General	7053	Robert Sarvis	L	467	2.18	va
88	2014 US Senator - Regular General	7053	Ed Gillespie	R	12862	60.02	va
89	2012 US President - Regular General	6598	Barack Obama	D	21223	81.27	va
89	2012 US President - Regular General	6598	Mitt Romney	R	4562	17.47	va
89	2012 US President - Regular General	6598	Gary Johnson	L	185	0.71	va
89	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	34	0.13	va
89	2012 US President - Regular General	6598	Jill Stein	Green	54	0.21	va
89	2013 Attorney General - Regular General	6525	Mark Obenshain	R	3604	21.63	va
89	2013 Attorney General - Regular General	6525	Mark Herring	D	13057	78.36	va
89	2013 Lt. Governor - Regular General	6523	E W Jackson	R	2748	16.53	va
89	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13826	83.16	va
89	2013 Governor - Regular General	6292	Ken Cuccinelli	R	2929	17.1	va
89	2013 Governor - Regular General	6292	Terry McAuliffe	D	13319	77.77	va
89	2013 Governor - Regular General	6292	Robert Sarvis	L	815	4.76	va
89	2014 US Senator - Regular General	7053	Mark Warner	D	11878	77.95	va
89	2014 US Senator - Regular General	7053	Robert Sarvis	L	329	2.16	va
89	2014 US Senator - Regular General	7053	Ed Gillespie	R	3019	19.81	va
90	2012 US President - Regular General	6598	Barack Obama	D	20804	79.61	va
90	2012 US President - Regular General	6598	Mitt Romney	R	5040	19.29	va
90	2012 US President - Regular General	6598	Gary Johnson	L	142	0.54	va
90	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	48	0.18	va
90	2012 US President - Regular General	6598	Jill Stein	Green	34	0.13	va
90	2013 Attorney General - Regular General	6525	Mark Obenshain	R	3571	23.92	va
90	2013 Attorney General - Regular General	6525	Mark Herring	D	11359	76.08	va
90	2013 Lt. Governor - Regular General	6523	E W Jackson	R	3148	21.15	va
90	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11701	78.61	va
90	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3105	20.24	va
90	2013 Governor - Regular General	6292	Terry McAuliffe	D	11594	75.58	va
90	2013 Governor - Regular General	6292	Robert Sarvis	L	603	3.93	va
90	2014 US Senator - Regular General	7053	Mark Warner	D	10701	75.62	va
90	2014 US Senator - Regular General	7053	Robert Sarvis	L	258	1.82	va
90	2014 US Senator - Regular General	7053	Ed Gillespie	R	3177	22.45	va
91	2012 US President - Regular General	6598	Barack Obama	D	14473	42.75	va
91	2012 US President - Regular General	6598	Mitt Romney	R	18777	55.47	va
91	2012 US President - Regular General	6598	Gary Johnson	L	397	1.17	va
91	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	70	0.21	va
91	2012 US President - Regular General	6598	Jill Stein	Green	68	0.2	va
91	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12690	57.59	va
91	2013 Attorney General - Regular General	6525	Mark Herring	D	9345	42.41	va
91	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11287	51.06	va
91	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10749	48.62	va
91	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11585	51.84	va
91	2013 Governor - Regular General	6292	Terry McAuliffe	D	9104	40.74	va
91	2013 Governor - Regular General	6292	Robert Sarvis	L	1613	7.22	va
91	2014 US Senator - Regular General	7053	Mark Warner	D	9244	43.11	va
91	2014 US Senator - Regular General	7053	Robert Sarvis	L	510	2.38	va
91	2014 US Senator - Regular General	7053	Ed Gillespie	R	11679	54.47	va
92	2012 US President - Regular General	6598	Barack Obama	D	27283	79.41	va
92	2012 US President - Regular General	6598	Mitt Romney	R	6672	19.42	va
92	2012 US President - Regular General	6598	Gary Johnson	L	221	0.64	va
92	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	56	0.16	va
92	2012 US President - Regular General	6598	Jill Stein	Green	55	0.16	va
92	2013 Attorney General - Regular General	6525	Mark Obenshain	R	4444	22.82	va
92	2013 Attorney General - Regular General	6525	Mark Herring	D	15034	77.18	va
92	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4095	20.95	va
92	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	15411	78.83	va
92	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3844	19.33	va
92	2013 Governor - Regular General	6292	Terry McAuliffe	D	15206	76.47	va
92	2013 Governor - Regular General	6292	Robert Sarvis	L	806	4.05	va
92	2014 US Senator - Regular General	7053	Mark Warner	D	14133	77.87	va
92	2014 US Senator - Regular General	7053	Robert Sarvis	L	308	1.7	va
92	2014 US Senator - Regular General	7053	Ed Gillespie	R	3695	20.36	va
93	2012 US President - Regular General	6598	Barack Obama	D	20637	56.45	va
93	2012 US President - Regular General	6598	Mitt Romney	R	15359	42.01	va
93	2012 US President - Regular General	6598	Gary Johnson	L	355	0.97	va
93	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	66	0.18	va
93	2012 US President - Regular General	6598	Jill Stein	Green	70	0.19	va
93	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10036	45.11	va
93	2013 Attorney General - Regular General	6525	Mark Herring	D	12211	54.89	va
93	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8888	39.94	va
93	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13296	59.74	va
93	2013 Governor - Regular General	6292	Ken Cuccinelli	R	8997	40.01	va
93	2013 Governor - Regular General	6292	Terry McAuliffe	D	12071	53.68	va
93	2013 Governor - Regular General	6292	Robert Sarvis	L	1348	6.0	va
93	2014 US Senator - Regular General	7053	Mark Warner	D	11583	54.75	va
93	2014 US Senator - Regular General	7053	Robert Sarvis	L	445	2.1	va
93	2014 US Senator - Regular General	7053	Ed Gillespie	R	9111	43.06	va
94	2012 US President - Regular General	6598	Barack Obama	D	18846	52.41	va
94	2012 US President - Regular General	6598	Mitt Romney	R	16491	45.86	va
94	2012 US President - Regular General	6598	Gary Johnson	L	408	1.13	va
94	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	66	0.18	va
94	2012 US President - Regular General	6598	Jill Stein	Green	73	0.2	va
94	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10591	50.6	va
94	2013 Attorney General - Regular General	6525	Mark Herring	D	10341	49.4	va
94	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9233	44.1	va
94	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11660	55.69	va
94	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9480	44.71	va
94	2013 Governor - Regular General	6292	Terry McAuliffe	D	10149	47.86	va
94	2013 Governor - Regular General	6292	Robert Sarvis	L	1528	7.21	va
94	2014 US Senator - Regular General	7053	Mark Warner	D	9726	49.81	va
94	2014 US Senator - Regular General	7053	Robert Sarvis	L	469	2.4	va
94	2014 US Senator - Regular General	7053	Ed Gillespie	R	9317	47.72	va
95	2012 US President - Regular General	6598	Barack Obama	D	23669	77.67	va
95	2012 US President - Regular General	6598	Mitt Romney	R	6449	21.16	va
95	2012 US President - Regular General	6598	Gary Johnson	L	208	0.68	va
95	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	65	0.21	va
95	2012 US President - Regular General	6598	Jill Stein	Green	39	0.13	va
95	2013 Attorney General - Regular General	6525	Mark Obenshain	R	4263	26.0	va
95	2013 Attorney General - Regular General	6525	Mark Herring	D	12135	74.0	va
95	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4126	25.13	va
95	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12267	74.71	va
95	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3764	22.57	va
95	2013 Governor - Regular General	6292	Terry McAuliffe	D	12243	73.4	va
95	2013 Governor - Regular General	6292	Robert Sarvis	L	647	3.88	va
95	2014 US Senator - Regular General	7053	Mark Warner	D	11289	74.18	va
95	2014 US Senator - Regular General	7053	Robert Sarvis	L	244	1.6	va
95	2014 US Senator - Regular General	7053	Ed Gillespie	R	3675	24.15	va
96	2012 US President - Regular General	6598	Barack Obama	D	16964	41.21	va
96	2012 US President - Regular General	6598	Mitt Romney	R	23612	57.36	va
96	2012 US President - Regular General	6598	Gary Johnson	L	370	0.9	va
96	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	71	0.17	va
96	2012 US President - Regular General	6598	Jill Stein	Green	73	0.18	va
96	2013 Attorney General - Regular General	6525	Mark Obenshain	R	16268	58.47	va
96	2013 Attorney General - Regular General	6525	Mark Herring	D	11557	41.53	va
96	2013 Lt. Governor - Regular General	6523	E W Jackson	R	14528	52.17	va
96	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13246	47.57	va
96	2013 Governor - Regular General	6292	Ken Cuccinelli	R	15093	53.76	va
96	2013 Governor - Regular General	6292	Terry McAuliffe	D	10997	39.17	va
96	2013 Governor - Regular General	6292	Robert Sarvis	L	1900	6.77	va
96	2014 US Senator - Regular General	7053	Mark Warner	D	11424	41.28	va
96	2014 US Senator - Regular General	7053	Robert Sarvis	L	569	2.06	va
96	2014 US Senator - Regular General	7053	Ed Gillespie	R	15647	56.54	va
97	2012 US President - Regular General	6598	Barack Obama	D	12980	29.55	va
97	2012 US President - Regular General	6598	Mitt Romney	R	30370	69.14	va
97	2012 US President - Regular General	6598	Gary Johnson	L	310	0.71	va
97	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	109	0.25	va
97	2012 US President - Regular General	6598	Jill Stein	Green	93	0.21	va
97	2013 Attorney General - Regular General	6525	Mark Obenshain	R	20136	68.99	va
97	2013 Attorney General - Regular General	6525	Mark Herring	D	9052	31.01	va
97	2013 Lt. Governor - Regular General	6523	E W Jackson	R	17518	60.16	va
97	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11427	39.24	va
97	2013 Governor - Regular General	6292	Ken Cuccinelli	R	18423	62.36	va
97	2013 Governor - Regular General	6292	Terry McAuliffe	D	7767	26.29	va
97	2013 Governor - Regular General	6292	Robert Sarvis	L	2911	9.85	va
97	2014 US Senator - Regular General	7053	Mark Warner	D	8693	29.72	va
97	2014 US Senator - Regular General	7053	Robert Sarvis	L	883	3.02	va
97	2014 US Senator - Regular General	7053	Ed Gillespie	R	19651	67.18	va
98	2012 US President - Regular General	6598	Barack Obama	D	16544	39.17	va
98	2012 US President - Regular General	6598	Mitt Romney	R	25005	59.2	va
98	2012 US President - Regular General	6598	Gary Johnson	L	351	0.83	va
98	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	158	0.37	va
98	2012 US President - Regular General	6598	Jill Stein	Green	107	0.25	va
98	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15594	62.53	va
98	2013 Attorney General - Regular General	6525	Mark Herring	D	9345	37.47	va
98	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13094	52.46	va
98	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11829	47.39	va
98	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14199	56.04	va
98	2013 Governor - Regular General	6292	Terry McAuliffe	D	8971	35.4	va
98	2013 Governor - Regular General	6292	Robert Sarvis	L	2030	8.01	va
98	2014 US Senator - Regular General	7053	Mark Warner	D	9282	37.5	va
98	2014 US Senator - Regular General	7053	Robert Sarvis	L	598	2.42	va
98	2014 US Senator - Regular General	7053	Ed Gillespie	R	14865	60.06	va
99	2012 US President - Regular General	6598	Barack Obama	D	17888	44.2	va
99	2012 US President - Regular General	6598	Mitt Romney	R	22036	54.45	va
99	2012 US President - Regular General	6598	Gary Johnson	L	268	0.66	va
99	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	106	0.26	va
99	2012 US President - Regular General	6598	Jill Stein	Green	89	0.22	va
99	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14266	58.56	va
99	2013 Attorney General - Regular General	6525	Mark Herring	D	10096	41.44	va
99	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12474	51.23	va
99	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11798	48.46	va
99	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13471	54.28	va
99	2013 Governor - Regular General	6292	Terry McAuliffe	D	9579	38.6	va
99	2013 Governor - Regular General	6292	Robert Sarvis	L	1595	6.43	va
99	2014 US Senator - Regular General	7053	Mark Warner	D	10184	41.06	va
99	2014 US Senator - Regular General	7053	Robert Sarvis	L	521	2.1	va
99	2014 US Senator - Regular General	7053	Ed Gillespie	R	14077	56.75	va
82	2016 US President - Regular General	8666	Hillary Clinton	D	13209	38.72	va
82	2016 US President - Regular General	8666	Donald Trump	R	18748	54.96	va
82	2016 US President - Regular General	8666	Gary Johnson	L	1484	4.35	va
82	2016 US President - Regular General	8666	Jill Stein	Green	297	0.87	va
82	2016 US President - Regular General	8666	Evan McMullin	I	373	1.09	va
81	2016 US President - Regular General	8666	Hillary Clinton	D	11225	36.04	va
81	2016 US President - Regular General	8666	Donald Trump	R	18120	58.17	va
81	2016 US President - Regular General	8666	Gary Johnson	L	1245	4.0	va
81	2016 US President - Regular General	8666	Jill Stein	Green	240	0.77	va
81	2016 US President - Regular General	8666	Evan McMullin	I	320	1.03	va
80	2016 US President - Regular General	8666	Hillary Clinton	D	23027	70.7	va
80	2016 US President - Regular General	8666	Donald Trump	R	8207	25.2	va
80	2016 US President - Regular General	8666	Gary Johnson	L	818	2.51	va
80	2016 US President - Regular General	8666	Jill Stein	Green	273	0.84	va
80	2016 US President - Regular General	8666	Evan McMullin	I	240	0.74	va
79	2016 US President - Regular General	8666	Hillary Clinton	D	12810	58.15	va
79	2016 US President - Regular General	8666	Donald Trump	R	7974	36.2	va
79	2016 US President - Regular General	8666	Gary Johnson	L	789	3.58	va
79	2016 US President - Regular General	8666	Jill Stein	Green	208	0.94	va
79	2016 US President - Regular General	8666	Evan McMullin	I	246	1.12	va
78	2016 US President - Regular General	8666	Hillary Clinton	D	13683	36.69	va
78	2016 US President - Regular General	8666	Donald Trump	R	21659	58.07	va
78	2016 US President - Regular General	8666	Gary Johnson	L	1285	3.45	va
78	2016 US President - Regular General	8666	Jill Stein	Green	225	0.6	va
78	2016 US President - Regular General	8666	Evan McMullin	I	446	1.2	va
77	2016 US President - Regular General	8666	Hillary Clinton	D	20705	71.61	va
77	2016 US President - Regular General	8666	Donald Trump	R	7202	24.91	va
77	2016 US President - Regular General	8666	Gary Johnson	L	595	2.06	va
77	2016 US President - Regular General	8666	Jill Stein	Green	199	0.69	va
77	2016 US President - Regular General	8666	Evan McMullin	I	210	0.73	va
76	2016 US President - Regular General	8666	Hillary Clinton	D	16448	42.14	va
76	2016 US President - Regular General	8666	Donald Trump	R	20657	52.92	va
76	2016 US President - Regular General	8666	Gary Johnson	L	1235	3.16	va
76	2016 US President - Regular General	8666	Jill Stein	Green	215	0.55	va
76	2016 US President - Regular General	8666	Evan McMullin	I	474	1.21	va
75	2016 US President - Regular General	8666	Hillary Clinton	D	17597	56.89	va
75	2016 US President - Regular General	8666	Donald Trump	R	12741	41.19	va
75	2016 US President - Regular General	8666	Gary Johnson	L	379	1.23	va
75	2016 US President - Regular General	8666	Jill Stein	Green	87	0.28	va
75	2016 US President - Regular General	8666	Evan McMullin	I	125	0.4	va
74	2016 US President - Regular General	8666	Hillary Clinton	D	26597	72.14	va
74	2016 US President - Regular General	8666	Donald Trump	R	9037	24.51	va
74	2016 US President - Regular General	8666	Gary Johnson	L	702	1.9	va
74	2016 US President - Regular General	8666	Jill Stein	Green	251	0.68	va
74	2016 US President - Regular General	8666	Evan McMullin	I	279	0.76	va
73	2016 US President - Regular General	8666	Hillary Clinton	D	17985	49.79	va
73	2016 US President - Regular General	8666	Donald Trump	R	15668	43.38	va
73	2016 US President - Regular General	8666	Gary Johnson	L	1609	4.45	va
73	2016 US President - Regular General	8666	Jill Stein	Green	279	0.77	va
73	2016 US President - Regular General	8666	Evan McMullin	I	576	1.59	va
72	2016 US President - Regular General	8666	Hillary Clinton	D	19079	48.6	va
72	2016 US President - Regular General	8666	Donald Trump	R	17531	44.65	va
72	2016 US President - Regular General	8666	Gary Johnson	L	1762	4.49	va
72	2016 US President - Regular General	8666	Jill Stein	Green	288	0.73	va
72	2016 US President - Regular General	8666	Evan McMullin	I	597	1.52	va
71	2016 US President - Regular General	8666	Hillary Clinton	D	31950	84.58	va
71	2016 US President - Regular General	8666	Donald Trump	R	3784	10.02	va
71	2016 US President - Regular General	8666	Gary Johnson	L	1162	3.08	va
71	2016 US President - Regular General	8666	Jill Stein	Green	493	1.31	va
71	2016 US President - Regular General	8666	Evan McMullin	I	387	1.02	va
70	2016 US President - Regular General	8666	Hillary Clinton	D	24448	77.3	va
70	2016 US President - Regular General	8666	Donald Trump	R	6193	19.58	va
70	2016 US President - Regular General	8666	Gary Johnson	L	543	1.72	va
70	2016 US President - Regular General	8666	Jill Stein	Green	244	0.77	va
70	2016 US President - Regular General	8666	Evan McMullin	I	198	0.63	va
69	2016 US President - Regular General	8666	Hillary Clinton	D	27653	83.0	va
69	2016 US President - Regular General	8666	Donald Trump	R	4039	12.12	va
69	2016 US President - Regular General	8666	Gary Johnson	L	924	2.77	va
69	2016 US President - Regular General	8666	Jill Stein	Green	378	1.13	va
69	2016 US President - Regular General	8666	Evan McMullin	I	318	0.95	va
68	2016 US President - Regular General	8666	Hillary Clinton	D	23697	51.24	va
68	2016 US President - Regular General	8666	Donald Trump	R	18922	40.92	va
68	2016 US President - Regular General	8666	Gary Johnson	L	2577	5.57	va
68	2016 US President - Regular General	8666	Jill Stein	Green	326	0.7	va
68	2016 US President - Regular General	8666	Evan McMullin	I	720	1.56	va
67	2016 US President - Regular General	8666	Hillary Clinton	D	19452	58.26	va
67	2016 US President - Regular General	8666	Donald Trump	R	11890	35.61	va
67	2016 US President - Regular General	8666	Gary Johnson	L	1111	3.33	va
67	2016 US President - Regular General	8666	Jill Stein	Green	281	0.84	va
67	2016 US President - Regular General	8666	Evan McMullin	I	649	1.94	va
66	2016 US President - Regular General	8666	Hillary Clinton	D	13989	36.14	va
66	2016 US President - Regular General	8666	Donald Trump	R	23012	59.45	va
66	2016 US President - Regular General	8666	Gary Johnson	L	1122	2.9	va
66	2016 US President - Regular General	8666	Jill Stein	Green	184	0.48	va
66	2016 US President - Regular General	8666	Evan McMullin	I	402	1.04	va
82	2012 US Senator - Regular General	6575	Tim Kaine	D	15380	43.79	va
82	2012 US Senator - Regular General	6575	George Allen	R	19700	56.08	va
81	2012 US Senator - Regular General	6575	Tim Kaine	D	13138	43.39	va
81	2012 US Senator - Regular General	6575	George Allen	R	17093	56.46	va
80	2012 US Senator - Regular General	6575	Tim Kaine	D	21492	75.36	va
80	2012 US Senator - Regular General	6575	George Allen	R	6987	24.5	va
79	2012 US Senator - Regular General	6575	Tim Kaine	D	14459	62.68	va
79	2012 US Senator - Regular General	6575	George Allen	R	8562	37.12	va
78	2012 US Senator - Regular General	6575	Tim Kaine	D	15097	40.74	va
78	2012 US Senator - Regular General	6575	George Allen	R	21879	59.04	va
77	2012 US Senator - Regular General	6575	Tim Kaine	D	20665	75.24	va
77	2012 US Senator - Regular General	6575	George Allen	R	6736	24.53	va
76	2012 US Senator - Regular General	6575	Tim Kaine	D	14533	45.17	va
76	2012 US Senator - Regular General	6575	George Allen	R	17596	54.69	va
75	2012 US Senator - Regular General	6575	Tim Kaine	D	20702	61.32	va
75	2012 US Senator - Regular General	6575	George Allen	R	13039	38.62	va
74	2012 US Senator - Regular General	6575	Tim Kaine	D	28225	74.95	va
74	2012 US Senator - Regular General	6575	George Allen	R	9381	24.91	va
73	2012 US Senator - Regular General	6575	Tim Kaine	D	17678	49.82	va
73	2012 US Senator - Regular General	6575	George Allen	R	17739	49.99	va
72	2012 US Senator - Regular General	6575	Tim Kaine	D	19087	48.25	va
72	2012 US Senator - Regular General	6575	George Allen	R	20393	51.56	va
71	2012 US Senator - Regular General	6575	Tim Kaine	D	27869	87.33	va
71	2012 US Senator - Regular General	6575	George Allen	R	3977	12.46	va
70	2012 US Senator - Regular General	6575	Tim Kaine	D	25547	79.49	va
70	2012 US Senator - Regular General	6575	George Allen	R	6538	20.34	va
69	2012 US Senator - Regular General	6575	Tim Kaine	D	27551	85.72	va
69	2012 US Senator - Regular General	6575	George Allen	R	4520	14.06	va
68	2012 US Senator - Regular General	6575	Tim Kaine	D	21660	48.88	va
68	2012 US Senator - Regular General	6575	George Allen	R	22558	50.91	va
67	2012 US Senator - Regular General	6575	Tim Kaine	D	18947	54.84	va
67	2012 US Senator - Regular General	6575	George Allen	R	15544	44.99	va
66	2012 US Senator - Regular General	6575	Tim Kaine	D	14859	38.51	va
66	2012 US Senator - Regular General	6575	George Allen	R	23633	61.25	va
66	2012 US President - Regular General	6598	Barack Obama	D	14176	36.39	va
66	2012 US President - Regular General	6598	Mitt Romney	R	24233	62.2	va
66	2012 US President - Regular General	6598	Gary Johnson	L	317	0.81	va
66	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	91	0.23	va
66	2012 US President - Regular General	6598	Jill Stein	Green	57	0.15	va
66	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15916	63.55	va
66	2013 Attorney General - Regular General	6525	Mark Herring	D	9128	36.45	va
66	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13572	54.47	va
66	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11219	45.02	va
66	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14482	56.98	va
66	2013 Governor - Regular General	6292	Terry McAuliffe	D	8225	32.36	va
66	2013 Governor - Regular General	6292	Robert Sarvis	L	2478	9.75	va
66	2014 US Senator - Regular General	7053	Mark Warner	D	8694	35.6	va
66	2014 US Senator - Regular General	7053	Robert Sarvis	L	756	3.1	va
66	2014 US Senator - Regular General	7053	Ed Gillespie	R	14951	61.22	va
67	2012 US President - Regular General	6598	Barack Obama	D	18613	53.34	va
67	2012 US President - Regular General	6598	Mitt Romney	R	15809	45.3	va
67	2012 US President - Regular General	6598	Gary Johnson	L	287	0.82	va
67	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	48	0.14	va
67	2012 US President - Regular General	6598	Jill Stein	Green	70	0.2	va
67	2013 Attorney General - Regular General	6525	Mark Obenshain	R	9862	45.55	va
67	2013 Attorney General - Regular General	6525	Mark Herring	D	11788	54.45	va
67	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9227	42.69	va
67	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12321	57.01	va
67	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9385	42.91	va
67	2013 Governor - Regular General	6292	Terry McAuliffe	D	11250	51.44	va
67	2013 Governor - Regular General	6292	Robert Sarvis	L	1178	5.39	va
67	2014 US Senator - Regular General	7053	Mark Warner	D	11437	51.65	va
67	2014 US Senator - Regular General	7053	Robert Sarvis	L	502	2.27	va
67	2014 US Senator - Regular General	7053	Ed Gillespie	R	10187	46.0	va
68	2012 US President - Regular General	6598	Barack Obama	D	19618	43.9	va
68	2012 US President - Regular General	6598	Mitt Romney	R	24324	54.43	va
68	2012 US President - Regular General	6598	Gary Johnson	L	492	1.1	va
68	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	92	0.21	va
68	2012 US President - Regular General	6598	Jill Stein	Green	88	0.2	va
68	2013 Attorney General - Regular General	6525	Mark Obenshain	R	17094	52.5	va
68	2013 Attorney General - Regular General	6525	Mark Herring	D	15467	47.5	va
68	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12928	40.16	va
68	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	18971	58.94	va
68	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14381	43.56	va
68	2013 Governor - Regular General	6292	Terry McAuliffe	D	13919	42.16	va
68	2013 Governor - Regular General	6292	Robert Sarvis	L	4098	12.41	va
68	2014 US Senator - Regular General	7053	Mark Warner	D	14329	46.0	va
68	2014 US Senator - Regular General	7053	Robert Sarvis	L	1144	3.67	va
68	2014 US Senator - Regular General	7053	Ed Gillespie	R	15664	50.28	va
69	2012 US President - Regular General	6598	Barack Obama	D	27699	84.89	va
69	2012 US President - Regular General	6598	Mitt Romney	R	4433	13.59	va
69	2012 US President - Regular General	6598	Gary Johnson	L	299	0.92	va
69	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	45	0.14	va
69	2012 US President - Regular General	6598	Jill Stein	Green	97	0.3	va
69	2013 Attorney General - Regular General	6525	Mark Obenshain	R	3005	15.56	va
69	2013 Attorney General - Regular General	6525	Mark Herring	D	16310	84.44	va
69	2013 Lt. Governor - Regular General	6523	E W Jackson	R	2637	13.65	va
69	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	16622	86.05	va
69	2013 Governor - Regular General	6292	Ken Cuccinelli	R	2349	11.92	va
69	2013 Governor - Regular General	6292	Terry McAuliffe	D	15777	80.09	va
69	2013 Governor - Regular General	6292	Robert Sarvis	L	1478	7.5	va
69	2014 US Senator - Regular General	7053	Mark Warner	D	14361	83.01	va
69	2014 US Senator - Regular General	7053	Robert Sarvis	L	538	3.11	va
69	2014 US Senator - Regular General	7053	Ed Gillespie	R	2390	13.82	va
70	2012 US President - Regular General	6598	Barack Obama	D	25613	78.97	va
70	2012 US President - Regular General	6598	Mitt Romney	R	6515	20.09	va
70	2012 US President - Regular General	6598	Gary Johnson	L	139	0.43	va
70	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	70	0.22	va
70	2012 US President - Regular General	6598	Jill Stein	Green	39	0.12	va
70	2013 Attorney General - Regular General	6525	Mark Obenshain	R	4427	21.54	va
70	2013 Attorney General - Regular General	6525	Mark Herring	D	16121	78.46	va
70	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4019	19.58	va
70	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	16476	80.27	va
70	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3893	18.71	va
70	2013 Governor - Regular General	6292	Terry McAuliffe	D	15856	76.22	va
70	2013 Governor - Regular General	6292	Robert Sarvis	L	980	4.71	va
70	2014 US Senator - Regular General	7053	Mark Warner	D	15100	78.23	va
70	2014 US Senator - Regular General	7053	Robert Sarvis	L	364	1.89	va
70	2014 US Senator - Regular General	7053	Ed Gillespie	R	3819	19.78	va
71	2012 US President - Regular General	6598	Barack Obama	D	27922	85.79	va
71	2012 US President - Regular General	6598	Mitt Romney	R	4049	12.44	va
71	2012 US President - Regular General	6598	Gary Johnson	L	325	1.0	va
71	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	64	0.2	va
71	2012 US President - Regular General	6598	Jill Stein	Green	124	0.38	va
71	2013 Attorney General - Regular General	6525	Mark Obenshain	R	2857	14.2	va
71	2013 Attorney General - Regular General	6525	Mark Herring	D	17255	85.79	va
71	2013 Lt. Governor - Regular General	6523	E W Jackson	R	2495	12.35	va
71	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	17593	87.11	va
71	2013 Governor - Regular General	6292	Ken Cuccinelli	R	2068	10.05	va
71	2013 Governor - Regular General	6292	Terry McAuliffe	D	16763	81.46	va
71	2013 Governor - Regular General	6292	Robert Sarvis	L	1636	7.95	va
71	2014 US Senator - Regular General	7053	Mark Warner	D	14767	84.16	va
71	2014 US Senator - Regular General	7053	Robert Sarvis	L	566	3.23	va
71	2014 US Senator - Regular General	7053	Ed Gillespie	R	2194	12.5	va
72	2012 US President - Regular General	6598	Barack Obama	D	17682	44.23	va
72	2012 US President - Regular General	6598	Mitt Romney	R	21656	54.18	va
72	2012 US President - Regular General	6598	Gary Johnson	L	354	0.89	va
72	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	110	0.28	va
72	2012 US President - Regular General	6598	Jill Stein	Green	89	0.22	va
72	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14404	54.18	va
72	2013 Attorney General - Regular General	6525	Mark Herring	D	12180	45.82	va
72	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11244	42.64	va
72	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	14932	56.63	va
72	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12409	46.0	va
72	2013 Governor - Regular General	6292	Terry McAuliffe	D	11002	40.78	va
72	2013 Governor - Regular General	6292	Robert Sarvis	L	3139	11.64	va
72	2014 US Senator - Regular General	7053	Mark Warner	D	11667	45.03	va
72	2014 US Senator - Regular General	7053	Robert Sarvis	L	893	3.45	va
72	2014 US Senator - Regular General	7053	Ed Gillespie	R	13333	51.46	va
73	2012 US President - Regular General	6598	Barack Obama	D	16679	46.31	va
73	2012 US President - Regular General	6598	Mitt Romney	R	18732	52.01	va
73	2012 US President - Regular General	6598	Gary Johnson	L	362	1.01	va
73	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	90	0.25	va
73	2012 US President - Regular General	6598	Jill Stein	Green	81	0.22	va
73	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13000	53.82	va
73	2013 Attorney General - Regular General	6525	Mark Herring	D	11152	46.17	va
73	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10023	41.85	va
73	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13747	57.39	va
73	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11217	45.81	va
73	2013 Governor - Regular General	6292	Terry McAuliffe	D	10024	40.94	va
73	2013 Governor - Regular General	6292	Robert Sarvis	L	2832	11.57	va
73	2014 US Senator - Regular General	7053	Mark Warner	D	10620	45.51	va
73	2014 US Senator - Regular General	7053	Robert Sarvis	L	826	3.54	va
73	2014 US Senator - Regular General	7053	Ed Gillespie	R	11865	50.85	va
74	2012 US President - Regular General	6598	Barack Obama	D	28286	74.19	va
74	2012 US President - Regular General	6598	Mitt Romney	R	9383	24.61	va
74	2012 US President - Regular General	6598	Gary Johnson	L	207	0.54	va
74	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	76	0.2	va
74	2012 US President - Regular General	6598	Jill Stein	Green	50	0.13	va
74	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6386	26.34	va
74	2013 Attorney General - Regular General	6525	Mark Herring	D	17855	73.65	va
74	2013 Lt. Governor - Regular General	6523	E W Jackson	R	5713	23.53	va
74	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	18489	76.14	va
74	2013 Governor - Regular General	6292	Ken Cuccinelli	R	5622	22.85	va
74	2013 Governor - Regular General	6292	Terry McAuliffe	D	17409	70.77	va
74	2013 Governor - Regular General	6292	Robert Sarvis	L	1464	5.95	va
74	2014 US Senator - Regular General	7053	Mark Warner	D	16890	74.12	va
74	2014 US Senator - Regular General	7053	Robert Sarvis	L	443	1.94	va
74	2014 US Senator - Regular General	7053	Ed Gillespie	R	5426	23.81	va
75	2012 US President - Regular General	6598	Barack Obama	D	21547	62.12	va
75	2012 US President - Regular General	6598	Mitt Romney	R	12828	36.98	va
75	2012 US President - Regular General	6598	Gary Johnson	L	105	0.3	va
75	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	123	0.35	va
75	2012 US President - Regular General	6598	Jill Stein	Green	60	0.17	va
75	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8167	41.28	va
75	2013 Attorney General - Regular General	6525	Mark Herring	D	11618	58.72	va
75	2013 Lt. Governor - Regular General	6523	E W Jackson	R	6662	33.71	va
75	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13067	66.13	va
75	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7456	36.95	va
75	2013 Governor - Regular General	6292	Terry McAuliffe	D	11723	58.09	va
75	2013 Governor - Regular General	6292	Robert Sarvis	L	951	4.71	va
75	2014 US Senator - Regular General	7053	Mark Warner	D	11479	59.82	va
75	2014 US Senator - Regular General	7053	Robert Sarvis	L	270	1.41	va
75	2014 US Senator - Regular General	7053	Ed Gillespie	R	7430	38.72	va
76	2012 US President - Regular General	6598	Barack Obama	D	13912	42.69	va
76	2012 US President - Regular General	6598	Mitt Romney	R	18246	55.99	va
76	2012 US President - Regular General	6598	Gary Johnson	L	243	0.75	va
76	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	93	0.29	va
76	2012 US President - Regular General	6598	Jill Stein	Green	42	0.13	va
76	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13764	55.25	va
76	2013 Attorney General - Regular General	6525	Mark Herring	D	11149	44.75	va
76	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12042	48.22	va
76	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12880	51.58	va
76	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12616	49.9	va
76	2013 Governor - Regular General	6292	Terry McAuliffe	D	11211	44.34	va
76	2013 Governor - Regular General	6292	Robert Sarvis	L	1384	5.47	va
76	2014 US Senator - Regular General	7053	Mark Warner	D	11533	46.4	va
76	2014 US Senator - Regular General	7053	Robert Sarvis	L	506	2.04	va
76	2014 US Senator - Regular General	7053	Ed Gillespie	R	12800	51.5	va
77	2012 US President - Regular General	6598	Barack Obama	D	21049	75.16	va
77	2012 US President - Regular General	6598	Mitt Romney	R	6658	23.77	va
77	2012 US President - Regular General	6598	Gary Johnson	L	138	0.49	va
77	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	49	0.17	va
77	2012 US President - Regular General	6598	Jill Stein	Green	35	0.12	va
77	2013 Attorney General - Regular General	6525	Mark Obenshain	R	4251	24.45	va
77	2013 Attorney General - Regular General	6525	Mark Herring	D	13136	75.55	va
77	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4208	24.07	va
77	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13237	75.72	va
77	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3686	20.73	va
77	2013 Governor - Regular General	6292	Terry McAuliffe	D	13443	75.59	va
77	2013 Governor - Regular General	6292	Robert Sarvis	L	628	3.53	va
77	2014 US Senator - Regular General	7053	Mark Warner	D	12493	75.5	va
77	2014 US Senator - Regular General	7053	Robert Sarvis	L	253	1.53	va
77	2014 US Senator - Regular General	7053	Ed Gillespie	R	3784	22.87	va
78	2012 US President - Regular General	6598	Barack Obama	D	14382	38.24	va
78	2012 US President - Regular General	6598	Mitt Romney	R	22672	60.28	va
78	2012 US President - Regular General	6598	Gary Johnson	L	349	0.93	va
78	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	66	0.18	va
78	2012 US President - Regular General	6598	Jill Stein	Green	57	0.15	va
78	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14190	61.07	va
78	2013 Attorney General - Regular General	6525	Mark Herring	D	9046	38.93	va
78	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12544	53.96	va
78	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10649	45.81	va
78	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13007	55.28	va
78	2013 Governor - Regular General	6292	Terry McAuliffe	D	9033	38.39	va
78	2013 Governor - Regular General	6292	Robert Sarvis	L	1421	6.04	va
78	2014 US Senator - Regular General	7053	Mark Warner	D	8757	38.29	va
78	2014 US Senator - Regular General	7053	Robert Sarvis	L	483	2.11	va
78	2014 US Senator - Regular General	7053	Ed Gillespie	R	13614	59.52	va
79	2012 US President - Regular General	6598	Barack Obama	D	14160	60.52	va
79	2012 US President - Regular General	6598	Mitt Romney	R	8846	37.81	va
79	2012 US President - Regular General	6598	Gary Johnson	L	253	1.08	va
79	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	45	0.19	va
79	2012 US President - Regular General	6598	Jill Stein	Green	50	0.21	va
79	2013 Attorney General - Regular General	6525	Mark Obenshain	R	5187	38.39	va
79	2013 Attorney General - Regular General	6525	Mark Herring	D	8325	61.61	va
79	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4196	30.91	va
79	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9331	68.73	va
79	2013 Governor - Regular General	6292	Ken Cuccinelli	R	4506	32.79	va
79	2013 Governor - Regular General	6292	Terry McAuliffe	D	8172	59.47	va
79	2013 Governor - Regular General	6292	Robert Sarvis	L	1002	7.29	va
79	2014 US Senator - Regular General	7053	Mark Warner	D	7912	61.43	va
79	2014 US Senator - Regular General	7053	Robert Sarvis	L	377	2.93	va
79	2014 US Senator - Regular General	7053	Ed Gillespie	R	4576	35.53	va
80	2012 US President - Regular General	6598	Barack Obama	D	21675	74.84	va
80	2012 US President - Regular General	6598	Mitt Romney	R	6965	24.05	va
80	2012 US President - Regular General	6598	Gary Johnson	L	167	0.58	va
80	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	52	0.18	va
80	2012 US President - Regular General	6598	Jill Stein	Green	49	0.17	va
80	2013 Attorney General - Regular General	6525	Mark Obenshain	R	5160	26.06	va
80	2013 Attorney General - Regular General	6525	Mark Herring	D	14639	73.94	va
80	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4532	22.81	va
80	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	15301	77.0	va
80	2013 Governor - Regular General	6292	Ken Cuccinelli	R	4462	22.13	va
80	2013 Governor - Regular General	6292	Terry McAuliffe	D	14722	73.03	va
80	2013 Governor - Regular General	6292	Robert Sarvis	L	918	4.55	va
80	2014 US Senator - Regular General	7053	Mark Warner	D	14095	74.18	va
80	2014 US Senator - Regular General	7053	Robert Sarvis	L	368	1.94	va
80	2014 US Senator - Regular General	7053	Ed Gillespie	R	4526	23.82	va
81	2012 US President - Regular General	6598	Barack Obama	D	12678	40.95	va
81	2012 US President - Regular General	6598	Mitt Romney	R	17784	57.44	va
81	2012 US President - Regular General	6598	Gary Johnson	L	313	1.01	va
81	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	62	0.2	va
81	2012 US President - Regular General	6598	Jill Stein	Green	52	0.17	va
81	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10640	59.63	va
81	2013 Attorney General - Regular General	6525	Mark Herring	D	7204	40.37	va
81	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9177	51.72	va
81	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8524	48.04	va
81	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9664	53.2	va
81	2013 Governor - Regular General	6292	Terry McAuliffe	D	7207	39.68	va
81	2013 Governor - Regular General	6292	Robert Sarvis	L	1236	6.8	va
81	2014 US Senator - Regular General	7053	Mark Warner	D	7351	40.26	va
81	2014 US Senator - Regular General	7053	Robert Sarvis	L	495	2.71	va
81	2014 US Senator - Regular General	7053	Ed Gillespie	R	10400	56.96	va
82	2012 US President - Regular General	6598	Barack Obama	D	14353	40.04	va
82	2012 US President - Regular General	6598	Mitt Romney	R	20943	58.42	va
82	2012 US President - Regular General	6598	Gary Johnson	L	327	0.91	va
82	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	64	0.18	va
82	2012 US President - Regular General	6598	Jill Stein	Green	65	0.18	va
82	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13129	58.74	va
82	2013 Attorney General - Regular General	6525	Mark Herring	D	9223	41.26	va
82	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10290	46.52	va
82	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11782	53.27	va
82	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11748	51.79	va
82	2013 Governor - Regular General	6292	Terry McAuliffe	D	9198	40.55	va
82	2013 Governor - Regular General	6292	Robert Sarvis	L	1624	7.16	va
82	2014 US Senator - Regular General	7053	Mark Warner	D	9290	40.94	va
82	2014 US Senator - Regular General	7053	Robert Sarvis	L	585	2.58	va
82	2014 US Senator - Regular General	7053	Ed Gillespie	R	12806	56.43	va
65	2016 US President - Regular General	8666	Hillary Clinton	D	15257	33.7	va
65	2016 US President - Regular General	8666	Donald Trump	R	27519	60.79	va
65	2016 US President - Regular General	8666	Gary Johnson	L	1773	3.92	va
65	2016 US President - Regular General	8666	Jill Stein	Green	206	0.46	va
65	2016 US President - Regular General	8666	Evan McMullin	I	513	1.13	va
64	2016 US President - Regular General	8666	Hillary Clinton	D	14883	35.97	va
64	2016 US President - Regular General	8666	Donald Trump	R	24934	60.27	va
64	2016 US President - Regular General	8666	Gary Johnson	L	1054	2.55	va
64	2016 US President - Regular General	8666	Jill Stein	Green	153	0.37	va
64	2016 US President - Regular General	8666	Evan McMullin	I	346	0.84	va
63	2016 US President - Regular General	8666	Hillary Clinton	D	19994	66.45	va
63	2016 US President - Regular General	8666	Donald Trump	R	9367	31.13	va
63	2016 US President - Regular General	8666	Gary Johnson	L	404	1.34	va
63	2016 US President - Regular General	8666	Jill Stein	Green	155	0.52	va
63	2016 US President - Regular General	8666	Evan McMullin	I	166	0.55	va
62	2016 US President - Regular General	8666	Hillary Clinton	D	15124	44.75	va
62	2016 US President - Regular General	8666	Donald Trump	R	17184	50.85	va
62	2016 US President - Regular General	8666	Gary Johnson	L	969	2.87	va
62	2016 US President - Regular General	8666	Jill Stein	Green	204	0.6	va
62	2016 US President - Regular General	8666	Evan McMullin	I	312	0.92	va
61	2016 US President - Regular General	8666	Hillary Clinton	D	12953	38.94	va
61	2016 US President - Regular General	8666	Donald Trump	R	19473	58.54	va
61	2016 US President - Regular General	8666	Gary Johnson	L	569	1.71	va
61	2016 US President - Regular General	8666	Jill Stein	Green	97	0.29	va
61	2016 US President - Regular General	8666	Evan McMullin	I	170	0.51	va
60	2016 US President - Regular General	8666	Hillary Clinton	D	13240	41.48	va
60	2016 US President - Regular General	8666	Donald Trump	R	17761	55.64	va
60	2016 US President - Regular General	8666	Gary Johnson	L	601	1.88	va
60	2016 US President - Regular General	8666	Jill Stein	Green	109	0.34	va
60	2016 US President - Regular General	8666	Evan McMullin	I	206	0.65	va
59	2016 US President - Regular General	8666	Hillary Clinton	D	12248	33.83	va
59	2016 US President - Regular General	8666	Donald Trump	R	22621	62.48	va
59	2016 US President - Regular General	8666	Gary Johnson	L	797	2.2	va
59	2016 US President - Regular General	8666	Jill Stein	Green	177	0.49	va
59	2016 US President - Regular General	8666	Evan McMullin	I	358	0.99	va
58	2016 US President - Regular General	8666	Hillary Clinton	D	14846	38.21	va
58	2016 US President - Regular General	8666	Donald Trump	R	21697	55.85	va
58	2016 US President - Regular General	8666	Gary Johnson	L	1365	3.51	va
58	2016 US President - Regular General	8666	Jill Stein	Green	256	0.66	va
58	2016 US President - Regular General	8666	Evan McMullin	I	687	1.77	va
57	2016 US President - Regular General	8666	Hillary Clinton	D	26212	73.89	va
57	2016 US President - Regular General	8666	Donald Trump	R	6857	19.33	va
57	2016 US President - Regular General	8666	Gary Johnson	L	1373	3.87	va
57	2016 US President - Regular General	8666	Jill Stein	Green	351	0.99	va
57	2016 US President - Regular General	8666	Evan McMullin	I	681	1.92	va
56	2016 US President - Regular General	8666	Hillary Clinton	D	14941	37.65	va
56	2016 US President - Regular General	8666	Donald Trump	R	22699	57.21	va
56	2016 US President - Regular General	8666	Gary Johnson	L	1382	3.48	va
56	2016 US President - Regular General	8666	Jill Stein	Green	197	0.5	va
56	2016 US President - Regular General	8666	Evan McMullin	I	458	1.15	va
55	2016 US President - Regular General	8666	Hillary Clinton	D	15141	36.6	va
55	2016 US President - Regular General	8666	Donald Trump	R	24105	58.27	va
55	2016 US President - Regular General	8666	Gary Johnson	L	1432	3.46	va
55	2016 US President - Regular General	8666	Jill Stein	Green	218	0.53	va
55	2016 US President - Regular General	8666	Evan McMullin	I	474	1.15	va
54	2016 US President - Regular General	8666	Hillary Clinton	D	14293	40.81	va
54	2016 US President - Regular General	8666	Donald Trump	R	18767	53.59	va
54	2016 US President - Regular General	8666	Gary Johnson	L	1130	3.23	va
54	2016 US President - Regular General	8666	Jill Stein	Green	276	0.79	va
54	2016 US President - Regular General	8666	Evan McMullin	I	555	1.58	va
53	2016 US President - Regular General	8666	Hillary Clinton	D	21271	69.49	va
53	2016 US President - Regular General	8666	Donald Trump	R	7283	23.79	va
53	2016 US President - Regular General	8666	Gary Johnson	L	956	3.12	va
53	2016 US President - Regular General	8666	Jill Stein	Green	314	1.03	va
53	2016 US President - Regular General	8666	Evan McMullin	I	782	2.55	va
52	2016 US President - Regular General	8666	Hillary Clinton	D	17972	71.84	va
52	2016 US President - Regular General	8666	Donald Trump	R	5885	23.52	va
52	2016 US President - Regular General	8666	Gary Johnson	L	592	2.37	va
52	2016 US President - Regular General	8666	Jill Stein	Green	245	0.98	va
52	2016 US President - Regular General	8666	Evan McMullin	I	320	1.28	va
51	2016 US President - Regular General	8666	Hillary Clinton	D	15975	50.49	va
51	2016 US President - Regular General	8666	Donald Trump	R	13764	43.5	va
51	2016 US President - Regular General	8666	Gary Johnson	L	1041	3.29	va
51	2016 US President - Regular General	8666	Jill Stein	Green	286	0.9	va
51	2016 US President - Regular General	8666	Evan McMullin	I	573	1.81	va
50	2016 US President - Regular General	8666	Hillary Clinton	D	14602	53.3	va
50	2016 US President - Regular General	8666	Donald Trump	R	11187	40.84	va
50	2016 US President - Regular General	8666	Gary Johnson	L	891	3.25	va
50	2016 US President - Regular General	8666	Jill Stein	Green	251	0.92	va
50	2016 US President - Regular General	8666	Evan McMullin	I	462	1.69	va
49	2016 US President - Regular General	8666	Hillary Clinton	D	21407	77.3	va
49	2016 US President - Regular General	8666	Donald Trump	R	4676	16.88	va
49	2016 US President - Regular General	8666	Gary Johnson	L	754	2.72	va
49	2016 US President - Regular General	8666	Jill Stein	Green	269	0.97	va
49	2016 US President - Regular General	8666	Evan McMullin	I	587	2.12	va
65	2012 US Senator - Regular General	6575	George Allen	R	26552	63.07	va
64	2012 US Senator - Regular General	6575	Tim Kaine	D	17339	42.29	va
64	2012 US Senator - Regular General	6575	George Allen	R	23610	57.58	va
63	2012 US Senator - Regular General	6575	Tim Kaine	D	26236	72.31	va
63	2012 US Senator - Regular General	6575	George Allen	R	9984	27.52	va
62	2012 US Senator - Regular General	6575	Tim Kaine	D	15208	47.31	va
62	2012 US Senator - Regular General	6575	George Allen	R	16882	52.52	va
61	2012 US Senator - Regular General	6575	Tim Kaine	D	16163	44.34	va
61	2012 US Senator - Regular General	6575	George Allen	R	20269	55.6	va
60	2012 US Senator - Regular General	6575	Tim Kaine	D	16280	47.47	va
60	2012 US Senator - Regular General	6575	George Allen	R	17980	52.43	va
59	2012 US Senator - Regular General	6575	Tim Kaine	D	14904	40.54	va
59	2012 US Senator - Regular General	6575	George Allen	R	21824	59.36	va
58	2012 US Senator - Regular General	6575	Tim Kaine	D	15927	42.25	va
58	2012 US Senator - Regular General	6575	George Allen	R	21723	57.62	va
57	2012 US Senator - Regular General	6575	Tim Kaine	D	27075	72.99	va
57	2012 US Senator - Regular General	6575	George Allen	R	9965	26.86	va
56	2012 US Senator - Regular General	6575	Tim Kaine	D	16017	41.16	va
56	2012 US Senator - Regular General	6575	George Allen	R	22842	58.7	va
55	2012 US Senator - Regular General	6575	Tim Kaine	D	16419	42.26	va
55	2012 US Senator - Regular General	6575	George Allen	R	22337	57.5	va
54	2012 US Senator - Regular General	6575	Tim Kaine	D	15769	47.18	va
54	2012 US Senator - Regular General	6575	George Allen	R	17589	52.63	va
53	2012 US Senator - Regular General	6575	Tim Kaine	D	20256	67.41	va
53	2012 US Senator - Regular General	6575	George Allen	R	9708	32.31	va
52	2012 US Senator - Regular General	6575	Tim Kaine	D	17828	72.0	va
52	2012 US Senator - Regular General	6575	George Allen	R	6878	27.78	va
51	2012 US Senator - Regular General	6575	Tim Kaine	D	18271	52.02	va
51	2012 US Senator - Regular General	6575	George Allen	R	16794	47.82	va
50	2012 US Senator - Regular General	6575	Tim Kaine	D	15232	53.33	va
50	2012 US Senator - Regular General	6575	George Allen	R	13281	46.5	va
49	2012 US Senator - Regular General	6575	Tim Kaine	D	21061	74.64	va
49	2012 US Senator - Regular General	6575	George Allen	R	7074	25.07	va
49	2012 US President - Regular General	6598	Barack Obama	D	21107	73.43	va
49	2012 US President - Regular General	6598	Mitt Romney	R	7149	24.87	va
49	2012 US President - Regular General	6598	Gary Johnson	L	304	1.06	va
49	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	43	0.15	va
49	2012 US President - Regular General	6598	Jill Stein	Green	95	0.33	va
49	2013 Attorney General - Regular General	6525	Mark Obenshain	R	3722	23.07	va
49	2013 Attorney General - Regular General	6525	Mark Herring	D	12409	76.93	va
49	2013 Lt. Governor - Regular General	6523	E W Jackson	R	3373	21.0	va
49	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12612	78.53	va
49	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3366	20.54	va
49	2013 Governor - Regular General	6292	Terry McAuliffe	D	12150	74.15	va
49	2013 Governor - Regular General	6292	Robert Sarvis	L	803	4.9	va
49	2014 US Senator - Regular General	7053	Mark Warner	D	12055	73.17	va
49	2014 US Senator - Regular General	7053	Robert Sarvis	L	442	2.68	va
49	2014 US Senator - Regular General	7053	Ed Gillespie	R	3955	24.0	va
50	2012 US President - Regular General	6598	Barack Obama	D	15391	53.08	va
50	2012 US President - Regular General	6598	Mitt Romney	R	13154	45.36	va
50	2012 US President - Regular General	6598	Gary Johnson	L	269	0.93	va
50	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	71	0.24	va
50	2012 US President - Regular General	6598	Jill Stein	Green	48	0.17	va
50	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8486	50.38	va
50	2013 Attorney General - Regular General	6525	Mark Herring	D	8358	49.62	va
50	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8140	48.3	va
50	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8661	51.39	va
50	2013 Governor - Regular General	6292	Ken Cuccinelli	R	8167	47.94	va
50	2013 Governor - Regular General	6292	Terry McAuliffe	D	8080	47.43	va
50	2013 Governor - Regular General	6292	Robert Sarvis	L	759	4.46	va
50	2014 US Senator - Regular General	7053	Mark Warner	D	7874	47.04	va
50	2014 US Senator - Regular General	7053	Robert Sarvis	L	474	2.83	va
50	2014 US Senator - Regular General	7053	Ed Gillespie	R	8377	50.04	va
51	2012 US President - Regular General	6598	Barack Obama	D	18117	51.02	va
51	2012 US President - Regular General	6598	Mitt Romney	R	16826	47.38	va
51	2012 US President - Regular General	6598	Gary Johnson	L	327	0.92	va
51	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	76	0.21	va
51	2012 US President - Regular General	6598	Jill Stein	Green	94	0.26	va
51	2013 Attorney General - Regular General	6525	Mark Obenshain	R	11300	50.36	va
51	2013 Attorney General - Regular General	6525	Mark Herring	D	11137	49.63	va
51	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10630	47.5	va
51	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11684	52.2	va
51	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10847	47.96	va
51	2013 Governor - Regular General	6292	Terry McAuliffe	D	10684	47.24	va
51	2013 Governor - Regular General	6292	Robert Sarvis	L	1047	4.63	va
51	2014 US Senator - Regular General	7053	Mark Warner	D	10011	45.45	va
51	2014 US Senator - Regular General	7053	Robert Sarvis	L	495	2.25	va
51	2014 US Senator - Regular General	7053	Ed Gillespie	R	11503	52.22	va
52	2012 US President - Regular General	6598	Barack Obama	D	18190	72.36	va
52	2012 US President - Regular General	6598	Mitt Romney	R	6610	26.29	va
52	2012 US President - Regular General	6598	Gary Johnson	L	183	0.73	va
52	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	49	0.19	va
52	2012 US President - Regular General	6598	Jill Stein	Green	60	0.24	va
52	2013 Attorney General - Regular General	6525	Mark Obenshain	R	4054	31.24	va
52	2013 Attorney General - Regular General	6525	Mark Herring	D	8921	68.75	va
52	2013 Lt. Governor - Regular General	6523	E W Jackson	R	3903	30.09	va
52	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9038	69.67	va
52	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3918	29.86	va
52	2013 Governor - Regular General	6292	Terry McAuliffe	D	8721	66.46	va
52	2013 Governor - Regular General	6292	Robert Sarvis	L	471	3.59	va
52	2014 US Senator - Regular General	7053	Mark Warner	D	8059	64.11	va
52	2014 US Senator - Regular General	7053	Robert Sarvis	L	252	2.0	va
52	2014 US Senator - Regular General	7053	Ed Gillespie	R	4249	33.8	va
53	2012 US President - Regular General	6598	Barack Obama	D	20088	65.91	va
53	2012 US President - Regular General	6598	Mitt Romney	R	9835	32.27	va
53	2012 US President - Regular General	6598	Gary Johnson	L	335	1.1	va
53	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	51	0.17	va
53	2012 US President - Regular General	6598	Jill Stein	Green	99	0.32	va
53	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6066	30.88	va
53	2013 Attorney General - Regular General	6525	Mark Herring	D	13578	69.12	va
53	2013 Lt. Governor - Regular General	6523	E W Jackson	R	5546	28.28	va
53	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13965	71.22	va
53	2013 Governor - Regular General	6292	Ken Cuccinelli	R	5591	28.15	va
53	2013 Governor - Regular General	6292	Terry McAuliffe	D	13111	66.02	va
53	2013 Governor - Regular General	6292	Robert Sarvis	L	1099	5.53	va
53	2014 US Senator - Regular General	7053	Mark Warner	D	13076	65.71	va
53	2014 US Senator - Regular General	7053	Robert Sarvis	L	550	2.76	va
53	2014 US Senator - Regular General	7053	Ed Gillespie	R	6252	31.42	va
54	2012 US President - Regular General	6598	Barack Obama	D	15477	45.7	va
54	2012 US President - Regular General	6598	Mitt Romney	R	17860	52.73	va
54	2012 US President - Regular General	6598	Gary Johnson	L	291	0.86	va
54	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	98	0.29	va
54	2012 US President - Regular General	6598	Jill Stein	Green	74	0.22	va
54	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10732	56.16	va
54	2013 Attorney General - Regular General	6525	Mark Herring	D	8376	43.83	va
54	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10195	53.31	va
54	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8881	46.44	va
54	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10380	53.6	va
54	2013 Governor - Regular General	6292	Terry McAuliffe	D	7915	40.87	va
54	2013 Governor - Regular General	6292	Robert Sarvis	L	1018	5.26	va
54	2014 US Senator - Regular General	7053	Mark Warner	D	8094	40.76	va
54	2014 US Senator - Regular General	7053	Robert Sarvis	L	438	2.21	va
54	2014 US Senator - Regular General	7053	Ed Gillespie	R	11308	56.94	va
55	2012 US President - Regular General	6598	Barack Obama	D	15577	39.66	va
55	2012 US President - Regular General	6598	Mitt Romney	R	23093	58.8	va
55	2012 US President - Regular General	6598	Gary Johnson	L	334	0.85	va
55	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	124	0.32	va
55	2012 US President - Regular General	6598	Jill Stein	Green	78	0.2	va
55	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15471	59.56	va
55	2013 Attorney General - Regular General	6525	Mark Herring	D	10504	40.44	va
55	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13420	51.86	va
55	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12310	47.57	va
55	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14106	53.68	va
55	2013 Governor - Regular General	6292	Terry McAuliffe	D	9410	35.81	va
55	2013 Governor - Regular General	6292	Robert Sarvis	L	2447	9.31	va
55	2014 US Senator - Regular General	7053	Mark Warner	D	10122	39.13	va
55	2014 US Senator - Regular General	7053	Robert Sarvis	L	803	3.1	va
55	2014 US Senator - Regular General	7053	Ed Gillespie	R	14914	57.66	va
56	2012 US President - Regular General	6598	Barack Obama	D	14704	37.47	va
56	2012 US President - Regular General	6598	Mitt Romney	R	23992	61.13	va
56	2012 US President - Regular General	6598	Gary Johnson	L	265	0.68	va
56	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	137	0.35	va
56	2012 US President - Regular General	6598	Jill Stein	Green	88	0.22	va
56	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15890	62.02	va
56	2013 Attorney General - Regular General	6525	Mark Herring	D	9731	37.98	va
56	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13519	53.05	va
56	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11845	46.48	va
56	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14228	54.78	va
56	2013 Governor - Regular General	6292	Terry McAuliffe	D	8790	33.85	va
56	2013 Governor - Regular General	6292	Robert Sarvis	L	2643	10.18	va
56	2014 US Senator - Regular General	7053	Mark Warner	D	9785	37.34	va
56	2014 US Senator - Regular General	7053	Robert Sarvis	L	773	2.95	va
56	2014 US Senator - Regular General	7053	Ed Gillespie	R	15632	59.65	va
57	2012 US President - Regular General	6598	Barack Obama	D	26470	70.18	va
57	2012 US President - Regular General	6598	Mitt Romney	R	10509	27.86	va
57	2012 US President - Regular General	6598	Gary Johnson	L	400	1.06	va
57	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	87	0.23	va
57	2012 US President - Regular General	6598	Jill Stein	Green	161	0.43	va
57	2013 Attorney General - Regular General	6525	Mark Obenshain	R	5935	26.85	va
57	2013 Attorney General - Regular General	6525	Mark Herring	D	16171	73.15	va
57	2013 Lt. Governor - Regular General	6523	E W Jackson	R	5491	24.92	va
57	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	16466	74.72	va
57	2013 Governor - Regular General	6292	Ken Cuccinelli	R	4776	21.23	va
57	2013 Governor - Regular General	6292	Terry McAuliffe	D	15585	69.27	va
57	2013 Governor - Regular General	6292	Robert Sarvis	L	1928	8.57	va
57	2014 US Senator - Regular General	7053	Mark Warner	D	13836	69.79	va
57	2014 US Senator - Regular General	7053	Robert Sarvis	L	766	3.86	va
57	2014 US Senator - Regular General	7053	Ed Gillespie	R	5204	26.25	va
58	2012 US President - Regular General	6598	Barack Obama	D	15504	40.6	va
58	2012 US President - Regular General	6598	Mitt Romney	R	22053	57.75	va
58	2012 US President - Regular General	6598	Gary Johnson	L	326	0.85	va
58	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	141	0.37	va
58	2012 US President - Regular General	6598	Jill Stein	Green	90	0.24	va
58	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14362	58.04	va
58	2013 Attorney General - Regular General	6525	Mark Herring	D	10382	41.96	va
58	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13714	55.79	va
58	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10813	43.99	va
58	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12740	50.83	va
58	2013 Governor - Regular General	6292	Terry McAuliffe	D	9787	39.04	va
58	2013 Governor - Regular General	6292	Robert Sarvis	L	2358	9.41	va
58	2014 US Senator - Regular General	7053	Mark Warner	D	9609	39.33	va
58	2014 US Senator - Regular General	7053	Robert Sarvis	L	867	3.55	va
58	2014 US Senator - Regular General	7053	Ed Gillespie	R	13934	57.03	va
59	2012 US President - Regular General	6598	Barack Obama	D	14672	39.58	va
59	2012 US President - Regular General	6598	Mitt Romney	R	21789	58.78	va
59	2012 US President - Regular General	6598	Gary Johnson	L	230	0.62	va
59	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	242	0.65	va
59	2012 US President - Regular General	6598	Jill Stein	Green	81	0.22	va
59	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14341	63.78	va
59	2013 Attorney General - Regular General	6525	Mark Herring	D	8143	36.22	va
59	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12559	56.15	va
59	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9758	43.63	va
59	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13291	57.97	va
59	2013 Governor - Regular General	6292	Terry McAuliffe	D	7873	34.34	va
59	2013 Governor - Regular General	6292	Robert Sarvis	L	1655	7.22	va
59	2014 US Senator - Regular General	7053	Mark Warner	D	8368	38.2	va
59	2014 US Senator - Regular General	7053	Robert Sarvis	L	567	2.59	va
59	2014 US Senator - Regular General	7053	Ed Gillespie	R	12951	59.12	va
60	2012 US President - Regular General	6598	Barack Obama	D	16375	47.54	va
60	2012 US President - Regular General	6598	Mitt Romney	R	17567	51.0	va
60	2012 US President - Regular General	6598	Gary Johnson	L	147	0.43	va
60	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	225	0.65	va
60	2012 US President - Regular General	6598	Jill Stein	Green	86	0.25	va
60	2013 Attorney General - Regular General	6525	Mark Obenshain	R	11736	58.6	va
60	2013 Attorney General - Regular General	6525	Mark Herring	D	8291	41.4	va
60	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9820	49.32	va
60	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10048	50.46	va
60	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10948	52.52	va
60	2013 Governor - Regular General	6292	Terry McAuliffe	D	8426	40.42	va
60	2013 Governor - Regular General	6292	Robert Sarvis	L	1372	6.58	va
60	2014 US Senator - Regular General	7053	Mark Warner	D	9019	45.78	va
60	2014 US Senator - Regular General	7053	Robert Sarvis	L	347	1.76	va
60	2014 US Senator - Regular General	7053	Ed Gillespie	R	10324	52.41	va
61	2012 US President - Regular General	6598	Barack Obama	D	16859	44.71	va
61	2012 US President - Regular General	6598	Mitt Romney	R	20333	53.92	va
61	2012 US President - Regular General	6598	Gary Johnson	L	173	0.46	va
61	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	250	0.66	va
61	2012 US President - Regular General	6598	Jill Stein	Green	65	0.17	va
61	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12164	59.46	va
61	2013 Attorney General - Regular General	6525	Mark Herring	D	8295	40.54	va
61	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10730	52.45	va
61	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9695	47.39	va
61	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11448	54.45	va
61	2013 Governor - Regular General	6292	Terry McAuliffe	D	8204	39.02	va
61	2013 Governor - Regular General	6292	Robert Sarvis	L	1293	6.15	va
61	2014 US Senator - Regular General	7053	Mark Warner	D	8586	41.54	va
61	2014 US Senator - Regular General	7053	Robert Sarvis	L	446	2.16	va
61	2014 US Senator - Regular General	7053	Ed Gillespie	R	11625	56.24	va
62	2012 US President - Regular General	6598	Barack Obama	D	14826	45.81	va
62	2012 US President - Regular General	6598	Mitt Romney	R	17079	52.77	va
62	2012 US President - Regular General	6598	Gary Johnson	L	249	0.77	va
62	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	91	0.28	va
62	2012 US President - Regular General	6598	Jill Stein	Green	60	0.19	va
62	2013 Attorney General - Regular General	6525	Mark Obenshain	R	11292	55.37	va
62	2013 Attorney General - Regular General	6525	Mark Herring	D	9101	44.63	va
62	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9651	47.43	va
62	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10607	52.13	va
62	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10315	49.74	va
62	2013 Governor - Regular General	6292	Terry McAuliffe	D	8538	41.17	va
62	2013 Governor - Regular General	6292	Robert Sarvis	L	1755	8.46	va
62	2014 US Senator - Regular General	7053	Mark Warner	D	8669	44.79	va
62	2014 US Senator - Regular General	7053	Robert Sarvis	L	651	3.36	va
62	2014 US Senator - Regular General	7053	Ed Gillespie	R	10012	51.73	va
63	2012 US President - Regular General	6598	Barack Obama	D	26790	72.47	va
63	2012 US President - Regular General	6598	Mitt Romney	R	9865	26.69	va
63	2012 US President - Regular General	6598	Gary Johnson	L	125	0.34	va
63	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	79	0.21	va
63	2012 US President - Regular General	6598	Jill Stein	Green	48	0.13	va
63	2013 Attorney General - Regular General	6525	Mark Obenshain	R	5626	29.77	va
63	2013 Attorney General - Regular General	6525	Mark Herring	D	13270	70.22	va
63	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4912	25.97	va
63	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13964	73.83	va
63	2013 Governor - Regular General	6292	Ken Cuccinelli	R	5101	26.54	va
63	2013 Governor - Regular General	6292	Terry McAuliffe	D	13131	68.31	va
63	2013 Governor - Regular General	6292	Robert Sarvis	L	933	4.85	va
63	2014 US Senator - Regular General	7053	Mark Warner	D	12572	69.21	va
63	2014 US Senator - Regular General	7053	Robert Sarvis	L	304	1.67	va
63	2014 US Senator - Regular General	7053	Ed Gillespie	R	5263	28.97	va
64	2012 US President - Regular General	6598	Barack Obama	D	17080	41.06	va
64	2012 US President - Regular General	6598	Mitt Romney	R	24004	57.7	va
64	2012 US President - Regular General	6598	Gary Johnson	L	257	0.62	va
64	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	123	0.3	va
64	2012 US President - Regular General	6598	Jill Stein	Green	70	0.17	va
64	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15349	59.25	va
64	2013 Attorney General - Regular General	6525	Mark Herring	D	10558	40.75	va
64	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13490	52.07	va
64	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12348	47.66	va
64	2013 Governor - Regular General	6292	Ken Cuccinelli	R	14240	54.3	va
64	2013 Governor - Regular General	6292	Terry McAuliffe	D	10256	39.11	va
64	2013 Governor - Regular General	6292	Robert Sarvis	L	1628	6.21	va
64	2014 US Senator - Regular General	7053	Mark Warner	D	10518	41.1	va
64	2014 US Senator - Regular General	7053	Robert Sarvis	L	560	2.19	va
64	2014 US Senator - Regular General	7053	Ed Gillespie	R	14500	56.65	va
65	2012 US President - Regular General	6598	Barack Obama	D	14436	33.94	va
65	2012 US President - Regular General	6598	Mitt Romney	R	27419	64.46	va
65	2012 US President - Regular General	6598	Gary Johnson	L	383	0.9	va
65	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	140	0.33	va
65	2012 US President - Regular General	6598	Jill Stein	Green	80	0.19	va
65	2013 Attorney General - Regular General	6525	Mark Obenshain	R	18592	65.3	va
65	2013 Attorney General - Regular General	6525	Mark Herring	D	9881	34.7	va
65	2013 Lt. Governor - Regular General	6523	E W Jackson	R	16059	56.71	va
65	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12079	42.65	va
65	2013 Governor - Regular General	6292	Ken Cuccinelli	R	16835	58.23	va
65	2013 Governor - Regular General	6292	Terry McAuliffe	D	8919	30.85	va
65	2013 Governor - Regular General	6292	Robert Sarvis	L	2894	10.01	va
65	2014 US Senator - Regular General	7053	Mark Warner	D	9634	33.95	va
65	2014 US Senator - Regular General	7053	Robert Sarvis	L	994	3.5	va
65	2014 US Senator - Regular General	7053	Ed Gillespie	R	17735	62.5	va
48	2016 US President - Regular General	8666	Hillary Clinton	D	21159	68.97	va
48	2016 US President - Regular General	8666	Donald Trump	R	7472	24.36	va
48	2016 US President - Regular General	8666	Gary Johnson	L	992	3.23	va
48	2016 US President - Regular General	8666	Jill Stein	Green	227	0.74	va
48	2016 US President - Regular General	8666	Evan McMullin	I	829	2.7	va
47	2016 US President - Regular General	8666	Hillary Clinton	D	24613	73.59	va
47	2016 US President - Regular General	8666	Donald Trump	R	6447	19.28	va
47	2016 US President - Regular General	8666	Gary Johnson	L	1323	3.96	va
47	2016 US President - Regular General	8666	Jill Stein	Green	235	0.7	va
47	2016 US President - Regular General	8666	Evan McMullin	I	827	2.47	va
46	2016 US President - Regular General	8666	Hillary Clinton	D	20588	76.72	va
46	2016 US President - Regular General	8666	Donald Trump	R	4910	18.3	va
46	2016 US President - Regular General	8666	Gary Johnson	L	652	2.43	va
46	2016 US President - Regular General	8666	Jill Stein	Green	241	0.9	va
46	2016 US President - Regular General	8666	Evan McMullin	I	443	1.65	va
45	2016 US President - Regular General	8666	Hillary Clinton	D	27751	73.88	va
45	2016 US President - Regular General	8666	Donald Trump	R	7286	19.4	va
45	2016 US President - Regular General	8666	Gary Johnson	L	1219	3.25	va
45	2016 US President - Regular General	8666	Jill Stein	Green	293	0.78	va
45	2016 US President - Regular General	8666	Evan McMullin	I	1014	2.7	va
44	2016 US President - Regular General	8666	Hillary Clinton	D	18182	68.36	va
44	2016 US President - Regular General	8666	Donald Trump	R	7094	26.67	va
44	2016 US President - Regular General	8666	Gary Johnson	L	646	2.43	va
44	2016 US President - Regular General	8666	Jill Stein	Green	209	0.79	va
44	2016 US President - Regular General	8666	Evan McMullin	I	468	1.76	va
43	2016 US President - Regular General	8666	Hillary Clinton	D	22166	68.39	va
43	2016 US President - Regular General	8666	Donald Trump	R	8403	25.93	va
43	2016 US President - Regular General	8666	Gary Johnson	L	943	2.91	va
43	2016 US President - Regular General	8666	Jill Stein	Green	278	0.86	va
43	2016 US President - Regular General	8666	Evan McMullin	I	619	1.91	va
42	2016 US President - Regular General	8666	Hillary Clinton	D	18951	57.1	va
42	2016 US President - Regular General	8666	Donald Trump	R	12344	37.19	va
42	2016 US President - Regular General	8666	Gary Johnson	L	941	2.84	va
42	2016 US President - Regular General	8666	Jill Stein	Green	243	0.73	va
42	2016 US President - Regular General	8666	Evan McMullin	I	710	2.14	va
41	2016 US President - Regular General	8666	Hillary Clinton	D	21553	61.88	va
41	2016 US President - Regular General	8666	Donald Trump	R	11129	31.95	va
41	2016 US President - Regular General	8666	Gary Johnson	L	1127	3.24	va
41	2016 US President - Regular General	8666	Jill Stein	Green	273	0.78	va
41	2016 US President - Regular General	8666	Evan McMullin	I	751	2.16	va
40	2016 US President - Regular General	8666	Hillary Clinton	D	17363	51.3	va
40	2016 US President - Regular General	8666	Donald Trump	R	14504	42.85	va
40	2016 US President - Regular General	8666	Gary Johnson	L	1036	3.06	va
40	2016 US President - Regular General	8666	Jill Stein	Green	273	0.81	va
40	2016 US President - Regular General	8666	Evan McMullin	I	667	1.97	va
39	2016 US President - Regular General	8666	Hillary Clinton	D	21829	66.07	va
39	2016 US President - Regular General	8666	Donald Trump	R	9461	28.64	va
39	2016 US President - Regular General	8666	Gary Johnson	L	889	2.69	va
39	2016 US President - Regular General	8666	Jill Stein	Green	274	0.83	va
39	2016 US President - Regular General	8666	Evan McMullin	I	582	1.76	va
38	2016 US President - Regular General	8666	Hillary Clinton	D	18385	69.62	va
38	2016 US President - Regular General	8666	Donald Trump	R	6735	25.51	va
38	2016 US President - Regular General	8666	Gary Johnson	L	606	2.29	va
38	2016 US President - Regular General	8666	Jill Stein	Green	262	0.99	va
38	2016 US President - Regular General	8666	Evan McMullin	I	416	1.58	va
37	2016 US President - Regular General	8666	Hillary Clinton	D	19358	64.0	va
37	2016 US President - Regular General	8666	Donald Trump	R	8890	29.39	va
37	2016 US President - Regular General	8666	Gary Johnson	L	1066	3.52	va
37	2016 US President - Regular General	8666	Jill Stein	Green	317	1.05	va
37	2016 US President - Regular General	8666	Evan McMullin	I	616	2.04	va
36	2016 US President - Regular General	8666	Hillary Clinton	D	22330	68.03	va
36	2016 US President - Regular General	8666	Donald Trump	R	8532	25.99	va
36	2016 US President - Regular General	8666	Gary Johnson	L	1021	3.11	va
36	2016 US President - Regular General	8666	Jill Stein	Green	334	1.02	va
36	2016 US President - Regular General	8666	Evan McMullin	I	605	1.84	va
35	2016 US President - Regular General	8666	Hillary Clinton	D	20927	64.99	va
35	2016 US President - Regular General	8666	Donald Trump	R	9173	28.49	va
35	2016 US President - Regular General	8666	Gary Johnson	L	987	3.07	va
35	2016 US President - Regular General	8666	Jill Stein	Green	349	1.08	va
35	2016 US President - Regular General	8666	Evan McMullin	I	763	2.37	va
34	2016 US President - Regular General	8666	Hillary Clinton	D	19558	56.3	va
34	2016 US President - Regular General	8666	Donald Trump	R	13260	38.17	va
34	2016 US President - Regular General	8666	Gary Johnson	L	1019	2.93	va
34	2016 US President - Regular General	8666	Jill Stein	Green	228	0.66	va
34	2016 US President - Regular General	8666	Evan McMullin	I	674	1.94	va
33	2016 US President - Regular General	8666	Hillary Clinton	D	15844	39.25	va
33	2016 US President - Regular General	8666	Donald Trump	R	22102	54.76	va
33	2016 US President - Regular General	8666	Gary Johnson	L	1378	3.41	va
33	2016 US President - Regular General	8666	Jill Stein	Green	301	0.75	va
33	2016 US President - Regular General	8666	Evan McMullin	I	735	1.82	va
32	2016 US President - Regular General	8666	Hillary Clinton	D	21875	56.56	va
32	2016 US President - Regular General	8666	Donald Trump	R	14536	37.59	va
32	2016 US President - Regular General	8666	Gary Johnson	L	1204	3.11	va
32	2016 US President - Regular General	8666	Jill Stein	Green	265	0.69	va
32	2016 US President - Regular General	8666	Evan McMullin	I	794	2.05	va
48	2012 US Senator - Regular General	6575	Tim Kaine	D	21537	64.48	va
48	2012 US Senator - Regular General	6575	George Allen	R	11784	35.28	va
47	2012 US Senator - Regular General	6575	Tim Kaine	D	24013	69.01	va
47	2012 US Senator - Regular General	6575	George Allen	R	10697	30.74	va
46	2012 US Senator - Regular General	6575	Tim Kaine	D	21570	74.72	va
46	2012 US Senator - Regular General	6575	George Allen	R	7234	25.06	va
45	2012 US Senator - Regular General	6575	Tim Kaine	D	26367	69.74	va
45	2012 US Senator - Regular General	6575	George Allen	R	11369	30.07	va
44	2012 US Senator - Regular General	6575	Tim Kaine	D	18077	65.14	va
44	2012 US Senator - Regular General	6575	George Allen	R	9619	34.66	va
43	2012 US Senator - Regular General	6575	Tim Kaine	D	21492	65.88	va
43	2012 US Senator - Regular General	6575	George Allen	R	11067	33.92	va
42	2012 US Senator - Regular General	6575	Tim Kaine	D	17525	53.7	va
42	2012 US Senator - Regular General	6575	George Allen	R	15020	46.02	va
41	2012 US Senator - Regular General	6575	Tim Kaine	D	21700	59.34	va
41	2012 US Senator - Regular General	6575	George Allen	R	14759	40.36	va
40	2012 US Senator - Regular General	6575	Tim Kaine	D	17076	49.1	va
40	2012 US Senator - Regular General	6575	George Allen	R	17630	50.69	va
39	2012 US Senator - Regular General	6575	Tim Kaine	D	19558	62.72	va
39	2012 US Senator - Regular General	6575	George Allen	R	11552	37.05	va
38	2012 US Senator - Regular General	6575	Tim Kaine	D	17561	67.11	va
38	2012 US Senator - Regular General	6575	George Allen	R	8532	32.6	va
37	2012 US Senator - Regular General	6575	Tim Kaine	D	19295	61.06	va
37	2012 US Senator - Regular General	6575	George Allen	R	12228	38.7	va
36	2012 US Senator - Regular General	6575	Tim Kaine	D	22376	65.38	va
36	2012 US Senator - Regular General	6575	George Allen	R	11775	34.41	va
35	2012 US Senator - Regular General	6575	Tim Kaine	D	20719	61.26	va
35	2012 US Senator - Regular General	6575	George Allen	R	13031	38.53	va
34	2012 US Senator - Regular General	6575	Tim Kaine	D	19609	52.38	va
34	2012 US Senator - Regular General	6575	George Allen	R	17758	47.43	va
33	2012 US Senator - Regular General	6575	Tim Kaine	D	13679	43.72	va
33	2012 US Senator - Regular General	6575	George Allen	R	17555	56.11	va
32	2012 US Senator - Regular General	6575	Tim Kaine	D	15883	53.38	va
32	2012 US Senator - Regular General	6575	George Allen	R	13821	46.45	va
32	2012 US President - Regular General	6598	Barack Obama	D	15709	52.11	va
32	2012 US President - Regular General	6598	Mitt Romney	R	14045	46.59	va
32	2012 US President - Regular General	6598	Gary Johnson	L	230	0.76	va
32	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	41	0.14	va
32	2012 US President - Regular General	6598	Jill Stein	Green	71	0.24	va
32	2013 Attorney General - Regular General	6525	Mark Obenshain	R	9425	45.42	va
32	2013 Attorney General - Regular General	6525	Mark Herring	D	11325	54.58	va
32	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9039	43.64	va
32	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11623	56.11	va
32	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9177	43.83	va
32	2013 Governor - Regular General	6292	Terry McAuliffe	D	10697	51.09	va
32	2013 Governor - Regular General	6292	Robert Sarvis	L	1019	4.87	va
32	2014 US Senator - Regular General	7053	Mark Warner	D	11169	49.82	va
32	2014 US Senator - Regular General	7053	Robert Sarvis	L	462	2.06	va
32	2014 US Senator - Regular General	7053	Ed Gillespie	R	10766	48.02	va
33	2012 US President - Regular General	6598	Barack Obama	D	13196	41.69	va
33	2012 US President - Regular General	6598	Mitt Romney	R	17779	56.17	va
33	2012 US President - Regular General	6598	Gary Johnson	L	364	1.15	va
33	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	111	0.35	va
33	2012 US President - Regular General	6598	Jill Stein	Green	111	0.35	va
33	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13463	55.7	va
33	2013 Attorney General - Regular General	6525	Mark Herring	D	10708	44.3	va
33	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13048	54.17	va
33	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	10984	45.6	va
33	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13301	54.5	va
33	2013 Governor - Regular General	6292	Terry McAuliffe	D	9780	40.07	va
33	2013 Governor - Regular General	6292	Robert Sarvis	L	1272	5.21	va
33	2014 US Senator - Regular General	7053	Mark Warner	D	9829	38.9	va
33	2014 US Senator - Regular General	7053	Robert Sarvis	L	611	2.42	va
33	2014 US Senator - Regular General	7053	Ed Gillespie	R	14804	58.59	va
34	2012 US President - Regular General	6598	Barack Obama	D	18688	49.43	va
34	2012 US President - Regular General	6598	Mitt Romney	R	18688	49.43	va
34	2012 US President - Regular General	6598	Gary Johnson	L	266	0.7	va
34	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	32	0.08	va
34	2012 US President - Regular General	6598	Jill Stein	Green	58	0.15	va
34	2013 Attorney General - Regular General	6525	Mark Obenshain	R	11855	45.49	va
34	2013 Attorney General - Regular General	6525	Mark Herring	D	14206	54.51	va
34	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10932	42.24	va
34	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	14865	57.43	va
34	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11106	42.28	va
34	2013 Governor - Regular General	6292	Terry McAuliffe	D	13624	51.86	va
34	2013 Governor - Regular General	6292	Robert Sarvis	L	1464	5.57	va
34	2014 US Senator - Regular General	7053	Mark Warner	D	13778	51.24	va
34	2014 US Senator - Regular General	7053	Robert Sarvis	L	443	1.65	va
34	2014 US Senator - Regular General	7053	Ed Gillespie	R	12643	47.02	va
35	2012 US President - Regular General	6598	Barack Obama	D	20274	59.21	va
35	2012 US President - Regular General	6598	Mitt Romney	R	13443	39.26	va
35	2012 US President - Regular General	6598	Gary Johnson	L	319	0.93	va
35	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	39	0.11	va
35	2012 US President - Regular General	6598	Jill Stein	Green	87	0.25	va
35	2013 Attorney General - Regular General	6525	Mark Obenshain	R	7851	37.63	va
35	2013 Attorney General - Regular General	6525	Mark Herring	D	13010	62.37	va
35	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7118	34.29	va
35	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13571	65.37	va
35	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7326	34.81	va
35	2013 Governor - Regular General	6292	Terry McAuliffe	D	12494	59.36	va
35	2013 Governor - Regular General	6292	Robert Sarvis	L	1154	5.48	va
35	2014 US Senator - Regular General	7053	Mark Warner	D	12462	59.33	va
35	2014 US Senator - Regular General	7053	Robert Sarvis	L	455	2.17	va
35	2014 US Senator - Regular General	7053	Ed Gillespie	R	8072	38.43	va
36	2012 US President - Regular General	6598	Barack Obama	D	21974	63.46	va
36	2012 US President - Regular General	6598	Mitt Romney	R	12110	34.97	va
36	2012 US President - Regular General	6598	Gary Johnson	L	344	0.99	va
36	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	41	0.12	va
36	2012 US President - Regular General	6598	Jill Stein	Green	94	0.27	va
36	2013 Attorney General - Regular General	6525	Mark Obenshain	R	7033	32.12	va
36	2013 Attorney General - Regular General	6525	Mark Herring	D	14864	67.88	va
36	2013 Lt. Governor - Regular General	6523	E W Jackson	R	6545	29.99	va
36	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	15211	69.7	va
36	2013 Governor - Regular General	6292	Ken Cuccinelli	R	6546	29.63	va
36	2013 Governor - Regular General	6292	Terry McAuliffe	D	14308	64.77	va
36	2013 Governor - Regular General	6292	Robert Sarvis	L	1180	5.34	va
36	2014 US Senator - Regular General	7053	Mark Warner	D	14395	64.44	va
36	2014 US Senator - Regular General	7053	Robert Sarvis	L	518	2.32	va
36	2014 US Senator - Regular General	7053	Ed Gillespie	R	7410	33.17	va
37	2012 US President - Regular General	6598	Barack Obama	D	19161	59.78	va
37	2012 US President - Regular General	6598	Mitt Romney	R	12345	38.51	va
37	2012 US President - Regular General	6598	Gary Johnson	L	344	1.07	va
37	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	45	0.14	va
37	2012 US President - Regular General	6598	Jill Stein	Green	88	0.27	va
37	2013 Attorney General - Regular General	6525	Mark Obenshain	R	7254	40.16	va
37	2013 Attorney General - Regular General	6525	Mark Herring	D	10807	59.84	va
37	2013 Lt. Governor - Regular General	6523	E W Jackson	R	6723	37.31	va
37	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11220	62.27	va
37	2013 Governor - Regular General	6292	Ken Cuccinelli	R	6835	37.36	va
37	2013 Governor - Regular General	6292	Terry McAuliffe	D	10379	56.74	va
37	2013 Governor - Regular General	6292	Robert Sarvis	L	1013	5.54	va
37	2014 US Senator - Regular General	7053	Mark Warner	D	9936	56.02	va
37	2014 US Senator - Regular General	7053	Robert Sarvis	L	465	2.62	va
37	2014 US Senator - Regular General	7053	Ed Gillespie	R	7324	41.29	va
38	2012 US President - Regular General	6598	Barack Obama	D	17492	65.84	va
38	2012 US President - Regular General	6598	Mitt Romney	R	8677	32.66	va
38	2012 US President - Regular General	6598	Gary Johnson	L	218	0.82	va
38	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	36	0.14	va
38	2012 US President - Regular General	6598	Jill Stein	Green	91	0.34	va
38	2013 Attorney General - Regular General	6525	Mark Obenshain	R	5284	32.17	va
38	2013 Attorney General - Regular General	6525	Mark Herring	D	11141	67.83	va
38	2013 Lt. Governor - Regular General	6523	E W Jackson	R	4797	29.4	va
38	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11453	70.18	va
38	2013 Governor - Regular General	6292	Ken Cuccinelli	R	4985	30.1	va
38	2013 Governor - Regular General	6292	Terry McAuliffe	D	10716	64.71	va
38	2013 Governor - Regular General	6292	Robert Sarvis	L	821	4.96	va
38	2014 US Senator - Regular General	7053	Mark Warner	D	10236	63.29	va
38	2014 US Senator - Regular General	7053	Robert Sarvis	L	348	2.15	va
38	2014 US Senator - Regular General	7053	Ed Gillespie	R	5570	34.44	va
39	2012 US President - Regular General	6598	Barack Obama	D	19392	61.5	va
39	2012 US President - Regular General	6598	Mitt Romney	R	11694	37.08	va
39	2012 US President - Regular General	6598	Gary Johnson	L	236	0.75	va
39	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	63	0.2	va
39	2012 US President - Regular General	6598	Jill Stein	Green	78	0.25	va
39	2013 Attorney General - Regular General	6525	Mark Obenshain	R	8124	38.26	va
39	2013 Attorney General - Regular General	6525	Mark Herring	D	13107	61.74	va
39	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7403	35.04	va
39	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13650	64.62	va
39	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7680	35.81	va
39	2013 Governor - Regular General	6292	Terry McAuliffe	D	12620	58.84	va
39	2013 Governor - Regular General	6292	Robert Sarvis	L	1083	5.05	va
39	2014 US Senator - Regular General	7053	Mark Warner	D	12326	58.87	va
39	2014 US Senator - Regular General	7053	Robert Sarvis	L	460	2.2	va
39	2014 US Senator - Regular General	7053	Ed Gillespie	R	8136	38.86	va
40	2012 US President - Regular General	6598	Barack Obama	D	16842	47.38	va
40	2012 US President - Regular General	6598	Mitt Romney	R	18261	51.38	va
40	2012 US President - Regular General	6598	Gary Johnson	L	285	0.8	va
40	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	42	0.12	va
40	2012 US President - Regular General	6598	Jill Stein	Green	59	0.17	va
40	2013 Attorney General - Regular General	6525	Mark Obenshain	R	11939	53.36	va
40	2013 Attorney General - Regular General	6525	Mark Herring	D	10435	46.64	va
40	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11221	50.28	va
40	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11026	49.41	va
40	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11441	50.72	va
40	2013 Governor - Regular General	6292	Terry McAuliffe	D	9927	44.01	va
40	2013 Governor - Regular General	6292	Robert Sarvis	L	1137	5.04	va
40	2014 US Senator - Regular General	7053	Mark Warner	D	10276	43.47	va
40	2014 US Senator - Regular General	7053	Robert Sarvis	L	480	2.03	va
40	2014 US Senator - Regular General	7053	Ed Gillespie	R	12858	54.39	va
41	2012 US President - Regular General	6598	Barack Obama	D	21227	57.44	va
41	2012 US President - Regular General	6598	Mitt Romney	R	15105	40.87	va
41	2012 US President - Regular General	6598	Gary Johnson	L	382	1.03	va
41	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	63	0.17	va
41	2012 US President - Regular General	6598	Jill Stein	Green	112	0.3	va
41	2013 Attorney General - Regular General	6525	Mark Obenshain	R	9771	40.61	va
41	2013 Attorney General - Regular General	6525	Mark Herring	D	14289	59.39	va
41	2013 Lt. Governor - Regular General	6523	E W Jackson	R	8974	37.33	va
41	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	14966	62.26	va
41	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9309	38.21	va
41	2013 Governor - Regular General	6292	Terry McAuliffe	D	13693	56.21	va
41	2013 Governor - Regular General	6292	Robert Sarvis	L	1280	5.25	va
41	2014 US Senator - Regular General	7053	Mark Warner	D	13259	55.41	va
41	2014 US Senator - Regular General	7053	Robert Sarvis	L	526	2.2	va
41	2014 US Senator - Regular General	7053	Ed Gillespie	R	10125	42.31	va
42	2012 US President - Regular General	6598	Barack Obama	D	17207	52.23	va
42	2012 US President - Regular General	6598	Mitt Romney	R	15311	46.47	va
42	2012 US President - Regular General	6598	Gary Johnson	L	234	0.71	va
42	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	51	0.15	va
42	2012 US President - Regular General	6598	Jill Stein	Green	74	0.22	va
42	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10968	46.94	va
42	2013 Attorney General - Regular General	6525	Mark Herring	D	12400	53.06	va
42	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10003	42.89	va
42	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13211	56.65	va
42	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10384	43.99	va
42	2013 Governor - Regular General	6292	Terry McAuliffe	D	11903	50.42	va
42	2013 Governor - Regular General	6292	Robert Sarvis	L	1244	5.27	va
42	2014 US Senator - Regular General	7053	Mark Warner	D	11809	50.38	va
42	2014 US Senator - Regular General	7053	Robert Sarvis	L	449	1.92	va
42	2014 US Senator - Regular General	7053	Ed Gillespie	R	11162	47.62	va
43	2012 US President - Regular General	6598	Barack Obama	D	21745	64.55	va
43	2012 US President - Regular General	6598	Mitt Romney	R	11445	33.97	va
43	2012 US President - Regular General	6598	Gary Johnson	L	273	0.81	va
43	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	57	0.17	va
43	2012 US President - Regular General	6598	Jill Stein	Green	108	0.32	va
43	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6783	34.1	va
43	2013 Attorney General - Regular General	6525	Mark Herring	D	13110	65.9	va
43	2013 Lt. Governor - Regular General	6523	E W Jackson	R	6185	31.18	va
43	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13578	68.45	va
43	2013 Governor - Regular General	6292	Ken Cuccinelli	R	6385	31.82	va
43	2013 Governor - Regular General	6292	Terry McAuliffe	D	12681	63.19	va
43	2013 Governor - Regular General	6292	Robert Sarvis	L	934	4.65	va
43	2014 US Senator - Regular General	7053	Mark Warner	D	12644	63.18	va
43	2014 US Senator - Regular General	7053	Robert Sarvis	L	431	2.15	va
43	2014 US Senator - Regular General	7053	Ed Gillespie	R	6921	34.58	va
44	2012 US President - Regular General	6598	Barack Obama	D	18068	64.42	va
44	2012 US President - Regular General	6598	Mitt Romney	R	9651	34.41	va
44	2012 US President - Regular General	6598	Gary Johnson	L	179	0.64	va
44	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	38	0.14	va
44	2012 US President - Regular General	6598	Jill Stein	Green	52	0.19	va
44	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6489	35.7	va
44	2013 Attorney General - Regular General	6525	Mark Herring	D	11689	64.3	va
44	2013 Lt. Governor - Regular General	6523	E W Jackson	R	5908	32.66	va
44	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	12089	66.83	va
44	2013 Governor - Regular General	6292	Ken Cuccinelli	R	6061	33.08	va
44	2013 Governor - Regular General	6292	Terry McAuliffe	D	11301	61.68	va
44	2013 Governor - Regular General	6292	Robert Sarvis	L	897	4.9	va
44	2014 US Senator - Regular General	7053	Mark Warner	D	11304	61.37	va
44	2014 US Senator - Regular General	7053	Robert Sarvis	L	317	1.72	va
44	2014 US Senator - Regular General	7053	Ed Gillespie	R	6784	36.83	va
45	2012 US President - Regular General	6598	Barack Obama	D	25863	67.43	va
45	2012 US President - Regular General	6598	Mitt Romney	R	11929	31.1	va
45	2012 US President - Regular General	6598	Gary Johnson	L	353	0.92	va
45	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	43	0.11	va
45	2012 US President - Regular General	6598	Jill Stein	Green	93	0.24	va
45	2013 Attorney General - Regular General	6525	Mark Obenshain	R	7379	27.1	va
45	2013 Attorney General - Regular General	6525	Mark Herring	D	19847	72.9	va
45	2013 Lt. Governor - Regular General	6523	E W Jackson	R	6403	23.64	va
45	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	20451	75.52	va
45	2013 Governor - Regular General	6292	Ken Cuccinelli	R	6582	23.87	va
45	2013 Governor - Regular General	6292	Terry McAuliffe	D	19244	69.8	va
45	2013 Governor - Regular General	6292	Robert Sarvis	L	1595	5.79	va
45	2014 US Senator - Regular General	7053	Mark Warner	D	19259	68.91	va
45	2014 US Senator - Regular General	7053	Robert Sarvis	L	625	2.24	va
45	2014 US Senator - Regular General	7053	Ed Gillespie	R	8027	28.72	va
46	2012 US President - Regular General	6598	Barack Obama	D	21626	73.65	va
46	2012 US President - Regular General	6598	Mitt Romney	R	7322	24.94	va
46	2012 US President - Regular General	6598	Gary Johnson	L	232	0.79	va
46	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	42	0.14	va
46	2012 US President - Regular General	6598	Jill Stein	Green	90	0.31	va
46	2013 Attorney General - Regular General	6525	Mark Obenshain	R	4220	24.8	va
46	2013 Attorney General - Regular General	6525	Mark Herring	D	12795	75.2	va
46	2013 Lt. Governor - Regular General	6523	E W Jackson	R	3798	22.41	va
46	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13047	76.98	va
46	2013 Governor - Regular General	6292	Ken Cuccinelli	R	3880	22.56	va
46	2013 Governor - Regular General	6292	Terry McAuliffe	D	12546	72.93	va
46	2013 Governor - Regular General	6292	Robert Sarvis	L	704	4.09	va
46	2014 US Senator - Regular General	7053	Mark Warner	D	11871	71.11	va
46	2014 US Senator - Regular General	7053	Robert Sarvis	L	367	2.2	va
46	2014 US Senator - Regular General	7053	Ed Gillespie	R	4443	26.61	va
47	2012 US President - Regular General	6598	Barack Obama	D	23361	66.17	va
47	2012 US President - Regular General	6598	Mitt Romney	R	11269	31.92	va
47	2012 US President - Regular General	6598	Gary Johnson	L	455	1.29	va
47	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	39	0.11	va
47	2012 US President - Regular General	6598	Jill Stein	Green	119	0.34	va
47	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6236	25.6	va
47	2013 Attorney General - Regular General	6525	Mark Herring	D	18120	74.39	va
47	2013 Lt. Governor - Regular General	6523	E W Jackson	R	5541	22.82	va
47	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	18591	76.58	va
47	2013 Governor - Regular General	6292	Ken Cuccinelli	R	5615	22.7	va
47	2013 Governor - Regular General	6292	Terry McAuliffe	D	17483	70.67	va
47	2013 Governor - Regular General	6292	Robert Sarvis	L	1538	6.22	va
47	2014 US Senator - Regular General	7053	Mark Warner	D	17586	70.73	va
47	2014 US Senator - Regular General	7053	Robert Sarvis	L	691	2.78	va
47	2014 US Senator - Regular General	7053	Ed Gillespie	R	6557	26.37	va
48	2012 US President - Regular General	6598	Barack Obama	D	20775	61.5	va
48	2012 US President - Regular General	6598	Mitt Romney	R	12506	37.02	va
48	2012 US President - Regular General	6598	Gary Johnson	L	298	0.88	va
48	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	38	0.11	va
48	2012 US President - Regular General	6598	Jill Stein	Green	109	0.32	va
48	2013 Attorney General - Regular General	6525	Mark Obenshain	R	7874	31.35	va
48	2013 Attorney General - Regular General	6525	Mark Herring	D	17242	68.65	va
48	2013 Lt. Governor - Regular General	6523	E W Jackson	R	7014	28.07	va
48	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	17810	71.29	va
48	2013 Governor - Regular General	6292	Ken Cuccinelli	R	7165	28.17	va
48	2013 Governor - Regular General	6292	Terry McAuliffe	D	16572	65.14	va
48	2013 Governor - Regular General	6292	Robert Sarvis	L	1576	6.2	va
48	2014 US Senator - Regular General	7053	Mark Warner	D	16616	64.91	va
48	2014 US Senator - Regular General	7053	Robert Sarvis	L	479	1.87	va
48	2014 US Senator - Regular General	7053	Ed Gillespie	R	8478	33.12	va
31	2016 US President - Regular General	8666	Hillary Clinton	D	17348	50.91	va
31	2016 US President - Regular General	8666	Donald Trump	R	15048	44.16	va
31	2016 US President - Regular General	8666	Gary Johnson	L	908	2.66	va
31	2016 US President - Regular General	8666	Jill Stein	Green	239	0.7	va
31	2016 US President - Regular General	8666	Evan McMullin	I	529	1.55	va
30	2016 US President - Regular General	8666	Hillary Clinton	D	12093	34.31	va
30	2016 US President - Regular General	8666	Donald Trump	R	21675	61.5	va
30	2016 US President - Regular General	8666	Gary Johnson	L	859	2.44	va
30	2016 US President - Regular General	8666	Jill Stein	Green	246	0.7	va
30	2016 US President - Regular General	8666	Evan McMullin	I	371	1.05	va
29	2016 US President - Regular General	8666	Hillary Clinton	D	11321	32.55	va
29	2016 US President - Regular General	8666	Donald Trump	R	21680	62.33	va
29	2016 US President - Regular General	8666	Gary Johnson	L	1084	3.12	va
29	2016 US President - Regular General	8666	Jill Stein	Green	284	0.82	va
29	2016 US President - Regular General	8666	Evan McMullin	I	411	1.18	va
28	2016 US President - Regular General	8666	Hillary Clinton	D	14948	45.3	va
28	2016 US President - Regular General	8666	Donald Trump	R	16186	49.06	va
28	2016 US President - Regular General	8666	Gary Johnson	L	1074	3.26	va
28	2016 US President - Regular General	8666	Jill Stein	Green	294	0.89	va
28	2016 US President - Regular General	8666	Evan McMullin	I	492	1.49	va
27	2016 US President - Regular General	8666	Hillary Clinton	D	17968	45.31	va
27	2016 US President - Regular General	8666	Donald Trump	R	19291	48.64	va
27	2016 US President - Regular General	8666	Gary Johnson	L	1564	3.94	va
27	2016 US President - Regular General	8666	Jill Stein	Green	277	0.7	va
27	2016 US President - Regular General	8666	Evan McMullin	I	558	1.41	va
26	2016 US President - Regular General	8666	Hillary Clinton	D	12836	42.32	va
26	2016 US President - Regular General	8666	Donald Trump	R	15443	50.92	va
26	2016 US President - Regular General	8666	Gary Johnson	L	1182	3.9	va
26	2016 US President - Regular General	8666	Jill Stein	Green	334	1.1	va
26	2016 US President - Regular General	8666	Evan McMullin	I	531	1.75	va
25	2016 US President - Regular General	8666	Hillary Clinton	D	13952	35.49	va
25	2016 US President - Regular General	8666	Donald Trump	R	23129	58.84	va
25	2016 US President - Regular General	8666	Gary Johnson	L	1289	3.28	va
25	2016 US President - Regular General	8666	Jill Stein	Green	244	0.62	va
25	2016 US President - Regular General	8666	Evan McMullin	I	693	1.76	va
24	2016 US President - Regular General	8666	Hillary Clinton	D	9849	29.65	va
24	2016 US President - Regular General	8666	Donald Trump	R	21755	65.5	va
24	2016 US President - Regular General	8666	Gary Johnson	L	849	2.56	va
24	2016 US President - Regular General	8666	Jill Stein	Green	179	0.54	va
24	2016 US President - Regular General	8666	Evan McMullin	I	582	1.75	va
7	2016 US President - Regular General	8666	Hillary Clinton	D	10982	31.37	va
7	2016 US President - Regular General	8666	Donald Trump	R	22190	63.39	va
7	2016 US President - Regular General	8666	Gary Johnson	L	1065	3.04	va
7	2016 US President - Regular General	8666	Jill Stein	Green	285	0.81	va
7	2016 US President - Regular General	8666	Evan McMullin	I	483	1.38	va
6	2016 US President - Regular General	8666	Hillary Clinton	D	6423	20.07	va
6	2016 US President - Regular General	8666	Donald Trump	R	24581	76.8	va
6	2016 US President - Regular General	8666	Gary Johnson	L	615	1.92	va
6	2016 US President - Regular General	8666	Jill Stein	Green	141	0.44	va
6	2016 US President - Regular General	8666	Evan McMullin	I	245	0.77	va
5	2016 US President - Regular General	8666	Hillary Clinton	D	6440	20.42	va
5	2016 US President - Regular General	8666	Donald Trump	R	24059	76.27	va
5	2016 US President - Regular General	8666	Gary Johnson	L	600	1.9	va
5	2016 US President - Regular General	8666	Jill Stein	Green	156	0.49	va
5	2016 US President - Regular General	8666	Evan McMullin	I	286	0.91	va
4	2016 US President - Regular General	8666	Hillary Clinton	D	5962	19.69	va
4	2016 US President - Regular General	8666	Donald Trump	R	23449	77.43	va
4	2016 US President - Regular General	8666	Gary Johnson	L	490	1.62	va
4	2016 US President - Regular General	8666	Jill Stein	Green	127	0.42	va
4	2016 US President - Regular General	8666	Evan McMullin	I	252	0.83	va
3	2016 US President - Regular General	8666	Hillary Clinton	D	4655	15.6	va
3	2016 US President - Regular General	8666	Donald Trump	R	24474	82.0	va
3	2016 US President - Regular General	8666	Gary Johnson	L	426	1.43	va
3	2016 US President - Regular General	8666	Jill Stein	Green	93	0.31	va
3	2016 US President - Regular General	8666	Evan McMullin	I	198	0.66	va
2	2016 US President - Regular General	8666	Hillary Clinton	D	15629	55.84	va
2	2016 US President - Regular General	8666	Donald Trump	R	11009	39.33	va
2	2016 US President - Regular General	8666	Gary Johnson	L	786	2.81	va
2	2016 US President - Regular General	8666	Jill Stein	Green	226	0.81	va
2	2016 US President - Regular General	8666	Evan McMullin	I	339	1.21	va
1	2016 US President - Regular General	8666	Hillary Clinton	D	4916	17.24	va
1	2016 US President - Regular General	8666	Donald Trump	R	22947	80.49	va
1	2016 US President - Regular General	8666	Gary Johnson	L	365	1.28	va
1	2016 US President - Regular General	8666	Jill Stein	Green	127	0.45	va
1	2016 US President - Regular General	8666	Evan McMullin	I	155	0.54	va
31	2012 US Senator - Regular General	6575	Tim Kaine	D	18694	53.48	va
31	2012 US Senator - Regular General	6575	George Allen	R	16199	46.35	va
31	2012 US President - Regular General	6598	Barack Obama	D	18634	52.74	va
31	2012 US President - Regular General	6598	Mitt Romney	R	16194	45.84	va
31	2012 US President - Regular General	6598	Gary Johnson	L	269	0.76	va
31	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	65	0.18	va
31	2012 US President - Regular General	6598	Jill Stein	Green	96	0.27	va
31	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10632	48.68	va
31	2013 Attorney General - Regular General	6525	Mark Herring	D	11209	51.32	va
30	2012 US Senator - Regular General	6575	Tim Kaine	D	15171	43.17	va
30	2012 US Senator - Regular General	6575	George Allen	R	19897	56.62	va
29	2012 US Senator - Regular General	6575	Tim Kaine	D	13767	41.14	va
29	2012 US Senator - Regular General	6575	George Allen	R	19630	58.66	va
28	2012 US Senator - Regular General	6575	Tim Kaine	D	16708	50.79	va
28	2012 US Senator - Regular General	6575	George Allen	R	16085	48.9	va
27	2012 US Senator - Regular General	6575	Tim Kaine	D	18600	47.71	va
27	2012 US Senator - Regular General	6575	George Allen	R	20299	52.07	va
26	2012 US Senator - Regular General	6575	Tim Kaine	D	12311	43.61	va
26	2012 US Senator - Regular General	6575	George Allen	R	15874	56.23	va
25	2012 US Senator - Regular General	6575	Tim Kaine	D	14327	38.77	va
25	2012 US Senator - Regular General	6575	George Allen	R	22585	61.12	va
24	2012 US Senator - Regular General	6575	Tim Kaine	D	13441	38.31	va
24	2012 US Senator - Regular General	6575	George Allen	R	21590	61.54	va
7	2012 US Senator - Regular General	6575	Tim Kaine	D	13388	40.67	va
7	2012 US Senator - Regular General	6575	George Allen	R	19485	59.19	va
6	2012 US Senator - Regular General	6575	Tim Kaine	D	10966	34.16	va
6	2012 US Senator - Regular General	6575	George Allen	R	21049	65.58	va
5	2012 US Senator - Regular General	6575	Tim Kaine	D	11021	33.22	va
5	2012 US Senator - Regular General	6575	George Allen	R	22121	66.69	va
4	2012 US Senator - Regular General	6575	Tim Kaine	D	10729	34.21	va
4	2012 US Senator - Regular General	6575	George Allen	R	20610	65.72	va
3	2012 US Senator - Regular General	6575	Tim Kaine	D	9184	28.52	va
3	2012 US Senator - Regular General	6575	George Allen	R	23004	71.43	va
2	2012 US Senator - Regular General	6575	Tim Kaine	D	16294	58.74	va
2	2012 US Senator - Regular General	6575	George Allen	R	11376	41.01	va
1	2012 US Senator - Regular General	6575	Tim Kaine	D	8990	29.61	va
1	2012 US Senator - Regular General	6575	George Allen	R	21341	70.3	va
1	2012 US President - Regular General	6598	Barack Obama	D	7926	25.83	va
1	2012 US President - Regular General	6598	Mitt Romney	R	22280	72.62	va
1	2012 US President - Regular General	6598	Gary Johnson	L	175	0.57	va
1	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	154	0.5	va
1	2012 US President - Regular General	6598	Jill Stein	Green	70	0.23	va
1	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12300	76.02	va
1	2013 Attorney General - Regular General	6525	Mark Herring	D	3879	23.98	va
1	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11698	73.39	va
1	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	4209	26.41	va
1	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11780	72.22	va
1	2013 Governor - Regular General	6292	Terry McAuliffe	D	4053	24.85	va
1	2013 Governor - Regular General	6292	Robert Sarvis	L	438	2.69	va
1	2014 US Senator - Regular General	7053	Mark Warner	D	5197	30.76	va
1	2014 US Senator - Regular General	7053	Robert Sarvis	L	269	1.59	va
1	2014 US Senator - Regular General	7053	Ed Gillespie	R	11420	67.59	va
2	2012 US President - Regular General	6598	Barack Obama	D	16381	58.32	va
2	2012 US President - Regular General	6598	Mitt Romney	R	11328	40.33	va
2	2012 US President - Regular General	6598	Gary Johnson	L	214	0.76	va
2	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	59	0.21	va
2	2012 US President - Regular General	6598	Jill Stein	Green	48	0.17	va
2	2013 Attorney General - Regular General	6525	Mark Obenshain	R	6855	44.36	va
2	2013 Attorney General - Regular General	6525	Mark Herring	D	8597	55.64	va
2	2013 Lt. Governor - Regular General	6523	E W Jackson	R	6504	42.08	va
2	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8903	57.6	va
2	2013 Governor - Regular General	6292	Ken Cuccinelli	R	6553	42.07	va
2	2013 Governor - Regular General	6292	Terry McAuliffe	D	8304	53.31	va
2	2013 Governor - Regular General	6292	Robert Sarvis	L	690	4.43	va
2	2014 US Senator - Regular General	7053	Mark Warner	D	8605	52.35	va
2	2014 US Senator - Regular General	7053	Robert Sarvis	L	309	1.88	va
2	2014 US Senator - Regular General	7053	Ed Gillespie	R	7509	45.68	va
3	2012 US President - Regular General	6598	Barack Obama	D	7998	24.83	va
3	2012 US President - Regular General	6598	Mitt Romney	R	23768	73.8	va
3	2012 US President - Regular General	6598	Gary Johnson	L	171	0.53	va
3	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	160	0.5	va
3	2012 US President - Regular General	6598	Jill Stein	Green	65	0.2	va
3	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12430	72.5	va
3	2013 Attorney General - Regular General	6525	Mark Herring	D	4713	27.49	va
3	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12072	70.79	va
3	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	4954	29.05	va
3	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12624	71.36	va
3	2013 Governor - Regular General	6292	Terry McAuliffe	D	4481	25.33	va
3	2014 US Senator - Regular General	7053	Mark Warner	D	5188	30.45	va
3	2014 US Senator - Regular General	7053	Robert Sarvis	L	212	1.24	va
3	2014 US Senator - Regular General	7053	Ed Gillespie	R	11618	68.2	va
4	2012 US President - Regular General	6598	Barack Obama	D	9564	30.07	va
4	2012 US President - Regular General	6598	Mitt Romney	R	21684	68.18	va
4	2012 US President - Regular General	6598	Gary Johnson	L	202	0.64	va
4	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	204	0.64	va
4	2012 US President - Regular General	6598	Jill Stein	Green	69	0.22	va
4	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12186	70.31	va
4	2013 Attorney General - Regular General	6525	Mark Herring	D	5146	29.69	va
4	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11541	67.67	va
4	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	5486	32.17	va
4	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11650	66.28	va
4	2013 Governor - Regular General	6292	Terry McAuliffe	D	5289	30.09	va
4	2013 Governor - Regular General	6292	Robert Sarvis	L	579	3.29	va
4	2014 US Senator - Regular General	7053	Mark Warner	D	6067	34.88	va
4	2014 US Senator - Regular General	7053	Robert Sarvis	L	261	1.5	va
4	2014 US Senator - Regular General	7053	Ed Gillespie	R	11028	63.4	va
5	2012 US President - Regular General	6598	Barack Obama	D	9824	29.32	va
5	2012 US President - Regular General	6598	Mitt Romney	R	22997	68.63	va
5	2012 US President - Regular General	6598	Gary Johnson	L	259	0.77	va
5	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	272	0.81	va
5	2012 US President - Regular General	6598	Jill Stein	Green	99	0.3	va
5	2013 Attorney General - Regular General	6525	Mark Obenshain	R	14433	72.66	va
5	2013 Attorney General - Regular General	6525	Mark Herring	D	5430	27.34	va
5	2013 Lt. Governor - Regular General	6523	E W Jackson	R	13384	68.42	va
5	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	6149	31.43	va
5	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13503	66.97	va
5	2013 Governor - Regular General	6292	Terry McAuliffe	D	5632	27.93	va
5	2013 Governor - Regular General	6292	Robert Sarvis	L	976	4.84	va
5	2014 US Senator - Regular General	7053	Mark Warner	D	6159	32.5	va
5	2014 US Senator - Regular General	7053	Robert Sarvis	L	393	2.07	va
5	2014 US Senator - Regular General	7053	Ed Gillespie	R	12373	65.29	va
6	2012 US President - Regular General	6598	Barack Obama	D	10156	31.1	va
6	2012 US President - Regular General	6598	Mitt Romney	R	21616	66.2	va
6	2012 US President - Regular General	6598	Gary Johnson	L	242	0.74	va
6	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	448	1.37	va
6	2012 US President - Regular General	6598	Jill Stein	Green	136	0.42	va
6	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13931	70.2	va
6	2013 Attorney General - Regular General	6525	Mark Herring	D	5913	29.8	va
6	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12461	63.3	va
6	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	7168	36.41	va
6	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12774	63.52	va
6	2013 Governor - Regular General	6292	Terry McAuliffe	D	5785	28.77	va
6	2013 Governor - Regular General	6292	Robert Sarvis	L	1449	7.21	va
6	2014 US Senator - Regular General	7053	Mark Warner	D	6174	34.02	va
6	2014 US Senator - Regular General	7053	Robert Sarvis	L	457	2.52	va
6	2014 US Senator - Regular General	7053	Ed Gillespie	R	11496	63.34	va
7	2012 US President - Regular General	6598	Barack Obama	D	12392	37.11	va
7	2012 US President - Regular General	6598	Mitt Romney	R	20055	60.05	va
7	2012 US President - Regular General	6598	Gary Johnson	L	388	1.16	va
7	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	370	1.11	va
7	2012 US President - Regular General	6598	Jill Stein	Green	139	0.42	va
7	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12822	64.74	va
7	2013 Attorney General - Regular General	6525	Mark Herring	D	6982	35.25	va
7	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10952	55.52	va
7	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8724	44.22	va
7	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11321	56.4	va
7	2013 Governor - Regular General	6292	Terry McAuliffe	D	6666	33.21	va
7	2013 Governor - Regular General	6292	Robert Sarvis	L	1964	9.78	va
7	2014 US Senator - Regular General	7053	Mark Warner	D	8005	40.47	va
7	2014 US Senator - Regular General	7053	Robert Sarvis	L	635	3.21	va
7	2014 US Senator - Regular General	7053	Ed Gillespie	R	11118	56.21	va
24	2012 US President - Regular General	6598	Barack Obama	D	12926	37.03	va
24	2012 US President - Regular General	6598	Mitt Romney	R	21379	61.24	va
24	2012 US President - Regular General	6598	Gary Johnson	L	264	0.76	va
24	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	204	0.58	va
24	2012 US President - Regular General	6598	Jill Stein	Green	77	0.22	va
24	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13435	65.25	va
24	2013 Attorney General - Regular General	6525	Mark Herring	D	7154	34.75	va
24	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11457	56.08	va
24	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	8931	43.72	va
24	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12309	58.77	va
24	2013 Governor - Regular General	6292	Terry McAuliffe	D	6980	33.32	va
24	2013 Governor - Regular General	6292	Robert Sarvis	L	1531	7.31	va
24	2014 US Senator - Regular General	7053	Mark Warner	D	7700	37.68	va
24	2014 US Senator - Regular General	7053	Robert Sarvis	L	502	2.46	va
24	2014 US Senator - Regular General	7053	Ed Gillespie	R	12220	59.81	va
25	2012 US President - Regular General	6598	Barack Obama	D	13758	37.17	va
25	2012 US President - Regular General	6598	Mitt Romney	R	22656	61.22	va
25	2012 US President - Regular General	6598	Gary Johnson	L	332	0.9	va
25	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	134	0.36	va
25	2012 US President - Regular General	6598	Jill Stein	Green	86	0.23	va
25	2013 Attorney General - Regular General	6525	Mark Obenshain	R	15753	63.2	va
25	2013 Attorney General - Regular General	6525	Mark Herring	D	9173	36.8	va
25	2013 Lt. Governor - Regular General	6523	E W Jackson	R	14615	59.43	va
25	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9911	40.3	va
25	2013 Governor - Regular General	6292	Ken Cuccinelli	R	13962	55.47	va
25	2013 Governor - Regular General	6292	Terry McAuliffe	D	9052	35.96	va
25	2013 Governor - Regular General	6292	Robert Sarvis	L	1970	7.83	va
25	2014 US Senator - Regular General	7053	Mark Warner	D	8838	36.71	va
25	2014 US Senator - Regular General	7053	Robert Sarvis	L	722	3.0	va
25	2014 US Senator - Regular General	7053	Ed Gillespie	R	14498	60.23	va
26	2012 US President - Regular General	6598	Barack Obama	D	12480	43.4	va
26	2012 US President - Regular General	6598	Mitt Romney	R	15661	54.46	va
26	2012 US President - Regular General	6598	Gary Johnson	L	346	1.2	va
26	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	78	0.27	va
26	2012 US President - Regular General	6598	Jill Stein	Green	121	0.42	va
26	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10489	62.96	va
26	2013 Attorney General - Regular General	6525	Mark Herring	D	6170	37.04	va
26	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9679	58.77	va
26	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	6732	40.88	va
26	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9188	54.77	va
26	2013 Governor - Regular General	6292	Terry McAuliffe	D	6388	38.08	va
26	2013 Governor - Regular General	6292	Robert Sarvis	L	1118	6.66	va
26	2014 US Senator - Regular General	7053	Mark Warner	D	5917	38.29	va
26	2014 US Senator - Regular General	7053	Robert Sarvis	L	537	3.47	va
26	2014 US Senator - Regular General	7053	Ed Gillespie	R	8987	58.15	va
27	2012 US President - Regular General	6598	Barack Obama	D	17695	45.03	va
27	2012 US President - Regular General	6598	Mitt Romney	R	20953	53.33	va
27	2012 US President - Regular General	6598	Gary Johnson	L	376	0.96	va
27	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	114	0.29	va
27	2012 US President - Regular General	6598	Jill Stein	Green	82	0.21	va
27	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13763	54.78	va
27	2013 Attorney General - Regular General	6525	Mark Herring	D	11362	45.22	va
27	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11678	46.66	va
27	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	13172	52.63	va
27	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12298	48.32	va
27	2013 Governor - Regular General	6292	Terry McAuliffe	D	10287	40.42	va
27	2013 Governor - Regular General	6292	Robert Sarvis	L	2663	10.46	va
27	2014 US Senator - Regular General	7053	Mark Warner	D	10744	44.32	va
27	2014 US Senator - Regular General	7053	Robert Sarvis	L	909	3.75	va
27	2014 US Senator - Regular General	7053	Ed Gillespie	R	12579	51.89	va
28	2012 US President - Regular General	6598	Barack Obama	D	16326	49.1	va
28	2012 US President - Regular General	6598	Mitt Romney	R	16325	49.1	va
28	2012 US President - Regular General	6598	Gary Johnson	L	339	1.02	va
28	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	87	0.26	va
28	2012 US President - Regular General	6598	Jill Stein	Green	93	0.28	va
28	2013 Attorney General - Regular General	6525	Mark Obenshain	R	10180	52.19	va
28	2013 Attorney General - Regular General	6525	Mark Herring	D	9324	47.8	va
28	2013 Lt. Governor - Regular General	6523	E W Jackson	R	9515	48.73	va
28	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9941	50.92	va
28	2013 Governor - Regular General	6292	Ken Cuccinelli	R	9781	49.44	va
28	2013 Governor - Regular General	6292	Terry McAuliffe	D	8803	44.49	va
28	2013 Governor - Regular General	6292	Robert Sarvis	L	1127	5.7	va
28	2014 US Senator - Regular General	7053	Mark Warner	D	8465	44.02	va
28	2014 US Senator - Regular General	7053	Robert Sarvis	L	462	2.4	va
28	2014 US Senator - Regular General	7053	Ed Gillespie	R	10276	53.44	va
29	2012 US President - Regular General	6598	Barack Obama	D	13107	38.61	va
29	2012 US President - Regular General	6598	Mitt Romney	R	20051	59.07	va
29	2012 US President - Regular General	6598	Gary Johnson	L	350	1.03	va
29	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	191	0.56	va
29	2012 US President - Regular General	6598	Jill Stein	Green	138	0.41	va
29	2013 Attorney General - Regular General	6525	Mark Obenshain	R	12325	62.39	va
29	2013 Attorney General - Regular General	6525	Mark Herring	D	7430	37.61	va
29	2013 Lt. Governor - Regular General	6523	E W Jackson	R	11549	58.89	va
29	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	7999	40.79	va
29	2013 Governor - Regular General	6292	Ken Cuccinelli	R	11819	59.37	va
29	2013 Governor - Regular General	6292	Terry McAuliffe	D	7006	35.19	va
29	2013 Governor - Regular General	6292	Robert Sarvis	L	1027	5.16	va
29	2014 US Senator - Regular General	7053	Mark Warner	D	7223	34.59	va
29	2014 US Senator - Regular General	7053	Robert Sarvis	L	547	2.62	va
29	2014 US Senator - Regular General	7053	Ed Gillespie	R	13067	62.58	va
30	2012 US President - Regular General	6598	Barack Obama	D	14961	42.38	va
30	2012 US President - Regular General	6598	Mitt Romney	R	19797	56.08	va
30	2012 US President - Regular General	6598	Gary Johnson	L	264	0.75	va
30	2012 US President - Regular General	6598	Virgil H Goode, Jr	Const.	160	0.45	va
30	2012 US President - Regular General	6598	Jill Stein	Green	65	0.18	va
30	2013 Attorney General - Regular General	6525	Mark Obenshain	R	13272	61.3	va
30	2013 Attorney General - Regular General	6525	Mark Herring	D	8378	38.7	va
30	2013 Lt. Governor - Regular General	6523	E W Jackson	R	12509	57.89	va
30	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	9048	41.87	va
30	2013 Governor - Regular General	6292	Ken Cuccinelli	R	12439	56.54	va
30	2013 Governor - Regular General	6292	Terry McAuliffe	D	7859	35.72	va
30	2013 Governor - Regular General	6292	Robert Sarvis	L	1611	7.32	va
30	2014 US Senator - Regular General	7053	Mark Warner	D	7620	36.18	va
30	2014 US Senator - Regular General	7053	Robert Sarvis	L	542	2.57	va
30	2014 US Senator - Regular General	7053	Ed Gillespie	R	12886	61.18	va
31	2013 Lt. Governor - Regular General	6523	E W Jackson	R	10039	46.03	va
31	2013 Lt. Governor - Regular General	6523	Ralph Northam	D	11710	53.69	va
31	2013 Governor - Regular General	6292	Ken Cuccinelli	R	10202	46.37	va
31	2013 Governor - Regular General	6292	Terry McAuliffe	D	10822	49.18	va
31	2013 Governor - Regular General	6292	Robert Sarvis	L	944	4.29	va
31	2014 US Senator - Regular General	7053	Mark Warner	D	10285	47.82	va
31	2014 US Senator - Regular General	7053	Robert Sarvis	L	409	1.9	va
31	2014 US Senator - Regular General	7053	Ed Gillespie	R	10799	50.21	va
\.


--
-- PostgreSQL database dump complete
--

