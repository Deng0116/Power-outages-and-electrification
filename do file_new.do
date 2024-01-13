xtset city Time
*BPHEV
reghdfe lnBPHEV l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*BEV
reghdfe lnbev l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*PHEV
reghdfe lnPHEV l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*Non-EV
reghdfe lnnonelec l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnnonelec l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
//with no-lag
*BPHEV
reghdfe lnBPHEV outaget l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV outageh l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV outaget l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV outageh l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*BEV
reghdfe lnbev outaget l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev outageh l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev outaget l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev outageh l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*PHEV
reghdfe lnPHEV outaget l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV outageh l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV outaget l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV outageh l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
//T-test
*l1.outaget
reghdfe lnbev l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
scalar coef1 = _b[l1.outaget]
scalar se1 = _se[l1.outaget]
reghdfe lnPHEV  l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
scalar coef2 = _b[l1.outaget]
scalar se2 = _se[l1.outaget]
scalar diff = coef1 - coef2
scalar se_diff = sqrt(se1^2 + se2^2)
scalar t = diff / se_diff
scalar df = e(df_r)
display "t = " t ", df = " df ", p-value = " 2 * ttail(df, abs(t))
*l1.outageh
reghdfe lnbev l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
scalar coef1 = _b[l1.outageh]
scalar se1 = _se[l1.outageh]
reghdfe lnPHEV l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
scalar coef2 = _b[l1.outageh]
scalar se2 = _se[l1.outageh]
scalar diff = coef1 - coef2
scalar se_diff = sqrt(se1^2 + se2^2)
scalar t = diff / se_diff
scalar df = e(df_r)
display "t = " t ", df = " df ", p-value = " 2 * ttail(df, abs(t))
//Heterogeneous impact(one-month lag) 
*NCV vs FHV
reghdfe lnncv l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnncv l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnfhv l1.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnfhv l1.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*Southern vs Northern
reghdfe lnBPHEV l1.outaget lngdp if Southern==0, absorb( i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh lngdp if Southern==0, absorb( i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outaget lngdp if Southern==1, absorb( i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh lngdp if Southern==1, absorb( i.month#i.city i.year#i.city) vce(cluster city)
*GDP high vs low
reghdfe lnBPHEV l1.outaget lngdp if GDP_high==0, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh lngdp if GDP_high==0, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outaget lngdp if GDP_high==1, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh lngdp if GDP_high==1, absorb(i.month#i.city i.year#i.city) vce(cluster city)
//Heterogeneous impact(two-month lag) 
*NCV vs FHV
reghdfe lnncv l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnncv l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnfhv l1.outaget l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnfhv l1.outageh l2.outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*Southern vs Northern
reghdfe lnBPHEV l1.outaget l2.outaget lngdp if Southern==0, absorb( i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l2.outageh lngdp if Southern==0, absorb( i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outaget l2.outaget lngdp if Southern==1, absorb( i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l2.outageh lngdp if Southern==1, absorb( i.month#i.city i.year#i.city) vce(cluster city)
*GDP high vs low
reghdfe lnBPHEV l1.outaget l2.outaget lngdp if GDP_high==0, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l2.outageh lngdp if GDP_high==0, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outaget l2.outaget lngdp if GDP_high==1, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l2.outageh lngdp if GDP_high==1, absorb(i.month#i.city i.year#i.city) vce(cluster city)
//control of charge pile
reghdfe lnBPHEV l1.outaget l2.outaget lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l1.outageh lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev l1.outaget l2.outaget lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev l1.outageh l1.outageh lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV l1.outaget l2.outaget lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV l1.outageh l2.outageh lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
//Statistical test for heterogeneity analysis
gen region=outaget*Southern
gen region1=outageh*Southern
reghdfe lnBPHEV l1.region l1.outaget lngdp , absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.region1 l1.outageh lngdp , absorb(i.month#i.city i.year#i.city) vce(cluster city)
gen economy=outaget*GDP_high
gen economy1=outageh*GDP_high
reghdfe lnBPHEV l1.economy l1.outaget lngdp , absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.economy1 l1.outageh lngdp , absorb(i.month#i.city i.year#i.city) vce(cluster city)
//different time lags
reghdfe lnBPHEV outaget lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outaget l2.outaget l3.outaget lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV outageh lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh l2.outageh l3.outageh lngdp lncp, absorb(i.month#i.city i.year#i.city) vce(cluster city)

// four model specifications
*liner
reghdfe BPHEV l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*semi-log
reghdfe lnBPHEV l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*double log
gen l2outaget=l2.outaget
gen lnl2outaget=ln(l2outaget)
reghdfe lnBPHEV lnl2outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
*exponential relation
gen el2outaget=exp(l2outaget)
reghdfe BPHEV el2outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)

//link test
*liner
qui reghdfe BPHEV l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
linktest
*semi-log
qui reghdfe lnBPHEV l2.outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
linktest
*double log
qui reghdfe lnBPHEV lnl2outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
linktest
*exponential relation
qui reghdfe BPHEV el2outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
linktest

//Mandatory notices
reghdfe lnBPHEV l1.outaget lngdp l1.mandatorynotice, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnbev l1.outaget lngdp l1.mandatorynotice, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnPHEV l1.outaget lngdp l1.mandatorynotice, absorb(i.month#i.city i.year#i.city) vce(cluster city)

//COVID-19 and supply chian
gen supplychain=l1.lockdown
reghdfe lnBPHEV l1.outaget lngdp lockdown supplychain, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l1.outageh lngdp lockdown supplychain, absorb(i.month#i.city i.year#i.city) vce(cluster city) 
reghdfe lnBPHEV l2.outaget lngdp lockdown supplychain, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnBPHEV l2.outageh lngdp lockdown supplychain, absorb(i.month#i.city i.year#i.city) vce(cluster city)

// panel unit root test
bysort city:egen time1=count(city)
drop if time1!=23
egen time2=group(Time)
 xtset city time2
*HT
xtunitroot ht lnBPHEV
xtunitroot ht lnbev
xtunitroot ht lnPHEV,demean
xtunitroot ht outaget
xtunitroot ht outageh
xtunitroot ht lncp
gen dlncharge=d.lncp
xtunitroot ht dlncharge
xtunitroot ht lngdp

*IPS
xtunitroot ips lnBPHEV,lag(5)
xtunitroot ips lnbev,lag(5)
xtunitroot ips lnPHEV,lag(5) demean
xtunitroot ips outaget ,lag(5)
xtunitroot ips outageh ,lag(5)
xtunitroot ips lncp,lag(5)
xtunitroot ips dlncharge,lag(5)
xtunitroot ips lngdp,lag(5) demean

// EV charging station (first order difference) added as a control variable
gen dlncharge=d.lncp
gen dlnBPHEV=d.lnBPHEV
gen dlnbev=d.lnbev
gen dlnPHEV=d.lnPHEV
gen dlngdp=d.lngdp
gen doutaget=d.outaget
reghdfe dlnBPHEV l1.doutaget l2.doutaget dlngdp dlncharge , absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe dlnbev l1.doutaget l2.doutaget dlngdp dlncharge , absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe dlnPHEV l1.doutaget l2.doutaget dlngdp dlncharge , absorb(i.month#i.city i.year#i.city) vce(cluster city)

//cointegration test 
xtcointtest pedroni lnBPHEV l2.outaget lngdp dlncharge, trend demean
xtcointtest kao lnBPHEV l2.outaget lngdp dlncharge, demean

//Granger non-causality test
gen l1outaget=l1.outaget
xtgcause lnBPHEV l1outaget if l1outaget!=.,lag(2)
xtgcause lnPHEV l1outaget if l1outaget!=.
xtgcause lnbev l1outaget if l1outaget!=.,lag(2)
xtgcause lnBPHEV l1outageh if l1outageh!=.,lag(2)
xtgcause lnPHEV l1outageh if l1outageh!=.
xtgcause lnbev l1outageh if l1outageh!=.,lag(2)
xtgcause l1outaget lnBPHEV if l1outaget!=.,lag(2)
xtgcause l1outaget lnPHEV if l1outaget!=.
xtgcause l1outaget lnbev if l1outaget!=.
xtgcause l1outageh lnBPHEV if l1outageh!=.
xtgcause l1outageh lnPHEV if l1outageh!=.,lag(2)
xtgcause l1outageh lnbev if l1outageh!=.



