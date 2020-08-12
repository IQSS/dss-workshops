
 *** Exercise 0

* 1. Try to get Stata to say "Hello World!". Search `help display`

disp "Hello " "World!" // 'disp' is short for 'display'

* 2. Try to get Stata to break "Hello World!" over two lines:

disp "Hello" ///
     " World!"


 *** Exercise 1

* We are using The Generations of Talent Study (`talent.dta`) to practice reading in data, plotting data, and calculating descriptive statistics. The dataset includes information on quality of employment as experienced by today's multigenerational workforces. Here is a codebook of a subset of variables:
*
* | Variable name | Label                                                                |
* |:--------------|:---------------------------------------------------------------------|
* | job           | type of main job                                                     |
* | workload      | how long hours do you work per week                                  |
* | otherjob      | do you have other paid jobs beside main job                          |
* | schedule      | which best describes your work schedule                              |
* | fulltime      | Does your employer consider you a full-time or part-time employee    |
* | B3A           | How important are the following to you? Your work                    |
* | B3B           | How important are the following to you? Your family                  |
* | B3C           | How important are the following to you? Your friends                 |
* | marital       | Which of the following best describes your current marital status    |
* | I3            | Sex/gender                                                           |
* | income        | What was your total household income during last year                |

* Create a new do-file for the following exercise prompts. After the exercise save the do-file to your working directory.
*
* 1. Read in the dataset `talent.dta`: 

use talent.dta, clear

* 2. Examine a few selected variables using the `describe`, `sum` and `codebook` commands:

describe workperweek
tab I3
sum income
codebook job

* 3. Produce a histogram of hours worked (`workload`) and add a normal curve: 

hist workload, normal 

* 4. Summarize the total household income last year (`income`) by marital status (`marital`):

bysort marital: sum income

* 5. Cross-tabulate marital status (`marital`) with respondents' type of main job (`job`):

bysort job: tab marital 
save talent.dta, replace 




 ### Exercise 2

* Open the `talent.dta` data, use the basic data management tools we have learned to add labels and generate new variables:
*
* 1. Tabulate the variable, marital status (`marital`), with and without labels:

use talent.dta, clear

tab marital
tab marital, nol 

* 2. Summarize the total household income last year (`income`) for married individuals only:

summarize income if marital == 1

* 3. Generate a new `overwork` dummy variable from the original variable `workperweek` that will take on a value of 1 if a person works more than 40 hours per week, and 0 if a person works equal to or less than 40 hours per week:

gen overwork = .
replace overwork = 1 if workperweek > 40
replace overwork = 0 if workperweek <= 40
tab overwork

* 4. Generate a new `marital_dummy` dummy variable from the original variable `marital` that will take on a value of 1 if a person is either married or partnered and 0 otherwise:

gen marital_dummy = .
replace marital_dummy = 1 if marital == 1 | marital == 2
replace marital_dummy = 0 if marital != 1 & marital != 2
tab marital_dummy

* 5. Rename the `Sex` variable and give it a more intuitive name:

rename I3 Sex

* 6. Give a variable label and value labels for the variable `overwork`:

label variable overwork "whether someone works more than 40 hours per week"
label define overworklabel 1 "Yes" 0 "No"
label values overwork overworklabel

* 7. Generate a new variable called `work_family` and code it as 2 if a respondent perceived work to be more important than family, 1 if a respondent perceived family to be more important than work, and 0 if the two are of equal importance:

gen work_family = .
replace work_family = 2 if B3A > B3B
replace work_family = 1 if B3A < B3B
replace work_family = 0 if B3A == B3B

* 8. Save the changes to `newtalent.dta`

save newtalent.dta, replace 



 ### Exercise 3

* Open the `newtalent.dta` data, use the basic data management tools we have learned to conduct bivariate analysis. 

* 1.  Test the relationship between two variables `sex` and type of main job (`job`):

use newtalent.dta, clear 
tab Sex job, chi2 

* 2.  Test if there is a significant difference in hours worked per week (`workload`) and `sex`: 

ttest workload, by(Sex)

* 3.  Test if there is a significant difference in hours worked per week (`workload`) and marital status (`marital`): 

oneway workload marital 
save newtalent.dta, replace 

     
