---
layout: info_page
title: Installation Guide
---

In order to fully participate in this course, you should bring a laptop to work
on during the sessions and make sure you have the following installed on it
**before** the first session.

- R, version 4.1 or later. You can install this from the University's
  Company Portal software repository. Alternatively, visit
  <a href="https://cran.rstudio.com" target="_blank" rel="external noreferrer">https://cran.rstudio.com</a>,
  or adopt whatever method you usually use.
  
- RStudio desktop. You can download this from the University's
  Company Portal software repository. Alternatively, visit
  <a href="https://posit.co/download/rstudio-desktop/" target="_blank" rel="external noreferrer">https://posit.co/download/rstudio-desktop/</a>.
  We will use RStudio to work with R notebooks throughout the course. If you have
  another way of working with R notebooks that you prefer, then you are welcome
  to use this, but we recommend using RStudio if you're unsure.

- Ensure you have following R packages installed:
  - `tidyverse`
  - `palmerpenguins` (This contains a dataset we'll use in examples during the
    course.)
  
  If you need a refresher on installing R packages, consult the
  [resources page]({{ site.url }}/resources.html). (Note: if you use a package
  management system for managing your R packages, such as
  <a href="https://rstudio.github.io/renv/" target="_blank" rel="external noreferrer">renv</a>,
  then you are of course free to use this.)

Finally, you will also need to **download the course materials**:

- Zip archive: [course_materials.zip]({{ site.url }}/assets/materials/course_materials.zip)
- Tar gzip archive: [course_materials.tar.gz]({{ site.url }}/assets/materials/course_materials.tar.gz)

These contain R notebooks and datasets that will be worked through in the course
sessions. The notebooks are designed to work with the relative directory
structure in the archives, so it's best not to change this structure! We suggest
you place the archive in a directory specifically for this course and then
unpack the contents within this directory. You will also find an R project file
`Working_with_data_in_R.Rproj`: double-clicking on this should open RStudio at
the correct directory containing all the notebooks.
