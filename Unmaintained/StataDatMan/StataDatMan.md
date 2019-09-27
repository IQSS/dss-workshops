Introduction
============

Materials and Setup
-------------------

-   Lab computer log in:
    -   USERNAME: dataclass
    -   PASSWORD: on the board to your left
-   Workshop materials:
    -   Download class materials from <http://tutorials.iq.harvard.edu/Stata/StataDatMan.zip>
    -   Open a file browser, right-click on `StataDatMan.zip`, select the `WinZip` menu and select `Extract to Here`.

Copy the workshop materials to your home directory<span class="tag" data-tag-name="mitsetup"></span>
----------------------------------------------------------------------------------------------------

-   **Log in to an Athena workstation** using your Athena user name and password
-   **Click on the "Ubuntu" button** on the upper-left and type "term" as shown below

<!-- -->

-   **Click on the "Terminal" icon** as shown above
-   In the terminal, **type this line exactly as shown**:

<!-- -->

-   If you see "ERROR 404: Not Found", then you mistyped the command -- try again, making sure to type the command exactly as shown. If it still doesn't work, open <http://j.mp/stata-datman> in a web browser.

Launch Stata on Athena<span class="tag" data-tag-name="mitsetup"></span>
------------------------------------------------------------------------

-   To start Stata **type these commands in the terminal**:

``` example
    add stata
    xstata
```

-   Open up today's Stata script
    -   In Stata, go to **Window =&gt; New do file =&gt; Open**
    -   Locate and open the `StatDatMan.do` script in the StataDatMan folder in your home directory
-   I encourage you to add your own notes to this file!

Workshop Description
--------------------

-   This is an Introduction to data management in Stata
-   Assumes basic knowledge of Stata
-   Not appropriate for people already well familiar with Stata
-   If you are catching on before the rest of the class, experiment with command features described in help files

Organization
------------

-   Please feel free to ask questions at any point if they are relevant to the current topic (or if you are lost!)
-   There will be a Q&A after class for more specific, personalized questions
-   Collaboration with your neighbors is encouraged
-   If you are using a laptop, you will need to adjust paths accordingly

Opening Files in Stata
----------------------

-   Look at bottom left hand corner of Stata screen
    -   This is the directory Stata is currently reading from
-   Files are located in the StataDatMan folder in your home directory
-   Start by telling Stata where to look for these

``` stata
  // change directory
  cd "~/tutorials/Stata/StataDatMan"

  // Use dir to see what is in the directory:
  dir
  dir dataSets

  // use the gss data set
  use dataSets/gss.dta
```

``` example
set more off

cd "~/tutorials/Stata/StataDatMan"
/nfs/www/edu-harvard-iq-tutorials/Stata/StataDatMan


dir

total 100
drwxrwsr-x. 2 apache tutorwww  4096 Oct  9 08:44 dataSets/
-rwxrwxr-x. 1 izahn  tutorwww  1302 Oct  9 08:44 Exercises.do*
drwxrwsr-x. 2 apache tutorwww  4096 Oct  9 08:44 images/
drwxrwsr-x. 4 apache tutorwww  4096 Oct  9 08:44 StataDatMan/
-rwxrwxr-x. 1 izahn  tutorwww 17446 Oct  9 08:44 StataDatMan.do*
-rwxrwxr-x. 1 izahn  tutorwww 38153 Oct  9 08:44 StataDatMan.html*
-rwxrwxr-x. 1 izahn  tutorwww 20463 Oct  9 08:44 StataDatMan.org*
dir dataSets

total 2644
-rwxrwxr-x. 1 izahn tutorwww 275705 Oct  9 08:44 gss1.dta*
-rwxrwxr-x. 1 izahn tutorwww 263324 Oct  9 08:44 gss2.dta*
-rwxrwxr-x. 1 izahn tutorwww 532880 Oct  9 08:44 gssAddObserve.dta*
-rwxrwxr-x. 1 izahn tutorwww 527005 Oct  9 08:44 gssAppend.dta*
-rwxrwxr-x. 1 izahn tutorwww 527005 Oct  9 08:44 gsscompare1.dta*
-rwxrwxr-x. 1 izahn tutorwww 538755 Oct  9 08:44 gss.dta*
-rwxrwxr-x. 1 izahn tutorwww   1139 Oct  9 08:44 marital.dta*


use dataSets/gss.dta
```

