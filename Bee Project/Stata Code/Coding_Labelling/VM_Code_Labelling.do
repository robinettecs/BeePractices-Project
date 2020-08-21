import delimited "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/CLEANED/VM_Num_Cleaned.csv", clear 

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


/* Fuzzying latitutde and longitude */

gen lat = loc_lat + 3
gen lon = loc_long + 3
drop loc_lat loc_long

label define resp_lang 1 "EN" 2 "IT" 3 "ES_ES" 4 "DA" 5 "FR" 6 "NL" 7 "RU" 8 "SL" 9 "AR"
label val resp_lang resp_lang
drop user_lang

label define q_lan 1 "EN" 2 "IT" 3 "ES_ES" 4 "DA" 5 "FR" 6 "NL" 7 "RU" 8 "SL" 9 "AR"
label val q_lan q_lan
drop q_lang

drop resp_type agree

label define finished  0 "No" 1 "Yes"
label val finished finished

label define bee_country 1 "Algeria" 2 "Egypt" 3 "Libya" 4 "Morrocco" 6 "Tunisia" 7 "Canada" 11 "Djibouti" 12 "Eritrea" 13 "Ethiopia" 15 "Kenya" 17 "Malawi" 19 "Mayotte" 20 "Mozambique" 22 "Rwanda" 31 "Gabon" 44 "Ghana" 51 "Nigeria" 63 "Bahamas" 87 "United States Virgin Island" 92 "Honduras" 93 "Mexico" 96 "Argentina" 98 "United States of America" 100 "Chile" 101 "Colombia" 102 "Ecuador" 108 "Kazakhstan" 125 "Thailand" 130 "India" 131 "Iran" 134 "Pakistan" 140 "Georgia" 148 "Saudi Arabia" 150 "Turkey" 154 "Bulgaria" 156 "Poland" 159 "Slovakia" 160 "Ukraine" 161 "Russian Federation" 162 "Denmark" 168 "Lituania" 169 "Norway" 170 "Sweden" 171 "United Kingdom of Great Britain and Northern Ireland" 172 "Albania" 174 "Bosnia and Herzegovina" 176 "Greece" 177 "Italy" 178 "Malta" 180 "Portugal" 182 "Slovenia" 183 "Spain" 184 "Austria" 185 "Belgium" 186 "France" 187 "Germany" 189 "Switzerland" 192 "Papua New Guinea" 211 "Australia" 212 "New Zealand" 9 "Burundi" 14 "French Southern Territories" 18 "Mauritius" 24 "Somalia" 27 "United Republic of Tanzania" 33 "Democratic Republic of the Congo" 91 "Guatemala" 97 "Bolivia" 99 "Brazil" 111 "Turkmenistan" 113 "China" 142 "Israel" 145 "Lebanon" 155 "Hungary" 175 "Croatia" 188 "Netherlands"
label val bee_country bee_country

label define bee_region 81 "Biblio" 8 "California" 135 "Central District" 9 "Colorado" 15 "Idaho" 16 "Illinois" 17 "Indiana" 19 "Kansas" 23 "Maryland" 24 "Massachusetts" 25 "Michigan" 26 "Minnesota" 27 "Mississippi" 28 "Missouri" 33 "New Jersey" 35 "New York" 36 "North Carolina" 150 "North Island" 38 "Ohio" 39 "Oklahoma" 126 "Ontario" 40 "Oregon" 41 "Pennsylvania" 77 "Santiago" 124 "Saskatchewan" 45 "Tennessee" 46 "Texas" 64 "Turkistan" 76 "Valparaiso" 48 "Vermont" 49 "Virginia" 50 "Washington" 51 "West Virginia" 52 "Wisconsin" 4 "Alabama" 18 "Iowa" 122 "British Columbia" 106 "Tamil Nadu" 127 "Quebec" 144 "New South Wales" 7 "Arkansas" 10 "Connecticut" 12 "Florida" 13 "Georgia" 22 "Maine" 32 "New Hampshire" 43 "South Carolina" 69 "Cuyo" 69 "Pampas" 78 "O'Higgins" 84 "Los Lagos" 110 "North" 116 "North China" 118 "East China" 147 "Victoria" 
label val bee_region bee_region

