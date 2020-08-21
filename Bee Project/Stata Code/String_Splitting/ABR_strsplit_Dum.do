/* Run ABR_Num_Cleansing.do, then ABR_Code_Labelling.do before running this file*/


/* The purpose of this code is to split the check-all question strings into individual variables and then replace dummy variables accordingly */

use "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/ABR_Coded_Labeled.dta", replace

sort region, stable
drop in 316/380

/* Europe vs. North America */
gen region1 = .
replace region1 = 0 if region == 0
replace region1 = 1 if region == 1
label define reg1 0 "Continental Europe" 1 "North America"
label val region1 reg1

/* Europe vs. United Kingdom */ 
gen region2 = .
replace region2 = 1 if region == 2
replace region2 = 0 if region == 0
label define reg2 0 "Continental Europe" 1 "United Kingdom"
label val region2 reg2


/* type_hives */

/* Create dummies, split strings, destring resulting vars, sort for missing values, recode missing values,recode dummies accordingly */

gen type_hive_TBH = 0
gen type_hive_LH = 0
gen type_hive_WH = 0
gen type_hive_DB = 0
gen type_hive_OTH = 0


split type_hives, p(",")
destring type_hives1 type_hives2 type_hives3 type_hives4, replace
sort type_hives, stable
replace type_hives = "." in 1/15

replace type_hive_TBH = 0 if type_hives1 != 2 | type_hives2 != 2 | type_hives3 != 2 | type_hives4 != 2
replace type_hive_TBH = 1 if type_hives1 == 2 | type_hives2 == 2 | type_hives3 == 2 | type_hives4 == 2
replace type_hive_TBH = . if type_hives == "."

replace type_hive_LH = 0 if type_hives1 != 4 | type_hives2 != 4 | type_hives3 != 4 | type_hives4 != 4
replace type_hive_LH = 1 if type_hives1 == 4 | type_hives2 == 4 | type_hives3 == 4 | type_hives4 == 4
replace type_hive_LH = . if type_hives == "."

replace type_hive_WH = 0 if type_hives1 != 6 | type_hives2 != 6 | type_hives3 != 6| type_hives4 != 6
replace type_hive_WH = 1 if type_hives1 == 6 | type_hives2 == 6 | type_hives3 == 6 | type_hives4 == 6
replace type_hive_WH = . if type_hives == "."

replace type_hive_DB = 0 if type_hives1 != 10 | type_hives2 != 10 | type_hives3 != 10 | type_hives4 != 10
replace type_hive_DB = 1 if type_hives1 == 10 | type_hives2 == 10 | type_hives3 == 10 | type_hives4 == 10
replace type_hive_DB = . if type_hives == "."

replace type_hive_OTH = 0 if type_hives1 != 11 | type_hives2 != 11 | type_hives3 != 11 | type_hives4 != 11
replace type_hive_OTH = 1 if type_hives1 == 11 | type_hives2 == 11 | type_hives3 == 11 | type_hives4 == 11
replace type_hive_OTH = . if type_hives == "."


drop type_hives1 type_hives2 type_hives3 type_hives4

label define TBH 0 "na" 1 "Top-Bar Hive"
label define LH 0 "na" 1 "Langstroth Hive"
label define WH 0 "na" 1 "Warre Hive"
label define DB 0 "na" 1 "Dadant Blatt"
label define OTH 0 "na" 1 "Other, please explain"

label val type_hive_TBH TBH
label val type_hive_LH LH
label val type_hive_WH WH
label val type_hive_DB DB
label val type_hive_OTH OTH


/* atb_int */

/* Create dummies, split strings, destring resulting vars, sort for missing values, recode missing values,recode dummies accordingly */


gen atbint_prev = .
gen atbint_cure = .
gen atbint_slow = .
gen atbint_prod = .
gen atbint_oth = .

split atb_int, p(",")
destring atb_int1 atb_int2 atb_int3 atb_int4, replace
sort atb_int, stable
replace atb_int = "." in 1/63

replace atbint_prev = 0 if atb_int1 != 1 | atb_int2 != 1 | atb_int3 != 1 | atb_int4 != 1 
replace atbint_prev = 1 if atb_int1 == 1 | atb_int2 == 1 | atb_int3 == 1 | atb_int4 == 1 
replace atbint_prev = . if atb_int == "."

replace atbint_cure = 0 if atb_int1 != 2 | atb_int2 != 2 | atb_int3 != 2 | atb_int4 != 2 
replace atbint_cure = 1 if atb_int1 == 2 | atb_int2 == 2 | atb_int3 == 2 | atb_int4 == 2 
replace atbint_cure = . if atb_int == "."

