import delimited "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/CLEANED/ABR_Num_cleaned.csv", clear 


gen resp_lang = .
replace resp_lang = 1 if user_lang == "EN"
replace resp_lang = 2 if user_lang == "IT"
replace resp_lang = 3 if user_lang == "ES-ES"
replace resp_lang = 4 if user_lang == "DA"
replace resp_lang = 5 if user_lang == "FR"
replace resp_lang = 6 if user_lang == "NL"
replace resp_lang = 7 if user_lang == "RU"
replace resp_lang = 8 if user_lang == "SL"
replace resp_lang = 9 if user_lang == "AR"

gen q_lan = .
replace q_lan = 1 if q_lang == "EN"
replace q_lan = 2 if q_lang == "IT"
replace q_lan = 3 if q_lang == "ES-ES"
replace q_lan = 4 if q_lang == "DA"
replace q_lan = 5 if q_lang == "FR"
replace q_lan = 6 if q_lang == "NL"
replace q_lan = 7 if q_lang == "RU"
replace q_lan = 8 if q_lang == "SL"
replace q_lan = 9 if q_lang == "AR"


label define resp_lang 1 "EN" 2 "IT" 3 "ES_ES" 4 "DA" 5 "FR" 6 "NL" 7 "RU" 8 "SL" 9 "AR"
label val resp_lang resp_lang
drop user_lang


label define q_lan 1 "EN" 2 "IT" 3 "ES_ES" 4 "DA" 5 "FR" 6 "NL" 7 "RU" 8 "SL" 9 "AR"
label val q_lan q_lan
drop q_lang

/* Converted string to numeric and added labels*/

sort resp_lang, stable
drop in 1/5

/* Dropped observations w/ no values*/


drop agree resp_type

/* Fuzzying latitutde and longitude */

gen lat = loc_lat + 3
gen lon = loc_long + 3
drop loc_lat loc_long

label define finished 1 "Complete" 0 "Incomplete"
label val finished finished


label define bee_country 1 "Algeria" 2 "Egypt" 3 "Libya" 6 "Tunisia" 7 "Canada" 13 "Ethiopia" 15 "Kenya" 31 "Gabon" 44 "Ghana" 51 "Nigeria" 87 "United States Virgin Island" 92 "Honduras" 93 "Mexico" 96 "Argentina" 98 "United States of America" 100 "Chile" 101 "Colombia" 102 "Ecuador" 108 "Kazakhstan" 125 "Thailand" 131 "Iran" 140 "Georgia" 150 "Turkey" 154 "Bulgaria" 156 "Poland" 159 "Slovakia" 160 "Ukraine" 161 "Russian Federation" 162 "Denmark" 168 "Lituania" 169 "Norway" 170 "Sweden" 171 "United Kingdom of Great Britain and Northern Ireland" 172 "Albania" 174 "Bosnia and Herzegovina" 176 "Greece" 177 "Italy" 178 "Malta" 180 "Portugal" 182 "Slovenia" 183 "Spain" 184 "Austria" 185 "Belgium" 186 "France" 187 "Germany" 189 "Switzerland" 192 "Papua New Guinea" 212 "New Zealand"

label val bee_country bee_country

label define bee_region 81 "Biblio" 8 "California" 135 "Central District" 9 "Colorado" 15 "Idaho" 16 "Illinois" 17 "Indiana" 19 "Kansas" 23 "Maryland" 24 "Massachusetts" 25 "Michigan" 26 "Minnesota" 27 "Mississippi" 28 "Missouri" 33 "New Jersey" 35 "New York" 36 "North Carolina" 150 "North Island" 38 "Ohio" 39 "Oklahoma" 126 "Ontario" 40 "Oregon" 41 "Pennsylvania" 77 "Santiago" 124 "Saskatchewan" 45 "Tennessee" 46 "Texas" 64 "Turkistan" 76 "Valparaiso" 48 "Vermont" 49 "Virginia" 50 "Washington" 51 "West Virginia" 52 "Wisconsin"
label val bee_region bee_region


gen birth_years = 1919 + birth_year
drop birth_year
gen age = 2020 - birth_year

/* Birth year was interpreted as the number of years between 1919 and the respondent' birth year, so I created a new variable which did the math*/

gen gend = gender - 1
label define gend 0 "Not female" 1 "Female" 
label val gend gend

