/* Run IDM_Code_Labelling.do before running this code*/


use "/Users/christopherrobinette/Desktop/Summer 2020 School Notes/CARE stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/DTAs/IDM_Coded_Labeled.dta", clear

/* EU v NA */

/* General insights not in survey questions: completion/progress */

ttest progress, by(EUvNA) unequal
ttest finished, by(EUvNA) unequal

/*Demographics block of question 5-15 */
ttest age, by(EUvNA) unequal /* Q7 */
ttest gender, by(EUvNA) unequal /* Q8 */
ttest educ_highest, by(EUvNA) unequal /* Q9 */
ttest bk_year, by(EUvNA) unequal /* Q10 */
ttest est_hives, by(EUvNA) unequal /* Q11 */
ttest type_hive_TBH, by(EUvNA) unequal /* Q12 */
ttest type_hive_LH, by(EUvNA) unequal /* Q12 */
ttest type_hive_WH, by(EUvNA) unequal /* Q12 */
ttest type_hive_DB, by(EUvNA) unequal /* Q12 */
ttest type_hive_OTH, by(EUvNA) unequal /* Q12 */
tab type_hives_text /* Q12 */
ttest bee_prof, by(EUvNA) unequal /* Q13 */
ttest bee_move, by(EUvNA) unequal /* Q14 */
ttest insp_hives, by(EUvNA) unequal /* Q15 */

/* Disease specific questions-recognition and knowledge--*/

ttest ex_nosema, by(EUvNA) unequal /* Q16 */
ttest ex_af, by(EUvNA) unequal /* Q17 */
ttest ex_ef, by(EUvNA) unequal /* Q18 */
ttest know_nosema, by(EUvNA) unequal /* Q19 */
ttest know_ef, by(EUvNA) unequal /* Q19 */
ttest know_af, by(EUvNA) unequal /* Q19 */
ttest rec_nos, by(EUvNA) unequal /* Q20 */
ttest rec_af, by(EUvNA) unequal /* Q20 */
ttest rec_ef, by(EUvNA) unequal /* Q20 */

/* Beekeeping practices for Nosema */

ttest use_dys, by(EUvNA) unequal /* Q23 */
ttest use_forg, by(EUvNA) unequal /* Q23 */
ttest use_deb, by(EUvNA) unequal /* Q23 */
ttest use_var, by(EUvNA) unequal /* Q23 */
ttest use_feed, by(EUvNA) unequal /* Q23 */
ttest use_repq, by(EUvNA) unequal /* Q23 */
ttest use_atbs, by(EUvNA) unequal /* Q23 */

ttest feas_dys, by(EUvNA) unequal /* Q24 */
ttest feas_forg, by(EUvNA) unequal /* Q24 */
ttest fease_deb, by(EUvNA) unequal /* Q24 */
ttest feas_var, by(EUvNA) unequal /* Q24 */
ttest feas_feed, by(EUvNA) unequal /* Q24 */
ttest feas_repq, by(EUvNA) unequal /* Q24 */
ttest feas_atbs, by(EUvNA) unequal /* Q24 */
ttest feas_breed, by(EUvNA) unequal /* Q24 */


/*Beekeeping practices for AFB/EFB */

ttest use_insp, by(EUvNA) unequal /* Q26 */
ttest use_odor, by(EUvNA) unequal /* Q26 */
ttest use_afb_ropi, by(EUvNA) unequal /* Q26 */
ttest use_afb_scale, by(EUvNA) unequal /* Q26 */
ttest use_comkit, by(EUvNA) unequal /* Q26 */
ttest use_distools, by(EUvNA) unequal /* Q26 */
ttest use_procwax, by(EUvNA) unequal /* Q26 */
ttest use_prevlab, by(EUvNA) unequal /* Q26 */
ttest use_dislab, by(EUvNA) unequal /* Q26 */
ttest use_shook, by(EUvNA) unequal /* Q26 */
ttest use_shook_all, by(EUvNA) unequal /* Q26 */
ttest use_atb_afb, by(EUvNA) unequal /* Q26 */
ttest use_dest_afb, by(EUvNA) unequal /* Q26 */
ttest use_dest_all, by(EUvNA) unequal /* Q26 */
ttest use_afb_quick, by(EUvNA) unequal /* Q26 */
ttest use_afb_q, by(EUvNA) unequal /* Q26 */


/* Follow ups */