replace atbint_slow = 0 if atb_int1 != 4 | atb_int2 != 4 | atb_int3 != 4 | atb_int4 != 4
replace atbint_slow = 1 if atb_int1 == 4 | atb_int2 == 4 | atb_int3 == 4 | atb_int4 == 4
replace atbint_slow = . if atb_int == "."


replace atbint_prod = 0 if atb_int1 != 5 | atb_int2 != 5 | atb_int3 != 5 | atb_int4 != 5
replace atbint_prod = 1 if atb_int1 == 5 | atb_int2 == 5 | atb_int3 == 5 | atb_int4 == 5
replace atbint_prod = . if atb_int == "."

replace atbint_oth = 0 if atb_int1 != 6 | atb_int2 != 6 | atb_int3 != 6 | atb_int4 != 6
replace atbint_oth = 1 if atb_int1 == 6 | atb_int2 == 6 | atb_int3 == 6 | atb_int4 == 6
replace atbint_oth = . if atb_int == "."




label define prev 0 "na" 1 "Medicines that prevent diseases"
label define cure 0 "na" 1 "Medicines that cure only some diseases"
label define slow 0 "na" 1 "Medicines that kill or slow down the growth of bacteria and some other germs"
label define prod 0 "na" 1 "Medicines that increase production of the hives"
label define oth 0 "na" 1 "Other"


label val atbint_prev prev
label val atbint_cure cure
label val atbint_slow slow
label val atbint_prod prod
label val atbint_oth oth


drop atb_int1 atb_int2 atb_int3 atb_int4


/* use_atb_for */

/* Create dummies, split strings, destring resulting vars, sort for missing values, recode missing values,recode dummies accordingly */

sort use_atb_for, stable
replace use_atb_for = "." in 1/89
split use_atb_for, p(",")
destring use_atb_for1 use_atb_for2 use_atb_for3, replace

gen useatbfor_nos = .
gen useatbfor_var = .
gen useatbfor_afb = .
gen useatbfor_efb = .
gen useatbfor_shb = .
gen useatbfor_non = .
gen useatbfor_oth = .

replace useatbfor_nos = 0 if use_atb_for1 != 1 | use_atb_for2 != 1 | use_atb_for3 != 1
replace useatbfor_nos = 1 if use_atb_for1 == 1 | use_atb_for2 == 1 | use_atb_for3 == 1
replace useatbfor_nos = . if use_atb_for == "."

replace useatbfor_var = 0 if use_atb_for1 != 7 | use_atb_for2 != 7 | use_atb_for3 != 7
replace useatbfor_var = 1 if use_atb_for1 == 7 | use_atb_for2 == 7 | use_atb_for3 == 7
replace useatbfor_var = . if use_atb_for == "."


replace useatbfor_afb = 0 if use_atb_for1 != 2 | use_atb_for2 != 2 | use_atb_for3 != 2
replace useatbfor_afb = 1 if use_atb_for1 == 2 | use_atb_for2 == 2 | use_atb_for3 == 2
replace useatbfor_afb = . if use_atb_for == "."


replace useatbfor_efb = 0 if use_atb_for1 != 3 | use_atb_for2 != 3 | use_atb_for3 != 3
replace useatbfor_efb = 1 if use_atb_for1 == 3 | use_atb_for2 == 3 | use_atb_for3 == 3
replace useatbfor_efb = . if use_atb_for == "."


replace useatbfor_shb = 0 if use_atb_for1 != 8 | use_atb_for2 != 8 | use_atb_for3 != 8
replace useatbfor_shb = 1 if use_atb_for1 == 8 | use_atb_for2 == 8 | use_atb_for3 == 8
replace useatbfor_shb = . if use_atb_for == "."

replace useatbfor_non = 0 if use_atb_for1 != 6 | use_atb_for2 != 6 | use_atb_for3 != 6
replace useatbfor_non = 1 if use_atb_for1 == 6 | use_atb_for2 == 6 | use_atb_for3 == 6
replace useatbfor_non = . if use_atb_for == "."


replace useatbfor_oth = 0 if use_atb_for1 != 4 | use_atb_for2 != 4 | use_atb_for3 != 4
replace useatbfor_oth = 1 if use_atb_for1 == 4 | use_atb_for2 == 4 | use_atb_for3 == 4
replace useatbfor_oth = . if use_atb_for == "."


label define nos 1 "Nosema"
label define var1 1 "Varroa"
label define afb 1 "American Foulbrood"
label define efb 1 "European Foulbrood"
label define shb 1 "Small Hive Beetle"
label define non 1 "None"
label define oth1 1 "Other"