gen education = educ_highest - 1
label define education 0 "High School (Secondary) or less" 1 "Vocational or Technical Degree, Associates Degree, or Some College" 2 "University Degree" 3 "Post-graduate qualification"
label val education education
drop educ_highest
rename education educ_highest

destring est_hives, generate(est_hive) force


/* Converted string to numeric with hive estimate, force dropped string observations, will find these later in raw files and pipe them back in to avoid missing values*/

gen bk_year = bk_years - 4

/* The survey codes for beekeeping years was shifted up by four, so I unshifted it*/


sort type_hives, stable

gen type_hives_2 = .
replace type_hives_2 = 2 if type_hives == "2"
replace type_hives_2 = 3 if type_hives == "2,11" 
replace type_hives_2 = 5 if type_hives == "2,4"
replace type_hives_2 = 7 if type_hives == "2,10" 
replace type_hives_2 = 9 if type_hives == "2,6,10,11"
replace type_hives_2 = 4 if type_hives == "4"
replace type_hives_2 = 6 if type_hives == "6"
replace type_hives_2 = 10 if type_hives == "10"
replace type_hives_2 = 11 if type_hives == "11"
replace type_hives_2 = 12 if type_hives == "4,10,11"
replace type_hives_2 = 13 if type_hives == "4,11" 
replace type_hives_2 = 14 if type_hives == "4,6" 
replace type_hives_2 = 15 if type_hives == "6,10"
replace type_hives_2 = 16 if type_hives == "6,11"
replace type_hives_2 = 17 if type_hives == "10,11"

 


label define type_hives_2 2 "Top-Bar Hive" 3 "Top-Bar Hive, Others" 5 "Top-Bar Hive, Langstroth Hive" 7 "Top-Bar Hive, Dadant Blatt" 9 "Top-Bar Hive, Warre Hive, Dadant Blatt, Others" 4 "Langstroth Hive" 6 "Warre Hive" 10 "Dadant Blatt" 11 "Other(s)" 12 "Langstroth Hive, Dadant Blatt, Others" 13 "Langstroth Hive, Others" 14 "Langstroth Hive, Warre Hive" 15 "Warre Hive, Dadant Blatt" 16 "Warre Hive, Others" 16 "Dadant Blatt, Others"
label val type_hives_2 type_hives_2
drop type_hives
rename type_hives_2 type_hives




recode bee_prof (5 = 1)
recode bee_prof (6 = 0)
label define bee_prof 1 "Yes" 0 "No"
label val bee_prof bee_prof

recode bee_move (10 = 1)
recode bee_move (11 = 0)
label define bee_move 1 "Yes" 0 "No"
label val bee_move bee_move

recode insp_hives (1 = 0)
recode insp_hives (3 = 1)
recode insp_hives (8 = 2)
recode insp_hives (6 = 3)
recode insp_hives (7 = 4)
label define insp_hives 0 "Never" 1 "Once a month" 2 "Two or three times a month" 3 "Four times a month" 4 "More than four times a month"
label val insp_hives insp_hives


sort atb_int, stable

gen atb_int_2 = .
replace atb_int_2 = 1 if atb_int == "1"
replace atb_int_2 = 2 if atb_int == "2"
replace atb_int_2 = 3 if atb_int == "1,2"
replace atb_int_2 = 4 if atb_int == "4"
replace atb_int_2 = 5 if atb_int == "5"
replace atb_int_2 = 6 if atb_int == "6"
replace atb_int_2 = 7 if atb_int == "7"
replace atb_int_2 = 9 if atb_int == "1,2,4"
replace atb_int_2 = 11 if atb_int == "1,2,4,5"
replace atb_int_2 = 12 if atb_int == "1,2,4,5,6"
replace atb_int_2 = 13 if atb_int == "1,2,5"
replace atb_int_2 = 14 if atb_int == "1,4"
replace atb_int_2 = 15 if atb_int == "1,4,5"
replace atb_int_2 = 16 if atb_int == "1,4,6"
replace atb_int_2 = 17 if atb_int == "1,6"
replace atb_int_2 = 18 if atb_int == "2,4"
replace atb_int_2 = 19 if atb_int == "2,4,5"
replace atb_int_2 = 20 if atb_int == "2,4,6"
replace atb_int_2 = 21 if atb_int == "2,5"
replace atb_int_2 = 22 if atb_int == "4,6"

