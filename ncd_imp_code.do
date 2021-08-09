**** Replication code for regression analyses for "Implementation of non-communicable disease policies from 2015 to 2020: a geopolitical analysis of 194 countries" ****
**** Authors: Luke Allen, Hampus Holmer, and Simon Wigley                                                                                                           ****
**** Journal: Lancet Global Health                                                                                                                                  ****
**** Updated: 1 August 2021                                                                                                                                         ****

set more off
clear

****Stata version 14.2****
use "ncd_imp_panel.dta" 
xtset country1 year

ssc install coefplot, replace
ssc install estout, replace

***PRESERVE ORIGINAL***
preserve

***STANDARDIZE ALL VARIABLES***
center  target mortality_data risk_factor_surveys plan tob_tax smoke_free graphic_warnings tob_advert alc_sales alc_advert alc_tax salt fat child_food_market milk_code phys_mass_media clinical_guide cardio_therapies ///
total_imp comm_imp no_imp tob_imp_total alc_imp_total fedu_yrs_pc_1519 risk_target_ncds_2015 uhc_index_2015 ncd_burden_who_2015 alcohol_consumption smoking_prevalence hypertension_average obese_average  /// 
obese_child_average cpi_indexaa elf1 muslim00 dist_coast cont_africa cont_asia cont_europe cont_oceania cont_north_america cont_south_america legor_gbr legor_fra legor_soc legor_deu legor_sca v2x_mpi v2x_corr ln_ldi_pc_2015 /// 
ln_ghe_gdp_2015_ghe  ln_mx_warterror_10yr tax_gdp_hf ln_tax_gdp_hf ln_pop65_pct_wb ln_oilres_regav_2015 ln_urban_un transparencyindex missing_points sids dd_2015 dd_mode_201519 /// 
prop_imp_wtmm prop_nomiss prop_imp prop_avg, inplace standardize nolabel

glo xlist "ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1"
		  

***COEFFICIENT PLOTS***
 
*****Bivariate regressions for all policies (with and without controls)****

xtset country1 year

xtreg total_imp v2x_mpi $xlist yr*, r 
estimates store controlsa
xtreg total_imp v2x_corr $xlist yr*, r 
estimates store controlsb
xtreg total_imp cpi_indexaa $xlist yr*, r 
estimates store controlsc

xtreg total_imp ln_ghe_gdp_2015_ghe $xlist yr*, r 
estimates store controlsd
xtreg total_imp ln_tax_gdp_hf $xlist yr*, r 
estimates store controlse
xtreg total_imp uhc_index_2015 $xlist yr*, r 
estimates store controlsf

xtreg total_imp risk_target_ncds_2015 $xlist yr*, r 
estimates store controlsg
xtreg total_imp ncd_burden_who_2015 $xlist yr*, r 
estimates store controlsh
xtreg total_imp smoking_prevalence $xlist yr*, r 
estimates store controlsi
xtreg total_imp alcohol_consumption $xlist yr*, r 
estimates store controlsj
xtreg total_imp hypertension_average $xlist yr*, r 
estimates store controlsk
xtreg total_imp obese_average $xlist yr*, r 
estimates store controlsl

xtreg total_imp fedu_yrs_pc_1519 $xlist yr*, r 
estimates store controlsm
xtreg total_imp ln_mx_warterror_10yr $xlist yr*, r 
estimates store controlsn
xtreg total_imp ln_oilres_regav_2015 $xlist yr*, r 
estimates store controlso
		  
		  foreach var in v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average /// 
		  obese_average fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 {
    quietly xtreg total_imp `var'  yr*, r
    estimates store `var'
}
coefplot (v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015, label(Without controls) pstyle(p15)) ///
         (controls*, label(With controls) pstyle(p1))                            ///
         , keep(v2x_mpi  v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
		 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015)  xline(0) ylabel(,labsize(vsmall)) xlabel(,labsize(vsmall)) coeflabels(, wrap(25))  /// 
		 legend(size(tiny)) legend(off) ///
		 title("A. Bivariate", size(small)) ///
		 saving(figure1a, replace)
		  
	  
*****Mutlivariate regressions for all policies (with and without controls)****
xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average yr*, r 
estimates store multa
xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average $xlist yr*, r 
estimates store multb

 coefplot (multa , label(Without controls) pstyle(p15)) (multb, label(With controls) pstyle(p1)) ///
