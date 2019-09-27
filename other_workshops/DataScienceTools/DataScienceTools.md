<a href="https://github.com/IQSS/workshops"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>


# Tools for working with data

Working with data effectively requires learning at least one programming or scripting language. You can get by without this, but it would be like trying to cook with only a butter knife; not recommended! Compared to using a menu-driven interface (e.g., SPSS or SAS) or a spreadsheet (e.g., Excel), using a programming language allows you to:

-   reproduce results,
-   correct errors and update output,
-   reuse code,
-   collaborate with others,
-   automate repetitive tasks, and
-   generate manuscripts, reports, and other documents from your code.

So, you need to learn a programming language for working with data, but which one should you learn? Since you'll be writing code you'll want to set up a comfortable environment for writing and editing that code. Which text editors are good for this? You'll probably also want to learn at least one markup language (e.g., LaTeX, Markdown) so that you can create reproducible manuscripts. What tools are good for this? These questions will guide our discussion, the goal of which is to help you decide which tools you should invest time in learning.


# The puzzle pieces

As we've noted, working effectively with data requires using a number of tools.


## Data analysis building blocks

The basic pieces are:

-   a data storage and retrieval system,
-   an editor for writing code,
-   an interpreter or compiler for executing that code,
-   a system for presenting results, and
-   some "glue" to make all the pieces work together.


# Examples

Before looking in detail at each of these building blocks we'll look at a few examples to get an intuitive feel for the basic elements.


## Old-school example

In this example we're going to process data in a text file in a way that would be familiar to a statistician working forty years ago. Surprisingly, it's not much different from the way we would do it today. Programs come and go, but the basic ideas remain pretty much the same!

---

Specifically, we'll process the data in `1980_census.txt` by writing **fortran** code in the **vi** text editor and running it through the **fortran** compiler. Then we'll take the results and put them in to a **TeX** file, again using the **vi** editor to create the report. For "glue" we will use a terminal emulator running the bash shell. All of these tools were available in 1980, though some features have been added since that time.

---

OLD SCHOOL DEMO:

| example    | data storage    | editor | program | report tool | glue                      |
|---------- |--------------- |------ |------- |----------- |------------------------- |
| old school | ASCII text file | vi     | fortran | TeX         | Bourne (compatable) shell |
|            |                 |        |         |             |                           |


## Something old and something new

Next we're going to do the same basic process, this time using a modern text editor (**Atom**), a different programming language (**Python**), and a modern report generation system (**LaTeX** processed via **xelatex**). For the glue we're still going to use a shell.

---

OLD AND NEW DEMO:

| example     | data storage    | editor | program | report tool | glue                      |
|----------- |--------------- |------ |------- |----------- |------------------------- |
| old school  | ASCII text file | vi     | fortran | TeX         | Bourne (compatable) shell |
| old and new | ASCII text file | Atom   | python  | LaTeX       | Bash shell                |


## A modern version

Finally, we'll produce the same report using modern tools. Remember, the process is basically the same: we're just using different tools.

---

MODERN DEMO:

| example     | data storage    | editor  | program | report tool | glue                      |
|----------- |--------------- |------- |------- |----------- |------------------------- |
| old school  | ASCII text file | vi      | fortran | TeX         | Bourne (compatable) shell |
| old and new | ASCII text file | Atom    | python  | LaTeX       | Bash shell                |
| modern      | SQLite database | Rstudio | R       | R Markdown  | Rstudio                   |


# Data storage and retrieval

Data storage and retrieval is a fairly dry topic, so we won't spend too much time on it. There are roughly four types of technology for storing and retrieving data.


## Text files

Storing data in text files (e.g., comma separated values, other delimited text formats) is simple and makes the data easy to access from just about any program. It is also good for archiving data since no specialized software is needed to read it. The main downsides are that retrieval is slow and often all-or-nothing, and the fact that storing metadata in plain text files is cumbersome.


## Binary files