label define atb_int_2 1 "Medicines that prevent diseases" 2 "Medicines that cure only some diseases" 3 "Medicines that prevent diseases, Medicines that cure only some diseases" 4 "Medicines that kill or slow down the growth of bacteria and some other germs" 5 "Medicines that increase production of the hives" 6 "Other" 7 "I don't know" 9 "Medicines that prevent diseases, Medicines that cure only some diseases, Medicines that kill or slow down the growth of bacteria and some other germs" 11 "Medicines that prevent diseases, Medicines that cure only some diseases, Medicines that kill or slow down the growth of bacteria and some other germs, Medicines that increase production of the hives" 12 "Medicines that prevent diseases, Medicines that cure only some diseases, Medicines that kill or slow down the growth of bacteria and some other germs, Medicines that increase production of the hives, Other" 13 "Medicines that prevent diseases, Medicines that cure only some diseases, Medicines that increase production of the hives" 14 "Medicines that prevent diseases, Medicines that kill or slow down the growth of bacteria and some other germs" 15 "Medicines that prevent diseases, Medicines that kill or slow down the growth of bacteria and some other germs, Medicines that increase production of the hives" 16 "Medicines that prevent diseases, Medicines that kill or slow down the growth of bacteria and some other germs, Other" 17 "Medicines that prevent diseases, Other" 18 "Medicines that cure only some diseases, Medicines that kill or slow down the growth of bacteria and some other germs" 19 "Medicines that cure only some diseases, Medicines that kill or slow down the growth of bacteria and some other germs, Medicines that increase production of the hives" 20 "Medicines that cure only some diseases, Medicines that kill or slow down the growth of bacteria and some other germs, Other" 21 "Medicines that cure only some diseases, Medicines that increase production of the hives" 22 "Medicines that kill or slow down the growth of bacteria and some other germs, Other"

label val atb_int_2 atb_int_2
drop atb_int
rename atb_int_2 atb_int


recode atb_treat (2 = 0)
label define atb_treat 1 "Yes" 0 "No"
label val atb_treat atb_treat

gen use_atb_for_2 = .
replace use_atb_for_2 = 1 if use_atb_for == "1"
replace use_atb_for_2 = 7 if use_atb_for == "7"
replace use_atb_for_2 = 2 if use_atb_for == "2"
replace use_atb_for_2 = 3 if use_atb_for == "3"
replace use_atb_for_2 = 8 if use_atb_for == "8"
replace use_atb_for_2 = 6 if use_atb_for == "6"
replace use_atb_for_2 = 4 if use_atb_for == "4"
replace use_atb_for_2 = 10 if use_atb_for == "1,2"
replace use_atb_for_2 = 11 if use_atb_for == "1,2,3"
replace use_atb_for_2 = 12 if use_atb_for == "1,3"
replace use_atb_for_2 = 13 if use_atb_for == "1,7"
replace use_atb_for_2 = 14 if use_atb_for == "1,7,8"
replace use_atb_for_2 = 15 if use_atb_for == "2,3"
replace use_atb_for_2 = 16 if use_atb_for == "3,6,4"
replace use_atb_for_2 = 17 if use_atb_for == "6,4"
replace use_atb_for_2 = 18 if use_atb_for == "7,8"


label define use_atb_for_2 1 "Nosema" 2 "American Foulbrood" 3 "European Foulbrood" 4 "Others, please explain" 6 "None" 7 "Varroa" 8 "Small Bee Hive" 10 "Nosema, American Foulbrood" 11 "Nosema, American Foulbrood, European Foulbrood" 12 "Nosema, European Foulbrood" 13 "Nosema, Varroa" 14 "Nosema, Varroa, Small Bee Hive" 15 "American Foulbrood, European Foulbrood" 16 "European Foulbrood, None, Others" 17 "None, Others" 18 "Varroa, Small Bee Hive"

label val use_atb_for_2 use_atb_for_2

drop use_atb_for
rename use_atb_for_2 use_atb_for