gen birth_years = 1919 + birth_year
drop birth_year
gen age = 2020 - birth_year

/* Birth year was interpreted as the number of years between 1919 and the respondent' birth year, so I created a new variable which did the math and then calculated age*/

gen gend = gender - 1
label define gend 0 "Male" 1 "Female" 2 "Prefer not to answer"
label val gend gend
drop gender

gen education = educ_highest - 1
label define education 0 "High School (Secondary) or less" 1 "Vocational or Technical Degree, Associates Degree, or Some College" 2 "University Degree" 3 "Post-graduate qualification"
label val education education
drop educ_highest
rename education educ_highest

destring est_hives, generate(est_hive) force


/* Converted string to numeric with hive estimate, force dropped string observations, will find these later in raw files and pipe them back in to avoid missing values*/

gen bk_year = bk_years - 4
drop bk_years

/* The survey codes for beekeeping years was shifted up by four, so I unshifted it*/

sort type_hives, stable
gen type_hives_2 = .
replace type_hives_2 = 2 if type_hives == "2"
replace type_hives_2 = 3 if type_hives == "2,11" 
replace type_hives_2 = 4 if type_hives == "4"
replace type_hives_2 = 5 if type_hives == "2,4"
replace type_hives_2 = 6 if type_hives == "6"
replace type_hives_2 = 7 if type_hives == "2,10" 
replace type_hives_2 = 8 if type_hives == "2,11"
replace type_hives_2 = 9 if type_hives == "2,6,10,11"
replace type_hives_2 = 10 if type_hives == "10"
replace type_hives_2 = 11 if type_hives == "11"
replace type_hives_2 = 13 if type_hives == "2,4,10"
replace type_hives_2 = 14 if type_hives == "2,4,11"
replace type_hives_2 = 15 if type_hives == "2,4,6"
replace type_hives_2 = 16 if type_hives == "2,6"
replace type_hives_2 = 17 if type_hives == "2,6,10"
replace type_hives_2 = 18 if type_hives == "2,6,11"
replace type_hives_2 = 19 if type_hives == "4,10"
replace type_hives_2 = 20 if type_hives == "4,10,11"
replace type_hives_2 = 21 if type_hives == "4,11"
replace type_hives_2 = 22 if type_hives == "4,6" 
replace type_hives_2 = 23 if type_hives == "4,6,10"
replace type_hives_2 = 24 if type_hives == "6,10"
replace type_hives_2 = 25 if type_hives == "6,11"
replace type_hives_2 = 26 if type_hives == "6,10,11"

label define type_hives_2 2 "Top-Bar Hive" 3 "Top-Bar Hive, Others" 5 "Top-Bar Hive, Langstroth Hive" 7 "Top-Bar Hive, Dadant Blatt" 9 "Top-Bar Hive, Warre Hive, Dadant Blatt, Others" 4 "Langstroth Hive" 6 "Warre Hive" 10 "Dadant Blatt" 11 "Other(s)" 13 "Top-Bar, Langstroth, Dadant Blatt" 14 "Top-Bar, Langstroth, Others" 15 "Top-Bar, Langstroth, Warre" 16 "Top-Bar, Warre" 17 "Top-Bar, Warre, Dadant Blatt" 18 "Top-Bar, Warre, Others" 19 "Langstroth, Dadant Blatt" 20 "Langstroth, Dadant Blatt, Others" 21 "Langstroth, Others" 22 "Langstroth, Warre" 23 "Langstroth, Warre, Dadant Blatt" 24 "Warre, Dadant Blatt" 25 "Warre, Others" 26 "Warre, Dadant Blatt, Others"

label val type_hives_2 type_hives_2
drop type_hives
rename type_hives_2 type_hives

recode bee_prof (4 = 1)
recode bee_prof (5 = 0)
label define bee_prof 1 "Yes" 0 "No"
label val bee_prof bee_prof

recode bee_move (10 = 1)
recode bee_move (11 = 0)
label define bee_move 1 "Yes" 0 "No"
label val bee_move bee_move

recode insp_hives (1 = 0)
recode insp_hives (3 = 1)
recode insp_hives (4 = 2)
recode insp_hives (8 = 3)
recode insp_hives (6 = 4)
label define insp_hives 0 "Never" 1 "Once a month" 2 "Two or three times a month" 3 "Four times a month" 4 "More than four times a month"
label val insp_hives insp_hives

