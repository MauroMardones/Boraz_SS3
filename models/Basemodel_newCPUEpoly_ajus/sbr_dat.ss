#V3.30a																																																																																																									
#C this comment will be stored because it starts with #C.  It will be written to output files																																																																																																									
1989	#_styr																																																																																																								
2024	#_endyr																																																																																																								
1	#_nseas																																																																																																								
12	#_months/season																																																																																																								
2	#_N_subseasons(even number, minimum is 2)																																																																																																								
1	#_spawn_seas																																																																																																								
2	#_Ngenders																																																																																																								
17      #_Nages:  this accumulator age should be large enough so that little growth occurs after reaching this age																																																																																																								
1	#_N_areas																																																																																																								
5	#_Nfleets (including surveys)																																																																																																								
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=ignore 																																																																																																									
#_timing: -1=for fisheries and 0.5 for surveys, can be overridden to be month specific 																																																																																																									
#_fleet_area:  area the fleet/survey operates in.  Each fleet operates in only one area, but a fleet in one area can mirror the characteristics of fleet in another area																																																																																																									
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)																																																																																																									
#_need_catch_mult: 0 = none, 1 = apply catch multiplier as parameter specified in the control file at the end of the growth parameters 																																																																																																									
#_rows are fleets; columns are: 																																																																																																									
#fleet_type	 timing	 area	 units	 need_catch_mult	 fleet_name																																																																																																				
 1  -1  1  1  0 trawl_pt      # 1
 1  -1  1  1  0 polyvalent_pt # 2
 1  -1  1  1  0 trawl_sp      # 3
 1  -1  1  1  0 polyvalent_sp # 4
 3  11  1  1  0 polyvalent_pt_cpue # 5
 #_year	season	fleet	catch	catch_se	
-999	1	 1 10	0.001	#_1 
1989  1  1 30 0.05 #trawl_pt
1990  1  1 33 0.05 
1991  1  1 23 0.05
1992  1  1 28 0.05
1993  1  1 62 0.05
1994  1  1 27 0.05
1995  1  1 30 0.05
1996  1  1 44 0.05
1997  1  1 29 0.05
1998  1  1 33 0.05
1999  1  1 29 0.05
2000  1  1 23 0.05
2001  1  1 23 0.05
2002  1  1 16 0.05
2003  1  1 25 0.05
2004  1  1 25 0.05
2005  1  1 25 0.05
2006  1  1 28 0.05
2007  1  1 59 0.05
2008  1  1 39 0.05
2009  1  1 30 0.05
2010  1  1 25 0.05
2011  1  1 22 0.05
2012  1  1 46 0.05
2013  1  1 31 0.05
2014  1  1 18 0.05
2015  1  1 22 0.05
2016  1  1 22 0.05
2017  1  1 21 0.05
2018  1  1 14 0.05
2019  1  1 8  0.05
2020  1  1 14 0.05
2021  1  1 6  0.05
2022  1  1 5  0.05
2023  1  1 4  0.05
2024  1  1 6  0.05
-999  1  2 50 0.001  
1989  1  2 163 0.05  #polyvalent_pt
1990  1  2 97  0.05 
1991  1  2 65  0.05 
1992  1  2 68  0.05 
1993  1  2 90  0.05 
1994  1  2 89  0.05 
1995  1  2 143 0.05 
1996  1  2 121 0.05 
1997  1  2 135 0.05 
1998  1  2 135 0.05 
1999  1  2 93  0.05 
2000  1  2 41  0.05
2001  1  2 48  0.05
2002  1  2 65  0.05
2003  1  2 78  0.05
2004  1  2 106 0.05
2005  1  2 72  0.05
2006  1  2 78  0.05
2007  1  2 87  0.05
2008  1  2 82  0.05
2009  1  2 93  0.05
2010  1  2 79  0.05
2011  1  2 73  0.05
2012  1  2 96  0.05
2013  1  2 58  0.05
2014  1  2 39  0.05
2015  1  2 42  0.05
2016  1  2 47  0.05
2017  1  2 47  0.05
2018  1  2 43  0.05
2019  1  2 27  0.05
2020  1  2 27  0.05
2021  1  2 22  0.05
2022  1  2 27  0.05
2023  1  2 33  0.05
2024  1  2 26  0.05
#-999  1  3 1  0.001
2000    1  3 10  0.05  #trawl_sp
2001	1  3 12  0.05
2002	1  3 25  0.05
2003	1  3 35  0.05
2004	1  3 17  0.05
2005	1  3 10  0.05
2006	1  3 28  0.05
2007	1  3 13  0.05
2008	1  3 8   0.05
2009	1  3 16  0.05
2010	1  3 8   0.05
2011	1  3 6   0.05
2012	1  3 3   0.05
2013	1  3 12  0.05
2014	1  3 2   0.05
2015	1  3 0.7 0.05
2016	1  3 5   0.05
2017	1  3 1   0.05
2018	1  3 2   0.05
2019	1  3 1   0.05
2020	1  3 1   0.05
2021	1  3 0.4 0.05
2022	1  3 0.3 0.05
2023	1  3 0.4 0.05
2024    1  3 0.7 0.05
#-999  1  4 1  0.001
2000	1  4 23  0.05 #polyvalent_sp
2001	1  4 29  0.05
2002	1  4 57  0.05
2003	1  4 82  0.05
2004	1  4 40  0.05
2005	1  4 25  0.05
2006	1  4 65  0.05
2007	1  4 32  0.05
2008	1  4 19  0.05
2009	1  4 20  0.05
2010	1  4 24  0.05
2011    1  4 29  0.05
2012	1  4 20  0.05
2013	1  4 29  0.05
2014	1  4 27  0.05
2015	1  4 16  0.05
2016	1  4 16  0.05
2017	1  4 11  0.05
2018	1  4 7   0.05
2019	1  4 3   0.05
2020	1  4 4   0.05
2021	1  4 4   0.05
2022	1  4 3   0.05
2023	1  4 4   0.05
2024    1  4 4   0.05
-9999	0	0	0	0.1	#_terminator
																																																																																																			
