*______________________________________________________________________
* Data Management in Stata             
* Exercise solutions
*--------------------------------------------------------------------
*--------------------------------------------------------------------


/*Exercise 1*/

*1.
use dataSets/gss.dta
gen age2 = age^2

*2.
label list income
recode income (99=.) (98=.)
gen highincome =0 if income != .
replace highincome=1 if income>19
sum highincome

*3.
egen newvar2 = rowmiss(age-wifeft)

/*Exercise 2*/

*1.
use dataSets/gss2.dta, clear
tab hrs1, nola
recode hrs1 (99=.) (98=.) 
recode hrs1 (99=.) (98=.) , gen(hrs1z)

*2.
tostring marital, gen(marstring)
destring marstring, gen(mardstring)

*3. 

bysort degree: egen hrsdegree = mean(hrs1)
tab hrsdegree
tab degreehours degree 



/*Exercise 3*/
*1. 
use dataSets/gss2.dta, clear
merge 1:1 id using dataSets/gss1.dta
save gss3.dta, replace


*2.
use dataSets/gss.dta, clear
merge m:1 marital using dataSets/marital.dta, nogenerate replace update
save gss4.dta, replace

*3.
use dataSets/gssAppend.dta, clear
append using dataSets/gssAddObserve, generate(observe) 

*4.
use dataSets/gss.dta, clear
save collapse2.dta, replace
use collapse2.dta, clear
collapse (mean) meaninc=income (sd) sdinc=income, by(marital)




