---
layout: page
title: "More Advanced Data Wrangling"
order: 5
session: TODO
length: TODO
toc: true
adapted: true
attrib_name: "Tidyverse: Data wrangling & visualization - Data wrangling: beyond basics"
attrib_link: https://liza-wood.github.io/tidyverse_intro/data-wrangling-beyond-basics.html
attrib_license: Creative Commons BY-NC-SA 4.0
attrib_license_link: https://creativecommons.org/licenses/by-nc-sa/4.0/
---


## Outline / cheat sheet

- Manipulating date variables:
  - `lubridate` package: Use date format functions (e.g. `ymd`) to specify date
    data formats and extract particular date-related data. 
- Joining multiple dataframes:
  - `*_join` series: Combine two dataframes by one or more shared columns.
    Specify with kind of join (`full_join`, `left_join`, etc.) to determine
    which observations are kept/dropped.
- Reshaping (lengthening/widening) data:
  - `pivot_longer`: Take values that are spread across multiple columns and
    'lengthen' the data by stacking those columns on top of one another
  - `pivot_wider`: Take 'long' values stacked into one column and 'widen' the
    data by spreading them out
- Working with text:
  - `separate`: Divide the contents of one column into multiple based on
    particular symbols.
  - `stringr` package: Identify patterns using 'regular expressions' and apply a
    series of commands (e.g. remove, extract, detect) to manipulate text data.
  - `paste`: combine contents from multiple columns (or external text).
  

## Manipulating date variables

Remember the weather data we loaded in at the start. We have weather data from
the Palmer Station in Antarctica from 1989 - 2019, where data are available for
each day.

```r
library(tidyverse)
library(palmerpenguins)
weather <- read.csv("https://pasta.lternet.edu/package/data/eml/knb-lter-pal/28/8/375b34051b162d84516ec2d02f864675") 
```

```r
str(weather)
```

However, the structure of the data above indicate that the first variable, Date,
is a 'character'. This means that R is not reading these dates as numbers, and
so it may be hard to manipulate them any further (e.g. extracting certain
years).

```r
head(weather$Date)
class(weather$Date)
```

We want to use the `lubridate` package (loaded in when we load in `tidyverse`)
to convert these variables into dates and create a column for the year. This
package is handy because it has very intuitive function names and argument
structures. For instance, you can convert a character type into a date type by
using a function with letters representing the date format. You can see all of
these formats by specifically calling upon the `lubridate` package and then using
semicolons to call upon the functions, such as those starting with 'y'.

```r
lubridate::y
```

In `lubridate`, y = year, m = month, d = day, h = hour, m = minute, s = second, etc.

We can see that our data is formatted in the year-month-day format, and so we
can use the `ymd` function to indicate to R what format we want it to detect as
it converts characters to dates. If we use this function and assign the output
to a date vector, we can then evaluate the class to see that it is a date.  

```r
date_vector <- ymd(weather$Date)
class(date_vector)
```

It is important to remember that manipulating a column does not mean it
automatically saves into the dataframe. Instead, we need to remember to write
(or overwrite) that column into our dataframe. Remember that we can use the
mutate function to do this, where we can overwrite out date column. Note two
different ways of doing this. First, we could use the `ymd` function directly in
our mutate function:

```r
weather <- mutate(weather, Date = ymd(Date))
```

Or because we have saved the new date data as its own vector, we can feed that
vector into the dataframe as is.

```r
weather <- mutate(weather, Date = date_vector)
```

Now we have our date data saved in our dataframe.

```r
class(weather$Date)
```

Now that R recognizes these as dates, we can extract certain date-related
features, such as the year, month, and day. The lubridate package has functions
conveniently named `year`, `month`, `day` that can be used with a date argument,
and that element of the date will be extracted. For example:

```r
head(year(weather$Date), n = 75)
```

Again, let's use mutate to assign this as a new column

```r
weather <- mutate(weather, year = year(Date))
```

### Exercise  

We are going to review our basic wrangling skills to prepare the Palmer Station
weather data to merge with the penguins data.

We would like to merge a _summary_ of the weather data with the penguins. For
this summary, we want the weather data summarized by year, rather than by day
(as it currently is). Then per year, we want to know the maximum, minimum, and
average temperatures. Create this summary table called `weather_summary`.

<details>
<summary>Check your answer</summary>

```r
weather_summary <- weather %>% 
  group_by(year) %>% 
  summarize(average_temp = mean(Temperature.Average..C., na.rm = T),
            max_temp = max(Temperature.High..C., na.rm = T),
            min_temp = min(Temperature.Low..C., na.rm = T))

```

</details>

## Joining multiple dataframes

In your data wrangling journey, you will often find yourself wanting to combine
one dataframe with some kind of supplementary or partner dataframe. In our
case, we have the penguins and weather data stored separately, but if we ever
wanted to explore any relationships between them, we'd likely want all of that
data stored in one place so that we can line up data points. This lining up of
data points is called **joining** in the tidyverse language.  
  