Generating and replacing variables
==================================

Basic Data Manipulation Commands
--------------------------------

Basic commands you'll use for generating new variables or recoding existing variables:

-   gen
-   egen
-   replace
-   recode

Many different means of accomplishing the same thing in Stata -- find what is comfortable (and easy) for you!

Generate and Replace
--------------------

The `replace` command is often used with logic statements. Available logical operators include the following:

| Operator | Meaning                  |
|----------|--------------------------|
| ==       | equal to                 |
| !=       | not equal to             |
| &gt;     | greater than             |
| &gt;=    | greater than or equal to |
| &lt;     | less than                |
| &lt;=    | less than or equal to    |
| &        | and                      |
|          | or                       |

For example:

``` stata
  //create "hapnew" variable
  gen hapnew = .
  //set to 0 if happy equals 1
  replace hapnew=0 if happy==1 
  //set to 1 if happy both and hapmar are greater than 3
  replace hapnew=1 if happy>3 & hapmar>3 
  // tabulate the new 
  tab hapnew
```

``` example

gen hapnew = .
(1,419 missing values generated)

replace hapnew=0 if happy==1 
(435 real changes made)

replace hapnew=1 if happy>3 & hapmar>3 
(4 real changes made)

tab hapnew

     hapnew |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        435       99.09       99.09
          1 |          4        0.91      100.00
------------+-----------------------------------
      Total |        439      100.00
```

Recode
------

The `recode` command is basically generate and replace combined. You can recode an existing variable OR use recode to create a new variable (via the `gen` option).

``` stata
  // recode the wrkstat variable 
  recode wrkstat (1=8) (2=7) (3=6) (4=5) (5=4) (6=3) (7=2) (8=1)
  // recode wrkstat into a new variable named wrkstat2
  recode wrkstat (1=8), gen(wrkstat2)
  // tabulate workstat
  tab wrkstat
```

``` example

recode wrkstat (1=8) (2=7) (3=6) (4=5) (5=4) (6=3) (7=2) (8=1)
(wrkstat: 1419 changes made)

recode wrkstat (1=8), gen(wrkstat2)
(32 differences between wrkstat and wrkstat2)

tab wrkstat

      LABOR FRCE |
          STATUS |      Freq.     Percent        Cum.
-----------------+-----------------------------------
WORKING FULLTIME |         32        2.26        2.26
WORKING PARTTIME |        155       10.92       13.18
TEMP NOT WORKING |         34        2.40       15.57
UNEMPL, LAID OFF |        214       15.08       30.66
         RETIRED |         29        2.04       32.70
          SCHOOL |         35        2.47       35.17
   KEEPING HOUSE |        146       10.29       45.45
           OTHER |        774       54.55      100.00
-----------------+-----------------------------------
           Total |      1,419      100.00
```

The table below illustrates common forms of recoding

| Rule          | Example                                | Meaning                 |                          |
|---------------|----------------------------------------|-------------------------|--------------------------|
| \#=\#         | 3=1                                    | 3 recoded to 1          |                          |
| \#\#=\#       | 2. `9     | 2 and . recoded to 9     | 
                 | #/# ` \#                              | 1/5=4                   | 1 through 5 recoded to 4 |
| nonmissing=\# | nonmiss=8                              | nonmissing recoded to 8 |                          |
| missing=\#    | miss=9                                 | missing recoded to 9    |                          |

egen
----

The `egen` command ("extensions" to the `gen` command) provides convenient methods for performing many common data manipulation tasks.

For example, we can use `egen` to create a new variable that counts the number of "yes" responses on computer, email and internet use:

``` stata
  // count number of yes on use comp email and net 
  egen compuser= anycount(usecomp usemail usenet), values(1)
  tab compuser
```

``` example

egen compuser= anycount(usecomp usemail usenet), values(1)
tab compuser

    usecomp |
    usemail |
usenet == 1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        623       43.90       43.90
          1 |        142       10.01       53.91
          2 |         78        5.50       59.41
          3 |        576       40.59      100.00
------------+-----------------------------------
      Total |      1,419      100.00
```