label val useatbfor_nos nos
label val useatbfor_var var1
label val useatbfor_afb afb
label val useatbfor_efb efb
label val useatbfor_shb shb
label val useatbfor_non non
label val useatbfor_oth oth1

drop use_atb_for1 use_atb_for2 use_atb_for3


/* get_atb */

/* Create dummies, split strings, destring resulting vars, sort for missing values, recode missing values,recode dummies accordingly */

gen getatb_acs = .
gen getatb_vet = .
gen getatb_phm = .
gen getatb_obk = .
gen getatb_bka = .
gen getatb_int = .
gen getatb_ext = .
gen getatb_oth = .

sort get_atb, stable
replace get_atb = "." in 1/217

split get_atb, p(",")
destring get_atb1 get_atb2 get_atb3, replace

replace getatb_acs = 0 if get_atb1 != 9 | get_atb2 != 9 | get_atb3 != 9
replace getatb_acs = 1 if get_atb1 == 9 | get_atb2 == 9 | get_atb3 == 9
replace getatb_acs = . if get_atb == "."

replace getatb_vet = 0 if get_atb1 != 1 | get_atb2 != 1 | get_atb3 != 1
replace getatb_vet = 1 if get_atb1 == 1 | get_atb2 == 1 | get_atb3 == 1
replace getatb_vet = . if get_atb == "."

replace getatb_phm = 0 if get_atb1 != 2 | get_atb2 != 2 | get_atb3 != 2
replace getatb_phm = 1 if get_atb1 == 2 | get_atb2 == 2 | get_atb3 == 2
replace getatb_phm = . if get_atb == "."

replace getatb_obk = 0 if get_atb1 != 3 | get_atb2 != 3 | get_atb3 != 3
replace getatb_obk = 1 if get_atb1 == 3 | get_atb2 == 3 | get_atb3 == 3
replace getatb_obk = . if get_atb == "."

replace getatb_bka = 0 if get_atb1 != 10 | get_atb2 != 10 | get_atb3 != 10
replace getatb_bka = 1 if get_atb1 == 10 | get_atb2 == 10 | get_atb3 == 10
replace getatb_bka = . if get_atb == "."

replace getatb_int = 0 if get_atb1 != 6 | get_atb2 != 6 | get_atb3 != 6
replace getatb_int = 1 if get_atb1 == 6 | get_atb2 == 6 | get_atb3 == 6
replace getatb_int = . if get_atb == "."

replace getatb_ext = 0 if get_atb1 != 8 | get_atb2 != 8 | get_atb3 != 8
replace getatb_ext = 1 if get_atb1 == 8 | get_atb2 == 8 | get_atb3 == 8
replace getatb_ext = . if get_atb == "."

replace getatb_oth = 0 if get_atb1 != 5 | get_atb2 != 5 | get_atb3 != 5
replace getatb_oth = 1 if get_atb1 == 5 | get_atb2 == 5 | get_atb3 == 5
replace getatb_oth = . if get_atb == "."

label define acs 0 "na" 1 "Agro Chemical Supply-House"
label val getatb_acs acs

label define vet 0 "na" 1 "Veterinarian"
label val getatb_vet vet

label define phm 0 "na" 1 "Pharmacy"
label val getatb_phm phm

label define obk 0 "na" 1 "Other Beekeepers"
label val getatb_obk obk

label define bka 0 "na" 1 "Beekeepers Association"
label val getatb_bka bka

label define int 0 "na" 1 "Internet"
label val getatb_int int

label define ext 0 "na" 1 "Extension Services"
label val getatb_ext ext

label define other 0 "na" 1 "Others, please explain"
label val getatb_oth other

drop get_atb1 get_atb2 get_atb3


/* info_atb */

/* Create dummies, split strings, destring resulting vars, sort for missing values, recode missing values,recode dummies accordingly */

gen infoatb_acs = .
gen infoatb_vet = .
gen infoatb_phm = .
gen infoatb_obk = .
gen infoatb_bka = .
gen infoatb_int = .
gen infoatb_bks = .
gen infoatb_ext = .
gen infoatb_oth = .

sort info_atb, stable
replace info_atb = "." in 1/165

split info_atb, p(",")
destring info_atb1 info_atb2 info_atb3 info_atb4 info_atb5 info_atb6 info_atb7, replace

replace infoatb_acs = 0 if info_atb1 != 7 | info_atb2 != 7 | info_atb3 != 7 | info_atb4 != 7 |info_atb5 != 7 | info_atb6 != 7 | info_atb3 != 7 |7
replace infoatb_acs = 1 if info_atb1 == 7 | info_atb2 == 7 | info_atb3 == 7 | info_atb4 == 7 | info_atb5 == 7 | info_atb6 == 7 | info_atb7 == 7
replace infoatb_acs = . if info_atb == "."

