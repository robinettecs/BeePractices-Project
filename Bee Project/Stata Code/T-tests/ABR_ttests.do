/* RUN ABR_Code_Labelling.do and ABR_strsplit_Dum.do BEFORE this code */

use "/Users/christopherrobinette/Desktop/Summer 2020 School Notes/CARE Stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/ABR_Labeled_Split.dta", clear

/* EU vs North America */

/* General insights not in survey questions: completion/progress */

ttest progress, by(region1) unequal
ttest finished, by(region1) unequal

/*Demographics block of question 5-15 */
ttest age, by(region1) unequal /* Q7 */
ttest gender, by(region1) unequal /* Q8 */
ttest educ_highest, by(region1) unequal /* Q9 */
ttest bk_years, by(region1) unequal /* Q10 */
ttest est_hives, by(region1) unequal /* Q11 */
ttest type_hive_TBH, by(region1) unequal /* Q12 */
ttest type_hive_LH, by(region1) unequal /* Q12 */
ttest type_hive_WH, by(region1) unequal /* Q12 */
ttest type_hive_DB, by(region1) unequal /* Q12 */
ttest type_hive_OTH, by(region1) unequal /* Q12 */

sort type_hives_text, stable /*Sorting string variable to exclude missing values */
replace type_hives_text = "." in 1/181
tab type_hives_text /* Q12 */

ttest bee_prof, by(region1) unequal /* Q13 */
ttest bee_move, by(region1) unequal /* Q14 */
ttest insp_hives, by(region1) unequal /* Q15 */

/*Start of block: Antibiotics */
ttest atbint_prev, by(region1) unequal /* Q16 */
ttest atbint_cure, by(region1) unequal /* Q16 */
ttest atbint_slow, by(region1) unequal /* Q16 */
ttest atbint_prod, by(region1) unequal /* Q16 */
ttest atbint_oth, by(region1) unequal /* Q16 */
ttest atb_treat, by(region1) unequal /* Q17 */

sort med_trtmnts, stable /*Sorting string variable to exclude missing values */
replace med_trtmnts = "." in 1/173
tab med_trtmnts  /* Q18 */

ttest useatbfor_nos, by(region1) unequal /* Q19 */
ttest useatbfor_var, by(region1) unequal /* Q19 */
ttest useatbfor_afb, by(region1) unequal /* Q19 */
ttest useatbfor_efb, by(region1) unequal /* Q19 */
ttest useatbfor_shb, by(region1) unequal /* Q19 */
ttest useatbfor_non, by(region1) unequal /* Q19 */
ttest useatbfor_oth, by(region1) unequal /* Q19 */

sort use_atb_txt, stable /*Sorting string variable to exclude missing values */
replace use_atb_txt = "." in 1/290
tab use_atb_txt /* Q19 */

ttest getatb_acs, by(region1) unequal /* Q20 */
ttest getatb_vet, by(region1) unequal /* Q20 */
ttest getatb_phm, by(region1) unequal /* Q20 */
ttest getatb_obk, by(region1) unequal /* Q20 */
ttest getatb_bka, by(region1) unequal /* Q20 */
ttest getatb_int, by(region1) unequal /* Q20 */
ttest getatb_ext, by(region1) unequal /* Q20 */
ttest getatb_oth, by(region1) unequal /* Q20 */
ttest need_scrp, by(region1) unequal /* Q21 */

sort need_scrp_txt, stable /*Sorting string variable to exclude missing values */
replace need_scrp_txt = "." in 1/287
tab need_scrp_txt /* Q21 */

ttest how_atb, by(region1) unequal /* Q22 */ 
ttest infoatb_acs, by(region1) unequal /* Q23 */
ttest infoatb_vet, by(region1) unequal /* Q23 */
ttest infoatb_phm, by(region1) unequal /* Q23 */
ttest infoatb_obk, by(region1) unequal /* Q23 */
ttest infoatb_bka, by(region1) unequal /* Q23 */
ttest infoatb_int, by(region1) unequal /* Q23 */
ttest infoatb_bks, by(region1) unequal /* Q23 */
ttest infoatb_ext, by(region1) unequal /* Q23 */
ttest infoatb_oth, by(region1) unequal /* Q23 */

sort info_atb_txt, stable
replace info_atb_txt = "." in 1/278
tab info_atb_txt /* Q23 */

ttest use_nolab, by(region1) unequal /* Q24 */
ttest know_atb, by(region1) unequal /* Q25 */
ttest agr_no_eat, by(region1) unequal /* Q26 */
ttest know_atb_res, by(region1) unequal /* Q27 */

/* Antimicrobial-resistant infections */ 

ttest know_resist, by(region1) unequal /* Q28 */
ttest atb_fail, by(region1) unequal /* Q29 */
ttest agr_work, by(region1) unequal /* Q30 */
ttest vet_risk, by(region1) unequal /* Q31 */
ttest atb_imp, by(region1) unequal /* Q32 */
ttest exp_resist, by(region1) unequal /* Q33 */

/* Follow-up questions */
ttest int_bht, by(region1) unequal /* Q35 */
ttest int_otc, by(region1) unequal /* Q36 */

sort prof_groups, stable
replace prof_groups = "." in 1/96
tab prof_groups /* Q37 */

sort bee_train, stable
replace bee_train = "." in 1/136
tab bee_train /* Q38 */