Here are some additional examples of `egen` in action:

``` stata
  // assess how much missing data each participant has:
  egen countmiss = rowmiss(age-wifeft)
  codebook countmiss
  // compare values on multiple variables
  egen ftdiff=diff(wkftwife wkfthusb)
  codebook ftdiff
```

``` example

egen countmiss = rowmiss(age-wifeft)
codebook countmiss

-------------------------------------------------------------------------------
countmiss                                                           (unlabeled)
-------------------------------------------------------------------------------

                  type:  numeric (float)

                 range:  [0,7]                        units:  1
         unique values:  6                        missing .:  0/1,419

            tabulation:  Freq.  Value
                           296  0
                           215  1
                           113  2
                             7  3
                           782  6
                             6  7

egen ftdiff=diff(wkftwife wkfthusb)
codebook ftdiff

-------------------------------------------------------------------------------
ftdiff                                                   diff wkftwife wkfthusb
-------------------------------------------------------------------------------

                  type:  numeric (float)

                 range:  [0,1]                        units:  1
         unique values:  2                        missing .:  0/1,419

            tabulation:  Freq.  Value
                         1,169  0
                           250  1
```

You will need to refer to the documentation to discover what else `egen` can do: type "help egen" in Stata to get a complete list of functions.

Exercise 1: Generate, Replace, Recode & Egen
--------------------------------------------

Open the gss.dta data.

1.  Generate a new variable that represents the squared value of age.
2.  Generate a new variable equal to "1" if income is greater than "19".
3.  Create a new variable that counts the number of missing responses for each respondent. What is the maximum number of missing variables?

Exercise 1 prototype<span class="tag" data-tag-name="prototype"></span>
-----------------------------------------------------------------------

Open the gss.dta data.

1.  \[@1\] Generate a new variable that represents the squared value of age.

``` stata
     use dataSets/gss.dta, clear
     gen age2 = age^2
```

1.  \[@2\] Generate a new variable equal to "1" if income is greater than "19".

``` stata
     describe income
     label list income
     recode income (99=.) (98=.)
     gen highincome =0 if income != .
     replace highincome=1 if income>19
     sum highincome
```

1.  \[@3\]Create a new variable that counts the number of missing responses for each respondent. What is the maximum number of missing variables?

``` stata
  egen nmissing = rowmiss(_all)
  sum nmissing
```

By processing
=============

The "bysort" Command
--------------------

Sometimes, you'd like to create variables based on different categories of a single variable. For example, say you want to look at happiness based on whether an individual is male or female. The "bysort" prefix does just this:

``` stata
  // tabulate happy separately for male and female 
  bysort sex: tab happy
  // generate summary statistics using bysort 
  bysort state: egen stateincome = mean(income)
  bysort degree: egen degreeincome = mean(income)
  bysort marital: egen marincomesd = sd(income)
```

``` example

bysort sex: tab happy

-------------------------------------------------------------------------------
-> sex = Male

      GENERAL |
    HAPPINESS |      Freq.     Percent        Cum.
--------------+-----------------------------------
   VERY HAPPY |        189       30.39       30.39
 PRETTY HAPPY |        350       56.27       86.66
NOT TOO HAPPY |         73       11.74       98.39
           NA |         10        1.61      100.00
--------------+-----------------------------------
        Total |        622      100.00

-------------------------------------------------------------------------------
-> sex = Female

      GENERAL |
    HAPPINESS |      Freq.     Percent        Cum.
--------------+-----------------------------------
   VERY HAPPY |        246       30.87       30.87
 PRETTY HAPPY |        447       56.09       86.95
NOT TOO HAPPY |         84       10.54       97.49
           DK |          1        0.13       97.62
           NA |         19        2.38      100.00
--------------+-----------------------------------
        Total |        797      100.00

bysort state: egen stateincome = mean(income)
variable state not found
r(111);
bysort degree: egen degreeincome = mean(income)
bysort marital: egen marincomesd = sd(income)
```

By prefix vs. by options
------------------------

