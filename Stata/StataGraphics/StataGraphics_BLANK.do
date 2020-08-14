* **Topics**
*
* * Univariate graphs
* * Bivariate graphs

* ## Setup
*
* ### Class structure and organization
*
* * Please feel free to ask questions at any point if they are relevant to the current topic (or if you are lost!)
* * Collaboration is encouraged - please introduce yourself to your neighbors!
* * If you are using a laptop, you will need to adjust file paths accordingly
* * Make comments in your Do-file - save on flash drive or email to yourself

* ### Prerequisites
*
* This is an intermediate-level Stata graphics workshop
*
* * Assumes basic knowledge of Stata
* * Not appropriate for people already well familiar with graphing in Stata
* * If you are catching on before the rest of the class, experiment with command features described in help files

* ### Goals
*
* **We will learn about Stata graphics by practicing graphing using two real datasets.** In particular, our goals are to:
*
* 1. Plot basic graphs in Stata
* 2. Plot two-way graphs in Stata

* ## Graphing in Stata
*
* **GOAL: To get familiar with how to produce graphs in Stata.** In particular:
*
* 1. Learn about graphing strategies
* 2. Compare two examples of a bad graph and a good graph

* ### Graphing strategies
*
* * Keep it simple
* * Labels, labels, labels!!
* * Avoid cluttered graphs
* * Every part of the graph should be meaningful
* * Avoid:
*     + Shading
*     + Distracting colors
*     + Decoration
* * Always know what you are working with before you get started
*     + Recognize scale of data
*     + If you are using multiple variables, how do their scales align?
* * Before any graphing procedure review variables with `codebook`, `sum`, `tab`, etc.
* * HELPFUL STATA HINT: If you want your command to go on multiple lines use `///` at end of each line
*
* ### Terrible graph
* ![](images/Terrible.png)
*
* ### Much better graph
*
* ![](images/Good.png)

* ## Univariate graphics
*
* **GOAL: To learn how to graph a single continuous and categorical variable.** In particular:
*
* 1. Graph a continuous variable using a histogram
* 2. Graph a categorical variable using a bar graph

* ### Our first dataset
*
* * Time Magazine Public School Poll
*     + Based on survey of 1,000 adults in U.S.
*     + Conducted in August 2010
*     + Questions regarding feelings about parental involvement, teachers union, current potential for reform
* * Open Stata and call up the datafile for today

// Step 1: tell Stata where to find data:

##

// Step 2: call up our dataset:

##

* ### Single continuous variable
*
* **Example: Histogram**
*
* * Stata assumes you are working with continuous data
* * Very simple syntax:
*     + `hist varname`
* * Put a comma after your varname and start adding options
*     + `bin(#)` : change the number of bars that the graph displays
*     + `normal` : overlay normal curve
*     + `addlabels` : add actual values to bars
*
* **Histogram options**
*
* * To change the numeric depiction of your data add these options after the comma
*     + Choose one: `density`, `fraction`, `frequency`, `percent`
* * Be sure to properly describe your histogram:
*     + `title("insert name of graph")`
*     + `subtitle("insert subtitle of graph")`
*     + `note("insert note to appear at bottom of graph")`
*     + `caption("insert caption to appear below notes")`
*
* **Histogram example**

hist F1, bin(10) percent title("TITLE") ///
  subtitle("SUBTITLE") caption("CAPTION") note("NOTES")
  
* ![](images/hist1.png)

* **Axis titles & labels**
*
* * Axis title options (default is variable label):
*     + `xtitle("insert x axis name")`
*     + `ytitle("insert y axis name")`
* * Don't want axis titles?
*     + `xtitle("")`
*     + `ytitle("")`
* * Add labels to X or Y axis:
*     + `xlabel("insert x axis label")`
*     + `ylabel("insert y axis label")`
* * Tell Stata how to scale each axis
*     + `xlabel("start\#(increment)end\#")`
*     + `xlabel(0(5)100)` This would label x-axis from 0-100 in increments of 5
*
* **Axis labels example**

hist F1, bin(10) percent title("TITLE") subtitle("SUBTITLE") ///
    caption("CAPTION") note("NOTES") ///
    xtitle("Here's your x-axis title") ///
    ytitle("here's your y-axis title")

* ![](images/hist2.png)
*
* ### Single categorical variable
*
* * We can also use the `hist` command for bar graphs
*     + Simply specify the option `discrete`
* * Stata will produce one bar for each level (i.e. category) of variable
* * Use `xlabel` command to insert names of individual categories

hist F4, title("Racial breakdown of Time Poll Sample") xtitle("Race") ///
   ytitle("Percent") xlabel(1 "White" 2 "Black" 3 "Asian" 4 "Hispanic" ///
   5 "Other") discrete percent addlabels

* ![](images/bargraph.png)
*
* ### Exercise 0
*
* **Histograms & bar graphs**
*
* 1.  Open the datafile, `NatNeighCrimeStudy.dta`.

*#

* 2.  Create a histogram of the tract-level poverty rate (`T_POVRTY`).

*#

* 3.  Insert the normal curve over the histogram.

*#

* 4.  Change the numeric representation on the Y-axis to `percent`.

*#

* 5.  Add appropriate titles to the overall graph and the x axis and y axis. Also, add a note that states the source of this data.

*#

* 6.  Open the datafile, `TimePollPubSchools.dta`.

*#

* 7.  Create a histogram of the question, "What grade would you give your child's school" (`Q11`). Be sure to tell Stata that this is a categorical variable.

*#

* 8.  Format this graph so that the axes have proper titles and labels. Also, add an appropriate title to the overall graph. Add a note stating the source of the data.

*#



