---
layout: page
title: "Example Data"
order: 3
session: TODO
length: TODO
toc: true
adapted: true
attrib_name: "Tidyverse: Data wrangling & visualization - Data"
attrib_link: https://liza-wood.github.io/tidyverse_intro/data.html
attrib_license: Creative Commons BY-NC-SA 4.0
attrib_license_link: https://creativecommons.org/licenses/by-nc-sa/4.0/
---

## Learning Objectives

By the end of this episode participants will be able to:

TODO: objectives


## Palmer Station penguins

TODO: add code outputs

The Palmer Station penguins data is a tidy data set related to three species of
Antarctic penguins from Horst, Hill, and Gorman [[^1]].

The data contains size measurements for male and female adult foraging
Adélie, Chinstrap, and Gentoo penguins observed on islands in the Palmer
Archipelago near Palmer Station, Antarctica between 2007-2009. Data were
collected and made available by Dr. Kristen Gorman and the Palmer Station Long
Term Ecological Research (LTER) Program. You can read more about the package
on the
<a href="https://allisonhorst.github.io/palmerpenguins/index.html" target="_blank" rel="external noreferrer">`palmerpenguins` documentation website</a>.  

Let's start by installing the package:  

```r
# Install from CRAN
install.packages('palmerpenguins')
```

Now we can load in the package library, which stores the `penguins` dataset.

```r
library(palmerpenguins)
head(penguins)
```

Learn more about each variable in the documentation  

```r
?penguins
```

Let's take a look at its structure:

```r
str(penguins)
```


## Palmer Station weather

To practice data wrangling skills, this course will also use another data
set from the Antarctic LTER Program -- the 'Daily averaged weather timeseries
at Palmer Station, Antarctica'[[^2]], which includes various weather metrics
measured between 1989-2019. We'll read in these data directly from online and
name the data frame `weather`.

TODO: replace with `readr` functionality?

```r
weather <- read.csv("https://pasta.lternet.edu/package/data/eml/knb-lter-pal/28/9/a3b91017602b29acbf60e319d6a5e9bc")
```

These data have been made available through the Environmental Data Initiative
and more information can be found on the
<a href="https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-pal.28.9" target="_blank" rel="external noreferrer">EDI Data Portal</a>.

Let's take a look at the data's structure:

```r
str(weather)
```

Together this tutorial uses data collected from penguins across three islands
in the Palmer archipelago and weather sensing technology at the US Palmer
Station.


## References

[^1]: Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer Archipelago
      (Antarctica) penguin data. R package version 0.1.0.
      <https://allisonhorst.github.io/palmerpenguins/>. doi: 10.5281/zenodo.3960218.

[^2]: Palmer Station Antarctica LTER. 2023. Daily weather averages for Palmer
      Station, Antarctica (1989-2023) ver 9. Environmental Data Initiative.
      <https://doi.org/10.6073/pasta/3eefb45dbfb784c3cabe3690ea46fe9e>
      (Accessed 2024-01-04).