Some commands won't work with by prefix, but instead have a `by` option:

``` stata
  // generate separate histograms for female and male 
  hist nethrs, by(sex)
```

Missing values
==============

Missing Values
--------------

You always need to consider how missing values are coded when recoding variables.

-   Stata's symbol for a missing value is "."
-   Stata interprets "." as a large value
-   Easy to make mistakes!

To identify highly educated women, we might use the command:

``` stata
  // generate and replace without considering missing values
  gen hi_ed=0
  replace hi_ed=1 if wifeduc>15
  // What happens to our missing values?
  tab hi_ed, mi nola
```

``` example

gen hi_ed=0
replace hi_ed=1 if wifeduc>15
(944 real changes made)

tab hi_ed, mi nola

      hi_ed |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        475       33.47       33.47
          1 |        944       66.53      100.00
------------+-----------------------------------
      Total |      1,419      100.00
```

It looks like around 66% have higher education, but look closer:

``` stata
  // gen hi_ed2, but don't set a value if wifeduc is missing
  gen hi_ed2 = 0 if wifeduc != . 
  // only replace non-missing
  replace hi_ed2=1 if wifeduc >15 & wifeduc !=. 
  //check to see that missingness is preserved
  tab hi_ed2, mi
```

``` example

gen hi_ed2 = 0 if wifeduc != . 
(797 missing values generated)

replace hi_ed2=1 if wifeduc >15 & wifeduc !=. 
(147 real changes made)

 |        797       56.17      100.00
------------+-----------------------------------
      Total |      1,419      100.00
```

The correct value is 10%. Moral of the story? Be careful with missing values and remember that Stata considers missing values to be large!

Bulk Conversion to Missing Values
---------------------------------

Often the data collection/generating procedure will have used some other value besides "." to represent missing values. The `mvdecode` command will convert all these values to missing. For example:

``` stata
  mvdecode _all, mv(999)
```

``` example
mvdecode _all, mv(999)
```

-   The "\_all" command tells Stata to do this to all variables
-   Use this command carefully!
    -   If you have any variables where "999" is a legitimate value, Stata is going to recode it to missing
    -   As an alternative, you could list var names separately rather than using "\_all"

Variable types
==============

Variable Types
--------------

Stata uses two main types of variables: String and Numeric. To be able to perform any mathematical operations, your variables need to be in a numeric format. Stata can store numbers with differing levels of precision, as described in the table below.

| type   | Minimum                         | Maximum                        | being 0              | bytes |
|--------|---------------------------------|--------------------------------|----------------------|-------|
| byte   | -127                            | 100                            | +/-1                 | 1     |
| int    | -32,767                         | 32,740                         | +/-1                 | 2     |
| long   | -2,147,483,647                  | 2,147,483,620                  | +/-1                 | 4     |
| float  | -1.70141173319\*10<sup>38</sup> | 1.70141173319\*10<sup>38</sup> | +/-10<sup>-38</sup>  | 4     |
| double | -8.9884656743\*10<sup>307</sup> | 8.9884656743\*10<sup>307</sup> | +/-10<sup>-323</sup> | 8     |

-   Precision for float is 3.795x10<sup>-8</sup>.
-   Precision for double is 1.414x10<sup>-16</sup>.

Converting to and from Strings
------------------------------

Stata provides several ways to convert to and from strings. You can use `tostring` and `destring` to convert from one type to the other:

``` stata
  // convert degree to a string
  tostring degree, gen(degree_s)
  // and back to a number
  destring degree_s, gen(degree_n)
```

``` example

tostring degree, gen(degree_s)
degree_s generated as str1

destring degree_s, gen(degree_n)
degree_s has all characters numeric; degree_n generated as byte
```

Use `decode` and `encode` to convert to/from variable labels:

``` stata
  // convert degree to a descriptive string
  decode degree, gen(degree_s2)
  // and back to a number with labels
  encode degree_s2, gen(degree_n2)
```

``` example

decode degree, gen(degree_s2)

encode degree_s2, gen(degree_n2)
```

Converting Strings to Date/Time
-------------------------------

Often date/time variables start out as strings -- You'll need to convert them to numbers using one of the conversion functions listed below.

