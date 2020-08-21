import delimited "/Users/christopherrobinette/Desktop/Summer 2020 School Notes/CARE stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/RAW/IDM_Num_Raw.csv", numericcols(5 6 7 14 15 18 19 20 21 22 23 24 25 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 78) clear 

drop in 1
drop in 2
drop v10 v11 v12 v13 v16
drop v79 v81 v83 v84 v85

/*Dropped original string labels for variables in 1 and 2
Dropped Anonymized variables: Resp First Name, Last name, Email, External Reference, Distribution Channel.
Dropped empty variable columns: Duplicate IP Address, Device Identifier, Topics
Dropped Email addresses for anonymity*/ 

rename v1 start_date
rename v2 end_date
rename v3 resp_type
rename v4 ip_add
rename v5 progress
rename v6 dur_sec
rename v7 finished
rename v8 rec_date
rename v9 resp_ID
rename v14 loc_lat
rename v15 loc_long
rename v17 user_lang
rename v18 agree
rename v19 bee_country
rename v20 bee_region
rename v21 birth_year
rename v22 gender
rename v23 educ_highest
rename v24 bk_years
rename v25 est_hives
rename v26 type_hives
rename v27 type_hives_text
rename v28 bee_prof
rename v29 bee_move
rename v30 insp_hives
rename v31 ex_nosema
rename v32 ex_af
rename v33 ex_ef
rename v34 know_nosema
rename v35 know_ef
rename v36 know_af
rename v37 rec_nos
rename v38 rec_af
rename v39 rec_ef
rename v40 use_nos
rename v41 use_ef
rename v42 use_af
rename v43 use_dys
rename v44 use_forg
rename v45 use_dab
rename v46 use_var
rename v47 use_feed
rename v48 use_repq
rename v49 use_abtc
rename v50 feas_dys
rename v51 feas_forg
rename v52 feas_deb
rename v53 feas_var
rename v54 feas_feed
rename v55 reas_repq
rename v56 feas_atbc
rename v57 feas_breed
rename v58 use_insp
rename v59 use_odor
rename v60 use_ropi_afb
rename v61 use_afb_efb
rename v62 use_comkit
rename v63 use_distools
rename v64 use_procwax
rename v65 use_prevlab
rename v66 use_dislab
rename v67 use_shook
rename v68 use_shook_all
rename v69 use_atbc_afb
rename v70 use_afb_dest
rename v71 use_dest_all
rename v72 use_afb_quick
rename v73 use_afb_q
rename v74 int_bht
rename v75 int_otc
rename v76 prof_groups
rename v77 bee_train
rename v78 int_bkconn
rename v80 add_comm
rename v82 q_lang





gen region = .
/* North America*/
replace region = 1 if bee_country == 98
replace region = 1 if bee_country == 87
replace region = 1 if bee_country == 7
replace region = 1 if bee_country == 93

/* UK */ 

replace region = 2 if bee_country == 171


/*Europe*/
replace region = 0 if bee_country == 162
replace region = 0 if bee_country == 168
replace region = 0 if bee_country == 169
replace region = 0 if bee_country == 170
replace region = 0 if bee_country == 172
replace region = 0 if bee_country == 174
replace region = 0 if bee_country == 175
replace region = 0 if bee_country == 176
replace region = 0 if bee_country == 177
replace region = 0 if bee_country == 178
replace region = 0 if bee_country == 180
replace region = 0 if bee_country == 182
replace region = 0 if bee_country == 183
replace region = 0 if bee_country == 184
replace region = 0 if bee_country == 185
replace region = 0 if bee_country == 186
replace region = 0 if bee_country == 187
replace region = 0 if bee_country == 188
replace region = 0 if bee_country == 189

label define region  0 "Continental Europe" 1 "North America" 2 "UK" 
label val region region 



/*Dropping duplicate variable string labels*/
drop in 1 


export delimited using "/Users/christopherrobinette/Desktop/Summer 2020 School Notes/CARE stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/CLEANED/IDM_Num_Cleaned.csv", replace
