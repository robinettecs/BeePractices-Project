/* Run VM_Code_Labelling.do before running this code */

use "/Users/christopherrobinette/Desktop/CARE stuff/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/DTAs/VM_Coded_Labeled.dta", replace


recode gend (2 = .)
/* EU v NA */

/* General Demographics questions */ 

/* General insights not in survey questions: completion/progress */

ttest progress, by(EUvNA) unequal
ttest finished, by(EUvNA) unequal

/*Demographics block of question 5-15 */
ttest age, by(EUvNA) unequal /* Q7 */
ttest gend, by(EUvNA) unequal /* Q8 */
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

/* Beekeeping practices for Varroa */

ttest mites_dummy, by(EUvNA) unequal /* Q16 */
ttest v_know, by(EUvNA) unequal /* Q18 */
ttest v_rec, by(EUvNA) unequal /* Q19 */
ttest v_cont_1, by(EUvNA) unequal /* Q20 How useful do you think each example belwo is at Varroa prevention/control? Adopt/provide hives with screened bottom boards */
ttest v_cont_2, by(EUvNA) unequal /* Q20 Nuclei and swarms should originate from colonies with no clinical signs of diseases related with Varroa */
ttest v_cont_3, by(EUvNA) unequal /* Q20 Maintain the nimber of Varroa below the harmful threshold in each colony */
ttest v_cont_4, by(EUvNA) unequal /* Adopt diagnostic tools for measuring Varroa infestation levels */
ttest v_cont_5, by(EUvNA) unequal /* Provide sufficient number of healthy spare bees at the right time */
ttest v_cont_6, by(EUvNA) unequal /* Have good knowledge of the signs of varroosis and virosis */
ttest v_cont_7, by(EUvNA) unequal /* Select and breed queens that are more Varroa tolerant/resistant */
ttest v_cont_8, by(EUvNA) unequal /* Treat swarms (no brood) just after harvest */



/* Acarides */ 

ttest v_treat, by(EUvNA) unequal /* Q21 */
ttest ms_acsh, by(EUvNA) unequal /* Q23 */
ttest ms_vet, by(EUvNA) unequal /* Q23 */
ttest ms_phm, by(EUvNA) unequal /* Q23 */
ttest ms_otbk, by(EUvNA) unequal /* Q23 */
ttest ms_bka, by(EUvNA) unequal /* Q23 */
ttest ms_int, by(EUvNA) unequal /* Q23 */
ttest ms_ext, by(EUvNA) unequal /* Q23 */
ttest ms_oth, by(EUvNA) unequal /* Q23 */

ttest v_scrip, by(EUvNA) unequal /* Q24 */

ttest med_proc1, by(EUvNA) unequal /* Q25 Treat simultaneously all colonies of the apiary*/
ttest med_proc2, by(EUvNA) unequal /* Q25 Treat only the diseased hives in an apiary*/
ttest med_proc3, by(EUvNA) unequal /* Q25 Perform at least 2 treatments per year*/
ttest med_proc4, by(EUvNA) unequal /* Q25 Rotate the products*/
ttest med_proc5, by(EUvNA) unequal /* Q25 Use preferably medicines allowed in organic farming*/
ttest med_proc6, by(EUvNA) unequal /* Q25 Verifying Varroa mite presence on adult bees after treatment*/
ttest med_proc7, by(EUvNA) unequal /* Q25 Verifying Varroa mite presence on adult bees after treatment--examples */

ttest noinst, by(EUvNA) unequal /* Q26 */


/* Follow up questions */ 

ttest int_bht, by(EUvNA) unequal /* 27 */
ttest int_otc, by(EUvNA) unequal /* 27 */
ttest int_bkconn, by(EUvNA) unequal /* 27 */




/* EU v UK */ 

/* General Demographics questions */ 

/* General insights not in survey questions: completion/progress */

ttest progress, by(EUvUK) unequal
ttest finished, by(EUvUK) unequal

/*Demographics block of question 5-15 */
ttest age, by(EUvUK) unequal /* Q7 */
ttest gend, by(EUvUK) unequal /* Q8 */
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

/* Beekeeping practices for Varroa */

ttest mites_dummy, by(EUvUK) unequal /* Q16 */
ttest v_know, by(EUvUK) unequal /* Q18 */
ttest v_rec, by(EUvUK) unequal /* Q19 */
ttest v_cont_1, by(EUvUK) unequal /* Q20 How useful do you think each example belwo is at Varroa prevention/control? Adopt/provide hives with screened bottom boards */
ttest v_cont_2, by(EUvUK) unequal /* Q20 Nuclei and swarms should originate from colonies with no clinical signs of diseases related with Varroa */
ttest v_cont_3, by(EUvUK) unequal /* Q20 Maintain the nimber of Varroa below the harmful threshold in each colony */
ttest v_cont_4, by(EUvUK) unequal /* Adopt diagnostic tools for measuring Varroa infestation levels */
ttest v_cont_5, by(EUvUK) unequal /* Provide sufficient number of healthy spare bees at the right time */
ttest v_cont_6, by(EUvUK) unequal /* Have good knowledge of the signs of varroosis and virosis */
ttest v_cont_7, by(EUvUK) unequal /* Select and breed queens that are more Varroa tolerant/resistant */
ttest v_cont_8, by(EUvUK) unequal /* Treat swarms (no brood) just after harvest */



/* Acarides */ 

ttest v_treat, by(EUvUK) unequal /* Q21 */
ttest ms_acsh, by(EUvUK) unequal /* Q23 */
ttest ms_vet, by(EUvUK) unequal /* Q23 */
ttest ms_phm, by(EUvUK) unequal /* Q23 */
ttest ms_otbk, by(EUvUK) unequal /* Q23 */
ttest ms_bka, by(EUvUK) unequal /* Q23 */
ttest ms_int, by(EUvUK) unequal /* Q23 */
ttest ms_ext, by(EUvUK) unequal /* Q23 */
ttest ms_oth, by(EUvUK) unequal /* Q23 */

ttest v_scrip, by(EUvUK) unequal /* Q24 */

ttest med_proc1, by(EUvUK) unequal /* Q25 Treat simultaneously all colonies of the apiary*/
ttest med_proc2, by(EUvUK) unequal /* Q25 Treat only the diseased hives in an apiary*/
ttest med_proc3, by(EUvUK) unequal /* Q25 Perform at least 2 treatments per year*/
ttest med_proc4, by(EUvUK) unequal /* Q25 Rotate the products*/
ttest med_proc5, by(EUvUK) unequal /* Q25 Use preferably medicines allowed in organic farming*/
ttest med_proc6, by(EUvUK) unequal /* Q25 Verifying Varroa mite presence on adult bees after treatment*/
ttest med_proc7, by(EUvUK) unequal /* Q25 Verifying Varroa mite presence on adult bees after treatment--examples */

ttest noinst, by(EUvUK) unequal /* Q26 */


/* Follow up questions */ 

ttest int_bht, by(EUvUK) unequal /* 27 */
ttest int_otc, by(EUvUK) unequal /* 27 */
ttest int_bkconn, by(EUvUK) unequal /* 27 */


























