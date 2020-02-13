

solutions: 

* ### Exercise 0
*
* **Importing data**
*
* 1.  Save any work you've done so far. Close down Stata and open a new session.
* 2.  Start Stata and open your `.do` file. 
* 3.  Change directory (`cd`) to the `dataSets` folder.
* 3.  Try opening the following files:
*     + A comma separated value file: `gss.csv`
*     + An Excel file: `gss.xlsx`

clear 
cd "C:\Users\yiw640\Desktop\StataIntro\dataSets"

import delimited gss.csv, clear
import excel gss.xlsx, clear 


* ### Exercise 1
*
* **Descriptive statistics**

* The Generations of Talent Study sought to examine quality of employment as experienced by today's multigenerational workforces. 
* The primary goal was to explore how country-related factors and age-related factors affect employees' perceptions of quality of employment. 
* Demographic variables included gender, birth year, race/ethnicity, education, marital * status, number of children, hourly wage, salary, and household income.

* 1.  Use the dataset, "talent.dta", open a new do-file and write on the do-file, after the exercise save it to the folder 
* 2.  Examine a few selected variables using the describe, sum and codebook commands
* 3.  Tabulate the variable, marital status ("marital"), with and without labels
* 4.  Summarize the total household income last year ("income") by marital status
* 5.  Cross-tabulate marital status with respondents' type of main job ("job")
* 6.  Summarize the total household income last year ("income") for married individuals only

use talent.dta, clear 
describe workperweek
tab I3 
sum income
codebook job

tab marital 
tab marital, nol 

bysort marital: sum income
tabulate marital job 
summarize income if marital == 1 

* ### Exercise 2
*
* **Variable labels & value labels**
*
* 1.  Open the data set `gss.csv`
* 2.  Familiarize yourself with the data using describe, sum, etc.
* 3.  Rename and label variables using the following codebook:
*
* | Var     | Rename to     | Label with          |
* |:--------|:--------------|:--------------------|
* | v1      | marital       | marital status      |
* | v2      | age           | age of respondent   |
* | v3      | educ          | education           |
* | v4      | sex           | respondent's sex    |
* | v5      | inc           | household income    |
* | v6      | happy         | general happiness   |
* | v7      | region        | region of interview |
*
* 1.  Add value labels to your `marital` variable using this codebook:
*
* | Value     | Label           |
* |:----------|:----------------|
* | 1         | "married"       |
* | 2         | "widowed"       |
* | 3         | "divorced"      |
* | 4         | "separated"     |
* | 5         | "never married" |
*
* ## Working on subsets
*
* * It is often useful to select just those rows of your data where some condition holds--for example select only rows where sex is 1 (male)
* * The following operators allow you to do this:
*
* | Operator | Meaning                  |
* |:---------|:-------------------------|
* | ==       | equal to                 |
* | !=       | not equal to             |
* | >        | greater than             |
* | >=       | greater than or equal to |
* | <        | less than                |
* | <=       | less than or equal to    |
* | &        | and                      |
* | \|       | or                       |
*
* * Note the double equals signs for testing equality

import delimited gss.csv, clear
rename v1 marital
label var marital "marital status"
label define marital_label 1 "married" 2 "widowed" 3 " divorced" 4 "seperated" 5 "never married"
label val marital marital_label 

rename v2 age
rename v3 educ
rename v4 sex
rename v5 inc
rename v6 happy
rename v7 region


label var age "age of respondent"
label var educ "education"
label var sex "respondent's sex"
label var inc "household income"
label var happy "general happiness"
label var region "region of interview"



* ### Exercise 3
*
* **Manipulating variables with gen and replace** 
*
* 1.  Use the dataset, `talent.dta`, work on the previous do-file. Save any changes to the data to original data. 
* 2.  Generate a new "overwork" dummy variable from the original variable "workperweek" that will take on a value of "1" if a person works more than 40 hours per week, and "0" if a person works equal to or less than 40 hours per week 
* 3.  Generate a new "marital_dummy" dummy variable from the original variable "marital" that will take on a value of "1" if a person is either married or partnered and "0" otherwise
* 4. Save the changes to the origial dataset 


use talent.dta, clear 
gen overwork = . 
replace overwork = 1 if workperweek > 40 
replace overwork = 0 if workperweek <= 40 
tab overwork

gen marital_dummy = . 
replace marital_dummy = 1 if marital == 1 | marital == 2
replace marital_dummy = 0 if marital != 1 & marital != 2 
tab marital_dummy



* ### Exercise 4
*
* Combine all what we have leanred together! 
*
* 1.  Use the dataset, `talent.dta`
* 2.  Rename the Sex/gender variable and give it a more intuitive name 
* 3.  Use codebook,  describe, tab, and browse commands to know more about how the three variables "A3", "A5", and "A7" are coded and store, give them new names 
* 4.  Plot a histogram distribution for "workperweek" and add a normal curve 
* 5.  Give a variable label and value labels for the variable "overwork"
* 6.  Generate a new variable called "work_family" and code it as 2 if a respondent perceived work to be more important than family, 1 if a respondent perceived family to be more important than work, and 0 if the two are of equal importance 
* 7.  Drop the B3C variable that is not used in our exercise 
* 8.  Save the changes to a new data file called "talent_new.dta" and save it to our folder 


use talent.dta, clear 
rename I3 Sex

codebook A3 
describe A5 
tab A7 

rename A3 otherjob 
rename A5 workschedule 
rename A7 parttime 

hist workperweek, normal 

label variable overwork "whether someone works more than 40 hours per week"
label define overworklabel 1 "Yes" 0 "No"
label values overwork overworklabel

gen work_family = .
replace work_family = 2 if B3A > B3B
replace work_family = 1 if B3A < B3B 
replace work_family = 0 if B3A == B3B

drop B3C 









