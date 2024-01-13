xtset city time
reghdfe lnave_nev ave_outaget l1.ave_outaget l2.ave_outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnave_nev ave_outageh l1.ave_outageh l2.ave_outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnave_bev ave_outaget l1.ave_outaget l2.ave_outaget lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
reghdfe lnave_bev ave_outageh l1.ave_outageh l2.ave_outageh lngdp, absorb(i.month#i.city i.year#i.city) vce(cluster city)