Many statistics packages and programming languages have a "native" binary data storage format. For example, Stata stores data in `.dta` files, and R stores data in `.rds` or `.Rdata` files. These storage formats usually more efficient than text files, and usually provide faster read/write access. They usually include a mechanism for storing metadata. The down side is that specialized software is required to read them (will Stata exist in 50 years? Are you sure?) and the ability to read them using other programs may be limited.


## Databases

Storing data in a database requires more up-front planning and set up, but has several advantages. Databases provide fast selective retrieval and facilitate efficient storage and flexible retrieval.


## Distributed file storage

Data that is too large to fit on a single hard drive may be stored and analyzed on a distributed file system or database such as the *Hadoop Distributed File System* or *Cassandra*. When working with data on this scale considerable infrastructure and specialized tools will be required.


# Programming languages and statistics packages

There are tens of programs for statistics and data science available. Here we will focus only on the more popular programs that offer a wide range of features. Note that for specific applications a specialized program may be better, e.g., many people use Mplus for structural equation models and another program for everything else.


## Programming language features

Things we want a statistics program to do include:

-   read/write data from/to a variety of data storage systems,
-   manipulate data,
-   perform statistical methods,
-   visualize data and results,
-   export results in a variety of formats,
-   be easy to use,
-   be well documented,
-   have a large user community.

---

Note that this list is deceptively simple; each item may include a diversity of complicated features. For example,"read/write data from/to a variety of data storage systems" may include reading from databases, image files, .pdf files, .html and .xml files from a website, and any number of proprietary data storage formats.


## Program comparison

| Program | Statistics | Visualization | Machine learning | Ease of use | Power/flexibility | Fun  |
|------- |---------- |------------- |---------------- |----------- |----------------- |---- |
| Stata   | Good       | Servicable    | Limited          | Very easy   | Low               | Some |
| SPSS    | OK         | Servicable    | Limited          | Easy        | Low               | None |
| SAS     | Good       | Not great     | Good             | Moderate    | Moderate          | None |
| Matlab  | Good       | Good          | Good             | Moderate    | Good              | Some |
| R       | Excellent  | Excellent     | Good             | Moderate    | Excellent         | Yes  |
| Python  | Good       | Good          | Excellent        | Moderate    | Excellent         | Yes  |
| Julia   | OK         | Excellent     | Good             | Hard        | Excellent         | Yes  |
|         |            |               |                  |             |                   |      |


## Examples: Read data from a file and summarize

In this example we will compare the syntax for reading and summarizing data stored in a file.

---

-   Stata

```stata
import delimited using "http://tutorials.iq.harvard.edu/R/Rgraphics/dataSets/EconomistData.csv"
sum
```

    set more off
     EconomistData.csv"
    Picked up _JAVA_OPTIONS: -Dawt.useSystemAAFontSettings=gasp -Dswing.aatext=true -Dsun.java2d.opengl=true
    (6 vars, 173 obs)
    sum
    
        Variable |        Obs        Mean    Std. Dev.       Min        Max
    -------------+---------------------------------------------------------
              v1 |        173          87    50.08493          1        173
         country |          0
         hdirank |        173    95.28324    55.00767          1        187
             hdi |        173    .6580867    .1755888       .286       .943
             cpi |        173    4.052023    2.116782        1.5        9.5
    -------------+---------------------------------------------------------
          region |          0

---

-   R

```R
cpi <- read.csv("http://tutorials.iq.harvard.edu/R/Rgraphics/dataSets/EconomistData.csv")
summary(cpi)
```

          X              Country       HDI.Rank           HDI        
    Min.   :  1   Afghanistan:  1   Min.   :  1.00   Min.   :0.2860  
    1st Qu.: 44   Albania    :  1   1st Qu.: 47.00   1st Qu.:0.5090  
    Median : 87   Algeria    :  1   Median : 96.00   Median :0.6980  
    Mean   : 87   Angola     :  1   Mean   : 95.28   Mean   :0.6581  
    3rd Qu.:130   Argentina  :  1   3rd Qu.:143.00   3rd Qu.:0.7930  
    Max.   :173   Armenia    :  1   Max.   :187.00   Max.   :0.9430  
                  (Other)    :167                                    
         CPI                      Region  
    Min.   :1.500   Americas         :31  
    1st Qu.:2.500   Asia Pacific     :30  
    Median :3.200   East EU Cemt Asia:18  
    Mean   :4.052   EU W. Europe     :30  
    3rd Qu.:5.100   MENA             :18  
    Max.   :9.500   SSA              :46

