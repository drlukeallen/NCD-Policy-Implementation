****Replication code for regression analyses for "Implementation of non-communicable policies from 2015 to 2020: a geopolitical analysis of 194 countries"****
****Authors: Luke Allen, Hampus Holmer, and Simon Wigley                                                                                                  ****
****Draft: 15 Nov 2020                                                                                                                                    ****
****Data and code not to be used or cited without permission of authors                                                                                   ****

set more off
clear

use "ncd_imp_data.dta" 
xtset country1 year

eststo clear

***Stata version 14.2***

***PRESERVE ORIGINAL***
preserve


***STANDARDIZE ALL VARIABLES***
center  target mortality_data risk_factor_surveys plan tob_tax smoke_free graphic_warnings tob_advert alc_sales alc_advert alc_tax salt fat child_food_market milk_code phys_mass_media clinical_guide cardio_therapies ///
total_imp comm_imp no_imp tob_imp_total alc_imp_total fedu_yrs_pc_1519 risk_target_ncds_2015 uhc_index_2015 ncd_burden_who_2015 alcohol_consumption smoking_prevalence hypertension_average obese_average  /// 
obese_child_average cpi_indexaa elf1 muslim00 dist_coast cont_africa cont_asia cont_europe cont_oceania cont_north_america cont_south_america legor_gbr legor_fra legor_soc legor_deu legor_sca v2x_mpi v2x_corr ln_ldi_pc_2015 /// 
ln_ghe_gdp_2015_ghe  ln_mx_warterror_10yr tax_gdp_hf ln_tax_gdp_hf ln_pop65_pct_wb ln_oilres_regav_2015 ln_urban_un transparencyindex missing_points sids dd_2015 dd_mode_201519, inplace standardize nolabel
		  

***COEFFICIENT PLOTS***
ssc install coefplot
 
*****Bivariate regressions for all policies (with and without controls) (Reproduce Figure 7)****

xtset country1 year

xtreg total_imp v2x_mpi ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsa
xtreg total_imp v2x_corr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsb
xtreg total_imp cpi_indexaa ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsc

xtreg total_imp ln_ghe_gdp_2015_ghe ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsd
xtreg total_imp ln_tax_gdp_hf ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlse
xtreg total_imp uhc_index_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsf

xtreg total_imp risk_target_ncds_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsg
xtreg total_imp ncd_burden_who_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsh
xtreg total_imp smoking_prevalence ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsi
xtreg total_imp alcohol_consumption ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsj
xtreg total_imp hypertension_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsk
xtreg total_imp obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsl

xtreg total_imp fedu_yrs_pc_1519 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsm
xtreg total_imp ln_mx_warterror_10yr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsn
xtreg total_imp ln_oilres_regav_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
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
gr combine figure1a.gph figure1b.gph, title("Figure 7: All policies", size(small))  subtitle("  ", size(tiny)) imargin(0 0 0 0) graphregion(margin(l=0 r=0)) 
graph export figure7.pdf, replace

*****Bivariate regressions for commercial policies (with and without controls) (Reproduce Figure 10)****

xtset country1 year

xtreg comm_imp v2x_mpi ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsa
xtreg comm_imp v2x_corr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsb
xtreg comm_imp cpi_indexaa ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsc

xtreg comm_imp ln_ghe_gdp_2015_ghe ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsd
xtreg comm_imp ln_tax_gdp_hf ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlse
xtreg comm_imp uhc_index_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsf

xtreg comm_imp risk_target_ncds_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsg
xtreg comm_imp ncd_burden_who_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsh
xtreg comm_imp smoking_prevalence ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsi
xtreg comm_imp alcohol_consumption ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsj
xtreg comm_imp hypertension_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsk
xtreg comm_imp obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsl

