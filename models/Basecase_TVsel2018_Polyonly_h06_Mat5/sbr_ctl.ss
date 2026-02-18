#V3.30.23.1;_safe;_compile_date:_Dec  5 2024;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.2
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-ost/ss3-source-code

#C control file for a SBR (2 Fishery)
#_data_and_control_files: sbr_dat.ss // sbr_ctl.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond sd_ratio_rd < 0: platoon_sd_ratio parameter required after movement params.
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
#_NATMORT
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
 #_Age_natmort_by sex x growthpattern (nest GP in sex)
 	0.726	0.558	0.400	0.321	0.275	0.245	0.223	0.208	0.196	0.187	0.180	0.174	0.170	0.166	0.163	0.160	0.158	0.156
	0.726	0.558	0.400	0.321	0.275	0.245	0.223	0.208	0.196	0.187	0.180	0.174	0.170	0.166	0.163	0.160	0.158	0.156
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement) for L1 (aka Amin); first growth parameter is size at this age; linear growth below this
999 #_Age(post-settlement) for L2 (aka Amax); 999 to treat as Linf
-998 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
5 #_First_Mature_Age
1 #_fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
-1 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
-1 # Hermaphro_season.first_age (seas=-1 means all seasons; first_age must be 0 to 9)
0 # fraction_of_maleSSB_added_to_total_SSB 
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
# Sex: 1  BioPattern: 1  Growth
 0 10 0 0 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 1 70 56.6 56.6 10 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.001 2 0.151 0.2 0.05 0 -3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.001 5 0.1 0.1 0.5 0 -4 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.001 5 0.07 0.07 0.5 0 -4 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 8.7e-06 0.0087 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.14 3.14 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 0.0001 60 30.24 34.6 99 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -2 4 -0.545266 -0.545266 99 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 0.0087 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 3.14 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
# Sex: 2  BioPattern: 1  Growth
 -1 1 0 0 0 0 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 1 0 0 0 0 -4 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -1 1 0 0 0 0 -4 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 1 0 0 0 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 1 0 0 0 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 3 8.7e-06 0.0087 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.14 3.14 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
 0 8 2.041 3 0 0 -2 0 0 0 0 0 0 0 # Herm_Infl_age
 0.1 50 1.103 10.1407 0 0 -2 0 0 0 0 0 0 0 # Herm_stdev
 0 1 0.581 0.890681 0 0 -2 0 0 0 0 0 0 0 # Herm_asymptote
#  Recruitment Distribution 
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Platoon StDev Ratio 
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0 0.99 1e-06 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
        0.0001            20       7.74473             2            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.6           0.6          0.24             3         -1          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.9           0.5            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -99          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
2 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
2009 # first year of main recr_devs; early devs can precede this era
2022 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -10 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1997 #_last_yr_nobias_adj_in_MPD; begin of ramp
 2006 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2020 #_last_yr_fullbias_adj_in_MPD
 2022 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.8738 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_year Input_value
#
# all recruitment deviations
#  1999E 2000E 2001E 2002E 2003E 2004E 2005E 2006E 2007E 2008E 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021R 2022R 2023R 2024F 2025F 2026F
#  -1.23436 -1.20624 0.113153 0.174725 0.0493227 0.0349467 0.37032 0.416096 0.680705 0.487467 0.613752 1.03516 1.12423 1.23085 -0.108389 1.18845 1.04604 0.628801 0.449378 -0.153437 -0.252148 -0.909047 -0.851742 0.122097 0 0 0 0
#
#Fishing Mortality info 
0.15 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
4 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
5 # max F (methods 2-4) or harvest fraction (method 1)
# Read list of fleets that do F as parameter; unlisted fleets stay hybrid, bycatch fleets must be included with start_PH=1, high F fleets should switch early
# (A) fleet;
# (B) F_starting_value (ignored if start_PH=1 or reading from ss3.par);
# (C) start_PH for fleet's Fparms (99 to stay in hybrid, <0 to stay at starting value)
# Terminate list with -9999 for fleet
# or terminate with -9998 to invoke reading fleet-time specific F values after first reading N hybrid tune loops)
# (A) (B) (C)
 1 0.08 1 # trawl_pt
 2 0.08 1 # polyvalent_pt
 3 0.08 1 # trawl_sp
 4 0.08 1 # polyvalent_sp
-9999 1 1 # end of list
#F_detail template: fleet year seas F_value catch_se phase
4 #_number of loops for hybrid tuning; 4 precise; 3 faster; 2 enough if switching to parms is enabled
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 2
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 1e-05 1.5 0.0091 0.1 99 0 -1 # InitF_seas_1_flt_1trawl_pt
 1e-05 1.5 0.0892317 0.02 99 0 1 # InitF_seas_1_flt_2polyvalent_pt
