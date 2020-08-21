import delimited "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/RAW/ABR_Num_Raw.csv", varnames(nonames) stringcols(26 31) numericcols(5 6 7 14 15 18 19 20 21 22 23 24 25 28 29 30 32 38 43 44 45 46 47 48 49 50 51 52 53 54 57) clear 

drop in 1
drop in 2
drop v10 v11 v12 v13 v16
drop v58 v60 v62 v63 v64 

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
rename v31 atb_int
rename v32 atb_treat
rename v33 med_trtmnts
rename v34 use_atb_for
rename v35 use_atb_txt
rename v36 get_atb
rename v37 get_atb_txt
rename v38 need_scrp
rename v39 need_scrp_txt
rename v40 how_atb
rename v41 info_atb
rename v42 info_atb_txt
rename v43 use_nolab
rename v44 know_atb
rename v45 agr_no_eat
rename v46 know_atb_res
rename v47 know_resist
rename v48 atb_fail
rename v49 agr_work
rename v50 vet_risk
rename v51 atb_imp
rename v52 exp_resist
rename v53 int_bht
rename v54 int_otc
rename v55 prof_groups
rename v56 bee_train
rename v57 int_bkconn
rename v59 add_comm
rename v61 q_lang





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

export delimited using "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/CLEANED/ABR_Num_Cleaned.csv", replace 