---

-   Matlab

```matlab
tmpfile = websave(tempname(), 'http://tutorials.iq.harvard.edu/R/Rgraphics/dataSets/EconomistData.csv');
cpi = readtable(tmpfile);
summary(cpi)
```

    tmpfile = websave(tempname(), 'http://tutorials.iq.harvard.edu/R/Rgraphics/dataSets/EconomistData.csv');
    cpi = readtable(tmpfile);
    [Warning: Variable names were modified to make them valid MATLAB identifiers.
    The original names are saved in the VariableDescriptions property.]
    summary(cpi)
    
    Variables:
    
        Var1: 173×1 cell array of character vectors
    
        Country: 173×1 cell array of character vectors
    
        HDI_Rank: 173×1 double
    
            Description:  Original column heading: 'HDI.Rank'
            Values:
    
                Min         1       
                Median     96       
                Max       187       
    
        HDI: 173×1 double
    
            Values:
    
                Min       0.286
                Median    0.698
                Max       0.943
    
        CPI: 173×1 double
    
            Values:
    
                Min       1.5  
                Median    3.2  
                Max       9.5  
    
        Region: 173×1 cell array of character vectors
    'org_babel_eoe'
    
    ans =
    
        'org_babel_eoe'

---

-   Python

```python
import pandas as pd
cpi = pd.read_csv('http://tutorials.iq.harvard.edu/R/Rgraphics/dataSets/EconomistData.csv')
cpi.describe(include = 'all')
```

    Python 3.6.2 (default, Jul 20 2017, 03:52:27) 
    [GCC 7.1.1 20170630] on linux
    Type "help", "copyright", "credits" or "license" for more information.
            Unnamed: 0 Country    HDI.Rank         HDI         CPI Region
    count   173.000000     173  173.000000  173.000000  173.000000    173
    unique         NaN     173         NaN         NaN         NaN      6
    top            NaN    Oman         NaN         NaN         NaN    SSA
    freq           NaN       1         NaN         NaN         NaN     46
    mean     87.000000     NaN   95.283237    0.658087    4.052023    NaN
    std      50.084928     NaN   55.007670    0.175589    2.116782    NaN
    min       1.000000     NaN    1.000000    0.286000    1.500000    NaN
    25%      44.000000     NaN   47.000000    0.509000    2.500000    NaN
    50%      87.000000     NaN   96.000000    0.698000    3.200000    NaN
    75%     130.000000     NaN  143.000000    0.793000    5.100000    NaN
    max     173.000000     NaN  187.000000    0.943000    9.500000    NaN


## Examples: Fit a linear regression

Fitting statistical models is pretty straight-forward in all popular programs.

---

-   Stata

```stata
regress hdi cpi
```

    regress hdi cpi
    
          Source |       SS           df       MS      Number of obs   =       173
    -------------+----------------------------------   F(1, 171)       =    168.85
           Model |  2.63475703         1  2.63475703   Prob > F        =    0.0000
        Residual |   2.6682467       171  .015603782   R-squared       =    0.4968
    -------------+----------------------------------   Adj R-squared   =    0.4939
           Total |  5.30300372       172  .030831417   Root MSE        =    .12492
    
    ------------------------------------------------------------------------------
             hdi |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
    -------------+----------------------------------------------------------------
             cpi |   .0584696   .0044996    12.99   0.000     .0495876    .0673515
           _cons |   .4211666   .0205577    20.49   0.000     .3805871    .4617462
    ------------------------------------------------------------------------------

---

-   R