#
# F rates by fleet x season
#_year:  1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# trawl_pt 0.419186 0.507701 0.345081 0.412674 0.990394 0.439188 0.515414 0.811126 0.553447 0.653933 0.557232 0.921127 1.72217 0.513421 0.87492 1.16487 1.13324 1.22655 3.56188 1.44517 1.60165 1.35441 0.712848 1.49856 0.938961 1.43787 0.883783 0.85714 1.06825 0.798198 0.66492 1.49186 1.11476 1.07941 0.261617 2.42028e-05 2.1226e-05 1.83697e-05
# polyvalent_pt 0.3179 0.217815 0.148439 0.150991 0.21038 0.221953 0.374068 0.346689 0.41262 0.433309 0.296215 0.190474 0.409558 0.428559 0.533314 0.976982 0.689155 0.713944 1.11258 0.722677 0.997553 0.915338 0.532363 0.611759 0.340751 0.398012 0.337546 0.328758 0.379812 0.39782 0.324812 0.419695 0.557154 0.949809 0.491995 1.97006e-05 1.72775e-05 1.49526e-05
# trawl_sp 0 0 0 0 0 0 0 0 0 0 0 0.400121 0.897757 0.802194 1.22482 0.792131 0.453315 1.22655 0.784643 0.296472 0.854363 0.433547 0.194461 0.097795 0.363737 0.159842 0.0281503 0.195075 0.0509361 0.114138 0.0831453 0.106578 0.0743216 0.0647004 0.0261603 1.62794e-06 1.42771e-06 1.23559e-06
# polyvalent_sp 0 0 0 0 0 0 0 0 0 0 0 0.106773 0.247249 0.375837 0.560641 0.369018 0.239498 0.59501 0.408352 0.166631 0.212496 0.277412 0.211079 0.127227 0.17037 0.275654 0.128556 0.112216 0.0891133 0.0649942 0.0361736 0.0622804 0.101754 0.106025 0.0595927 2.63506e-06 2.31096e-06 1.99999e-06
#
#_Q_setup for fleets with cpue or survey or deviation data
#_1:  fleet number
#_2:  link type: 1=simple q; 2=mirror; 3=power (+1 parm); 4=mirror with scale (+1p); 5=offset (+1p); 6=offset & power (+2p)
#_     where power is applied as y = q * x ^ (1 + power); so a power value of 0 has null effect
#_     and with the offset included it is y = q * (x + offset) ^ (1 + power)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         5         1         0         1         0         1  #  polyvalent_sp_cpue
-9999 0 0 0 0 0
#
#_Q_parameters
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -0.66645             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_polyvalent_sp_cpue(5)
             0             1             0             0             0             0         -2          0          0          0          0          0          0          0  #  Q_extraSD_polyvalent_sp_cpue(5)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (mean over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2*special; non-parm len selex, read as N break points, then N selex parameters
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (mean over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 trawl_pt
 24 0 0 0 # 2 polyvalent_pt
 15 0 0 1 # 3 trawl_sp
 15 0 0 2 # 4 polyvalent_sp
 15 0 0 2 # 5 polyvalent_sp_cpue
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic. Recommend using pattern 18 instead.
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (mean over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (mean over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 10 0 0 0 # 1 trawl_pt
 10 0 0 0 # 2 polyvalent_pt
 10 0 0 0 # 3 trawl_sp
 10 0 0 0 # 4 polyvalent_sp
 10 0 0 0 # 5 polyvalent_sp_cpue
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   trawl_pt LenSelex
             5            60       5.00272            10            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_trawl_pt(1)
           -15             3        -11.54            -3            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_trawl_pt(1)
           -20             8            -6          1.04            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_trawl_pt(1)
            -4             8       5.47025       5.27992            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_trawl_pt(1)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_trawl_pt(1)
          -999             9          -999          -999            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_trawl_pt(1)
# 2   polyvalent_pt LenSelex
             5            60       16.5527            10            99             0          4          0          23          2009          2018          5          0          0  #  Size_DblN_peak_polyvalent_pt(2)
           -15             3       -12.1177            -3            99             0          -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_polyvalent_pt(2)
             0             8      0.604673             3            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_polyvalent_pt(2)
           -20            20       4.83643             3            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_polyvalent_pt(2)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_polyvalent_pt(2)
          -999             9          -999          -999            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_polyvalent_pt(2)
# 3   trawl_sp LenSelex
# 4   polyvalent_sp LenSelex
# 5   polyvalent_sp_cpue LenSelex
# 1   trawl_pt AgeSelex
# 2   polyvalent_pt AgeSelex
# 3   trawl_sp AgeSelex
# 4   polyvalent_sp AgeSelex
# 5   polyvalent_sp_cpue AgeSelex
#_No_Dirichlet parameters

#_no timevary selex parameters
# 0.5  5    1.5 1 0.5 6 -7 # RecrDist_GP_1_area_2_month_1_dev_se
#-0.99 0.99 0   0 0.5 6 -6 # RecrDist_GP_1_area_2_month_1_dev_autocorr

 0.5  5    1.5 1 0.5 6 -7 # RecrDist_GP_1_area_2_month_1_dev_se
-0.99 0.99 0   0 0.5 6 -6 # RecrDist_GP_1_area_2_month_1_dev_autocorr

0   #  use 2D_AR1 selectivity? (0/1)
#_no 2D_AR1 selex offset used
#_specs:  fleet, ymin, ymax, amin, amax, sigma_amax, use_rho, len1/age2, devphase, before_range, after_range
#_sigma_amax>amin means create sigma parm for each bin from min to sigma_amax; sigma_amax<0 means just one sigma parm is read and used for all bins
#_needed parameters follow each fleet's specifications
# -9999  0 0 0 0 0 0 0 0 0 0 # terminator
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_factor  fleet  value
      4      1         1
      4      2         1
      4      3         1
      4      4         1
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 4 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 9 1 1 1 0
 9 2 1 1 0
 9 3 1 1 0
 9 4 1 1 0
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  0 0 0 0 #_lencomp:_3
#  0 0 0 0 #_lencomp:_4
#  0 0 0 0 #_lencomp:_5
#  1 1 1 1 #_init_equ_catch1
#  1 1 1 1 #_init_equ_catch2
#  1 1 1 1 #_init_equ_catch3
#  1 1 1 1 #_init_equ_catch4
#  1 1 1 1 #_init_equ_catch5
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