| Format | Meaning      | String-to-numeric conversion function |
|--------|--------------|---------------------------------------|
| %tc    | milliseconds | clock(string, mask)                   |
| %td    | days         | date(string, mask)                    |
| %tw    | weeks        | weekly(string, mask)                  |
| %tm    | months       | monthly(string, mask)                 |
| %tq    | quarters     | quarterly(string, mask)               |
| %ty    | years        | yearly(string, mask)                  |

Date/time variables are stored as the number of units elapsed since 01jan1960 00:00:00.000. For example, the `date` function returns the number of days since that time, and the `clock` function returns the number of milliseconds since that time.

``` stata
  // create string variable and convert to date
  gen date = "November 9 2020"
  gen date1 = date(date, "MDY")
  list date1 in 1/5
```

``` example

gen date = "November 9 2020"
gen date1 = date(date, "MDY")
list date1 in 1/5

     +-------+
     | date1 |
     |-------|
  1. | 22228 |
  2. | 22228 |
  3. | 22228 |
  4. | 22228 |
  5. | 22228 |
     +-------+
```

Formatting Numbers as Dates
---------------------------

Once you have converted the string to a number you can format it for display. You can simply accept the defaults used by your formatting string or provide details to customize it.

``` stata
  // format so humans can read the date
  format date1 %d
  list date1 in 1/5
  // format with detail
  format date1 %tdMonth_dd,_CCYY
  list date1 in 1/5
```

``` example

format date1 %d
list date1 in 1/5

     +-----------+
     |     date1 |
     |-----------|
  1. | 09nov2020 |
  2. | 09nov2020 |
  3. | 09nov2020 |
  4. | 09nov2020 |
  5. | 09nov2020 |
     +-----------+

format date1 %tdMonth_dd,_CCYY
list date1 in 1/5

     +------------------+
     |            date1 |
     |------------------|
  1. | November 9, 2020 |
  2. | November 9, 2020 |
  3. | November 9, 2020 |
  4. | November 9, 2020 |
  5. | November 9, 2020 |
     +------------------+
```

Exercise 2: Missing Values, String Conversion, and by Processing
----------------------------------------------------------------

1.  Recode values "99" and "98" on the variable, "hrs1" as "missing."
2.  Recode the marital variable into a "string" variable and then back into a numeric variable.
3.  Create a new variable that associates each individual with the average number of hours worked among individuals with matching educational degrees (see the last "by" example for inspiration).

Exercise 2 prototype<span class="tag" data-tag-name="prototype"></span>
-----------------------------------------------------------------------

1.  \[@1\] Recode values "99" and "98" on the variable, "hrs1" as "missing."

``` stata
  use dataSets/gss.dta, clear
  sum hrs1
  recode hrs1 (99=.) (98=.) 
  sum hrs1
```

1.  \[@2\] Recode the marital variable into a "string" variable and then back into a numeric variable.

``` stata
  tostring marital, gen(marstring)
  destring marstring, gen(mardstring)
  //compare with
  decode marital, gen(marital_s)
  encode marital_s, gen(marital_n)

  describe marital marstring mardstring marital_s marital_n
  sum marital marstring mardstring marital_s marital_n
```

1.  \[@3\] Create a new variable that associates each individual with the average number of hours worked among individuals with matching educational degrees (see the last "by" example for inspiration).

``` stata
  bysort degree: egen hrsdegree = mean(hrs1)
  tab hrsdegree
  tab hrsdegree degree 
```

Merging, appending, and joining
===============================

Appending Datasets
------------------

Sometimes you have observations in two different datasets, or you'd like to add observations to an existing dataset. In this case you can use the `append` command to add observations to the end of the observations in the master dataset. For example:

``` stata
  clear
  // from the append help file
  webuse even
  list
  webuse odd
  list
  // Append even data to the end of the odd data
  append using "http://www.stata-press.com/data/r14/even"
  list
  clear
```

