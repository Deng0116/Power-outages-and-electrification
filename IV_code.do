xtset city Time
gen l1outaget=l1.outaget
gen l1outageh=l1.outageh
gen l1DD=l1.DD
*outage times
ivreghdfe lnNEV lngdp (l1outaget=l1DD ), absorb(i.month#i.city i.year#i.city) r first
ivreghdfe lnBEV lngdp (l1outaget=l1DD ), absorb(i.month#i.city i.year#i.city) r first
ivreghdfe lnPHEV lngdp (l1outaget=l1DD ), absorb(i.month#i.city i.year#i.city) r first
*outage hours
ivreghdfe lnNEV lngdp (l1outageh=l1DD ), absorb(i.month#i.city i.year#i.city) r first
ivreghdfe lnBEV lngdp (l1outageh=l1DD ), absorb(i.month#i.city i.year#i.city) r first
ivreghdfe lnPHEV lngdp (l1outageh=l1DD ), absorb(i.month#i.city i.year#i.city) r first
