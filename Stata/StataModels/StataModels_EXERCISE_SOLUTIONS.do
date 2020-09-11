
 ### Exercise 0

* **Regression with continuous outcomes**
*
* Open the datafile, `gss.dta`.
*
* Fit an OLS regression model to predict general happiness (`happy`) based on respondent's sex (`sex`), marital status (`marital`), highest year of school completed (`educ`), and respondent's income for last year (`rincome`).
*
// 1.  Before running the regression, examine descriptive statistics of the variables and generate a few scatterplots.

sum happy educ rincome
tab sex
tab marital

scatter happy rincome

// 2.  Run your regression model.

regress happy i.sex educ i.marital rincome

// 3.  Examine the plausibility of the assumptions of normality and homoscedasticity.

hist happy, normal
rvfplot,yline(0)

// 4.  Add on to the regression equation by generating an interaction term between `sex` and `educ` and testing the interaction.

regress happy i.sex*#c.educ i.marital rincome


 ### Exercise 1

* **Regression with binary outcomes**
*
* Use the data file, `gss.dta`. Examine how age of a respondent (`age`), highest year of school completed (`degree`), hours per day watching TV (`tvhours`), and total family income for last year (`income`) relate to whether someone uses internet (`usenet`).
*
// 1.  Load the dataset.

use gss.dta, clear

// 2.  Run summary statistics, delete subjects who did not provide an answer to the `usenet` question.

tab usenet
drop if usenet == 9
tab degree
sum age tvhours income



 ### Exercise 2

* **Exporting & saving results**

// 1.  Fit the logistic model and save it as `Model1`.

logit usenet age i.degree tvhours income
est store Model1

// 2.  Add another predictor (`hrs1`) in the model and save the new model as `Model2` and compare between `Model1` and `Model2`.

logit usenet age i.degree tvhours income hrs1
est store Model2

lrtest Model1 Model2

// 3.  Save the better fitted model output to a word document.

logit usenet age i.degree tvhours income hrs1
outreg2 using Mymodel.doc



 ### Exercise 3

* **Margins of responses**
*
* Open the datafile `gss.dta`
*
// 1. Fit an OLS regression model to predict general happiness (`happy`) based on respondent's sex (`sex`), marital status (`marital`), highest year of school completed (`educ`), and respondent's income for last year (`rincome`). Obtain average predictive margins for `happy`.

regress happy i.sex educ i.marital rincome
margins

// 2. Obtain predictive margins of `sex` and `marital`.

margins, sex
margins, marital

// 3. Obtain predictive margins of `rincome` from 10000 to 30000, with an interval of 5000.

margins, at(rincome=(10000(5000)30000))

// 4. Create a `marginsplot` and interpret the results.

marginsplot



### Exercise 4

* **Margins of changes in responses**
*
* Open the datafile `gss.dta`
*
// 1. Fit a logistic model to examine how whether someone uses internet (`usenet`) is related to age of the respondent (`age`), highest year of school completed (`degree`), hours per day watching TV (`tvhours`), and total family income for last year (`income`). Obtain Average Predictive Margins and Average Marginal Effects for `degree`.

logit usenet age i.degree tvhours income

margins degree
margins, dydx(degree)

// 2. Obtain Predictive Margins of `degree` at Representative values of `tvhours` from 0 to 10 hours, on a 1 hour interval. Examine how the marginal effect of `degree` differs across the range of `tvhours` (i.e., obtain Marginal Effects at Representative values).

margins degree, at(tvhours=(0 1 2 3 4 5 6 7 8 9 10) vsquish
margins, dydx(degree) at(tvhours=(0 1 2 3 4 5 6 7 8 9 10)) vsquish

// 3. Create a `marginsplot` for the marginal effects from *2.

marginsplot