gen get_atb_2 = .
replace get_atb_2 = 9 if get_atb == "9"
replace get_atb_2 = 1 if get_atb == "1"
replace get_atb_2 = 2 if get_atb == "2"
replace get_atb_2 = 3 if get_atb == "3"
replace get_atb_2 = 10 if get_atb == "10"
replace get_atb_2 = 6 if get_atb == "6"
replace get_atb_2 = 8 if get_atb == "8"
replace get_atb_2 = 5 if get_atb == "5"
replace get_atb_2 = 11 if get_atb == "1,2"
replace get_atb_2 = 12 if get_atb == "1,5"
replace get_atb_2 = 13 if get_atb == "10,6"
replace get_atb_2 = 14 if get_atb == "10,8"
replace get_atb_2 = 15 if get_atb == "3,10"
replace get_atb_2 = 16 if get_atb == "3,10,6"
replace get_atb_2 = 17 if get_atb == "6,5"
replace get_atb_2 = 18 if get_atb == "9,1,2"
replace get_atb_2 = 19 if get_atb == "9,10"
replace get_atb_2 = 20 if get_atb == "9,6"

label define get_atb_2 9 "Agro Chemical Supply-House" 1 "Veterinarian" 2 "Pharmacy" 3 "Other beekeeper" 10 "Beekeepers' Association" 6 "Internet" 8 "Extension Services" 5 "Others, please explain" 11 "Veterinarian, Pharmacy" 12 "Veterinarian, Others" 13 "Beekeepers' Association, Internet" 14 "Beekeepers Association, Extension Services" 15 "Other beekeeper, Beekeepers Association" 16 "Other beekeeper, Beekeepers Association, Internet" 17 "Internet, Others" 18 "Agro Chemical Supply-House, Veterinarian, Pharmacy" 19 "Agro Chemical Supply-House, Beekeepers Association" 20 "Agro Chemical Supply-House, Internet"

label val get_atb_2 get_atb_2
drop get_atb
rename get_atb_2 get_atb


recode need_scrp (2 = 0)
recode need_scrp (3 = .)
label define need_scrp 1 "Yes" 0 "No"
label val need_scrp need_scrp

gen how_atb2 = .
replace how_atb2 = 0 if how_atb == "1"
replace how_atb2 = 1 if how_atb == "2"
replace how_atb2 = 2 if how_atb == "1,2"
label define atb 0 "Prevention of an infection" 1 "Treatment of an infection" 2 "Prevention and treatment of infection"
label val how_atb2 atb
drop how_atb
rename how_atb2 how_atb

gen info_atb_2 = .
replace info_atb_2 = 1 if info_atb == "1"
replace info_atb_2 = 2 if info_atb == "2"
replace info_atb_2 = 3 if info_atb == "3"
replace info_atb_2 = 4 if info_atb == "4"
replace info_atb_2 = 5 if info_atb == "5"
replace info_atb_2 = 6 if info_atb == "6"
replace info_atb_2 = 7 if info_atb == "7"
replace info_atb_2 = 8 if info_atb == "8"
replace info_atb_2 = 9 if info_atb == "9"
replace info_atb_2 = 10 if info_atb == "1,2"
replace info_atb_2 = 11 if info_atb == "1,2,9"
replace info_atb_2 = 12 if info_atb == "1,2,9,3"
replace info_atb_2 = 13 if info_atb == "1,2,9,3,4"
replace info_atb_2 = 14 if info_atb == "1,3,4"
replace info_atb_2 = 15 if info_atb == "1,3,4,5"
replace info_atb_2 = 16 if info_atb == "1,5"
replace info_atb_2 = 17 if info_atb == "1,6"
replace info_atb_2 = 18 if info_atb == "1,8"
replace info_atb_2 = 19 if info_atb == "1,8,2,3"
replace info_atb_2 = 20 if info_atb == "1,8,2,3,5"
replace info_atb_2 = 21 if info_atb == "1,8,2,9,3,4"
replace info_atb_2 = 22 if info_atb == "1,8,3,4"
replace info_atb_2 = 23 if info_atb == "1,8,5"
replace info_atb_2 = 24 if info_atb == "1,8,6"
replace info_atb_2 = 25 if info_atb == "1,8,9,3"
replace info_atb_2 = 26 if info_atb == "1,8,9,5"
replace info_atb_2 = 27 if info_atb == "1,8,9,6"
replace info_atb_2 = 28 if info_atb == "1,9"
replace info_atb_2 = 29 if info_atb == "1,9,3"
replace info_atb_2 = 31 if info_atb == "1,9,4"
replace info_atb_2 = 32 if info_atb == "1,9,4,5"
replace info_atb_2 = 33 if info_atb == "1,9,6"
replace info_atb_2 = 34 if info_atb == "2,3,4"
replace info_atb_2 = 35 if info_atb == "2,3,5"
replace info_atb_2 = 36 if info_atb == "2,9"
replace info_atb_2 = 37 if info_atb == "2,9,3"
replace info_atb_2 = 38 if info_atb == "2,9,3,4"
replace info_atb_2 = 39 if info_atb == "2,9,3,4,5"
replace info_atb_2 = 40 if info_atb == "2,9,4"
replace info_atb_2 = 41 if info_atb == "2,9,5"
replace info_atb_2 = 42 if info_atb == "3,4"
replace info_atb_2 = 43 if info_atb == "3,4,5,6"
replace info_atb_2 = 44 if info_atb == "3,6"
replace info_atb_2 = 45 if info_atb == "4,5,6"
replace info_atb_2 = 46 if info_atb == "7,1"
replace info_atb_2 = 47 if info_atb == "7,1,2,9,3,5"
replace info_atb_2 = 48 if info_atb == "7,1,8,2,9,3,4"
replace info_atb_2 = 49 if info_atb == "7,2,4,5"
replace info_atb_2 = 50 if info_atb == "7,3"
replace info_atb_2 = 51 if info_atb == "7,8,9,3,4,6"
replace info_atb_2 = 52 if info_atb == "9,3"
replace info_atb_2 = 53 if info_atb == "9,3,4"
replace info_atb_2 = 54 if info_atb == "9,3,5"
replace info_atb_2 = 55 if info_atb == "9,4"
replace info_atb_2 = 56 if info_atb == "9,4,5"
replace info_atb_2 = 57 if info_atb == "9,4,6"
replace info_atb_2 = 58 if info_atb == "9,5"
replace info_atb_2 = 59 if info_atb == "9,6"

