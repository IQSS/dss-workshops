
 ### Exercise 0

* **Histograms & bar graphs**
*
// 1.  Open the datafile, `NatNeighCrimeStudy.dta`.
use NatNeighCrimeStudy.dta, clear

// 2.  Create a histogram of the tract-level poverty rate (`T_POVRTY`).
hist T_POVRTY

// 3.  Insert the normal curve over the histogram.
hist T_POVRTY, normal

// 4.  Change the numeric representation on the Y-axis to `percent`.
hist T_POVRTY, normal percent

// 5.  Add appropriate titles to the overall graph and the x axis and y axis. Also, add a note that states the source of this data.
hist T_POVRTY, normal percent title("Poverty Rate Distribution Among Study Participants") xtitle("Poverty Rate") ytitle("Percent") note("Notes: Results are based on raw data")

// 6.  Open the datafile, `TimePollPubSchools.dta`.
use TimePollPubSchools.dta, clear

// 7.  Create a histogram of the question, "What grade would you give your child's school" (`Q11`). Be sure to tell Stata that this is a categorical variable.
hist Q11, discrete

// 8.  Format this graph so that the axes have proper titles and labels. Also, add an appropriate title to the overall graph. Add a note stating the source of the data.
hist Q11, title("School grading breakdown of Time Poll Sample") xtitle("Grades") ytitle("Percent") xlabel(1 "A" 2 "B" 3 "C" 4 "D" 5 "F") note("Notes: Data is based on a survey of 1000 adults in U.S. conducted in 2010")



 ### Exercise 1

* **The `twoway` family**
*
// 1. Open the datafile, `NatNeighCrimeStudy.dta`.
use NatNeighCrimeStudy.dta, clear

// 2.  Create a basic twoway scatterplot that compares the city unemployment rate (`C_UNEMP`) to the percent secondary sector low-wage jobs (`C_SSLOW`)
twoway scatter C_UNEMP C_SSLOW

// 3. Generate the same scatterplot, but this time, divide the plot by the dummy variable indicating whether the city is located in the south or not (`C_SOUTH`)
twoway scatter C_UNEMP C_SSLOW, by(C_SOUTH)

// 4.  Change the color of the symbol that you use in this scatter plot
twoway scatter C_UNEMP C_SSLOW, by(C_SOUTH) mcolor("orange")

// 5.  Change the type of symbol you use to a marker of your choice
twoway scatter C_UNEMP C_SSLOW, by(C_SOUTH) mcolor("orange") msymbol(diamond)

// 6.  Notice in your scatterplot that is broken down by `C_SOUTH` that there is an outlier in the upper right hand corner of the "Not South" graph. Add the city name label to this marker.
twoway scatter C_UNEMP C_SSLOW, by(C_SOUTH) if C_UNEMP>25 mcolor("orange") msymbol(diamond) mlabel(CITY)
twoway (scatter C_UNEMP C_SSLOW if T_UNEMP>15 & C_SSLOW>25, mlabel(CITY) by(C_SOUTH)) (scatter C_UNEMP C_SSLOW, by(C_SOUTH))