```R
summary(lm(HDI ~ CPI, data = cpi))
```

    
    Call:
    lm(formula = HDI ~ CPI, data = cpi)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -0.28452 -0.08380  0.01372  0.09157  0.24104 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  0.42117    0.02056   20.49   <2e-16 ***
    CPI          0.05847    0.00450   12.99   <2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 0.1249 on 171 degrees of freedom
    Multiple R-squared:  0.4968,	Adjusted R-squared:  0.4939 
    F-statistic: 168.9 on 1 and 171 DF,  p-value: < 2.2e-16

---

-   Matlab

```matlab
fitlm(cpi, 'HDI~CPI')
```

    fitlm(cpi, 'HDI~CPI')
    
    ans = 
    
    
    Linear regression model:
        HDI ~ 1 + CPI
    
    Estimated Coefficients:
                       Estimate       SE        tStat       pValue  
                       ________    _________    ______    __________
    
        (Intercept)    0.42117      0.020558    20.487    6.7008e-48
        CPI            0.05847     0.0044996    12.994    2.6908e-27
    
    
    Number of observations: 173, Error degrees of freedom: 171
    Root Mean Squared Error: 0.125
    R-squared: 0.497,  Adjusted R-Squared 0.494
    F-statistic vs. constant model: 169, p-value = 2.69e-27
    'org_babel_eoe'
    
    ans =
    
        'org_babel_eoe'

---

-   Python

```python
import statsmodels.formula.api as model
X = cpi[['CPI']]
Y = cpi[['HDI']]
model.OLS(Y, X).fit().summary()
```

    
    <class 'statsmodels.iolib.summary.Summary'>
    """
                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:                    HDI   R-squared:                       0.885
    Model:                            OLS   Adj. R-squared:                  0.884
    Method:                 Least Squares   F-statistic:                     1325.
    Date:                Thu, 31 Aug 2017   Prob (F-statistic):           9.89e-83
    Time:                        23:16:45   Log-Likelihood:                 8.1584
    No. Observations:                 173   AIC:                            -14.32
    Df Residuals:                     172   BIC:                            -11.16
    Df Model:                           1                                         
    Covariance Type:            nonrobust                                         
    ==============================================================================
                     coef    std err          t      P>|t|      [0.025      0.975]
    ------------------------------------------------------------------------------
    CPI            0.1402      0.004     36.401      0.000       0.133       0.148
    ==============================================================================
    Omnibus:                       10.423   Durbin-Watson:                   1.616
    Prob(Omnibus):                  0.005   Jarque-Bera (JB):               11.099
    Skew:                          -0.599   Prob(JB):                      0.00389
    Kurtosis:                       2.674   Cond. No.                         1.00
    ==============================================================================
    
    Warnings:
    [1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
    """


## Examples: Extract links for .html file

Retrieving data from a website is a common task. Here we parse a simple web page containing links to files we wish to download.

---

-   Stata

```stata
disp "Ha ha ha! No, you do not want to use Stata for this!"
```

    disp "Ha ha ha! No, you do not want to use Stata for this!"
    Ha ha ha! No, you do not want to use Stata for this!

---

-   R

```R
library(xml2)
index_page <- read_html("http://tutorials.iq.harvard.edu/example_data/baby_names/EW/")
all_anchors <- xml_find_all(index_page, "//a")
all_hrefs <- xml_attr(all_anchors, "href")
data_hrefs <- grep("\\.csv$", all_hrefs, value = TRUE)
data_links <- paste0("http://tutorials.iq.harvard.edu/example_data/baby_names/EW/", data_hrefs)
data_links
```

     [1] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1996.csv" 
     [2] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1997.csv" 
     [3] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1998.csv" 
     [4] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1999.csv" 
     [5] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2000.csv" 
     [6] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2001.csv" 
     [7] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2002.csv" 
     [8] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2003.csv" 
     [9] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2004.csv" 
    [10] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2005.csv" 
    [11] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2006.csv" 
    [12] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2007.csv" 
    [13] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2008.csv" 
    [14] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2009.csv" 
    [15] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2010.csv" 
    [16] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2011.csv" 
    [17] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2012.csv" 
    [18] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2013.csv" 
    [19] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2014.csv" 
    [20] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2015.csv" 
    [21] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1996.csv"
    [22] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1997.csv"
    [23] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1998.csv"
    [24] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1999.csv"
    [25] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2000.csv"
    [26] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2001.csv"
    [27] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2002.csv"
    [28] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2003.csv"
    [29] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2004.csv"
    [30] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2005.csv"
    [31] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2006.csv"
    [32] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2007.csv"
    [33] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2008.csv"
    [34] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2009.csv"
    [35] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2010.csv"
    [36] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2011.csv"
    [37] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2012.csv"
    [38] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2013.csv"
    [39] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2014.csv"
    [40] "http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2015.csv"