* ## Bivariate graphics
*
* **GOAL: To learn how to produce two-way bivariate graphs.** In particular, to learn:
*
* 1. The `twoway` command
* 2. The `twoway` `title` options
* 3. The `twoway` `symbol` options
* 4. How to overlay `twoway` graphs

* ### Next dataset
*
* * National Neighborhood Crime Study (NNCS)
*     + N=9593 census tracts in 2000
*     + Explore sources of variation in crime for communities in the United States
*     + Tract-level data: crime, social disorganization, disadvantage, socioeconomic inequality
*     + City-level data: labor market, socioeconomic inequality, population change
*
* ### The `twoway` family
*
* * `twoway` is basic Stata command for all two-way graphs
* * Use `twoway` anytime you want to make comparisons among variables
* * Can be used to combine graphs (i.e., overlay one graph with another)
*     + e.g., insert line of best fit over a scatter plot
* * Some basic examples:

##

* **Twoway & the `by` statement**

##

* ![](images/twowayby.png)
*
* **Twoway title options**
*
* * Same title options as with histogram
*     + `title("insert name of graph")`
*     + `subtitle("insert subtitle of graph")`
*     + `note("insert note to appear at bottom of graph")`
*     + `caption("insert caption to appear below notes")`
*
* **Twoway title options example**

twoway scatter T_PERCAP T_VIOLNT, ///
    title("Comparison of Per Capita Income" ///
          "and Violent Crime Rate at Tract level") ///
    xtitle("Violent Crime Rate") ytitle("Per Capita Income") ///
    note("Source: National Neighborhood Crime Study 2000")

* **Twoway symbol options**
*
* * A variety of symbol shapes are available: use `palette symbolpalette` to see them and `msymbol()` to set them
*
* ![](images/Symbol.png)
*
* **Twoway symbol options example**

twoway scatter T_PERCAP T_VIOLNT, ///
    title("Comparison of Per Capita Income" ///
          "and Violent Crime Rate at Tract level") ///
    xtitle("Violent Crime Rate") ytitle("Per Capita Income") ///
    note("Source: National Neighborhood Crime Study 2000") ///
    msymbol(Sh) mcolor("red")

* ![](images/msymbol_mcolor.png)
*
* ### Overlaying twoway graphs
*
* * Very simple to combine multiple graphs by just putting each graph command in parentheses
*     + `twoway (scatter var1 var2) (lfit var1 var2)`
* * Add individual options to each graph within the parentheses
* * Add overall graph options as usual following the comma
*     + `twoway (scatter var1 var2) (lfit var1 var2), options`
*
* **Overlaying points & lines**

twoway (scatter T_PERCAP T_VIOLNT) ///
    (lfit T_PERCAP T_VIOLNT), ///
    title("Comparison of Per Capita Income" ///
          "and Violent Crime Rate at Tract level") ///
    xtitle("Violent Crime Rate") ytitle("Per Capita Income") ///
    note("Source: National  Neighborhood Crime Study 2000")

* **Overlaying points & labels**

twoway (scatter T_PERCAP T_VIOLNT if T_VIOLNT==1976, ///
    mlabel("CITY")) (scatter T_PERCAP T_VIOLNT), ///
    title("Comparison of Per Capita Income" ///
          "and Violent Crime Rate at Tract level") ///
    xlabel(0(200)2400) note("Source: National Neighborhood" ///
                            "Crime Study 2000") legend(off)


* ### Twoway line graphs
*
* * Line graphs helpful for a variety of data
*     + Especially any type of time series data
* * We will use data on US life expectancy from 1900-1999
*     + `webuse uslifeexp, clear`

##

* ![](images/linegraph1.png)

##

* ![](images/linegraph2.png)
*
* ### Stata graphing lines

##

* ![](images/linepalette.png)

* ### Exercise 1
*
* **The `twoway` family**
*
* 1. Open the datafile, `NatNeighCrimeStudy.dta`.

*#

* 2.  Create a basic twoway scatterplot that compares the city unemployment rate (`C_UNEMP`) to the percent secondary sector low-wage jobs (`C_SSLOW`)

*#

* 3.  Generate the same scatterplot, but this time, divide the plot by the dummy variable indicating whether the city is located in the south or not (`C_SOUTH`)

*#

* 4.  Change the color of the symbol that you use in this scatter plot

*#

* 5.  Change the type of symbol you use to a marker of your choice

*#

* 6.  Notice in your scatterplot that is broken down by `C_SOUTH` that there is an outlier in the upper right hand corner of the "Not South" graph. Add the city name label to this marker.

*#


* ## Exporting graphs
*
* **GOAL: To learn how to export graphs in Stata.**
*
* * From Stata, right click on image and select "save as" or try syntax:
*     + `graph export myfig.esp, replace`
* * In Microsoft Word: insert -> picture -> from file
*     + Or, right click on graph in Stata and copy and paste into MS Word


* ## Wrap-up
*
* ### Feedback
*
* These workshops are a work in progress, please provide any feedback to: help@iq.harvard.edu
*
* ### Resources
*
* * IQSS
*     + Workshops: <https://dss.iq.harvard.edu/workshop-materials>
*     + Data Science Services: <https://dss.iq.harvard.edu/>
*     + Research Computing Environment: <https://iqss.github.io/dss-rce/>
*
* * HBS
*     + Research Computing Services workshops: <https://training.rcs.hbs.org/workshops>
*     + Other HBS RCS resources: <https://training.rcs.hbs.org/workshop-materials>
*     + RCS consulting email: <mailto:research@hbs.edu>
*
* * Stata
*     + UCLA website: <http://www.ats.ucla.edu/stat/Stata/>
*     + Stata website: <http://www.stata.com/help.cgi?contents>
*     + Email list: <http://www.stata.com/statalist/>
