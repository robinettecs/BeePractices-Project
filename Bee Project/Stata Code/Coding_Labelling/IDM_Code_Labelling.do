import delimited "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/NUM DATA/CLEANED/IDM_Num_Cleaned.csv", clear 

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

drop agree resp_type

/* Fuzzying latitutde and longitude */

gen lat = loc_lat + 3
gen lon = loc_long + 3
drop loc_lat loc_long

label define bee_country 1 "Algeria" 2 "Egypt" 3 "Libya" 4 "Morrocco" 6 "Tunisia" 7 "Canada" 11 "Djibouti" 12 "Eritrea" 13 "Ethiopia" 15 "Kenya" 17 "Malawi" 19 "Mayotte" 20 "Mozambique" 22 "Rwanda" 31 "Gabon" 44 "Ghana" 51 "Nigeria" 63 "Bahamas" 87 "United States Virgin Island" 92 "Honduras" 93 "Mexico" 96 "Argentina" 98 "United States of America" 100 "Chile" 101 "Colombia" 102 "Ecuador" 108 "Kazakhstan" 125 "Thailand" 130 "India" 131 "Iran" 134 "Pakistan" 140 "Georgia" 148 "Saudi Arabia" 150 "Turkey" 154 "Bulgaria" 156 "Poland" 159 "Slovakia" 160 "Ukraine" 161 "Russian Federation" 162 "Denmark" 168 "Lituania" 169 "Norway" 170 "Sweden" 171 "United Kingdom of Great Britain and Northern Ireland" 172 "Albania" 174 "Bosnia and Herzegovina" 176 "Greece" 177 "Italy" 178 "Malta" 180 "Portugal" 182 "Slovenia" 183 "Spain" 184 "Austria" 185 "Belgium" 186 "France" 187 "Germany" 189 "Switzerland" 192 "Papua New Guinea" 211 "Australia" 212 "New Zealand"
label val bee_country bee_country

label define bee_region 81 "Biblio" 8 "California" 135 "Central District" 9 "Colorado" 15 "Idaho" 16 "Illinois" 17 "Indiana" 19 "Kansas" 23 "Maryland" 24 "Massachusetts" 25 "Michigan" 26 "Minnesota" 27 "Mississippi" 28 "Missouri" 33 "New Jersey" 35 "New York" 36 "North Carolina" 150 "North Island" 38 "Ohio" 39 "Oklahoma" 126 "Ontario" 40 "Oregon" 41 "Pennsylvania" 77 "Santiago" 124 "Saskatchewan" 45 "Tennessee" 46 "Texas" 64 "Turkistan" 76 "Valparaiso" 48 "Vermont" 49 "Virginia" 50 "Washington" 51 "West Virginia" 52 "Wisconsin" 4 "Alabama" 18 "Iowa" 122 "British Columbia" 106 "Tamil Nadu" 127 "Quebec" 144 "New South Wales" 
label val bee_region bee_region

gen birth_years = 1919 + birth_year
drop birth_year
gen age = 2020 - birth_year

/* Birth year was interpreted as the number of years between 1919 and the respondent' birth year, so I created a new variable which did the math and then created age variable*/

recode gender (3 = 0)
label define gender 1 "Male" 2 "Female" 0 "Prefer not to answer"
label val gender gender

gen education = educ_highest - 1
label define education 0 "High School (Secondary) or less" 1 "Vocational or Technical Degree, Associates Degree, or Some College" 2 "University Degree" 3 "Post-graduate qualification"
label val education education
drop educ_highest
rename education educ

destring est_hives, generate(est_hive) force
 

/* Converted string to numeric with hive estimate, force dropped string observations, will find these later in raw files and pipe them back in to avoid missing values*/

gen bk_year = bk_years - 4
drop bk_years

/* The survey codes for beekeeping years was shifted up by four, so I unshifted it*/

sort type_hives, stable
gen type_hives_2 = .
replace type_hives_2 = 2 if type_hives == "2"
replace type_hives_2 = 4 if type_hives == "4"
replace type_hives_2 = 6 if type_hives == "6"
replace type_hives_2 = 10 if type_hives == "10"
replace type_hives_2 = 11 if type_hives == "11"
replace type_hives_2 = 3 if type_hives == "2,11" 
replace type_hives_2 = 5 if type_hives == "2,4"
replace type_hives_2 = 7 if type_hives == "2,10" 
replace type_hives_2 = 9 if type_hives == "2,6,10,11"
replace type_hives_2 = 12 if type_hives == "2,4,6"
replace type_hives_2 = 13 if type_hives == "2,6"
replace type_hives_2 = 14 if type_hives == "4,10,11"
replace type_hives_2 = 15 if type_hives == "4,11" 
replace type_hives_2 = 16 if type_hives == "6,10"
replace type_hives_2 = 17 if type_hives == "6,11" 
replace type_hives_2 = 18 if type_hives == "4,10"
replace type_hives_2 = 19 if type_hives == "4,6,10"