The key to joining is to identify the variables by which you want to join the
data. In other words, which columns in each data are the ones that link them
together? In some cases these may be one-to-one matches (e.g. ID numbers to IDs
numbers), or in other cases there is data at different levels that need to be
lined up.

By default, `*_join` functions will link the data together based on all of the
shared column names, but usually you'll want to double check to make sure that
this will get you the desired output. Typically you can do this by just checking
out the column names of each dataframe (for this exercise we will use the
`weather_summary` object created in the last exercise).

```r
colnames(penguins)
```

```r
colnames(weather_summary)
```

We have one column overlapping, year, which makes it the likely candidate for
joining by. But it is also important to think: what is it that actually links
penguins to weather? Penguins experience weather at any given time, and so we
will need to choose a shared time scale at which penguins are experiencing
weather and the scale of data we collected for weather. In the penguins data set
we only know the year that the observations were taken, so we're interested in
the annual weather summaries. This is why we are looking at the weather summary
object, so that we can align the data relatively well.  

Now, let's join. The join functions take three arguments: the two dataframes
you'd like to join, and the name of the column by which to join. There are also
several types of joins, which we can explore in the exercise, but for now let's
use a `left_join`:

```r
penguins_leftjoined <- left_join(penguins, weather_summary, by = "year")
dim(penguins_leftjoined)
```

We go from 8 columns in the penguins data to 11 now that we've appended the
three weather-related columns to the data. And we stick with 344 rows because
that is the number of rows in our 'left' dataframe, penguins. These dimensions
might change depending on the kind of join you use.  


### Exercise

Go ahead and check out the documentation for join by using the help function, a
question mark:

```r
?join
```

You'll see the variety of joins that exist in `dplyr`. Try to experiment with
them: What happens when you use another kind of join? Check how the dimensions
of the data change depending on the join you choose.

<details>
<summary>Check your answer</summary>

```r
penguins_fulljoined <- full_join(penguins, weather_summary, by = "year")
dim(penguins_fulljoined)
# We now have more rows. Why? We had weather data for more years than we have penguin data, so we have a lot of weather data that is unmatched to any pengion observation
```

</details>


## Reshaping (lengthening/widening) data

There are often cases where you'd like to change the shape of your data. For
instance, you might want to turn several columns into two: one with the
measurements or values from the previous columns, and one with a categorical
indicator of what is represented in the new column. This is a case for pivoting
longer.

Let's say we wanted to take the key measures of our penguins and stack them on
top of one another (this is not actually useful given our data, but it is the
practice that counts). When we stack all of these columns on top of one another
we are going to be creating two new columns: one with the names of the columns
and another with the values of the columns. In the `pivot_longer` arguments, it
looks like this:

```r
# Pivot the data to make it longer
penguins_longer <- pivot_longer(penguins, 
                                cols = c(bill_length_mm, bill_depth_mm,
                                         flipper_length_mm, body_mass_g), 
                                names_to = "measure", values_to = "value")
```

```r
head(penguins_longer)
```

The reverse scenario is having data within one column that you'd like to widen
out into several columns. Here we have to identify the column we'd like to
un-stack (`values_from`), how we'd like to name the new columns filled with the
widened values (`names_from`). Note that we don't need to put these column names
in quotes because they already exist in the dataframe!

```r
penguins_wider <- pivot_wider(penguins_longer, 
                              names_from = measure, 
                              values_from = value)
```

BUT, we get a bit of an issue here. Our result has condensed many of the
measures down into list forms, leaving us with only 35 observations and several
repeated measured for each observation. Why? When `dplyr` is widening out the data
it wants to match the new columns to _unique observations_. So the function
created one row for each species-island-sex-year combination, thinking those are
unique. We can fix this by creating an ID column (id_col).

Here want to specify what it is that actually identifies unique observations in
the data. Our issue is that we don't have unique identifiers in the data.
Whoops. Let's fix that and re-run these functions to see why this matters.

First, let's assign a unique ID column to the original penguins data and then
re-run our `pivot_longer`:

```r
penguins$ID <- 1:nrow(penguins)
penguins_longer <- pivot_longer(penguins, 
                                cols = c(bill_length_mm, bill_depth_mm,
                                         flipper_length_mm, body_mass_g), 
                                names_to = "measure", values_to = "value")
```

```r
head(penguins_longer)
```

Now this will play an important part in the `pivot_wider`. Let's set ID as the
the `id_cols` argument in the function:

```r
penguins_widerID <- pivot_wider(penguins_longer, 
                                id_cols = ID,
                                names_from = measure, 
                                values_from = value)
head(penguins_widerID)
```

Uh, close, but still some issues. What happened to all of our other columns?
Well, since we said ID was our only id column, it dropped everything else. So we
can actually pile everything into our ID column that we wan to keep.

```{r}
penguins_widerID_allcols <- pivot_wider(penguins_longer, 
                                        id_cols = species:ID,
                                        names_from = "measure", 
                                        values_from = "value")
head(penguins_widerID_allcols)
```