, keep( v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 ln_oilres_regav_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
fedu_yrs_pc_1519 ln_mx_warterror_10yr) ///
levels(95)  xline(0) ylabel(,labsize(vsmall)) xlabel(,labsize(vsmall)) coeflabels(v2x_mpi = " " v2x_corr = " " cpi_indexaa= " " ln_ghe_gdp_2015_ghe= " " ln_tax_gdp_hf= " " uhc_index_2015= " " /// 
ln_oilres_regav_2015= " " risk_target_ncds_2015= " " ncd_burden_who_2015= " " smoking_prevalence= " " alcohol_consumption= " " hypertension_average= " " obese_average= " " fedu_yrs_pc_1519= " " ln_mx_warterror_10yr= " ") /// 
legend(size(tiny))  /// 
order( v2x_mpi v2x_corr  cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average fedu_yrs_pc_1519  /// 
ln_mx_warterror_10yr ln_oilres_regav_2015  ) ///
title("B. Multivariate", size(small)) legend( position(3) cols(1)) ///
saving(figure1b, replace)

****Combined figure****
gr combine figure1a.gph figure1b.gph, title("All policies", size(small))  subtitle("  ", size(tiny)) imargin(0 0 0 0) graphregion(margin(l=0 r=0)) 
graph export figure_total_imp.pdf, replace

*****Bivariate regressions for non-implementation (number of zero scores) (with and without controls) (Appendix)****
xtset country1 year

xtreg no_imp v2x_mpi $xlist yr*, r 
estimates store controlsa
xtreg no_imp v2x_corr $xlist yr*, r 
estimates store controlsb
xtreg no_imp cpi_indexaa $xlist yr*, r 
estimates store controlsc

xtreg no_imp ln_ghe_gdp_2015_ghe $xlist yr*, r 
estimates store controlsd
xtreg no_imp ln_tax_gdp_hf $xlist yr*, r 
estimates store controlse
xtreg no_imp uhc_index_2015 $xlist yr*, r 
estimates store controlsf

xtreg no_imp risk_target_ncds_2015 $xlist yr*, r 
estimates store controlsg
xtreg no_imp ncd_burden_who_2015 $xlist yr*, r 
estimates store controlsh
xtreg no_imp smoking_prevalence $xlist yr*, r 
estimates store controlsi
xtreg no_imp alcohol_consumption $xlist yr*, r 
estimates store controlsj
xtreg no_imp hypertension_average $xlist yr*, r 
estimates store controlsk
xtreg no_imp obese_average $xlist yr*, r 
estimates store controlsl

xtreg no_imp fedu_yrs_pc_1519 $xlist yr*, r 
estimates store controlsm
xtreg no_imp ln_mx_warterror_10yr $xlist yr*, r 
estimates store controlsn
xtreg no_imp ln_oilres_regav_2015 $xlist yr*, r 
estimates store controlso
		  
		  foreach var in v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average /// 
		  obese_average fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 {
    quietly xtreg no_imp `var'  yr*, r
    estimates store `var'
}
coefplot (v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015, label(Without controls) pstyle(p15)) ///
         (controls*, label(With controls) pstyle(p1))                            ///
         , keep(v2x_mpi  v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
		 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015)  xline(0) ylabel(,labsize(vsmall)) xlabel(,labsize(vsmall)) coeflabels(, wrap(25))  /// 
		 legend(size(tiny)) legend(off) ///
		 title("A. Bivariate", size(small)) ///
		 saving(figure1a, replace)
		  
*****Mutlivariate regressions for all policies (with and without controls) ****
xtreg no_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average yr*, r 
estimates store multa
xtreg no_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store multb

 coefplot (multa , label(Without controls) pstyle(p15)) (multb, label(With controls) pstyle(p1)) ///
, keep( v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 ln_oilres_regav_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
fedu_yrs_pc_1519 ln_mx_warterror_10yr) ///
levels(95)  xline(0) ylabel(,labsize(vsmall)) xlabel(,labsize(vsmall)) coeflabels(v2x_mpi = " " v2x_corr = " " cpi_indexaa= " " ln_ghe_gdp_2015_ghe= " " ln_tax_gdp_hf= " " uhc_index_2015= " " /// 
ln_oilres_regav_2015= " " risk_target_ncds_2015= " " ncd_burden_who_2015= " " smoking_prevalence= " " alcohol_consumption= " " hypertension_average= " " obese_average= " " fedu_yrs_pc_1519= " " ln_mx_warterror_10yr= " ") /// 
legend(size(tiny))  /// 
order( v2x_mpi v2x_corr  cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average fedu_yrs_pc_1519  /// 
ln_mx_warterror_10yr ln_oilres_regav_2015  ) ///
title("B. Multivariate", size(small)) legend( position(3) cols(1)) ///
saving(figure1b, replace)

