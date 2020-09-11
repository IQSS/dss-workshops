

 ### Exercise 0

* 1.  Open the `gss.dta` data, `generate` a new variable that represents the squared value of `age`.

use dataSets/gss.dta, clear
gen age2 = age^2

* 2.  `generate` a new variable equal to "1" if `income` is greater than "19".

describe income
label list income
recode income (99=.) (98=.)
gen highincome =0 if income != .
replace highincome=1 if income>19
sum highincome

* 3.  Create a new variable that counts the number of missing responses for each respondent. What is the maximum number of missing variables?

egen nmissing = rowmiss(_all)
sum nmissing



 ### Exercise 1

* **Missing values, string conversion, & by processing**
*
* 1.  Recode values "99" and "98" on the variable `hrs1` as missing.

use dataSets/gss.dta, clear
sum hrs1
recode hrs1 (99=.) (98=.) 
sum hrs1

* 2.  Recode the `marital` variable into a string variable and then back into a numeric variable.

tostring marital, gen(marstring)
destring marstring, gen(mardstring)

//compare with
decode marital, gen(marital_s)
encode marital_s, gen(marital_n)

describe marital marstring mardstring marital_s marital_n
sum marital marstring mardstring marital_s marital_n

* 3.  Create a new variable that associates each individual with the average number of hours worked among individuals with matching educational degrees (see the last `by` example for inspiration).

bysort degree: egen hrsdegree = mean(hrs1)
tab hrsdegree
tab hrsdegree degree 


 ### Exercise 2

* **Append, merge, & collapse**
*
* Open the `gss2.dta` dataset. This dataset contains only half of the variables that are in the complete gss dataset.
*
* 1.  Merge dataset `gss1.dta` with dataset `gss2.dta`. The identification variable is `id`.

use dataSets/gss2.dta, clear
merge 1:1 id using dataSets/gss1.dta
save gss3.dta, replace

* 2.  Open the `gss.dta` dataset and merge in data from the `marital.dta` dataset, which includes income information grouped by individuals' marital status. The `marital.dta` dataset contains collapsed data regarding average statistics of individuals based on their marital status.

use dataSets/gss.dta, clear
merge m:1 marital using dataSets/marital.dta, nogenerate replace update
save gss4.dta, replace

* 3.  Open the `gssAppend.dta` dataset and create a new dataset that combines the observations in `gssAppend.dta` with those in `gssAddObserve.dta`.

use dataSets/gssAppend.dta, clear
append using dataSets/gssAddObserve, generate(observe) 

* 4.  Open the `gss.dta` dataset and create a new dataset that summarizes the mean and standard deviation of income based on individuals' degree status (`degree`). In the process of creating this new dataset, rename your three new variables.

use dataSets/gss.dta, clear
save collapse2.dta, replace
use collapse2.dta, clear
collapse (mean) meaninc=income (sd) sdinc=income, by(marital)