gen mites_dummy = 0
replace mites_dummy = 1 if mites == 5
replace mites_dummy = 0 if mites != 5
drop mites

gen v_knowledge = v_know - 7
label define v_knowledge 0 "No knowledge" 1 "Little knowledge" 2 "Moderately knowledgeable" 3 "Very knowledgeable" 4 "Extremely knowledgeable"
label val v_knowledge v_knowledge
drop v_know
rename v_knowledge v_know

recode v_rec (1 = 0)
recode v_rec (5 = 1)
recode v_rec (6 = 2)
label define v_rec 0 "Never seen it" 1 "Saw a live emaple of it" 2 "Seen it multiple times"
label val v_rec v_rec


/*Recoded "I don't know" as missing value */

recode v_cont_use (1 = .)
recode v_cont2 (1 = .)
recode v_cont3 (1 = .)
recode v_cont4 (1 = .)
recode v_cont5 (1 = .)
recode v_cont6 (1 = .)
recode v_cont7 (1 = .)
recode v_cont8 (1 = .)

/*Recoded each likert scale question to have 0 baseline */

gen v_cont_1 = v_cont_use - 1
gen v_cont_2 = v_cont2 - 1
gen v_cont_3 = v_cont3 - 1
gen v_cont_4 = v_cont4 - 1
gen v_cont_5 = v_cont5 - 1
gen v_cont_6 = v_cont6 - 1
gen v_cont_7 = v_cont7 - 1
gen v_cont_8 = v_cont8 - 1



drop v_cont_use v_cont2 v_cont3 v_cont4 v_cont5 v_cont6 v_cont7 v_cont8

label define v_cont 1 "Not at all useful" 2 "Moderately useful" 3 "Extremely useufl"
label val v_cont_1 v_cont
label val v_cont_2 v_cont
label val v_cont_3 v_cont
label val v_cont_4 v_cont
label val v_cont_5 v_cont
label val v_cont_6 v_cont
label val v_cont_7 v_cont
label val v_cont_8 v_cont

recode v_scrip (2 = 0)
recode v_scrip (3 = 2)
label define v_scrip 0 "No" 1 "Yes" 2 "Depends on these conditions"
label val v_scrip v_scrip

recode v_treat (2 =0)
label define v_treat 1 "Yes" 0 "No"
label val v_treat v_treat


recode med_proc1 (2 = 0)
recode med_proc2 (2 = 0)
recode med_proc3 (2 = 0)
recode med_proc4 (2 = 0)
recode med_proc5 (2 = 0)
recode med_proc6 (2 = 0)
recode med_proc7 (2 = 0)

label define med_proc 0 "No" 1 "Yes"
label val med_proc1 med_proc
label val med_proc2 med_proc
label val med_proc3 med_proc
label val med_proc4 med_proc
label val med_proc5 med_proc
label val med_proc6 med_proc
label val med_proc7 med_proc

gen noinst = oft_noinst - 1
label define noinst 0 "Never" 1 "Sometimes" 2 "Often" 3 "Usually" 4 "Always"
label val noinst noinst
drop oft_noinst

recode int_bht (5 = 0)
recode int_bht (4 = 1)

recode int_otc (5 = 0)
recode int_otc (4 = 1)

label define int 0 "No" 1 "Yes"
label val int_bht int
label val int_otc int

gen int_bcon = int_bkconn - 1
label define bkconn 0 "Not at all interested" 1 "Somewhat interested" 2 "Interested" 3 "Very Interested" 4 "Extremely interested"
label val int_bcon bkconn
drop int_bkconn
rename int_bcon int_bkconn

gen reg1 = .
replace reg1 = 1 if region == "North America"
replace reg1= 2 if region == "Northern Europe"
replace reg1 = 3 if region == "Southern Europe"
replace reg1 = 4 if region == "Western Europe"
label define reg1 1 "North America" 2 "Northern Europe" 3 "Southern Europe" 4 "Western Europe"
label val reg1 reg1
drop region
rename reg1 region


export delimited using "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/VM_Code_Labelling.csv", replace