****Combined figure****
gr combine figure1a.gph figure1b.gph, title("Figure A.x: Non-implementation of policies", size(small))  subtitle("  ", size(tiny)) imargin(0 0 0 0) graphregion(margin(l=0 r=0)) 
graph export figure_nonimp.pdf, replace


***RESULTS TABLES***

*****Bivariate regressions with random effects for NCD aggregate (with and without controls)****
eststo clear

xtset country1 year
eststo: xtreg total_imp v2x_mpi yr*, r 
eststo: xtreg total_imp v2x_mpi $xlist yr*, r 

eststo: xtreg total_imp v2x_corr yr*, r 
eststo: xtreg total_imp v2x_corr $xlist yr*, r 

eststo: xtreg total_imp cpi_indexaa yr*, r 
eststo: xtreg total_imp cpi_indexaa $xlist yr*, r 

eststo: xtreg total_imp ln_ghe_gdp_2015_ghe yr*, r 
eststo: xtreg total_imp ln_ghe_gdp_2015_ghe $xlist yr*, r 

eststo: xtreg total_imp ln_tax_gdp_hf yr*, r 
eststo: xtreg total_imp ln_tax_gdp_hf $xlist yr*, r 

eststo: xtreg total_imp uhc_index_2015 yr*, r 
eststo: xtreg total_imp uhc_index_2015  $xlist  yr*, r 

eststo: xtreg total_imp risk_target_ncds_2015 yr* , r 
eststo: xtreg total_imp risk_target_ncds_2015 $xlist yr*, r 

eststo: xtreg total_imp ncd_burden_who_2015 yr* , r 
eststo: xtreg total_imp ncd_burden_who_2015 $xlist yr*, r 

eststo: xtreg total_imp smoking_prevalence yr*, r 
eststo: xtreg total_imp smoking_prevalence $xlist yr*, r 

eststo: xtreg total_imp alcohol_consumption yr*, r 
eststo: xtreg total_imp alcohol_consumption $xlist yr*, r 

eststo: xtreg total_imp hypertension_average  yr*, r 
eststo: xtreg total_imp hypertension_average $xlist yr*, r 

eststo: xtreg total_imp obese_average  yr*, r 
eststo: xtreg total_imp obese_average $xlist yr*, r 

eststo: xtreg total_imp fedu_yrs_pc_1519 yr*, r 
eststo: xtreg total_imp fedu_yrs_pc_1519 $xlist yr*, r 

eststo: xtreg total_imp ln_mx_warterror_10yr yr*, r 
eststo: xtreg total_imp ln_mx_warterror_10yr $xlist yr*, r 

eststo: xtreg total_imp ln_oilres_regav_2015 yr*, r 
eststo: xtreg total_imp ln_oilres_regav_2015 $xlist yr*, r 


*****Mutlivariate regressions with random effects for all policies and years (with and without controls) ****
eststo: xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 yr*, r 
eststo: xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ///
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 ///
legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

***Table A.x***
esttab using total_imp_table.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table A.x: Bivariate and multivariate results for NCD policy implementation") ///
order(v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average  ///
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb dist_coast elf1 muslim00 legor_gbr legor_deu legor_soc legor_fra /// 
cont_africa cont_asia cont_europe cont_north_america cont_south_america) /// 
 stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap compress replace

***ROBUSTNESS (Appendix)***
eststo clear

xtset country1 year

***Controlling for HRV Transparency Index***
eststo: xtreg total_imp transparencyindex v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average $xlist yr*, r 

***Controlling for number of missing implementation scores (DK, NA, NR, ND, -)***
eststo: xtreg total_imp missing_points v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average $xlist yr*, r

***Controlling for small island developing states (SIDS) (with and without dist_coast)***
eststo: xtreg total_imp sids  $xlist yr*, r

eststo: xtreg total_imp sids v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average $xlist yr*, r

eststo: xtreg total_imp sids  $xlist yr*, r

eststo: xtreg total_imp sids v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america dist_coast muslim00  /// 
legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r


***Table A.x***
esttab using imp_robustness.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table A.x: Robustness checks") ///
order(transparencyindex missing_points  sids v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average fedu_yrs_pc_1519 /// 
ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb dist_coast elf1 muslim00 legor_gbr legor_deu legor_soc legor_fra /// 
cont_africa cont_asia cont_europe cont_north_america cont_south_america) ///  
 stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap replace

***ADJUSTED P-VALUES FOR MULTIPLE TESTING***
net install wyoung, from("https://raw.githubusercontent.com/reifjulian/wyoung/controls-option") replace

