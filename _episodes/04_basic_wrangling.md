---
layout: page
title: "Data Wrangling Basics"
order: 4
session: TODO
length: TODO
toc: true
adapted: true
attrib_name: "Tidyverse: Data wrangling & visualization - Data wrangling basics"
attrib_link: https://liza-wood.github.io/tidyverse_intro/data-wrangling-basics.html
attrib_license: Creative Commons BY-NC-SA 4.0
attrib_license_link: https://creativecommons.org/licenses/by-nc-sa/4.0/
---

## Learning Objectives

By the end of this episode participants will be able to:

TODO: objectives


## Outline / cheat sheet  

- Reducing data dimensionality:
  - `select`: Name the columns to keep, separated by a comma. Using `select`
    will reduce the number of columns in your dataframe.
  - `filter`: Set conditions by which you want to filter (keep) rows of data.
    Using the `filter` function will reduce the number of rows in your dataframe.
  - `is.na()`: Specify a column name to get a logical vector indicated whether
    each value in that row has an NA value. Useful when paired with `filter`.  

- Combining multiple steps
  - `%>%`: Chain together multiple steps by 'piping' the output of one line of
    code into the next.

- Creating new variables
  - New columns
    - `mutate`: Create a new column by assigning a value (transformed or
      otherwise).
    - `case_when`: Pair with `mutate` to create a new variable that is based on
      one or more conditions, typically for creating categorical variables.
  - Summary tables
    - `group_by`: Set a column (or columns) by which you want to perform a
      summarizing function on. Using this function does apparently nothing on
      its own, but is powerful when paired with `summarize` or `mutate`.
    - `summarize`: Create a new variable by performing a variety of
      summary/transformative functions on an existing column (or set of
      columns). When paired with `group_by`, data is reduced to a summary table.


## Reducing data dimensionality

The functions, `select` and `filter`, are what you can use to reduce
dimensionality of your dataframe. That means reducing the number of columns
(with `select`) and/or the number of rows (with `filter`). To use `select`,
name the columns to keep, separated by a comma. For example, let's select the
species, year, sex, and body mass columns.

```r
library(tidyverse)
library(palmerpenguins)
```

```r
# Hint: check your column names first
colnames(penguins)
```

```r
# Select species, year, sex, and body mass
penguins_selected <- select(penguins, species, year, sex, body_mass_g)
# Take a look at the 'dimensions' with dim()
dim(penguins_selected)
```

The `select` function can also be used to remove columns by using the `-`
operator. For example, we may want to remove only two columns, island and year:

```r
# Remove the island and year columns by using -.
penguins_unselected <- select(penguins, -island, -year)

# Take a look at the number of columns
ncol(penguins_unselected)
```