ttest int_bkconn, by(region1) unequal /* Q39 */

sort add_comm, stable
replace add_comm = "." in 1/258
tab add_comm /* Q41 */






/* EU vs UK */

/* General insights not in survey questions: completion/progress */

ttest progress, by(region2) unequal
ttest finished, by(region2) unequal

/*Demographics block of question 5-15 */
ttest age, by(region2) unequal /* Q7 */
ttest gender, by(region2) unequal /* Q8 */
ttest educ_highest, by(region2) unequal /* Q9 */
ttest bk_years, by(region2) unequal /* Q10 */
ttest est_hives, by(region2) unequal /* Q11 */
ttest type_hive_TBH, by(region2) unequal /* Q12 */
ttest type_hive_LH, by(region2) unequal /* Q12 */
ttest type_hive_WH, by(region2) unequal /* Q12 */
ttest type_hive_DB, by(region2) unequal /* Q12 */
ttest type_hive_OTH, by(region2) unequal /* Q12 */

sort type_hives_text, stable /*Sorting string variable to exclude missing values */
replace type_hives_text = "." in 1/181
tab type_hives_text /* Q12 */

ttest bee_prof, by(region2) unequal /* Q13 */
ttest bee_move, by(region2) unequal /* Q14 */
ttest insp_hives, by(region2) unequal /* Q15 */

/*Start of block: Antibiotics */
ttest atbint_prev, by(region2) unequal /* Q16 */
ttest atbint_cure, by(region2) unequal /* Q16 */
ttest atbint_slow, by(region2) unequal /* Q16 */
ttest atbint_prod, by(region2) unequal /* Q16 */
ttest atbint_oth, by(region2) unequal /* Q16 */
ttest atb_treat, by(region2) unequal /* Q17 */

sort med_trtmnts, stable /*Sorting string variable to exclude missing values */
replace med_trtmnts = "." in 1/173
tab med_trtmnts  /* Q18 */

ttest useatbfor_nos, by(region2) unequal /* Q19 */
ttest useatbfor_var, by(region2) unequal /* Q19 */
ttest useatbfor_afb, by(region2) unequal /* Q19 */
ttest useatbfor_efb, by(region2) unequal /* Q19 */
ttest useatbfor_shb, by(region2) unequal /* Q19 */
ttest useatbfor_non, by(region2) unequal /* Q19 */
ttest useatbfor_oth, by(region2) unequal /* Q19 */

sort use_atb_txt, stable /*Sorting string variable to exclude missing values */
replace use_atb_txt = "." in 1/290
tab use_atb_txt /* Q19 */

ttest getatb_acs, by(region2) unequal /* Q20 */
ttest getatb_vet, by(region2) unequal /* Q20 */
ttest getatb_phm, by(region2) unequal /* Q20 */
ttest getatb_obk, by(region2) unequal /* Q20 */
ttest getatb_bka, by(region2) unequal /* Q20 */
ttest getatb_int, by(region2) unequal /* Q20 */
ttest getatb_ext, by(region2) unequal /* Q20 */
ttest getatb_oth, by(region2) unequal /* Q20 */
ttest need_scrp, by(region2) unequal /* Q21 */

sort need_scrp_txt, stable /*Sorting string variable to exclude missing values */
replace need_scrp_txt = "." in 1/287
tab need_scrp_txt /* Q21 */

ttest how_atb, by(region2) unequal /* Q22 */ 
ttest infoatb_acs, by(region2) unequal /* Q23 */
ttest infoatb_vet, by(region2) unequal /* Q23 */
ttest infoatb_phm, by(region2) unequal /* Q23 */
ttest infoatb_obk, by(region2) unequal /* Q23 */
ttest infoatb_bka, by(region2) unequal /* Q23 */
ttest infoatb_int, by(region2) unequal /* Q23 */
ttest infoatb_bks, by(region2) unequal /* Q23 */
ttest infoatb_ext, by(region2) unequal /* Q23 */
ttest infoatb_oth, by(region2) unequal /* Q23 */

sort info_atb_txt, stable
replace info_atb_txt = "." in 1/278
tab info_atb_txt /* Q23 */

ttest use_nolab, by(region2) unequal /* Q24 */
ttest know_atb, by(region2) unequal /* Q25 */
ttest agr_no_eat, by(region2) unequal /* Q26 */
ttest know_atb_res, by(region2) unequal /* Q27 */

/* Antimicrobial-resistant infections */ 

ttest know_resist, by(region2) unequal /* Q28 */
ttest atb_fail, by(region2) unequal /* Q29 */
ttest agr_work, by(region2) unequal /* Q30 */
ttest vet_risk, by(region2) unequal /* Q31 */
ttest atb_imp, by(region2) unequal /* Q32 */
ttest exp_resist, by(region2) unequal /* Q33 */

/* Follow-up questions */
ttest int_bht, by(region2) unequal /* Q35 */
ttest int_otc, by(region2) unequal /* Q36 */

sort prof_groups, stable
replace prof_groups = "." in 1/96
tab prof_groups /* Q37 */

sort bee_train, stable
replace bee_train = "." in 1/136
tab bee_train /* Q38 */

ttest int_bkconn, by(region2) unequal /* Q39 */

sort add_comm, stable
replace add_comm = "." in 1/258
tab add_comm /* Q41 */


