replace infoatb_vet = 0 if info_atb1 != 1 | info_atb2 != 1 | info_atb3 != 1 | info_atb4 != 1 | info_atb5 != 1 | info_atb6 != 1 | info_atb7 != 1
replace infoatb_vet = 1 if info_atb1 == 1 | info_atb2 == 1 | info_atb3 == 1 | info_atb4 == 1 | info_atb5 == 1 | info_atb6 == 1 | info_atb7 == 1
replace infoatb_vet = . if info_atb == "."

replace infoatb_phm = 0 if info_atb1 != 8 | info_atb2 != 8 | info_atb3 != 8 | info_atb4 != 8 | info_atb5 != 8 | info_atb6 != 8 | info_atb7 != 8
replace infoatb_phm = 1 if info_atb1 == 8 | info_atb2 == 8 | info_atb3 == 8 | info_atb4 == 8 | info_atb5 == 8 | info_atb6 == 8 | info_atb7 == 8
replace infoatb_phm = . if info_atb == "."

replace infoatb_obk = 0 if info_atb1 != 2 | info_atb2 != 2 | info_atb3 != 2 | info_atb4 != 2 | info_atb5 != 2 | info_atb6 != 2 | info_atb7 != 2
replace infoatb_obk = 1 if info_atb1 == 2 | info_atb2 == 2 | info_atb3 == 2 | info_atb4 == 2 | info_atb5 == 2 | info_atb6 == 2 | info_atb7 == 2
replace infoatb_obk = . if info_atb == "."

replace infoatb_bka = 0 if info_atb1 != 9 | info_atb2 != 9 | info_atb3 != 9 | info_atb4 != 9 | info_atb5 != 9 | info_atb6 != 9 | info_atb7 != 9
replace infoatb_bka = 1 if info_atb1 == 9 | info_atb2 == 9 | info_atb3 == 9 | info_atb4 == 9 | info_atb5 == 9 | info_atb6 == 9 | info_atb7 == 9
replace infoatb_bka = . if info_atb == "."

replace infoatb_int = 0 if info_atb1 != 3 | info_atb2 != 3 | info_atb3 != 3 | info_atb4 != 3 | info_atb5 != 3 | info_atb6 != 3 | info_atb7 != 3
replace infoatb_int = 1 if info_atb1 == 3 | info_atb2 == 3 | info_atb3 == 3 | info_atb4 == 3 | info_atb5 == 3 | info_atb6 == 3 | info_atb7 == 3
replace infoatb_int = . if info_atb == "."

replace infoatb_ext = 0 if info_atb1 != 5 | info_atb2 != 5 | info_atb3 != 5 | info_atb4 != 5 | info_atb5 != 5 | info_atb6 != 5 | info_atb7 != 5
replace infoatb_ext = 1 if info_atb1 == 5 | info_atb2 == 5 | info_atb3 == 5 | info_atb4 == 5 | info_atb5 == 5 | info_atb6 == 5 | info_atb7 == 5
replace infoatb_ext = . if info_atb == "."

replace infoatb_oth = 0 if info_atb1 != 6 | info_atb2 != 6 | info_atb3 != 6 | info_atb4 != 6 | info_atb5 != 6 | info_atb6 != 6 | info_atb7 != 6
replace infoatb_oth = 1 if info_atb1 == 6 | info_atb2 == 6 | info_atb3 == 6 | info_atb4 == 6 | info_atb5 == 6 | info_atb6 == 6 | info_atb7 == 6
replace infoatb_oth = . if info_atb == "."

replace infoatb_bks = 0 if info_atb1 != 4 | info_atb2 != 4 | info_atb3 != 4 | info_atb4 != 4 | info_atb5 != 4 | info_atb6 != 4 | info_atb7 != 4 
replace infoatb_bks = 1 if info_atb1 == 4 | info_atb2 == 4 | info_atb3 == 4 | info_atb4 == 4 | info_atb5 == 4 | info_atb6 == 4 | info_atb7 == 4 
replace infoatb_bks = . if info_atb == "."

label define bks 0 "na" 1 "Books"
label val infoatb_bks bks

label val infoatb_acs acs
label val infoatb_vet vet
label val infoatb_phm phm
label val infoatb_obk obk
label val infoatb_bka bka
label val infoatb_int int
label val infoatb_ext ext 
label val infoatb_oth other

drop info_atb1 info_atb2 info_atb3 info_atb4 info_atb5 info_atb6 info_atb7

save "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/STATA CODE/T-TESTS/ABR_Labeled_Split.dta", replace