Now, let's filter the data based on a certain condition. Creating 'conditions'
in R means writing logical statements with a response that will be either `TRUE`
or `FALSE`. To write conditions we can use
[comparative operators](https://www.w3schools.com/r/r_operators.asp), which give
a logical output:

| Comparative Operator | Name                     | Example |
|----------------------|--------------------------|---------|
| ==                   | Equal                    | x == y  |
| !=                   | Not equal                | x != y  |
| >                    | Greater than             | x > y   |
| <                    | Less than                | x < y   |
| >=                   | Greater than or equal to | x >= y  |
| <=                   | Less than or equal to    | x <= y  |

```r
head(penguins$year == 2007, n = 75)
```

The filter function evaluates the condition and keeps only the rows for which the value is TRUE. For example, let's filter observations so that we only keep those from the year 2007.

```r
penguins_filtered <- filter(penguins, year == 2007)
dim(penguins_filtered)
```

TODO: compare with base R way of filtering on boolean vector

There are other functions we can use to evaluate columns and get a true/false
output. An important one is `is.na()`. This function evaluates a column and
reports back a `TRUE` value when there is an NA in that column's row. For
example, we can use the `head()` function to look at the top 6 values of the
`sex` column, and see that there is an NA in the fourth row.

```r
head(penguins$sex, n = 10)
```

The `is.na` function evaluates the whole column and gives us `TRUE`s whenever it
sees an NA. Not surprisingly, we see a `TRUE` in the fourth observation.  

```r
head(is.na(penguins$sex), n = 10)
```

Since `is.na()` gives us a `TRUE`/`FALSE` vector, it is already a good
candidate for using it as a condition in filter. Below we are asking the
filter function to keep only the observations that have an NA in the sex column.
In other others, evaluate the logical conditions
"are there NAs in the sex column?" then filter out the rows where the condition
is `TRUE`, meaning there are NAs.

```r
penguins_filtered_nas <- filter(penguins, is.na(sex))
nrow(penguins_filtered_nas)
nrow(penguins)
```

To do the reverse, i.e. keep only the observations that do NOT have an NA in
the sex column, we can use the `!` operator to denote 'not' and reverse the
true/false.

```r
penguins_filtered_nonas <- filter(penguins, !is.na(sex))
dim(penguins_filtered_nonas)
```

You can combine multiple conditions using
[logical operators](https://www.w3schools.com/r/r_operators.asp):

| Logical Operator | Name    | Example           |
|------------------|---------|-------------------|
| &                | AND     | x == 2 & y == 10  |
| \|              | OR      | x == 2 \| y == 10  |

For example, we can filter out the rows where there are NAs in the sex column
AND keep only the rows of the penguin species named Adelie.

```r
penguins_filtered_2conditions <- filter(penguins, !is.na(sex) & species == "Adelie")
nrow(penguins_filtered_2conditions)
```


## Combining multiple steps

TODO: rearrange the discussion to first do nested calls, then successive updating, then piping

There are several ways to combine steps in coding. You can perform one
function at a time and save intermediate objects as you work, you can 'nest'
functions, or you can use 'pipes' (`%>%`). So for example, if you wanted to
select the species, sex, bill length, and bill depth, and filter data so to
only keep data 'Adelie' penguins, with no NAs in the sex column, these first
two options would look as follows:

```r
# Multiple steps with intermediate objects
penguins_step1 <- select(penguins, species, sex, bill_length_mm, bill_depth_mm)
penguins_step2 <- filter(penguins_step1, species == 'Adelie' & !is.na(sex))
summary(penguins_step2)
```

```r
# Multiple steps with nested functions
penguins_nested <- filter(select(penguins, species, sex, bill_length_mm, bill_depth_mm), 
                          species == 'Adelie' & !is.na(sex))
summary(penguins_nested)
```

The third option is pipes. Pipes let you take the output of one function and
send it directly to the next, which is useful when you need to do many things
to the same data set. Pipes in R look like `%>%` and are made available via the
`magrittr` package, installed automatically with the `tidyverse`. (If you use
RStudio, you can type the pipe with Ctrl + Shift + M if you have a PC or
Cmd + Shift + M if you have a Mac.)

```r
# Multiple steps with pipes
penguins_piped <- penguins %>% 
  select(species, sex, bill_length_mm, bill_depth_mm) %>% 
  filter(species == 'Adelie' & !is.na(sex))
summary(penguins_piped)
```

We will use the piping approach, as it helps make a smoother workflow for other
wrangling functions we'll use.

TODO: note about how result is entered as first arg and no need to specify.


### Exercise

Use pipes to select only the columns for species, sex, bill_length_mm, and
body_mass_g, and filter out where sex is missing and body_mass_g is greater than
3500. Name this new data frame 'filter_challenge' and look at a summary of it to
check your work.

<details>
<summary>Check your answer</summary>
```r
filter_challenge <- penguins %>%
select(species, sex, bill_length_mm, body_mass_g) %>%
filter(is.na(sex) & body_mass_g > 3500)
str(filter_challenge)
```
</details>


## Creating new variables

### New columns

We may often want to make a new column with some updated or transformed value.
We can use the `mutate` function for this, in which you can assign the new
column name and its value. The idea is generally
`mutate(data, new_column_name = value)`. For example, if we wanted to calculate
a new value, the ratio of bill length to bill depth, we could do the following

```r
# Mutate to create a new column; use penguins_piped so our output is
# easier to view
mutate(penguins_piped, bill_ratio = bill_length_mm / bill_depth_mm) 
```

Note that in order to save the column in the dataframe, we must assign it as a
new dataframe object. The output of mutate is not just a new column on its own,
but the whole dataframe with the new column appended. So far we have not
overwritten in, and we can see that bill_depth_cm is not in our penguins
dataframe

```r
colnames(penguins_piped)
```

Only once we assign it do we have a dataframe now with the new column appended

```r
penguins_newcolumn <- mutate(penguins_piped, bill_ratio = bill_length_mm / bill_depth_mm) 
colnames(penguins_newcolumn)
```

In addition to the mathematical transformations we just tried, we may want to
create new, discrete categories with our data. For example, let's categorize
bill ratio into discrete size groups based on its distribution.

```{r}
summary(penguins_newcolumn$bill_ratio)
```

All values are greater than 1, so all bill lengths are greater than depths.
Still, lower ratio values mean that the bill depth is large relative to its length
(deep bills) and higher values mean that bill depth is small relative to its
length (shallow bills). Let's say we wanted to use these bill ratios to group
penguins into one of three groups: 'deep' 'average' and 'shallow'.

<figure>
  <img src="{{ site.url }}/assets/images/culmen_depth.png" alt="Diagram of penguin bill measurements" />
  <figcaption>
    Penguin bills. Artwork by @allison_horst, obtained from
    <a href="https://allisonhorst.github.io/palmerpenguins/articles/art.html" target="_blank" rel="external noreferrer">https://allisonhorst.github.io/palmerpenguins/articles/art.html</a>
  </figcaption>
</figure>

The `case_when` function, combined with `mutate`, lets us set multiple
conditions and assign resulting categories. This function uses a series of
two-sided formulas where the left-hand side determines describes the condition,
and the right supplies the result. The final condition should always be
`TRUE`, meaning that when the previous conditions have not been met, assign the
last value.

Using these functions we can create a depth ratio category variable:

```r
penguins_newcolumn <- penguins_newcolumn %>% 
  mutate(bill_depth_cat = case_when(
    # Using the 1st Q as cutoff
    bill_ratio <= 2.013 ~ 'deep',
    # Between 1st and 2rd Q
    bill_ratio > 2.013 & bill_ratio <= 2.239 ~ 'average',
    T ~ 'shallow'
  ))

head(penguins_newcolumn$bill_depth_cat, n = 75)
```

A note: Always be cautious about what might be left out when naming the
conditions. In the previous example, we assume that everything left after the
first two conditions would be shallow. To be on the safe side, I often set every
condition and leave the last condition either an error notice, or NA, so that I
can check my conditions.

```r
penguins_newcolumn <- penguins_newcolumn %>% 
  mutate(bill_depth_cat = case_when(
    # Using the 1st Q as cutoff
    bill_ratio <= 2.013 ~ 'deep',
    # Between 1st and 2rd Q
    bill_ratio > 2.013 & bill_ratio <= 2.239 ~ 'average',
    bill_ratio >= 2.239 ~ 'shallow',
    T ~ 'ERROR'
  ))
```

Then we can use the `unique` function to look at all of the unique values of
that new variable to check out work.

```r
unique(penguins_newcolumn$bill_depth_cat)
```


### Summary tables

Often we want to aggregate data at certain levels to better understand
differences across groups. For instance, does flipper length differ by species?
Does body mass change between years? We can combine the `group_by` and
`summarize` functions to help answer these kinds of questions. `group_by` sets a
column (or columns) by which you want to perform a summarizing function on, then
`summarize` creates a new variable by performing a variety of
summary/transformative functions on an existing column.

First, we can use `summarize` on its own, without any grouping, to get a single
summary about the data frame. For example, if we want to know the mean body
mass:

```r
# calculate the mean body mass for the whole data frame
summarize(penguins, mean_body_mass_g = mean(flipper_length_mm))
```

If the result is NA, be sure to include the 'na.rm = TRUE' argument to tell the
function to 'remove NAs' before calculating:

```r
# set na.rm = T
summarize(penguins, mean_flipper_length_mm = mean(flipper_length_mm, na.rm = TRUE))
```

But if we want to know the mean flipper length across certain grouping
variables, such as sex, we want to combine summarize with `group_by` first.

```r
penguins %>% 
  group_by(species) %>% 
  summarize(mean_flipper_length_mm = mean(flipper_length_mm, na.rm = TRUE))
```

These functions are powerful. We can group by multiple columns at once AND
summarize can create several new summary variables within the same summarize
function, just by separating arguments by a comma in both cases. For instance,
we can group by species and sex, and generate two summary variables of mean and
standard deviation flipper length:

```r
penguins %>% 
  group_by(species,sex) %>% 
  summarize(mean_flipper_length_mm = mean(flipper_length_mm, na.rm = TRUE),
            sd_flipper_length_mm = sd(flipper_length_mm, na.rm = TRUE))
```


### Exercise

Use summarize to calculate the mean and standard deviation for each year-sex
group combination. Before calculating those summaries, filter out the
observations where there is no data for penguin sex. Name this new summary table
'summary_challenge'. What is the mean and standard deviation of the body mass
for male penguins in 2008?

<details>
<summary>Check your answer</summary>
```r
summary_challenge <- penguins %>%
  filter(!is.na(sex)) %>%
  group_by(year,sex) %>%
  summarize(mean_body_mass_g = mean(body_mass_g, na.rm = T),
            sd_body_mass_g = sd(body_mass_g, na.rm = T))
summary_challenge
# mean: 4632.456	sd: 722.0687	
```
</details>