---

-   Matlab

```matlab
index_page = urlread('http://tutorials.iq.harvard.edu/example_data/baby_names/EW/');
all_hrefs = regexp(index_page, '<a href="([^"]*\.csv)">', 'tokens')';
all_hrefs = [all_hrefs{:}]';
all_links = strcat('http://tutorials.iq.harvard.edu/example_data/baby_names/EW/', all_hrefs)
```

    index_page = urlread('http://tutorials.iq.harvard.edu/example_data/baby_names/EW/');
    all_hrefs = regexp(index_page, '<a href="([^"]*\.csv)">', 'tokens')';
    all_hrefs = [all_hrefs{:}]';
    all_links = strcat('http://tutorials.iq.harvard.edu/example_data/baby_names/EW/', all_hrefs)
    
    all_links =
    
      40×1 cell array
    
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1996.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1997.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1998.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1999.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2000.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2001.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2002.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2003.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2004.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2005.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2006.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2007.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2008.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2009.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2010.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2011.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2012.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2013.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2014.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2015.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1996.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1997.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1998.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1999.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2000.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2001.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2002.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2003.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2004.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2005.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2006.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2007.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2008.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2009.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2010.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2011.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2012.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2013.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2014.csv'
        'http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2015.csv'
    'org_babel_eoe'
    
    ans =
    
        'org_babel_eoe'

---

-   Python

```python
from lxml import etree
import requests

index_text = requests.get('http://tutorials.iq.harvard.edu/example_data/baby_names/EW/').text
index_page = etree.HTML(index_text)
all_hrefs = [a.values() for a in index_page.findall(".//a")]
data_links = ['http://tutorials.iq.harvard.edu/example_data/baby_names/EW/' +
              href[0] for href in all_hrefs if 'csv' in href[0]]
for link in data_links:
    print(link)
```

    
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1996.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1997.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1998.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_1999.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2000.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2001.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2002.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2003.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2004.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2005.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2006.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2007.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2008.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2009.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2010.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2011.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2012.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2013.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2014.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/boys_2015.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1996.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1997.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1998.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_1999.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2000.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2001.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2002.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2003.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2004.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2005.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2006.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2007.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2008.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2009.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2010.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2011.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2012.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2013.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2014.csv
    http://tutorials.iq.harvard.edu/example_data/baby_names/EW/girls_2015.csv


# Creating reports

Once you've analyzed your data you'll most likely want to communicate your results. For short informal projects this might take the form of a blog post or an email to your colleagues. For larger more formal projects you'll likely want to prepare a substantial report or manuscript for disseminating your findings via a journal publication or other means. Other common means of reporting research findings include posters or slides for a conference talk.

Regardless of the type of report, you may choose to use either a *markup language* or a WYSIWYG application like Microsoft Word/Powerpoint of a desktop publishing application such as Adobe InDesign.


## Markup languages

A markup language is a system for producing a formatted document from a text file using information by the markup. A major advantage of markup languages is that the formatting instructions can be easily generated by the program you use for analyzing your data.

---

Markup languages include *HTML*, *LaTeX*, *Markdown* and many others. *LaTeX* and *Markdown* are currently popular among data scientists, although others are used as well.