``` example
clear

webuse even
(6th through 8th even numbers)
list

     +---------------+
     | number   even |
     |---------------|
  1. |      6     12 |
  2. |      7     14 |
  3. |      8     16 |
     +---------------+
webuse odd
(First five odd numbers)
list

     +--------------+
     | number   odd |
     |--------------|
  1. |      1     1 |
  2. |      2     3 |
  3. |      3     5 |
  4. |      4     7 |
  5. |      5     9 |
     +--------------+

append using "http://www.stata-press.com/data/r14/even"
list

     +---------------------+
     | number   odd   even |
     |---------------------|
  1. |      1     1      . |
  2. |      2     3      . |
  3. |      3     5      . |
  4. |      4     7      . |
  5. |      5     9      . |
     |---------------------|
  6. |      6     .     12 |
  7. |      7     .     14 |
  8. |      8     .     16 |
     +---------------------+
clear
```

To keep track of where observations came from, use the `generate` option as shown below:

``` stata
  webuse odd
  append using "http://www.stata-press.com/data/r14/even", generate(observesource)
  list
  clear
```

``` example
webuse odd
(First five odd numbers)
 ce)
list

     +--------------------------------+
     | number   odd   observ~e   even |
     |--------------------------------|
  1. |      1     1          0      . |
  2. |      2     3          0      . |
  3. |      3     5          0      . |
  4. |      4     7          0      . |
  5. |      5     9          0      . |
     |--------------------------------|
  6. |      6     .          1     12 |
  7. |      7     .          1     14 |
  8. |      8     .          1     16 |
     +--------------------------------+
clear
```

There is a "force" option will allow for data type mismatches, but again this is not recommended.

Remember, `append` is for adding observations (i.e., rows) from a second data set.

Merging Datasets
----------------

You can `merge` variables from a second dataset to the dataset you're currently working with.

-   Current active dataset = master dataset
-   Dataset you'd like to merge with master = using dataset

There are different ways that you might be interested in merging data:

-   Two datasets with same participant pool, one row per participant (1:1)
-   A dataset with one participant per row with a dataset with multiple rows per participant (1:many or many:1)

Before you begin:

-   Identify the "ID" that you will use to merge your two datasets
-   Determine which variables you'd like to merge
-   In Stata &gt;= 11, data does NOT have to be sorted
-   Variable types must match across datasets (there is a "force" option to get around this, but not recommended)

``` stata
  // Adapted from the merge help page
  webuse autosize 
  list
  webuse autoexpense
  list

  webuse autosize
  merge 1:1 make using "http://www.stata-press.com/data/r14/autoexpense"
  list
  clear

  // keep only the matches (AKA "inner join")
  webuse autosize, clear
  merge 1:1 make using "http://www.stata-press.com/data/r14/autoexpense", keep(match) nogen
  list
  clear
```

``` example

webuse autosize 
(1978 Automobile Data)
list

     +------------------------------------+
     | make               weight   length |
     |------------------------------------|
  1. | Toyota Celica       2,410      174 |
  2. | BMW 320i            2,650      177 |
  3. | Cad. Seville        4,290      204 |
  4. | Pont. Grand Prix    3,210      201 |
  5. | Datsun 210          2,020      165 |
     |------------------------------------|
  6. | Plym. Arrow         3,260      170 |
     +------------------------------------+
webuse autoexpense
(1978 Automobile Data)
list

     +---------------------------------+
     | make                price   mpg |
     |---------------------------------|
  1. | Toyota Celica       5,899    18 |
  2. | BMW 320i            9,735    25 |
  3. | Cad. Seville       15,906    21 |
  4. | Pont. Grand Prix    5,222    19 |
  5. | Datsun 210          4,589    35 |
     +---------------------------------+

webuse autosize
(1978 Automobile Data)
merge 1:1 make using "http://www.stata-press.com/data/r14/autoexpense"

    Result                           # of obs.
    -----------------------------------------
    not matched                             1
        from master                         1  (_merge==1)
        from using                          0  (_merge==2)

    matched                                 5  (_merge==3)
    -----------------------------------------
list

     +---------------------------------------------------------------------+
     | make               weight   length    price   mpg            _merge |
     |---------------------------------------------------------------------|
  1. | BMW 320i            2,650      177    9,735    25       matched (3) |
  2. | Cad. Seville        4,290      204   15,906    21       matched (3) |
  3. | Datsun 210          2,020      165    4,589    35       matched (3) |
  4. | Plym. Arrow         3,260      170        .     .   master only (1) |
  5. | Pont. Grand Prix    3,210      201    5,222    19       matched (3) |
     |---------------------------------------------------------------------|
  6. | Toyota Celica       2,410      174    5,899    18       matched (3) |
     +---------------------------------------------------------------------+
clear


webuse autosize, clear
(1978 Automobile Data)
 match) nogen

    Result                           # of obs.
    -----------------------------------------
    not matched                             0
    matched                                 5  
    -----------------------------------------
list

     +---------------------------------------------------+
     | make               weight   length    price   mpg |
     |---------------------------------------------------|
  1. | BMW 320i            2,650      177    9,735    25 |
  2. | Cad. Seville        4,290      204   15,906    21 |
  3. | Datsun 210          2,020      165    4,589    35 |
  4. | Pont. Grand Prix    3,210      201    5,222    19 |
  5. | Toyota Celica       2,410      174    5,899    18 |
     +---------------------------------------------------+
clear
```