#																																																																																																									
#_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; >=30 for special types
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet	Units	Errtype	SD_Report
1	1	0	0   #trawl_pt
2	1	0	0   #polyvalent_pt
3       1       0       0   #trawl_sp
4       1       0       0   #polyvalent_sp
5       1       0       0   #polyvalent_pt_cpue
#_CPUE_data					
#_year	seas	index	obs	se_log	
2000	1	5	4.881	  0.200	#	cpue_polyv
2001	1	5	5.258	  0.213	#	cpue_polyv
2002	1	5	10.122	0.196	    #	cpue_polyv
2003	1	5	24.844	0.191	#	cpue_polyv
2004	1	5	37.184	0.172	#	cpue_polyv
2005	1	5	32.350	0.167	#	cpue_polyv
2006	1	5	18.338	0.181	#	cpue_polyv
2007	1	5	29.804	0.168	#	cpue_polyv
2008	1	5	27.937	0.162	#	cpue_polyv
2009	1	5	19.735	0.195	#	cpue_polyv
2010	1	5	30.278	0.237	#	cpue_polyv
2011	1	5	25.141	0.218	#	cpue_polyv
2012	1	5	24.706	0.197	#	cpue_polyv
2013	1	5	30.425	0.204	#	cpue_polyv
2014	1	5	24.275	0.273	#	cpue_polyv
2015	1	5	17.022	0.232	#	cpue_polyv
2016	1	5	 9.280	0.234	#	cpue_polyv
2017	1	5	32.923	0.206	#	cpue_polyv
2018	1	5	19.484	0.234	#	cpue_polyv
2019	1	5	12.248	0.247	#	cpue_polyv
2020	1	5	 9.018	0.262	#	cpue_polyv
2021	1	5	 4.552	0.363	#	cpue_polyv
2022	1	5	17.186	0.225	#	cpue_polyv
2023	1	5	28.458	0.204	#	cpue_polyv
2024	1	5	31.237	0.230	#	cpue_polyv
-9999 1 1 1 1 # terminator for survey observations 
																																																																																																	