label define info_atb_2 1 "Veterinarian" 2 "Other Beekeepers" 3 "Internet" 4 "Books" 5 "Extension Services" 6 "Others" 7 "Agro Chemical Supply-House" 8 "Pharmacy" 9 "Beekeepers Association" 10 "Veterinarian, Other Beekeepers" 11 "Veterinarian, Other Beekeepers, Beekeepers Association" 12 "Veterinarian, Other Beekeepers, Beekeepers Association, Internet" 13 "Veterinarian, Other Beekeepers, Beekeepers Association, Internet, Books" 14 "Veterinarian, Internet, Books" 15 "Veterinarian, Internet, Books, Extension Services" 16 "Veterinarian, Extension Services" 17 "Veterinarian, Others" 18 "Veterinarian, Pharmacy" 19 "Veterinarian, Pharmacy, Other Beekeepers, Internet" 20 "Veterinarian, Pharmacy, Other Beekeepers, Internet, Extension Services" 21 "Veterinarian, Pharmacy, Other Beekeepers, Beekeepers Association, Internet, Books" 22 "Veterinarian, Pharmacy, Internet, Books" 23 "Veterinarian, Pharmacy, Extension Services" 24 "Veterinarian, Pharmacy, Others" 25 "Veterinarian, Pharmacy, Beekeepers Association, Internet" 26 "Veterinarian, Pharmacy, Beekeepers Association, Extension Services" 27 "Veterinarian, Pharmacy, Beekeepers Association, Others" 28 "Veterinarian, Beekeepers Association" 29 "Veterinarian, Beekeepers Association, Internet" 31 "Veterinarian, Beekeepers Association, Books" 32 "Veterinarian, Beekeepers Association, Books, Extension Services" 33 "Veterinarian, Beekeepers Association, Others" 34 "Other Beekeepers, Internet, Books" 35 "Other Beekeepers, Internet, Extension Services" 36 "Other Beekeepers, Beekeepers Association" 37 "Other Beekeepers, Beekeepers Association, Internet" 38 "Other Beekeepers, Beekeepers Association, Internet, Books" 39 "Other Beekeepers, Beekeepers Association, Internet, Books, Extension Services" 40 "Other Beekeepers, Beekeepers Association, Books" 41 "Other Beekeepers, Beekeepers Association, Extension Services" 42 "Internet, Books" 43 "Internet, Books, Extension Services, Others" 44 "Internet, Others" 45 "Books, Extension Services, Other" 46 "Agro Chemical Supply-House, Veterinarian" 47 "Agro Chemical Supply-House, Veterinarian, Other Beekeepers, Beekeepers Association, Internet, Extension Services" 48 "Agro Chemical Supply-House, Veterinarian, Pharmacy, Other Beekeepers, Beekeepers Association, Internet, Books" 49 "Agro Chemical Supply-House, Other Beekeepers, Books, Extension Services" 50 "Agro Chemical Supply-House, Internet" 51 "Agro Chemical Supply-House, Pharmacy, Beekeepers Association, Internet, Books, Others" 52 "Beekeepers Association, Internet" 53 "Beekeepers Association, Internet, Books" 54 "Beekeepers Association, Internet, Extension Services" 55 "Beekeepers Association, Books" 56 "Beekeepers Association, Books, Extension Services" 57 "Beekeepers Association, Books, Others" 58 "Beekeepers Association, Extension Services" 59 "Beekeepers Association, Others"