---

*Markdown* is easy to write and designed to be human-readable. It is newer and somewhat less feature-full compared to LaTeX. It's main advantage is simplicity. *LaTeX* is more verbose but provides for just about any feature you'll ever need.

---

MARKDOWN DEMO LATEX DEMO


## Word processors

Modern word processors are largely just graphical user interfaces that write a markup language (usually XML) for you. They are commonly used for creating reports, but care must be taken when doing so.

---

If you use a word processor to produce your reports you should

-   use the structured outline feature,
-   link rather than embed external resources (figures, tables, etc.),
-   use cross-referencing features, and
-   use a bibliography management system.

---

WORD PROCESSOR DEMO


# Text editors and Integrated Development Environments

A text editor edits text obviously. But that is not all! At a minimum, a text editor will also have a mechanism for reading and writing text files. Most text editors do much more than this.

An IDE provides tools for working with code, such as syntax highlighting, code completion, jump-to-definition, execute/compile, package management, refactoring, etc. Of course an IDE includes a text editor.

Editors and IDE's are not really separate categories &#x2013; as you add features to a text editor it becomes more like an IDE, and a simple IDE may provide little more than a text editor. For example, Emacs is commonly referred to as a text editor, but it provides nearly every feature you would expect an IDE to have.

A more useful distinction is between language-specific editors/IDEs and general purpose editors/IDEs. The former are typically easier to set up since they come pre-configured for use with a specific language. General purpose editors/IDEs typically provide language support via *plugins* and may require extensive configuration for each language.


## Language specific editors and IDEs

| Editor               | Features  | Ease of use | Language |
|-------------------- |--------- |----------- |-------- |
| RStudio              | Excellent | Easy        | R        |
| Spyder               | Excellent | Easy        | Python   |
| Stata do file editor | OK        | Easy        | Stata    |
| SPSS syntax editor   | OK        | Easy        | SPSS     |
| &#x2026;             |           |             |          |

LANGUAGE SPECIFIC IDE DEMO


## General purpose editors and IDEs

| Editor       | Features  | Ease of use | Language support |
|------------ |--------- |----------- |---------------- |
| Vim          | Excellent | Hard        | Good             |
| Emacs        | Excellent | Hard        | Excellent        |
| Atom         | Good      | Moderate    | Good             |
| Eclipse      | Excellent | Easy        | Good             |
| Sublime Text | Good      | Easy        | Good             |
| Notepad++    | OK        | Easy        | OK               |
| Textmate     | Good      | Moderate    | Good             |
| Kate         | OK        | Easy        | Good             |

GENERAL PURPOSE EDITOR DEMO


# Literate programming and notebooks

In one of the Early demos we say an example of embedding R code in a markdown document. A closely related approach is to create a *notebook* that includes the prose of the report, the code used for the analysis, and the results produced by that code.


## Literate programming

Literate programming is the practice of embedding computer code in a natural language document. For example, using *RMarkdown* we can embed R code in a report authored using Markdown. Python and Stata have their own versions of literate programming using Markdown.


## Notebooks

Notebooks go one step farther, and include the output produced by the original program directly in the notebook. Examples include *Jupyter*, *Appache Zeppelin*, and *Emacs Org Mode*.

NOTEBOOKS DEMO


# Big data, annoying data, and computationally intensive methods

Thus far we've discussed popular programming languages, data storage and retrieval options, text editors, and reporting technology. These are the basic building blocks I recommend using just about any time you find yourself working with data. There are times however when more is needed. For example, you may wish to use distributed computing for large or resource intensive computations.


## Computing clusters at Harvard

Harvard provides a number of computing clusters, including Odyssey and the Research Computing Environment. Using these systems will be much easier if you know the basic tools well. After all, you're still going to need data storage/retrieval, you'll still need a text editor write code, and a programming language to write it in. My advice is to master these basics, and learn the rest as you need it.


# Wrap up

-   What do I use?
-   What do I recommend that students use?

-   Questions?