#																																																																																																
0	#_N_fleets_with_discard																																																																																																								
#0	#N_discard_observations																																																																																																								
#																																																																																																									
0	#_N_meanbodywt_obs																																																																																																								
#																																																																																																									
#Population length bins are needed even if there are no size data																																																																																																									
#  These define the resolution at which the mean weight-at-length, maturity-at-length and size-selectivity are based.  Calculations use the mid-length of the population bins.																																																																																																									
2	# length bin method: 1=use databins(read below); 2=generate from binwidth,min,max below; 3=read vector																																																																																																								
1	# binwidth for population size comp																																																																																																								
1	# minimum size in the population (lower edge of first bin and size at age 0.00)																																																																																																								
70	# maximum size in the population (lower edge of last bin)																																																																																																								
1	#Use length composition data (0/1)																																																																																																								
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.																																																																																																									
#_addtocomp:  after accumulation of tails; this value added to all bins																																																																																																									
#_males and females treated as combined gender below this bin number 																																																																																																									
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation																																																																																																									
#_Comp_Error: 0 = multinomial, 1 = dirichlet																																																																																																									
#_ParmSelect:  enter a null value that will be replaced by the parameter number for the dirichlet error distribution																																																																																																									
#_mintailcomp	 addtocomp	 combM+F	 CompressBins	 CompError	 ParmSelect																																																																																																				
0.001	1e-07	0	0	0	0  0.01  # 1 trawl_pt																																																																																														
0.001	1e-07	0	0	0	0  0.01  # 2 polyvalent_pt	
0.001	1e-07	0	0	0	0  0.01  # 3 trawl_sp																																																																																													
0.001	1e-07	0	0	0	0  0.01  # 4 polyvalent_sp
0.001	1e-07	0	0	0	0  0.01  # 4 polyvalent_sp	

65	#_Nbins for length composition data																																																																																																								
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution																																																																																																									
# partition codes:  (0=combined; 1=discard; 2=retained																																																																																																									
#lower edge of each data length data bin (in cm).  These cannot be finer than the pop. Length bins.  Conversion is shown in report.sso																																																																																																									
1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	37	38	39	40	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64	70
 #_lbin_vector

#_Yr 	Season	Fleet	Gender	Part	Nsamp	f1	f2	f3	f4	f5	f6	f7	f8	f9	f10	f11	f12	f13	f14	f15	f16	f17	f18	f19	f20	f21	f22	f23	f24	f25	f26	f27	f28	f29	f30	f31	f32	f33	f34	f35	f36	f37	f38	f39	f40	f41	f42	f43	f44	f45	f46	f47	f48	f49	f50	f51	f52	f53	f54	f55	f56	f57	f58	f59	f60	f61	f62	f63	f64	f65	f1	f2	f3	f4	f5	f6	f7	f8	f9	f10	f11	f12	f13	f14	f15	f16	f17	f18	f19	f20	f21	f22	f23	f24	f25	f26	f27	f28	f29	f30	f31	f32	f33	f34	f35	f36	f37	f38	f39	f40	f41	f42	f43	f44	f45	f46	f47	f48	f49	f50	f51	f52	f53	f54	f55	f56	f57	f58	f59	f60	f61	f62	f63	f64	f65
2009	7	2	1	0	51	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	7	21	60	163	373	762	1333	2324	3542	5091	6880	8809	10594	11971	13559	14179	14425	13924	13304	12348	11162	9854	8319	7002	5832	4753	3661	2938	2199	1685	1299	906	734	548	388	271	186	107	85	63	38	22	25	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2010	7	2	1	0	21	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	7	29	62	158	339	594	1027	1578	2265	3001	3977	4652	5257	5967	6253	6450	6218	5772	5427	4863	4292	3719	3089	2561	2058	1571	1283	952	801	552	390	329	229	167	116	95	44	39	25	17	11	11	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2011	7	2	1	0	54	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	6	18	57	149	328	656	1166	2079	3097	4486	6054	7815	9366	10584	11959	12470	12763	12266	11728	10890	9868	8726	7371	6193	5173	4231	3239	2619	1961	1491	1158	777	660	489	352	243	171	96	76	56	36	21	23	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2012	7	2	1	0	28	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	6	17	56	145	314	635	1115	1985	2955	4276	5755	7450	8935	10058	11430	11921	12163	11724	11169	10400	9414	8336	6983	5907	4936	4048	3077	2490	1863	1440	1087	746	626	457	339	232	163	87	71	51	36	21	21	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2013	7	2	1	0	64	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	7	24	35	92	146	281	389	608	775	1035	1230	1404	1559	1581	1745	1634	1485	1427	1277	1141	1022	859	665	514	364	324	255	201	136	91	90	61	37	30	20	9	9	8	6	1	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2014	7	2	1	0	131	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	6	21	30	78	134	258	348	551	717	960	1117	1276	1410	1455	1605	1497	1378	1277	1157	1027	909	772	598	457	330	293	233	183	130	83	85	57	29	25	18	9	8	8	5	1	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2015	7	2	1	0	126	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	6	36	88	227	460	976	1616	2451	3634	4488	5405	6060	6303	6070	5642	4964	4207	3455	2684	1931	1441	1031	738	412	328	179	120	78	34	25	12	9	3	6	2	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2016	7	2	1	0	97	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	5	17	50	125	280	569	1091	1700	2424	3506	4211	5027	5567	5847	5706	5275	4792	4164	3517	2783	2139	1603	1196	866	630	364	301	166	113	81	36	23	18	10	5	4	4	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2017	7	2	1	0	72	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	5	21	29	78	132	245	337	534	686	929	1072	1225	1342	1392	1542	1440	1327	1229	1108	994	871	746	574	438	323	287	228	176	122	82	81	56	27	25	18	9	6	8	5	1	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2018	7	2	1	0	84	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	5	1	23	34	61	79	121	152	217	239	273	307	323	342	300	330	293	254	211	207	183	112	107	82	71	47	33	19	20	25	17	8	6	3	1	1	4	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2019	7	2	1	0	210	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	15	32	60	137	242	435	661	939	1247	1645	1946	2241	2476	2571	2723	2598	2391	2244	1986	1782	1578	1313	1019	824	633	540	389	340	231	142	128	98	67	55	37	16	12	11	7	1	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2020	7	2	1	0	105	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	4	12	29	55	136	233	432	632	952	1241	1648	1911	2236	2314	2532	2328	2231	1974	1801	1569	1319	1000	759	566	475	336	227	134	131	64	51	42	13	11	8	6	2	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2021	7	2	1	0	61	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	6	17	44	84	155	246	336	467	646	758	805	957	903	862	752	686	550	467	332	244	198	121	89	52	51	32	13	9	5	3	4	4	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2022	7	2	1	0	69	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3	8	26	58	134	248	486	762	1128	1592	2017	2418	2632	2952	2909	2656	2422	2112	1858	1478	1081	791	629	444	306	175	152	78	59	40	14	10	7	5	1	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2023	7	2	1	0	119	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3	2	25	50	106	191	414	687	1048	1416	1954	2321	2714	2913	3157	2937	2777	2434	2177	1843	1487	1066	801	641	447	329	180	159	88	63	44	14	10	9	4	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2024	7	2	1	0	35	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	2	10	27	47	96	176	317	495	682	939	1064	1300	1334	1570	1421	1276	1140	1047	881	740	509	366	302	202	139	87	81	36	22	16	9	3	7	3	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
-9999	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0