label define type_hives_2 2 "Top-Bar Hive" 3 "Top-Bar Hive, Others" 5 "Top-Bar Hive, Langstroth Hive" 7 "Top-Bar Hive, Dadant Blatt" 9 "Top-Bar Hive, Warre Hive, Dadant Blatt, Others" 4 "Langstroth Hive" 6 "Warre Hive" 10 "Dadant Blatt" 11 "Other(s)" 12 "Top-Bar, Langstroth, Others" 13 "Top-Bar, Others" 14 "Langstroth Hive, Dadant Blatt, Others" 15 "Langstroth, Others" 16 "Warre Hive, Dadant Blatt" 17 "Warre Hive, Others" 18 "Langstroth, Dadant Blatt" 19 "Langstroth, Warre, Dadant Blatt"
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

label define ex_dis 1 "Nosema" 8 "European Foulbrood" 9 "American Foulbrood" 10 "Varroa Mites" 11 "Chalkbrood"

label val ex_nosema ex_dis
label val ex_af ex_dis
label val ex_ef ex_dis


gen ex_nos_dummy = 0
replace ex_nos_dummy = 1 if ex_nosema == 1
label define dum 1 "Correct" 0 "Incorrect"
label val ex_nos_dummy dum


gen ex_af_dummy = 0
replace ex_af_dummy = 1 if ex_af == 9
label val ex_af_dummy dum


gen ex_ef_dummy = 0
replace ex_ef_dummy = 1 if ex_ef == 8
label val ex_ef_dummy dum

label define finished 1 "Finished" 0 "Incomplete"
label val finished finished


/* Created dummy variables for each of the image response questions, indicating whether the respondent correctly identified the appropriate picture*/

gen know_nos = know_nosema - 1
label define know_nosema 0 "No knowledge" 1 "Little knowledge" 2 "Moderately knowledgeable" 3 "Very knowledgeable" 4 "Extremely Knowledgeable"
label val know_nos know_nosema 
drop know_nosema
rename know_nos know_nosema


gen know_amf = know_af - 1
label define know_amf 0 "No knowledge" 1 "Little knowledge" 2 "Moderately knowledgeable" 3 "Very knowledgeable" 4 "Extremely Knowledgeable"
label val know_amf know_amf 
drop know_af
rename know_amf know_af

gen know_euf = know_ef - 1
label define know_euf 0 "No knowledge" 1 "Little knowledge" 2 "Moderately knowledgeable" 3 "Very knowledgeable" 4 "Extremely Knowledgeable"
label val know_euf know_euf 
drop know_ef
rename know_euf know_ef

gen recog_nos = rec_nos - 1
label define recog_nos 0 "Never seen it" 1 "Saw a live example of it" 2 "Seen it multiple times"
label val recog_nos recog_nos
drop rec_nos
rename recog_nos rec_nos

gen recog_af = rec_af - 1
label define recog_af 0 "Never seen it" 1 "Saw a live example of it" 2 "Seen it multiple times"
label val recog_af recog_af
drop rec_af
rename recog_af rec_af

gen recog_ef = rec_ef - 1
label define recog_ef 0 "Never seen it" 1 "Saw a live example of it" 2 "Seen it multiple times"
label val recog_ef recog_ef
drop rec_ef
rename recog_ef rec_ef

gen use_nosema = use_nos - 1
label define use_nosema 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_nosema use_nosema
drop use_nos
rename use_nosema use_nos

gen use_amf = use_af - 1
label define use_amf 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_amf use_amf
drop use_af
rename use_amf use_af

gen use_euf = use_ef - 1
label define use_ef 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_euf use_ef
drop use_ef
rename use_euf use_ef

gen use_dys_hive = use_dys - 3
label define use_dys 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_dys_hive use_dys
drop use_dys
rename use_dys_hive use_dys

gen use_forage = use_forg - 3 
label define use_forg 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_forage use_forg
drop use_forg
rename use_forage use_forg

gen use_deb = use_dab - 3
label define use_dab 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_deb use_dab
drop use_dab


gen use_trt_var = use_var - 3
label define use_var 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_trt_var use_var
drop use_var
rename use_trt_var use_var

gen use_feed_hives = use_feed - 3
label define use_feed 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_feed_hives use_feed
drop use_feed
rename use_feed_hives use_feed

gen use_q = use_repq - 3
label define use_repq 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_q use_repq
drop use_repq
rename use_q use_repq

gen use_atbs = use_abtc - 3
label define use_abtc 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_atbs use_abtc
drop use_abtc

gen fease_dys = feas_dys - 3 
label define feas_dys 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val fease_dys feas_dys
drop feas_dys
rename fease_dys feas_dys

