---
layout: home
title: Course Information
---


## Overview

Over two sessions, learn how to use the Tidyverse to work with data in R. The
Tidyverse is a collection of R packages designed to help you manipulate, clean
and analyse data. This course will introduce you to the functionality of several
key packages, while also discussing some of the conventions the Tidyverse uses
when working with data. By the end of the course, participants should feel
confident to continue using the Tidyverse to work with datasets in R.


## Course objectives

On completion of this series of workshops, participants will:

- Be able to explain what is meant by the 'tidy' format (a widely recognised
  convention for structuring data).

- Know how to read tabular data from a file to a dataframe.

- Be able to manipulate datasets, including creating new variables, filtering
  data, summarising and sorting data.

- Know how to join multiple datasets together and reshape data.

- Learn how to work with strings and dates (as time permits).

- Gain hands on experience working with R notebooks for analysis.


## Pre-requisite knowledge

This course is for participants who already have some programming experience
with R. It assumes familiarity with things like: creating and setting variables,
the basic data structures (dataframes, vectors, lists), using functions, running
R code and viewing console output, installing R packages and using R packages in
your own code. Experience with R notebooks is _not_ required.


## Workshop format

This is a hybrid workshop that runs over 2 sessions. The
[schedule can be found here]({{ site.url }}/schedule.html). _Please note that you will be
expected to attend both sessions._


## Upcoming course dates

The sessions will be delivered according to the following timetable.

| Session | Dates | Time  | Venue |
| --- |--- |--- |--- | --- |
| Session 1 | 12 March 2024 | 1pm – 4pm | Training Room 4, Old Library, Streatham Campus |
| Session 2 | 19 March 2024 | 1pm – 4pm | Training Room 4, Old Library, Streatham Campus |


Registration for this course is handled by
<a href="https://www.exeter.ac.uk/research/doctoralcollege/early-career-researchers/traininganddevelopment/rdprogramme/" target="_blank" rel="external noreferrer">University of Exeter Researcher Development</a> (see the Software Training section).


## Set-up instructions for attendees

If you have registered for this course you can find the
[instructions for setting up your computer and the course materials here]({{ site.url }}/setup.html).
Also take a look at [additional resources and supplementary material]({{site.url }}/resources.html) for the course.


## Course notes

{% if site.notes_on %}
If you are unable to attend any of the dates above, the
<a href="{{ site.url }}/contents.html">full course notes</a> are freely available
for you to work through. Please note that you will need to have completed the
set up instructions linked above.
{% else %}
If you are unable to attend any of the dates above, the
<a href="{{ site.url }}/contents_off.html">full course notes</a> will be made freely
available for you to work through after the sessions. Please note that you will
need to have completed the set up instructions linked above.
{% endif %}


## Follow-up courses

On completion of this course you will be invited to join a network of other
participants. This is a supportive forum for you to ask follow-up questions and
receive invites to follow-on courses.


## Feedback

Please remember to complete a feedback survey at the end of the course. Our
workshops are under continual review and your experiences, suggestions and
criticism are invaluable for shaping the direction of this initiative. This is
especially important if you complete the materials in your own time, as it
enables us to measure impact. If you have ideas on other courses you would like
to see then please contact Eilis Hannon: <E.J.hannon@exeter.ac.uk>.


## Join us

If you are interested in becoming part of our community of workshop helpers,
leaders and developers please contact Eilis Hannon: <E.J.Hannon@exeter.ac.uk>.


## Acknowledgements

This course was developed by
[members]({{ site.url }}/acknowledgements.html) of the
University of Exeter's Research Software Engineering Group
who are enthusiastic about sharing their skills with the wider research
community.

If you have benefited in any way from this course and want to support its long term
sustainability then please take the time to complete our feedback survey,
recommend it to your colleagues, and enthuse about it to your senior leadership
team.

This workshop is brought to you by:

- The University of Exeter <a href="https://www.exeter.ac.uk/research/idsai/team/researchsoftwareengineers/" target="_blank" rel="external noreferrer">Research Software Engineering Group</a>
- The <a href="https://www.exeter.ac.uk/research/idsai/" target="_blank" rel="external noreferrer">Institute of Data Science and Artificial Intelligence</a>
- The University of Exeter <a href="https://www.exeter.ac.uk/research/doctoralcollege/early-career-researchers/traininganddevelopment/rdprogramme/" target="_blank" rel="external noreferrer">Researcher Development Programme</a>
- The University of Exeter <a href="https://www.exeter.ac.uk/research/doctoralcollege/" target="_blank" rel="external noreferrer">Doctoral College</a>

### Course material and datasets

The course material is adapted from Eliza Wood's
<a href="https://liza-wood.github.io/tidyverse_intro/" target="_blank" rel="external noreferrer">Tidyverse: Data wrangling & visualization</a>
course, which is licensed under
<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank" rel="external noreferrer">Creative Commons BY-NC-SA 4.0</a>.
This in itself is based on material from <a href="https://gge-ucd.github.io/R-DAVIS/index.html" target="_blank" rel="external noreferrer">UC Davis's R-DAVIS course</a>,
which draws heavily on <a href="https://datacarpentry.org/R-ecology-lesson/" target="_blank" rel="external noreferrer">Carpentries</a> R lessons.
The penguin artwork is from Allison Horst <a href="https://allisonhorst.com/" target="_blank" rel="external noreferrer">@allison_horst</a>.

The following datasets are used throughout the course:

- Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer Archipelago
  (Antarctica) penguin data. R package version 0.1.1.
  <a href="https://allisonhorst.github.io/palmerpenguins/" target="_blank" rel="external noreferrer">https://allisonhorst.github.io/palmerpenguins/</a>.
  doi: 10.5281/zenodo.3960218.

- Palmer Station Antarctica LTER. 2023. Daily weather averages for Palmer Station,
  Antarctica (1989-2023) ver 9. Environmental Data Initiative.
  <a href="https://doi.org/10.6073/pasta/3eefb45dbfb784c3cabe3690ea46fe9e" target="_blank" rel="external noreferrer">https://doi.org/10.6073/pasta/3eefb45dbfb784c3cabe3690ea46fe9e</a>
  (accessed 2024-01-08). (Further details available from the data README in the
  course materials and relevant course notebooks.)

- Friedlingstein, P., et al. (2023). Global Carbon Budget 2023, Earth Syst. Sci.
  Data, 15, 5301–5369, <a href="https://doi.org/10.5194/essd-15-5301-2023" target="_blank" rel="external noreferrer">https://doi.org/10.5194/essd-15-5301-2023</a>.
  Fossil CO2 emissions by country (territorial) data obtained from
  <a href="https://globalcarbonbudgetdata.org/downloads/latest-data/National_Fossil_Carbon_Emissions_2023v1.0.xlsx" target="_blank" rel="external noreferrer">https://globalcarbonbudgetdata.org/downloads/latest-data/National_Fossil_Carbon_Emissions_2023v1.0.xlsx</a>
  (accessed 2024-02-28). We acknowledge the Global Carbon Project, which is
  responsible for the Global Carbon Budget and we thank the fossil carbon
  emissions modelling groups for producing and making available their model
  output. (Further details available from the data README in the course
  materials and relevant course notebooks.)