0	#_N_age'_bins;  these are in terms of age', not true age.  Age' is estimated age taking into account any ageing bias and imprecision																																																																																																								
# 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 #_agebin_vector
# following vector is the lower edge of the integer age' for each age' bin; the first entry is for the age 0 fish																																																																																																									
#by starting at age' = 1,  any zero-year-old fish that are in the expected values will be accumulated up into the age 1' bin.																																																																																																									
## CF 0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15 16 17																																																																																									
#1 #_N_ageerror_definitions
#_age0	age1	age2	age3	age4	age5	age6	age7	age8	age9	age10	age11	age12	age13	age14	age15	age16	age17	age18	
#0.5	1.5	2.5	3.5	4.5	5.5	6.5	7.5	8.5	9.5	10.5	11.5	12.5	13.5	14.5	15.5	16.5	17.5	18.5	#1
#0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	#2																																														
#																																																																																																									
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.																																																																																																									
#_addtocomp:  after accumulation of tails; this value added to all bins																																																																																																									
#_males and females treated as combined gender below this bin number 																																																																																																									
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation																																																																																																									
#_mintailcomp_addtocomp_combM+F_CompressBins_CompError_ParmSelect																																																																																																									
#_Comp_Error: 0 = multinomial, 1 = dirichlet																																																																																																									
#_mintailcomp, addtocomp, combM+F, CompressBins, CompError, ParmSelect																																																																																																									
#-1	0.001	0	0	0	0	0.001	#_Fishery 
#-1	0.001	0	0	0	0	0.001	#_Fishery2																																																																																																		
#
#3 #_Lbin_method: 1=poplenbins; 2=datalenbins; 3=lengths
#_combine males into females at or below this bin number
#-9999	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0    0	0	0	0	0	0	0	0	#_terminator

#
0 #_Use_MeanSize-at-Age_obs (0/1)																																																		
#
0 #_N_environ_variables
#Yr Variable Value
#
0 # N sizefreq methods to read 
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
# Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
# feature not yet implemented
#
999

ENDDATA
