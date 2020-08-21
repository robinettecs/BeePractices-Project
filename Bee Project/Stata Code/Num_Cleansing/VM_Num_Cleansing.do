import delimited "/Users/christopherrobinette/Desktop/Summer 2020 School Notes/CARE stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/RAW/VM_Num_Raw.csv", varnames(nonames) numericcols(5 6 7 14 15 18 19 20 21 22 23 24 25 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 46 48 49 50 51 52 53 54 55 56 57 60) clear 

drop in 1
drop in 2
drop v10 v11 v12 v13 v16
drop v61 v63 v65 v66


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
rename v31 mites
rename v32 v_know
rename v33 v_rec
rename v34 v_cont_use
rename v35 v_cont2
rename v36 v_cont3
rename v37 v_cont4
rename v38 v_cont5
rename v39 v_cont6
rename v40 v_cont7
rename v41 v_cont8
rename v42 v_treat
rename v43 v_med
rename v44 med_source
rename v45 med_source_other
rename v46 v_scrip
rename v47 v_scrip_cond
rename v48 med_proc1
rename v49 med_proc2
rename v50 med_proc3
rename v51 med_proc4
rename v52 med_proc5
rename v53 med_proc6
rename v54 med_proc7
rename v55 oft_noinst
rename v56 int_bht
rename v57 int_otc
rename v58 prof_groups
rename v59 bee_train
rename v60 int_bkconn
rename v62 add_comm
rename v64 q_lang





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

export delimited using "/Users/christopherrobinette/Desktop/Summer 2020 School Notes/CARE stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/CLEANED/VM_Num_Cleaned.csv", replace