****Multivariate model with controls***
wyoung  total_imp, cmd(xtreg  OUTCOMEVAR v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average /// 
obese_average fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 ///
$xlist yr*) ///
familyp( v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ///
fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015)  cluster(country1) bootstrap(200) seed(20)

matrix list r(table)
 
 ***RESTORE TO NON-STANDARDIZED (i.e. original)***
restore


***PRESERVE ORIGINAL***
preserve

***Regressions based on multiple imputaton of missing values (Appendix)***
***Unreported policy scores also imputed and total implementation then calculated for each imputed data set****

mi set flong
mi xtset country1 year

mi register imputed ln_ldi_pc_2015 fedu_yrs_pc_1519 ln_mx_warterror_10yr risk_target_ncds_2015 ln_ghe_gdp_2015_ghe ncd_burden_who_2015 alcohol_consumption smoking_prevalence obese_average obese_child_average /// 
mean_bmi_average ln_pop65_pct_wb ln_oilres_regav_2015 cpi_indexaa ln_tax_gdp_hf muslim00 v2x_mpi v2x_corr transparencyindex dd_mode_201519 uhc_index_2015 ///
target_ms risk_factor_surveys_ms plan_ms tob_tax_ms  alc_sales_ms alc_advert_ms alc_tax_ms salt_ms fat_ms child_food_market_ms milk_code_ms /// 
phys_mass_media_ms clinical_guide_ms cardio_therapies_ms

mi impute mvn ln_ldi_pc_2015 fedu_yrs_pc_1519 ln_mx_warterror_10yr risk_target_ncds_2015 ln_ghe_gdp_2015_ghe ncd_burden_who_2015 alcohol_consumption smoking_prevalence obese_average obese_child_average /// 
mean_bmi_average ln_pop65_pct_wb ln_oilres_regav_2015 cpi_indexaa ln_tax_gdp_hf muslim00 v2x_mpi v2x_corr  transparencyindex dd_mode_201519 uhc_index_2015 ///
target_ms  risk_factor_surveys_ms plan_ms tob_tax_ms alc_sales_ms alc_advert_ms alc_tax_ms salt_ms fat_ms child_food_market_ms milk_code_ms ///
phys_mass_media_ms clinical_guide_ms cardio_therapies_ms ///
= cont_africa cont_asia cont_europe cont_north_america cont_south_america sids ln_urban_un elf1 dist_coast legor_gbr legor_fra legor_soc legor_deu yr1 yr2 /// 
mortality_data_ms smoke_free_ms graphic_warnings_ms tob_advert_ms prop_nomiss  total_imp, ///
add(30) replace rseed (53421) initmcmc(em, iterate(500))

***Create new total implementation variable for each imputed data set***
mi passive: gen total_imp_mi = target_ms + mortality_data_ms + risk_factor_surveys_ms + plan_ms + tob_tax_ms + smoke_free_ms + graphic_warnings_ms + tob_advert_ms + alc_sales_ms + alc_advert_ms + alc_tax_ms + salt_ms + fat_ms /// 
+ child_food_market_ms + milk_code_ms + phys_mass_media_ms + clinical_guide_ms + cardio_therapies_ms

***Standardize variables***
qui foreach var in total_imp total_imp_mi v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ///
ln_oilres_regav_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe /// 
cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc ///
legor_fra elf1 yr1 yr2 {
mi passive: egen `var'_z=std(`var')
}



***Run regression on imputed datasets and combine results using Rubin rules***
eststo clear

