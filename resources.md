---
layout: info_page
title: Resources
---

## Resources for learning R

This course assumes participants already have some programming experience
with R, assuming familiarity with things like: creating and setting variables,
the basic data structures (dataframes, vectors, lists), using functions and running
R code and viewing console output. You can refresh your memory of these concepts
by consulting
<a href="https://uniexeterrse.github.io/intro-to-r/" target="_blank" rel="external noreferrer">Introduction to R</a>.


### Installing and using packages

Participants will need to install some extra packages for this course. In
general, this can be done by using the `install.packages` function in R. For
example, to install the `dplyr` package, run the following within an R session:

```r
install.packages("dplyr")
```

To then use this package in your own code (or in the R console), you have two options:

1. Include the line `library(dplyr)` in your code to import all the functions (and
   any other objects e.g. example dataframes) from the package for you to use.
   For example, this would allow you to use the `mutate` function from `dplyr`.

2. Use 'namespace' notation to access a specific function / object from within
   the package. For example, to use the `mutate` function from `dplyr` without
   importing the whole package, we can write `dplyr::mutate`. Note that you
   don't need to run `library(dplyr)` for this to work.


## Further resources for learning the Tidyverse

This course will give you a grounding in using the Tidyverse collection of
packages in R to work with data. You may wish to look at the following
supplementary materials after the course:

- Cheatsheets for several Tidyverse packages, including the ones we've covered
  in this course, are available at
  <a href="https://posit.co/resources/cheatsheets/" target="_blank" rel="external noreferrer">https://posit.co/resources/cheatsheets/</a>.
  These are a great way to quickly look up function(s) that help you perform
  some concrete task. Often it's a good idea to look at the cheatsheet to know
  what functions(s) you need, then use the help system in R to read the
  documentation, or search the web for further advice.

- The <a href="https://r4ds.hadley.nz/" target="_blank" rel="external noreferrer">R for Data Science book (2nd ed.)</a>
  by Hadley Wickham, Mine Çetinkaya-Rundel and Garrett Grolemund is a freely
  available, online book which covers lots of aspects of working with and
  visualising data using the Tidyverse in a way that's approachable for
  non-expert R programmers.
