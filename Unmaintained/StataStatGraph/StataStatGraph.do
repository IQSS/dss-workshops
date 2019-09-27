*                    __________________________________
* 
*                     STATISTICS AND GRAPHICS IN STATA
*                    __________________________________
* 
* Table of Contents
* _________________
* 
* Introduction
* Fitting models in Stata
* .. Univariate regression
* .. Multiple regression
* .. Interactions
* .. Exporting and saving results
* Graphing in Stata
* .. Univariate Graphics
* .. Bivariate Graphics
* .. More Fun with Twoway Line Graphs
* Wrap-up
* 
* Introduction
* ============
* 
* Download workshop materials                                      :setup:
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~
* 
*   - Lab computer log in:
*     - USERNAME: dataclass
*     - PASSWORD: on the board to your left
*   - Download materials from
*     [http://tutorials.iq.harvard.edu/Stata/StataStatGraph.zip]
*   - Extract materials from the `StataStatGraph.zip' file
*   - Launch Stata and open the `StataStatGraph.do' file
* 
* Organization
* ~~~~~~~~~~~~
* 
*   - Please feel free to ask questions at any point if they are relevant
*     to the current topic (or if you are lost!)
*   - There will be a Q&A after class for more specific, personalized
*     questions
*   - Collaboration with your neighbors is encouraged
*   - If you are using a laptop, you will need to adjust paths accordingly
*   - Make comments in your Do-file rather than on hand-outs
*   - Save on flash drive or email to yourself
* 
* Fitting models in Stata
* =======================
* 
* Today's Dataset
* ~~~~~~~~~~~~~~~
* 
*   - We have data on a variety of variables for all 50 states
*   - Population, density, energy use, voting tendencies, graduation
*     rates, income, etc.
*   - We're going to be predicting SAT scores
*   - Univariate Regression: SAT scores and Education Expenditures
*   - Does the amount of money spent on education affect the mean SAT
*     score in a state?
*   - Dependent variable: csat
*   - Independent variable: expense
* 
* Opening Files in Stata
* ~~~~~~~~~~~~~~~~~~~~~~
* 
*   - Look at bottom left hand corner of Stata screen
*     - This is the directory Stata is currently reading from
*   - Files are located in the StataStatistics folder on the Desktop
*   - Start by telling Stata where to look for these
* 

// change directory
cd "~/tutorials/Stata/StataStatGraph"

* 
*   - Use dir to see what is in the directory:
* 

dir
cd dataSets
dir
cd ..

* 
*   - Load the data
* 

// use the states data set
use dataSets/states.dta

* 
* Steps for Running Regression
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* 
*   1. Examine descriptive statistics
*   2. Look at relationship graphically and test correlation(s)
*   3. Run and interpret regression
*   4. Test regression assumptions
* 
* Univariate regression
* ~~~~~~~~~~~~~~~~~~~~~
* 
* Univariate Regression: Preliminaries
* ------------------------------------
* 
*   - We want to predict csat scores from expense
*   - First, let's look at some descriptives
* 

// generate summary statistics for csat and expense
sum csat expense

* 
* Univariate Regression Preliminaries
* -----------------------------------
* 
*   - We want to predict csat scores from expense
*   - First, let's look at some descriptives
* 

// look at codebok
codebook csat expense

* 
* Univariate Regression Preliminaries
* -----------------------------------
* 
*   - Next, view relationship graphically
*   - Scatterplots work well for univariate relationships
* 

// graph expense by csat
twoway scatter expense csat

* 
*   [file:images/scatter1.png]
* 
* Univariate Regression Preliminaries
* -----------------------------------
* 
*   - Next look at the correlation matrix
* 

// correlate csat and expense
pwcorr csat expense, star(.05)

* 
*   - Not very interesting with only one predictor
* 
* Univariate Regression: SAT scores and Education Expenditures
* ------------------------------------------------------------
* 

regress csat expense

* 
* Linear Regression Assumptions
* -----------------------------
* 
*   - Assumption 1: Normal Distribution
*   - The errors of regression equation are normally distributed
*   - Assumption 2: Homoscedasticity (The variance around the regression
*     line is the same for all values of the predictor variable)
*   - Assumption 3: Errors are independent
*   - Assumption 4: Relationships are linear
* 
* Homoscedasticity
* ----------------
* 
*   [file:images/heteroscedasticity.png]
* 
*   [file:images/homscedasticity.png]
* 
* Testing Assumptions: Normality
* ------------------------------
* 
*   - A simple histogram of the residuals can be informative
* 

// graph the residual values of csat
predict resid, residual
histogram resid, normal

* 
*   [file:images/normalHist1.png]
* 
* Testing Assumptions: Homoscedasticity
* -------------------------------------
* 

rvfplot

* 
*   [file:images/fittedResidual1.png]
* 
* Multiple regression
* ~~~~~~~~~~~~~~~~~~~
* 
* Multiple Regression
* -------------------
* 
*   - Just keep adding predictors
*   - Let's try adding some predictors to the model of SAT scores
*   - % students taking SATs
*   - % adults with HS diploma (high)
* 
* Multiple Regression Preliminaries
* ---------------------------------
* 
*   - As before, start with descriptive statistics and correlations
* 

// descriptive statistics and correlations
sum income percent high
pwcorr csat expense income percent high

* 
* Multiple Regression
* -------------------
* 
*   - regress csat on exense, income, percent, and high
* 

regress csat expense income percent high

* 
* Exercise 1: Multiple Regression
* -------------------------------
* 
*   Open the datafile, states.dta.
*   1. Select a few variables to use in a multiple regression of your own.
*      Before running the regression, examine descriptive of the variables
*      and generate a few scatterplots.
*   2. Run your regression
*   3. Examine the plausibility of the assumptions of normality and
*      homogeneity
* 
* Interactions
* ~~~~~~~~~~~~
* 
* Interactions
* ------------
* 
*   - What if we wanted to test an interaction between percent & high?
*   - Option 1: generate product terms by hand
* 

// generate product of percent and high
gen percenthigh = percent*high 
regress csat expense income percent high percenthigh

* 
* Interactions
* ------------
* 
*   - What if we wanted to test an interaction between percent & high?
*   - Option 2: Let Stata do your dirty work
* 

// use the # sign to represent interactions 
regress csat percent high c.percent#c.high
// same as . regress csat c.percent##high

* 
* Categorical Predictors
* ----------------------
* 
*   - For categorical variables, we first need to dummy code
*   - Use region as example
*     - Option 1: create dummy codes before fitting regression model
* 

// create region dummy codes using tab 
tab region, gen(region)

//regress csat on region
regress csat region1 region2 region3

* 
* Categorical Predictors
* ----------------------
* 
*   - For categorical variables, we first need to dummy code
*   - Use region as example
*     - Option 2: Let Stata do it for you
* 

// regress csat on region using fvvarlist syntax
// see help fvvarlist for details
regress csat i.region

* 
* Exercise 2: Regression, Categorical Predictors, & Interactions
* --------------------------------------------------------------
* 
*   Open the datafile, states.dta.
*   1. Add on to the regression equation that you created in exercise 1 by
*      generating an interaction term and testing the interaction.
*   2. Try adding a categorical variable to your regression (remember, it
*      will need to be dummy coded). You could use region or generate a
*      new categorical variable from one of the continuous variables in
*      the dataset.
* 
* Exporting and saving results
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* 
* Saving and exporting regression tables
* --------------------------------------
* 
*   - Usually when we're running regression, we'll be testing multiple
*     models at a time
*   - Can be difficult to compare results
*   - Stata offers several user-friendly options for storing and viewing
*     regression output from multiple models
*   - First, download the necessary packages:
* 

// install outreg2 package
findit outreg2

* 
* Saving and replaying
* --------------------
* 
*   - You can store regression model results in Stata
* 

// fit two regression models and store the results
regress csat expense income percent high
estimates store Model1
regress csat expense income percent high i.region
estimates store Model2

* 
* Saving and replaying
* --------------------
* 
*   - Stored models can be recalled
* 

// Display Model1
estimates replay Model1

* 
* Saving and replaying
* --------------------
* 
*   - Stored models can be compared
* 

// Compare Model1 and Model2 coefficients
estimates table Model1 Model2

* 
* Exporting into Excel
* --------------------
* 
*   - Avoid human error when transferring coefficients into tables
*   - Excel can be used to format publication-ready tables
* 

outreg2 [Model1 Model2] using csatprediction.xls, replace

* 
* Graphing in Stata
* =================
* 
* Graphing Strategies
* ~~~~~~~~~~~~~~~~~~~
* 
*   - Keep it simple
*   - Labels, labels, labels!!
*   - Avoid cluttered graphs
*   - Every part of the graph should be meaningful
*   - Avoid:
*     - Shading
*     - Distracting colors
*     - Decoration
* 
*   - Always know what you’re working with before you get started
*     - Recognize scale of data
*     - If you’re using multiple variables – how do their scales align?
*   - Before any graphing procedure review variables with `codebook',
*     `sum', `tab', etc.
*   - HELPFUL STATA HINT: If you want your command to go on multiple lines
*     use `///' at end of each line
* 
* Univariate Graphics
* ~~~~~~~~~~~~~~~~~~~
* 
* Our First Dataset
* -----------------
* 
*   - Time Magazine Public School Poll
*     - Based on survey of 1,000 adults in U.S.
*     - Conducted in August 2010
*     - Questions regarding feelings about parental involvement, teachers
*       union, current potential for reform
* 
*   - Open Stata and call up the datafile for today
* 

// Step 1: tell Stata where to find data:
cd "dataSets"
// Step 2: call up our dataset:
use TimePollPubSchools.dta

* 
* Single Continuous Variables
* ---------------------------
* 
*   Example: Histograms
*   - Stata assumes you’re working with continuous data
*   - Very simple syntax:
*     - `hist varname'
*   - Put a comma after your varname and start adding options
*     - `bin(#)' : change the number of bars that the graph displays
*     - `normal' : overlay normal curve
*     - `addlabels' : add actual values to bars
* 
* Histogram Options
* -----------------
* 
*   - To change the numeric depiction of your data add these options after
*     the comma
*     - Choose one: density fraction frequency percent
*   - Be sure to properly describe your histogram:
*     - `title(insert name of graph)'
*     - `subtitle(insert subtitle of graph)'
*     - `note(insert note to appear at bottom of graph)'
*     - `caption(insert caption to appear below notes)'
* 
* Histogram Example
* -----------------
* 

hist F1, bin(10) percent title(TITLE) ///
  subtitle(SUBTITLE) caption(CAPTION) note(NOTES)

* 
* Axis Titles and Labels
* ----------------------
* 
*   Example: Histograms
*   - Axis title options (default is variable label):
*     - `xtitle(insert x axis name)'
*     - `ytitle(insert y axis name)'
*   - Don’t want axis titles?
*     - `xtitle("")'
*     - `ytitle("")'
* 
*   - Add labels to X or Y axis:
*     - xlabel(insert x axis label)
*     - ylabel(insert y axis label)
*   - Tell Stata how to scale each axis
*     - xlabel(start#(increment)end#)
*     - xlabel(0(5)100)
*   - This would label x-axis from 0-100 in increments of 5
* 
* Axis Labels Example
* -------------------
* 

hist F1, bin(10) percent title(TITLE) subtitle(SUBTITLE) ///
    caption(CAPTION) note(NOTES) ///
    xtitle(Here's your x-axis title) ///
ytitle(here's your y-axis title)

* 
* Basic Graphing: Single Categorical Variables
* --------------------------------------------
* 
*   - We can also use the `hist' command for bar graphs
*     - Simply specify "discrete" with options
*   - Stata will produce one bar for each level (i.e. category) of
*     variable
*   - Use `xlabel' command to insert names of individual categories
* 

hist F4, title(Racial breakdown of Time Poll Sample) xtitle(Race) ///
ytitle(Percent) xlabel(1 "White" 2 "Black" 3 "Asian" 4 "Hispanic" ///
 5 "Other") discrete percent addlabels

* 
* Exercise 1: Histograms Bar Graphs
* ---------------------------------
* 
*   1. Open the datafile, NatNeighCrimeStudy.dta.
*   2. Create a histogram of the tract-level poverty rate (variable name:
*      `T_POVRTY').
*   3. Insert the normal curve over the histogram
*   4. Change the numeric representation on the Y-axis to "percent"
*   5. Add appropriate titles to the overall graph and the x axis and y
*      axis. Also, add a note that states the source of this data.
*   6. Open the datafile, TimePollPubSchools.dta
*   7. Create a histogram of the question, "What grade would you give your
*      child’s school" (variable name: Q11). Be sure to tell Stata that
*      this is a categorical variable.
*   8. Format this graph so that the axes have proper titles and labels.
*      Also, add an appropriate title to the overall graph that goes onto
*      two lines. Add a note stating the source of the data.
* 
* Next Dataset:
* -------------
* 
*   - National Neighborhood Crime Study (NNCS)
*     - N=9,593 census tracts in 2000
*     - Explore sources of variation in crime for communities in the
*       United States
*     - Tract-level data: crime, social disorganization, disadvantage,
*       socioeconomic inequality
*     - City-level data: labor market, socioeconomic inequality,
*       population change
* 
* Bivariate Graphics
* ~~~~~~~~~~~~~~~~~~
* 
* The Twoway Family
* -----------------
* 
*   - `twoway' is basic Stata command for all twoway graphs
*   - Use `twoway' anytime you want to make comparisons among variables
*   - Can be used to combine graphs (i.e., overlay one graph with another
*     - e.g., insert line of best fit over a scatter plot
* 
*   - Some basic examples:

use NatNeighCrimeStudy.dta
twoway scatter T_PERCAP T_VIOLNT
twoway dropline T_PERCAP T_VIOLNT
twoway  lfitci T_PERCAP T_VIOLNT

* 
* Twoway and the "by" Statement
* -----------------------------
* 

twoway scatter T_PERCAP T_VIOLNT, by(DIVISION)

* 
* Twoway Title Options
* --------------------
* 
*   - Same title options as with histogram
*     - `title(insert name of graph)'
*     - `subtitle(insert subtitle of graph)'
*     - `note(insert note to appear at bottom of graph)'
*     - `caption(insert caption to appear below notes)'
* 
* Twoway Title Options Example
* ----------------------------
* 

twoway scatter T_PERCAP T_VIOLNT, ///
    title(Comparison of Per Capita Income ///
          and Violent Crime Rate at Tract level) ///
xtitle(Violent Crime Rate) ytitle(Per Capita Income) ///
    note(Source: National Neighborhood Crime Study 2000)

* 
*   - The title is a bit cramped--let's fix that:
* 

twoway scatter T_PERCAP T_VIOLNT, ///
    title("Comparison of Per Capita Income" ///
"and Violent Crime Rate at Tract level") ///
xtitle(Violent Crime Rate) ytitle(Per Capita Income) ///
note(Source: National Neighborhood Crime Study 2000)

* 
* Twoway Symbol Options
* ---------------------
* 
*   - A variety of symbol shapes are available: use `palette
*     symbolpalette' to seem them and `msymbol()' to set them
* 

twoway scatter T_PERCAP T_VIOLNT, ///
    title("Comparison of Per Capita Income" ///
"and Violent Crime Rate at Tract level") ///
xtitle(Violent Crime Rate) ytitle(Per Capita Income) ///
note(Source: National Neighborhood Crime Study 2000) ///
msymbol(Sh) mcolor("red")

* 
* Overlaying Twoway Graphs
* ------------------------
* 
*   - Very simple to combine multiple graphs…just put each graph command
*     in parentheses
*     - `twoway (scatter var1 var2) (lfit var1 var2)'
*   - Add individual options to each graph within the parentheses
*   - Add overall graph options as usual following the comma
*     - `twoway (scatter var1 var2) (lfit var1 var2), options'
* 
* Overlaying Points and Lines
* ---------------------------
* 

twoway (scatter T_PERCAP T_VIOLNT) ///
    (lfit T_PERCAP T_VIOLNT), ///
    title("Comparison of Per Capita Income" ///
          "and Violent Crime Rate at Tract level") ///
    xtitle(Violent Crime Rate) ytitle(Per Capita Income) ///
    note(Source: National  Neighborhood Crime Study 2000)

* 
* Overlaying Points and Labels
* ----------------------------
* 

twoway (scatter T_PERCAP T_VIOLNT if T_VIOLNT==1976, ///
        mlabel(CITY)) (scatter T_PERCAP T_VIOLNT), ///
    title("Comparison of Per Capita Income" ///
          "and Violent Crime Rate at Tract level") ///
    xlabel(0(200)2400) note(Source: National Neighborhood ///
                            Crime Study 2000) legend(off)

* 
* Exercise 2: The TwoWay Family
* -----------------------------
* 
*   Open the datafile, NatNeighCrimeStudy.dta.
*   1. Create a basic twoway scatterplot that compares the city
*      unemployment rate (`C_UNEMP') to the percent secondary sector
*      low-wage jobs (`C_SSLOW')
*   2. Generate the same scatterplot, but this time, divide the plot by
*      the dummy variable indicating whether the city is located in the
*      south or not (`C_SOUTH')
*   3. Change the color of the symbol that you use in this scatter plot
*   4. Change the type of symbol you use to a marker of your choice
*   5. Notice in your scatterplot that is broken down by `C_SOUTH' that
*      there is an outlier in the upper right hand corner of the "Not
*      South" graph. Add the city name label to this marker.
*   6. Review the options available under "help twoway_options" and
*      change one aspect of your graph using an option that we haven’t
*      already reviewed
* 
* More Fun with Twoway Line Graphs
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* 
* Line Graphs
* -----------
* 
*   - Line graphs helpful for a variety of data
*     - Especially any type of time series data
*   - We’ll use data on US life expectancy from 1900-1999
*     - `webuse uslifeexp, clear'
* 
* Line Graphs
* -----------
* 

webuse uslifeexp, clear
twoway (line le_wm year, mcolor("red")) ///
    (line le_bm year, mcolor("green"))

twoway (line (le_wfemale le_wmale le_bf le_bm) year, ///
    lpattern(dot solid dot solid))

palette linepalette

* 
* Exporting Graphs
* ----------------
* 
*   - From Stata, right click on image and select "save as" or try syntax:
*     - `graph export myfig.esp, replace'
*   - In Microsoft Word: insert > picture > from file
*     - Or, right click on graph in Stata and copy and paste into Word
* 
* Wrap-up
* =======
* 
* Help Us Make This Workshop Better
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* 
*   - Please take a moment to fill out a very short feedback form
*   - These workshops exist for you--tell us what you need!
*   - [http://tinyurl.com/StataRegressionFeedback]
* 
* Additional resources
* ~~~~~~~~~~~~~~~~~~~~
* 
*   - training and consulting
*     - IQSS workshops:
*       [http://projects.iq.harvard.edu/rtc/filter_by/workshops]
*     - IQSS statistical consulting: [http://dss.iq.harvard.edu]
* 
*   - Stata resources
*     - UCLA website: [http://www.ats.ucla.edu/stat/Stata/]
*     - Great for self-study
*     - Links to resources
*   - Stata website: [http://www.stata.com/help.cgi?contents]
*   - Email list: [http://www.stata.com/statalist/]
* 