ttest int_bht, by(EUvNA) unequal /* Q27 */
ttest int_otc, by(EUvNA) unequal /* Q27 */
ttest int_bcon, by(EUvNA) unequal /* Q27 */



/* EU v UK */


/* General insights not in survey questions: completion/progress */

ttest progress, by(EUvUK) unequal
ttest finished, by(EUvUK) unequal

/*Demographics block of question 5-15 */
ttest age, by(EUvUK) unequal /* Q7 */
ttest gender, by(EUvUK) unequal /* Q8 */
ttest educ_highest, by(EUvUK) unequal /* Q9 */
ttest bk_year, by(EUvUK) unequal /* Q10 */
ttest est_hives, by(EUvUK) unequal /* Q11 */
ttest type_hive_TBH, by(EUvUK) unequal /* Q12 */
ttest type_hive_LH, by(EUvUK) unequal /* Q12 */
ttest type_hive_WH, by(EUvUK) unequal /* Q12 */
ttest type_hive_DB, by(EUvUK) unequal /* Q12 */
ttest type_hive_OTH, by(EUvUK) unequal /* Q12 */
tab type_hives_text /* Q12 */
ttest bee_prof, by(EUvUK) unequal /* Q13 */
ttest bee_move, by(EUvUK) unequal /* Q14 */
ttest insp_hives, by(EUvUK) unequal /* Q15 */

/* Disease specific questions-recognition and knowledge--*/

ttest ex_nosema, by(EUvUK) unequal /* Q16 */
ttest ex_af, by(EUvUK) unequal /* Q17 */
ttest ex_ef, by(EUvUK) unequal /* Q18 */
ttest know_nosema, by(EUvUK) unequal /* Q19 */
ttest know_ef, by(EUvUK) unequal /* Q19 */
ttest know_af, by(EUvUK) unequal /* Q19 */
ttest rec_nos, by(EUvUK) unequal /* Q20 */
ttest rec_af, by(EUvUK) unequal /* Q20 */
ttest rec_ef, by(EUvUK) unequal /* Q20 */

/* Beekeeping practices for Nosema */

ttest use_dys, by(EUvUK) unequal /* Q23 */
ttest use_forg, by(EUvUK) unequal /* Q23 */
ttest use_deb, by(EUvUK) unequal /* Q23 */
ttest use_var, by(EUvUK) unequal /* Q23 */
ttest use_feed, by(EUvUK) unequal /* Q23 */
ttest use_repq, by(EUvUK) unequal /* Q23 */
ttest use_atbs, by(EUvUK) unequal /* Q23 */

ttest feas_dys, by(EUvUK) unequal /* Q24 */
ttest feas_forg, by(EUvUK) unequal /* Q24 */
ttest fease_deb, by(EUvUK) unequal /* Q24 */
ttest feas_var, by(EUvUK) unequal /* Q24 */
ttest feas_feed, by(EUvUK) unequal /* Q24 */
ttest feas_repq, by(EUvUK) unequal /* Q24 */
ttest feas_atbs, by(EUvUK) unequal /* Q24 */
ttest feas_breed, by(EUvUK) unequal /* Q24 */


/*Beekeeping practices for AFB/EFB */

ttest use_insp, by(EUvUK) unequal /* Q26 */
ttest use_odor, by(EUvUK) unequal /* Q26 */
ttest use_afb_ropi, by(EUvUK) unequal /* Q26 */
ttest use_afb_scale, by(EUvUK) unequal /* Q26 */
ttest use_comkit, by(EUvUK) unequal /* Q26 */
ttest use_distools, by(EUvUK) unequal /* Q26 */
ttest use_procwax, by(EUvUK) unequal /* Q26 */
ttest use_prevlab, by(EUvUK) unequal /* Q26 */
ttest use_dislab, by(EUvUK) unequal /* Q26 */
ttest use_shook, by(EUvUK) unequal /* Q26 */
ttest use_shook_all, by(EUvUK) unequal /* Q26 */
ttest use_atb_afb, by(EUvUK) unequal /* Q26 */
ttest use_dest_afb, by(EUvUK) unequal /* Q26 */
ttest use_dest_all, by(EUvUK) unequal /* Q26 */
ttest use_afb_quick, by(EUvUK) unequal /* Q26 */
ttest use_afb_q, by(EUvUK) unequal /* Q26 */


/* Follow ups */


ttest int_bht, by(EUvUK) unequal /* Q27 */
ttest int_otc, by(EUvUK) unequal /* Q27 */
ttest int_bcon, by(EUvUK) unequal /* Q27 */