label val info_atb_2 info_atb_2
drop info_atb
rename info_atb_2 info_atb

gen no_lab = use_nolab - 1
label define use_nolab 0 "Never" 1 "Sometimes" 2 "Often" 3 "Usually" 4 "Always"
label val no_lab use_nolab
drop use_nolab
rename no_lab use_nolab

recode know_atb (5 = 0)
recode know_atb (6 = 4)
label define know_atb 0 "No Knowledge" 1 "Little Knowledge" 2 "Somewhat Knowledge" 3 "Moderately Knowledgeable" 4 "Extremely Knowledgeable"
label val know_atb know_atb

recode agr_no_eat (2 = .)
recode agr_no_eat (3 = 0)
label define agr_no_eat 1 "Agree" 0 "Disagree"
label val agr_no_eat agr_no_eat

recode know_atb_res (4 = 1)
recode know_atb_res (5 = 0)
label define know_atb_res 1 "Yes" 0 "No"
label val know_atb_res know_atb_res

recode know_resist (5 = 0)
recode know_resist (4 = 1)
label define know_resist 1 "Yes" 0 "No"
label val know_resist know_resist

gen atb_fail1 = atb_fail - 1
label define atb_fail 0 "Never" 1 "Sometimes" 2 "Almost always" 3 "Always"
label val atb_fail1 atb_fail
drop atb_fail
rename atb_fail1 atb_fail
recode atb_fail (4=.)

recode agr_work (2 = .)
recode agr_work (3 = 0)
label define agr_work 1 "Agree" 0 "Disagree"
label val agr_work agr_work

recode vet_risk (4 = 1)
recode vet_risk (5 = 0)
label define vet_risk 1 "Yes" 0 "No"
label val vet_risk vet_risk

gen atb_imp1 = atb_imp - 1
recode atb_imp1 (3 = .)
label define atb_imp 0 "No impact" 1 "A little impact" 2 "A large impact"
label val atb_imp1 atb_imp
drop atb_imp
rename atb_imp1 atb_imp

recode exp_resist (1 = 0)
recode exp_resist (2 = 1)
recode exp_resist (3 = 2)

label define exp_resist 0 "Never seen it" 1 "Saw a live example of it" 2 "Seen it multiple times"
label val exp_resist exp_resist

recode int_bht (5 = 0)
recode int_bht (4 = 1)
label define int_bht 1 "Yes" 0 "No"
label val int_bht int_bht 

recode int_otc (2 = 0)
label define int_otc 1 "Yes" 0 "No"
label val int_otc int_otc 

gen int_bcon = int_bkconn - 6
label define int_bkconn 0 "Not at all interested" 1 "Somewhat interested" 2 "Interested" 3 "Very interested" 4 "Extremely interested"
label val int_bcon int_bkconn
drop int_bkconn
rename int_bcon int_bkconn

gen reg1 = 0
replace reg1 = 1 if region == "North America"
replace reg1= 2 if region == "Northern Europe"
replace reg1 = 3 if region == "Southern Europe"
replace reg1 = 4 if region == "Western Europe"
label define reg1 0 "Other" 1 "North America" 2 "Northern Europe" 3 "Southern Europe" 4 "Western Europe"
label val reg1 reg1
drop region
rename reg1 region 

drop in 50/54

export delimited using "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/ABR_Code_Labelling.csv", replace