gen fease_forg = feas_forg - 3
label define feas_forg  0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val fease_forg feas_forg
drop feas_forg
rename fease_forg feas_forg

gen fease_deb = feas_deb - 3
label define feas_deb 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val fease_deb feas_deb
drop feas_deb
rename fease_deb fease_deb

gen fease_var = feas_var - 3
label define feas_var 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val fease_var feas_var
drop feas_var
rename fease_var feas_var

gen fease_feed = feas_feed - 3
label define feas_feed 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val fease_feed feas_feed
drop feas_feed
rename fease_feed feas_feed

gen feas_repq = reas_repq - 3
label define feas_repq 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val feas_repq feas_repq 
drop reas_repq

gen feas_atbs = feas_atbc - 3
label define feas_atbc 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val feas_atbs feas_atbc 
drop feas_atbc

gen fease_breed = feas_breed - 3
label define feas_breed 0 "Not feasible" 1 "Slightly feasible" 2 "Moderately feasible" 3 "Very feasible" 4 "Extremely feasible"
label val fease_breed feas_breed
drop feas_breed
rename fease_breed feas_breed

gen use_insp1 = use_insp - 3
label define use_insp 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_insp1 use_insp
drop use_insp
rename use_insp1 use_insp

gen use_odor1 = use_odor - 3
label define use_odor 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_odor1 use_odor
drop use_odor
rename use_odor1 use_odor

gen use_afb_ropi = use_ropi_afb - 3
label define use_ropi_afb 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_afb_ropi use_ropi_afb
drop use_ropi_afb
rename use_afb_ropi use_afb_ropi

gen use_afb_scale = use_afb_efb - 3
label define use_afb_efb 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_afb_scale use_afb_efb
drop use_afb_efb

gen use_kit = use_comkit - 3
label define use_comkit 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_kit use_comkit
drop use_comkit
rename use_kit use_comkit

gen use_disin = use_distools - 3
label define use_distools 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_disin use_distools
drop use_distools
rename use_disin use_distools

gen use_wax = use_procwax - 3
label define use_procwax 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_wax use_procwax 
drop use_procwax
rename use_wax use_procwax

gen use_lab = use_prevlab - 3
label define use_prevlab 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_lab use_prevlab
drop use_prevlab
rename use_lab use_prevlab

gen use_dis = use_dislab - 3
label define use_dislab 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_dis use_dislab
drop use_dislab
rename use_dis use_dislab

gen shook = use_shook - 3
label define use_shook 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val shook use_shook 
drop use_shook
rename shook use_shook

gen shook_all = use_shook_all - 3
label define use_shook_all 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val shook_all use_shook_all
drop use_shook_all 
rename shook_all use_shook_all

gen atb_afb = use_atbc_afb - 3
label define use_atbc_afb 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val atb_afb use_atbc_afb  
drop use_atbc_afb
rename atb_afb use_atb_afb

gen use_dest = use_afb_dest - 3
label define use_afb_dest 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_dest use_afb_dest
drop use_afb_dest
rename use_dest use_dest_afb

gen dest_all = use_dest_all - 3
label define use_dest_all 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val dest_all use_dest_all
drop use_dest_all
rename dest_all use_dest_all

gen afb_quick = use_afb_quick - 3
label define use_afb_quick 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val afb_quick use_afb_quick
drop use_afb_quick
rename afb_quick use_afb_quick

gen use_q = use_afb_q - 3
label define use_afb_q 0 "Not useful at all" 1 "Slightly useful" 2 "Moderately useful" 3 "Very useful" 4 "Extremely useful"
label val use_q use_afb_q
drop use_afb_q 
rename use_q use_afb_q

recode int_bht (5 = 0)
recode int_bht (4 = 1)
label define int_bht 1 "Yes" 0 "No"
label val int_bht int_bht 

recode int_otc (5 = 0)
recode int_otc (4 = 1)
label define int_otc 1 "Yes" 0 "No"
label val int_otc int_otc 

gen int_bcon = int_bkconn - 1
label define int_bkconn 0 "Not at all interested" 1 "Somewhat interested" 2 "Interested" 3 "Very interested" 4 "Extremely interested"
label val int_bcon int_bkconn
drop int_bkconn

gen reg1 = .
replace reg1 = 1 if region == "North America"
replace reg1= 2 if region == "Northern Europe"
replace reg1 = 3 if region == "Southern Europe"
replace reg1 = 4 if region == "Western Europe"
label define reg1 1 "North America" 2 "Northern Europe" 3 "Southern Europe" 4 "Western Europe"
label val reg1 reg1
drop region
rename reg1 region 



export delimited using "/Users/christopherrobinette/Desktop/UN BPractices Output Data/UN SURVEY DATA + CODE/CODED _ LABELED/IDM_Code_Labelling.csv", replace