Remember, `merge` is for adding variables (i.e., columns) from a second data set.

Merge Options
-------------

There are several options that provide more fine-grain control over what happens to non-id columns contained in both data sets. If you've carefully cleaned and prepared the data prior to merging this shouldn't be an issue, but here are some details about how stata handles this situation.

-   In standard merge, the master dataset is the authority and WON'T CHANGE
-   If your master dataset has missing data and some of those values are not missing in your using dataset, specify "update" -- this will fill in missing data in master
-   If you want data from your using dataset to overwrite that in your master, specify "replace update" -- this will replace master data with using data UNLESS the value is missing in the using dataset

Many-to-many merges
-------------------

Stata allows you to specify merges like `merge m:m id using newdata.dta`, but I have never seen this do anything useful. To quote the official [Stata manual](https://www.stata.com/manuals13/dmerge.pdf):

> `m:m` specifies a many-to-many merge and is a **bad idea**. In an `m:m` merge, observations are matched within equal values of the key variable(s), with the first observation being matched to the first; the second, to the second; and so on. If the master and using have an unequal number of observations within the group, then the last observation of the shorter group is used repeatedly to match with subsequent observations of the longer group. Thus **m:m merges are dependent on the current sort order—something which should never happen**. **Because m:m merges are such a bad idea, we are not going to show you an example**. If you think that you need an m:m merge, then you probably need to work with your data so that you can use a 1:m or m:1 merge. Tips for this are given in Troubleshooting m:m merges below

(emphasis added).

If you are thinking about using `merge m:m` chances are good that you actually need `joinby`. Here is a quick example, modified from the `joinby` help page.

``` stata
  clear
  webuse parent
  list
  webuse children
  list
  // Complete and utter nonsense!
  merge m:m family_id using http://www.stata-press.com/data/r14/parent 
  // You want joinby instead
  clear
  webuse children
  joinby family_id using http://www.stata-press.com/data/r14/parent 
```

Remeber, `merge m:m` is old and broken; **do not use**. Anytime you think you might want `m:m` you should use `joinby` instead.

Creating summarized data sets
=============================

Collapse
--------

Collapse will take master data and create a new dataset of summary statistics

-   Useful in hierarchical linear modeling if you'd like to create aggregate, summary statistics
-   Can generate group summary data for many descriptive stats
-   Can also attach weights

Before you collapse:

-   Save your master dataset and then save it again under a new name (this will prevent collapse from writing over your original data\_
-   Consider issues of missing data. Do you want Stata to use all possible observations? If not, the `cw` (casewise) option will make casewise deletions

Collapse Example
----------------

``` stata
  // Adapted from the collapse help page
  clear
  webuse college
  list
  // mean and sd by hospital
  collapse (mean) mean_gpa = gpa mean_hour = hour (sd) sd_gpa = gpa sd_hour = hour, by(year)
  list
  clear
```

``` example

clear
webuse college
list

     +----------------------------+
     | gpa   hour   year   number |
     |----------------------------|
  1. | 3.2     30      1        3 |
  2. | 3.5     34      1        2 |
  3. | 2.8     28      1        9 |
  4. | 2.1     30      1        4 |
  5. | 3.8     29      2        3 |
     |----------------------------|
  6. | 2.5     30      2        4 |
  7. | 2.9     35      2        5 |
  8. | 3.7     30      3        4 |
  9. | 2.2     35      3        2 |
 10. | 3.3     33      3        3 |
     |----------------------------|
 11. | 3.4     32      4        5 |
 12. | 2.9     31      4        2 |
     +----------------------------+

 our, by(year)
list

     +--------------------------------------------------+
     | year   mean_gpa   mean_h~r     sd_gpa    sd_hour |
     |--------------------------------------------------|
  1. |    1        2.9       30.5   .6055301   2.516612 |
  2. |    2   3.066667   31.33333   .6658328    3.21455 |
  3. |    3   3.066667   32.66667   .7767453   2.516612 |
  4. |    4       3.15       31.5   .3535534   .7071068 |
     +--------------------------------------------------+
clear
```

You could also generate different statistics for multiple variables

Exercise 3: Merge, Append, and Collapse
---------------------------------------

Open the gss2.dta dataset. This dataset contains only half of the variables that are in the complete gss dataset.

1.  Merge dataset gss1.dta with dataset gss2.dta. The identification variable is "id."
2.  Open the gss.dta dataset and merge in data from the "marital.dta" dataset, which includes income information grouped by individuals' marital status. The marital dataset contains collapsed data regarding average statistics of individuals based on their marital status.
3.  Open the gssAppend.dta dataset and Create a new dataset that combines the observations in gssAppend.dta with those in gssAddObserve.dta.
4.  Open the gss.dta dataset. Create a new dataset that summarizes mean and standard deviation of income based on individuals' degree status ("degree"). In the process of creating this new dataset, rename your three new variables.

Exercise 3 prototype<span class="tag" data-tag-name="prototype"></span>
-----------------------------------------------------------------------

Open the gss2.dta dataset. This dataset contains only half of the variables that are in the complete gss dataset.

1.  \[@1\] Merge dataset gss1.dta with dataset gss2.dta. The identification variable is "id."

``` stata
  use dataSets/gss2.dta, clear
  merge 1:1 id using dataSets/gss1.dta
  save gss3.dta, replace
```

1.  \[@2\] Open the gss.dta dataset and merge in data from the "marital.dta" dataset, which includes income information grouped by individuals' marital status. The marital dataset contains collapsed data regarding average statistics of individuals based on their marital status.

``` stata
  use dataSets/gss.dta, clear
  merge m:1 marital using dataSets/marital.dta, nogenerate replace update
  save gss4.dta, replace


```

1.  \[@3\] Open the gssAppend.dta dataset and Create a new dataset that combines the observations in gssAppend.dta with those in gssAddObserve.dta.

``` stata
  use dataSets/gssAppend.dta, clear
  append using dataSets/gssAddObserve, generate(observe) 

```

1.  \[@4\] Open the gss.dta dataset. Create a new dataset that summarizes mean and standard deviation of income based on individuals' degree status ("degree"). In the process of creating this new dataset, rename your three new variables.

``` stata
  use dataSets/gss.dta, clear
  save collapse2.dta, replace
  use collapse2.dta, clear
  collapse (mean) meaninc=income (sd) sdinc=income, by(marital)
```

Wrap-up
=======

Help Us Make This Workshop Better
---------------------------------

-   Please take a moment to fill out a very short feedback form
-   These workshops exist for you--tell us what you need!
-   <http://tinyurl.com/StataDatManFeedback>

Additional resources
--------------------

-   training and consulting
    -   IQSS workshops: <http://projects.iq.harvard.edu/rtc/filter_by/workshops>
    -   IQSS statistical consulting: <http://dss.iq.harvard.edu>
-   Stata resources
    -   UCLA website: <http://www.ats.ucla.edu/stat/Stata/>
    -   Great for self-study
    -   Links to resources
-   Stata website: <http://www.stata.com/help.cgi?contents>
-   Email list: <http://www.stata.com/statalist/>