xtreg comm_imp fedu_yrs_pc_1519 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsm
xtreg comm_imp ln_mx_warterror_10yr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsn
xtreg comm_imp ln_oilres_regav_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlso

		  
		  foreach var in v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average /// 
		  obese_average fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 {
    quietly xtreg comm_imp `var'  yr*, r
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
xtreg comm_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average yr*, r 
estimates store multa
xtreg comm_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
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
gr combine figure1a.gph figure1b.gph, title("Figure 10: Commercial policies", size(small))  subtitle("  ", size(tiny)) imargin(0 0 0 0) graphregion(margin(l=0 r=0)) 
graph export figure10.pdf, replace


*****Bivariate regressions for non-implementation (number of zero scores) (with and without controls) (Reproduce appendix Figure A.x)****

xtset country1 year

xtreg no_imp v2x_mpi ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsa
xtreg no_imp v2x_corr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsb
xtreg no_imp cpi_indexaa ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsc

xtreg no_imp ln_ghe_gdp_2015_ghe ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsd
xtreg no_imp ln_tax_gdp_hf ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlse
xtreg no_imp uhc_index_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsf

xtreg no_imp risk_target_ncds_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsg
xtreg no_imp ncd_burden_who_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsh
xtreg no_imp smoking_prevalence ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsi
xtreg no_imp alcohol_consumption ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsj
xtreg no_imp hypertension_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsk
xtreg no_imp obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsl

xtreg no_imp fedu_yrs_pc_1519 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsm
xtreg no_imp ln_mx_warterror_10yr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
estimates store controlsn
xtreg no_imp ln_oilres_regav_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 
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
graph export figure_Ax.pdf, replace


***RESULTS TABLES***
ssc install estout

*****Bivariate regressions with random effects for NCD aggregate (with and without controls) (Reproduce appendix Table A.x)****

eststo clear


xtset country1 year
eststo: xtreg total_imp v2x_mpi yr*, r 
eststo: xtreg total_imp v2x_mpi ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp v2x_corr yr*, r 
eststo: xtreg total_imp v2x_corr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

eststo: xtreg total_imp cpi_indexaa yr*, r 
eststo: xtreg total_imp cpi_indexaa ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb   cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp ln_ghe_gdp_2015_ghe yr*, r 
eststo: xtreg total_imp ln_ghe_gdp_2015_ghe  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp ln_tax_gdp_hf yr*, r 
eststo: xtreg total_imp ln_tax_gdp_hf ln_ldi_pc_2015 ln_urban_un  ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr  legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp uhc_index_2015 yr*, r 
eststo: xtreg total_imp uhc_index_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

eststo: xtreg total_imp risk_target_ncds_2015 yr* , r 
eststo: xtreg total_imp risk_target_ncds_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp ncd_burden_who_2015 yr* , r 
eststo: xtreg total_imp ncd_burden_who_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp smoking_prevalence yr*, r 
eststo: xtreg total_imp smoking_prevalence ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp alcohol_consumption yr*, r 
eststo: xtreg total_imp alcohol_consumption ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp hypertension_average  yr*, r 
eststo: xtreg total_imp hypertension_average  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp obese_average  yr*, r 
eststo: xtreg total_imp obese_average  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp fedu_yrs_pc_1519 yr*, r 
eststo: xtreg total_imp fedu_yrs_pc_1519 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america muslim00 dist_coast legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp ln_mx_warterror_10yr yr*, r 
eststo: xtreg total_imp ln_mx_warterror_10yr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg total_imp ln_oilres_regav_2015 yr*, r 
eststo: xtreg total_imp ln_oilres_regav_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 


*****Mutlivariate regressions with random effects for all policies and years (with and without controls) ****
eststo: xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average /// 
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 yr*, r 
eststo: xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ///
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 ///
legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

***Table 1***
esttab using total_imp_table.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table A.x: Bivariate and multivariate results for NCD policy implementation") ///
order(v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average  ///
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb dist_coast elf1 muslim00 legor_gbr legor_deu legor_soc legor_fra /// 
cont_africa cont_asia cont_europe cont_north_america cont_south_america) /// 
 stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap compress replace
 
 
 *****Bivariate regressions with random effects for commercial policies (with and without controls) (Reproduce appendix Table A.x)****

eststo clear

xtset country1 year
eststo: xtreg comm_imp v2x_mpi yr*, r 
eststo: xtreg comm_imp v2x_mpi ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp v2x_corr yr*, r 
eststo: xtreg comm_imp v2x_corr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

eststo: xtreg comm_imp cpi_indexaa yr*, r 
eststo: xtreg comm_imp cpi_indexaa ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb   cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp ln_ghe_gdp_2015_ghe yr*, r 
eststo: xtreg comm_imp ln_ghe_gdp_2015_ghe  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp ln_tax_gdp_hf yr*, r 
eststo: xtreg comm_imp ln_tax_gdp_hf ln_ldi_pc_2015 ln_urban_un  ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr  legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp uhc_index_2015 yr*, r 
eststo: xtreg comm_imp uhc_index_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

eststo: xtreg comm_imp risk_target_ncds_2015 yr* , r 
eststo: xtreg comm_imp risk_target_ncds_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp ncd_burden_who_2015 yr* , r 
eststo: xtreg comm_imp ncd_burden_who_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp smoking_prevalence yr*, r 
eststo: xtreg comm_imp smoking_prevalence ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp alcohol_consumption yr*, r 
eststo: xtreg comm_imp alcohol_consumption ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp hypertension_average  yr*, r 
eststo: xtreg comm_imp hypertension_average  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp obese_average  yr*, r 
eststo: xtreg comm_imp obese_average  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp fedu_yrs_pc_1519 yr*, r 
eststo: xtreg comm_imp fedu_yrs_pc_1519 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america muslim00 dist_coast legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp ln_mx_warterror_10yr yr*, r 
eststo: xtreg comm_imp ln_mx_warterror_10yr ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

eststo: xtreg comm_imp ln_oilres_regav_2015 yr*, r 
eststo: xtreg comm_imp ln_oilres_regav_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1 yr*, r 

*****Mutlivariate regressions with random effects for all policies and years (with and without controls) ****
eststo: xtreg comm_imp v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ///
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 yr*, r 
eststo: xtreg comm_imp v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ///
 fedu_yrs_pc_1519 ln_mx_warterror_10yr ln_oilres_regav_2015 ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu ///
 legor_soc legor_fra elf1 yr*, r 

***Table 2***
esttab using comm_imp_table.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table A.x: Bivariate and multivariate results for commercial policy implementation") ///
order(v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average  fedu_yrs_pc_1519 /// 
ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb dist_coast elf1 muslim00 legor_gbr legor_deu legor_soc legor_fra /// 
cont_africa cont_asia cont_europe cont_north_america cont_south_america) /// 
 stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap replace
 
 
****Bivariate regressions for risk factors and specific policies (with and without controls) (with and without controls) (reproduce Table 2)****
eststo clear

xtset country1 year

eststo: xtreg tob_imp_total smoking_prevalence yr*, r 
eststo: xtreg tob_imp_total smoking_prevalence ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1   yr*, r 

eststo: xtreg fat obese_average yr*, r 
eststo: xtreg fat obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1   yr*, r 

eststo: xtreg child_food_market obese_child_average yr*, r 
eststo: xtreg child_food_market obese_child_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

eststo: xtreg salt hypertension_average yr*, r 
eststo: xtreg salt hypertension_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

eststo: xtreg alc_imp_total alcohol_consumption yr*, r 
eststo: xtreg alc_imp_total alcohol_consumption ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr*, r 

esttab using imp_risk_factors_table.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table 2: Bivariate results with and without controls - risk factors and specific policies for all years") ///
order(smoking_prevalence  obese_average obese_child_average hypertension_average  alcohol_consumption) /// 
 stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap replace


***ROBUSTNESS (Reproduce appendix Table A.x)***
eststo clear

xtset country1 year

***Controlling for HRV Transparency Index***
eststo: xtreg total_imp transparencyindex v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr /// 
legor_deu legor_soc legor_fra elf1 yr*, r 

***Controlling for number of missing implementation scores (DK, NA, NR, ND, -)***
eststo: xtreg total_imp missing_points v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  dist_coast muslim00 legor_gbr /// 
legor_deu legor_soc legor_fra elf1 yr*, r

***Controlling for small island developing states (SIDS) (with and without dist_coast)***
eststo: xtreg total_imp sids  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america   muslim00 legor_gbr /// 
legor_deu legor_soc legor_fra elf1 yr*, r

eststo: xtreg total_imp sids v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america   muslim00 legor_gbr /// 
legor_deu legor_soc legor_fra elf1 yr*, r

eststo: xtreg total_imp sids  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america dist_coast muslim00 legor_gbr /// 
legor_deu legor_soc legor_fra elf1 yr*, r

eststo: xtreg total_imp sids v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 ln_oilres_regav_2015 smoking_prevalence /// 
alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america   dist_coast muslim00 legor_gbr /// 
legor_deu legor_soc legor_fra elf1 yr*, r

esttab using imp_robustness.csv,  se  star(* 0.05 ** 0.01 *** 0.001) label title("Table A.x: Robustness checks") ///
order(transparencyindex missing_points sids v2x_mpi v2x_corr cpi_indexaa ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015 risk_target_ncds_2015 ncd_burden_who_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average  fedu_yrs_pc_1519 /// 
ln_mx_warterror_10yr ln_oilres_regav_2015  ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb dist_coast elf1 muslim00 legor_gbr legor_deu legor_soc legor_fra /// 
cont_africa cont_asia cont_europe cont_north_america cont_south_america) ///  
 stats(N_g r2_o, labels("Countries" "R-squared (overall)"))  addnote("All random effects. All include year dummies. Robust standard errors in parentheses") nogap replace

***RESTORE TO NON-STANDARDIZED (i.e. original)***
restore


***PRESERVE ORIGINAL***
preserve

***BLAND-ALTMAN PLOTS***
ssc install baplot
xtset country1 year


***Random effects regressions for all years***
xtreg total_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 /// 
ln_oilres_regav_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  /// 
dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr* , r

predict predicted_all 

xtreg comm_imp v2x_mpi v2x_corr cpi_indexaa ln_mx_warterror_10yr risk_target_ncds_2015 ncd_burden_who_2015 ln_ghe_gdp_2015_ghe ln_tax_gdp_hf uhc_index_2015  fedu_yrs_pc_1519 /// 
ln_oilres_regav_2015 smoking_prevalence alcohol_consumption hypertension_average obese_average ln_ldi_pc_2015 ln_urban_un ln_pop65_pct_wb  cont_africa cont_asia cont_europe cont_north_america cont_south_america  /// 
dist_coast muslim00 legor_gbr legor_deu legor_soc legor_fra elf1  yr* , r

predict predicted_comm 

***Plots for all implementation years***
batplot  total_imp predicted_all, valabel(country) notrend sc(jitter(4)) info ///
saving(batplot_all, replace)

batplot  comm_imp predicted_comm, valabel(country) notrend sc(jitter(4)) info ///
saving(batplot_all_comm, replace)

***Plots for 2019 implementation (Reproduce Figures 9 and 13)***
drop if year<2019
xtset country1 year

batplot  total_imp predicted_all, valabel(country) notrend sc(mlabel(ba_all_label_iso3) mlabsize(tiny)  jitter(4)) title("Figure 9: Bland-Altman plot for" "all policies in 2019")  ///
xtitle(Average of predicted and actual implementation score, size(small)) ytitle("Difference between predicted and" "actual implementation score", size(small)) note("") ///
saving(batplot_2019_all, replace)

batplot  comm_imp predicted_comm, valabel(country) notrend sc(mlabel(ba_comm_label_iso3) mlabsize(tiny)  jitter(4)) title("Figure 13: Bland-Altman plot for" "commercial policies in 2019")  ///
xtitle(Average of predicted and actual implementation score, size(small)) ytitle("Difference between predicted and" "actual implementation score", size(small)) note("") ///
saving(batplot_2019_comm, replace)


***RESTORE TO ORIGINAL***
restore



exit