## Working with text

Let's back up a bit to the cleaning process. We've been working on getting our
data in summary form, bringing in new data, and changing data shape, all of
which is pretty far down the data wrangling pipeline. But we are going to take
this last moment to talk about an earlier stage task: cleaning text data.  

When we first create and collect data, it may not be in its tidiest form. One
common messy data practice is to have multiple types of data in one column.
For instance, we can look at the 'raw' version of the penguins data, also
available through the package. Go ahead and read that in:

```r
penguins_raw <- penguins_raw
```

Let's look at the third and sixth columns, for instance.  

```r
head(select(penguins_raw, 3,6))
```

The Stage column is a good example of where multiple data points might be
combined into one cell as text. Here we have 'Adult, 1 Egg Stage' reported. But,
we might want to separate out the title of the penguin's stage, Adult, from
their egg stage count. For this we can use the `separate` function to divide the
contents of one column into multiple based on particular symbols. In this case,
there is a convention to separate the word Adult (or other stage) from the egg
count using a comma (,).

For the `separate` function we need to enter a few arguments: the data, the
column to separate, the names of the new columns, and the separator symbol. Note
that the help file says that the separator symbol is "interpreted as a regular
expression" -- we'll get to to that in a second.

```r
penguins_raw_sep <- separate(penguins_raw, Stage, c("age_cat", "egg_stage"), ',')
```

Now we can see that these two have replaced the previous Stage column which adds
one more column to the dataframe.  

```r
head(select(penguins_raw_sep, 4:7))
```

Now, we could even go one step further. The data here are well organized and
uniform, meaning that separate works quite well. Every Stage column has a comma,
and even now in the egg_stage column there are three words, so we could separate
by a space `" "` and get three new columns. However, when data is messy we might
need some more powerful text manipulation tools.

Enter: the `stringr` package and regular expressions. `stringr` is a package
providing a set of functions for manipulating "strings", also called text or
character data. Check out the great
<a href="https://github.com/rstudio/cheatsheets/blob/main/strings.pdf" target="_blank" rel="external noreferrer">stringr cheat sheet</a>.
Part of what makes `stringr` so powerful is that it relies on patterns
interpreted as 'regular expressions' (or regex). Regex is its own pattern
language that allows you to generalize string patterns for great adaptability to
string cleaning.

We will practice just one example, which is to extract the number from the
egg_stage column. The power of regex is that instead of specifying every
possible number that could exist in the column (1,2,3,4,5,6,7,8,9), there is a
symbol for numbers in the regex language, which is `\\d`. There is also a symbol
to quantify the number of symbols, where `?` is zero or one, `*` is zero or
more, `+` is one or more, etc. By combining `\\d+` we've created a regular
expression for the pattern: one or more digits. We can then use this in one of
the string functions, `str_extract`, with the two arguments it needs: the
character vector and the pattern.

```r
str_extract(penguins_raw_sep$egg_stage, '\\d+')
```

Excellent. Our pattern worked and we've successfully extracted the number
pattern from the column. One tiny tweak is that the numbers are in quotation
marks, meaning that they are still character data. We can coerce them to numeric
once they are all numbers.

```r
penguins_raw_sep$egg_no <- as.numeric(str_extract(penguins_raw_sep$egg_stage,
                                                  '\\d+'))
head(penguins_raw_sep$egg_no)
```

Finally, maybe we want to put things back together? The `paste` function is a
straightforward way to paste columns or values back together. The arguments for
paste are as many value you'd like to paste together, separated by a comma. For
instance:

```r
head(paste(penguins_raw_sep$age_cat, penguins_raw_sep$egg_stage))
```

And you can also mix and match data types and lengths, etc:

```r
paste("Paste together items of different lengths, for example:", 
      1:10, "different items")
```

### Exercise

Try to separate the common name from the scientific name from the 'Species'
column in penguins_raw. E.g. separate 'Adelie Penguin (Pygoscelis adeliae)' into
two columns: 'Adelie Penguin' and 'Pygoscelis adeliae'. You may need to combine
`separate` with a `stringr` function (e.g. `str_remove`) depending on how you'd
like to deal with the parentheses. Note that parentheses in regular expressions
are special characters and will need to be treated as such both in the
`separate` and `stringr` functions -- see the cheat sheet!

<details>
<summary>Check your answer</summary>

```r
# Separate by the first opening parentheses
penguins_raw <- separate(penguins_raw, Species, 
                         c("common_name", "sci_name"), "\\(")
# Then remove the second closing parentheses with stringr
penguins_raw$sci_name <- str_remove(penguins_raw$sci_name, "\\)")
# I also like to use the base R function 'trimws' to trim white space
penguins_raw$common_name <- trimws(penguins_raw$common_name)
penguins_raw$sci_name <- trimws(penguins_raw$sci_name)
# Let's take a look
head(select(penguins_raw, common_name, sci_name))
```

</details>