qui foreach var in v2x_mpi_z v2x_corr_z cpi_indexaa_z ln_ghe_gdp_2015_ghe_z ln_tax_gdp_hf_z uhc_index_2015_z risk_target_ncds_2015_z ncd_burden_who_2015_z smoking_prevalence_z alcohol_consumption_z /// 
hypertension_average_z obese_average_z  fedu_yrs_pc_1519_z /// 
ln_mx_warterror_10yr_z ln_oilres_regav_2015_z {
eststo: mi est, post: xtreg total_imp_z `var' ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r
}



eststo: mi est, post: xtreg total_imp_mi_z v2x_mpi_z v2x_corr_z cpi_indexaa_z ln_mx_warterror_10yr_z risk_target_ncds_2015_z ncd_burden_who_2015_z ln_ghe_gdp_2015_ghe_z ln_tax_gdp_hf_z uhc_index_2015_z  fedu_yrs_pc_1519_z ///
ln_oilres_regav_2015_z smoking_prevalence_z alcohol_consumption_z hypertension_average_z obese_average_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z ///
cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r 

esttab using imp_robustness_mi.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table A.x: Robustness checks - multiple imputation") ///
order(v2x_mpi_z v2x_corr_z cpi_indexaa_z ln_ghe_gdp_2015_ghe_z ln_tax_gdp_hf_z uhc_index_2015_z risk_target_ncds_2015_z ncd_burden_who_2015_z smoking_prevalence_z alcohol_consumption_z /// 
hypertension_average_z obese_average_z  fedu_yrs_pc_1519_z ln_mx_warterror_10yr_z ln_oilres_regav_2015_z  ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z dist_coast_z elf1_z muslim00_z legor_gbr_z legor_deu_z ///
legor_soc_z legor_fra_z cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z) ///  
stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap replace
 
***Calculate overall R-squared for each model***
eststo clear

mi query
local M = r(M)
scalar rsq = 0

qui mi xeq 1/`M': xtreg total_imp_z v2x_mpi_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z v2x_corr_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z cpi_indexaa_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z ln_ghe_gdp_2015_ghe_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z ln_tax_gdp_hf_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z uhc_index_2015_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z risk_target_ncds_2015_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z ncd_burden_who_2015_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z smoking_prevalence_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z alcohol_consumption_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

eststo: qui mi xeq 1/`M': xtreg total_imp_z hypertension_average_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z obese_average_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z fedu_yrs_pc_1519_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z  dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z ln_mx_warterror_10yr_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_z ln_oilres_regav_2015_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z  cont_africa_z cont_asia_z cont_europe_z cont_north_america_z cont_south_america_z dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; ; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq

qui mi xeq 1/`M': xtreg total_imp_mi_z v2x_mpi_z v2x_corr_z cpi_indexaa_z ln_mx_warterror_10yr_z risk_target_ncds_2015_z ncd_burden_who_2015_z ln_ghe_gdp_2015_ghe_z ln_tax_gdp_hf_z uhc_index_2015_z fedu_yrs_pc_1519_z ///
ln_oilres_regav_2015_z smoking_prevalence_z alcohol_consumption_z hypertension_average_z obese_average_z ln_ldi_pc_2015_z ln_urban_un_z ln_pop65_pct_wb_z cont_africa_z cont_asia_z cont_europe_z cont_north_america_z ///
cont_south_america_z dist_coast_z muslim00_z legor_gbr_z legor_deu_z legor_soc_z legor_fra_z elf1_z yr1_z yr2_z, r; scalar rsq = rsq + e(r2_o)
scalar rsq = rsq/`M'
di rsq 


 ***RESTORE TO ORIGINAL***
restore

ssc install concord, replace

***PRESERVE ORIGINAL***
preserve

***BLAND-ALTMAN PLOTS***
xtset country1 year

***Random effects regressions for all years: All policies***
xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 /// 
ln_oilres_regav_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  /// 
dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr* , r

predict predicted_all 

***Bland-Altman plot for  2019 implementation: All policies***
concord total_imp predicted_all if year==2019

gen diff = total_imp-predicted_all
gen avg = (total_imp+predicted_all)/2

su diff
local mdiff=r(mean)
local lrr = `mdiff' - 2*r(Var)^.5
local urr = `mdiff' + 2*r(Var)^.5
display "Mean difference=` mdiff'"
display "Reference Range= `lrr' to `urr'"

graph twoway  (scatter diff avg, mlabel(ba_all_label_ctry) mlabsize(tiny) msym(oh) jitter(4) )  if year==2019, yline(`mdiff', lc(black) lwidth(vvthin)) yline(`lrr', lc(black) lpattern(dash) lwidth(vvvthin)) ///
yline(`urr', lc(black) lpattern(dash) lwidth(vvvthin)) xtitle(Average of actual and predicted implementation scores, size(small)) ///
ytitle("Difference between actual and" "predicted implementation scores", size(small)) title("Bland-Altman plot for all policies in 2019") ylab(-6(2)6) legend(off) scheme(s1color) /// 
note("Points above (below) the zero line do better (worse) than predicted. 95% of all points lie between the dashed lines.""Predicted values based on regression model with all covariates." ///
"The concordance correlation coefficient for actual vs predicted is 0.780 (95% CI 0.749 to 0.823, p<0.0001).", size(vsmall))

graph export baplot_2019.pdf, replace


***RESTORE TO ORIGINAL***
restore

*****Hausman test for fixed vs random effects for multivariate model****
ssc install rhausman, replace

xtset country1 year

quietly xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

estimates store random

qui xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, fe r
estimates store fixed

rhausman fixed random,  reps(200) cluster

exit
