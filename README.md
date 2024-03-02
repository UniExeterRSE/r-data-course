# Working with Data in R

This repository contains source code for the [Working with data in R](https://uniexeterrse.github.io/r-data-course/)
workshop website. This workshop is part of the Coding for Reproducible Research
initiative at the University of Exeter.

## Local deployment

### Install dependencies

This repo is designed to be deployed with GitHub Pages, but you can also deploy
it locally using [Jekyll](https://jekyllrb.com/). Jekyll is a
[gem](https://guides.rubygems.org/) for the Ruby language. The instructions
below assume you have installed:

* [Ruby](https://www.ruby-lang.org/) (note that installing Ruby also installs
  RubyGems for managing gems too).

* [Bundler](https://bundler.io/) to manage your Ruby gems. Bundler is itself a
  gem and can be installed by running `gem install bundler` (note: installing
  may require administrative privileges).

With these installed, run the following from the root folder of this
repository to install Jekyll:

```bash
# Ensure gems are installed within the vendor/bundle subdirectory of the repo
bundle config set --local path 'vendor/bundle'

# Install the required gems
bundle install
```


### Run a local server for the site

To start a local server with Jekyll, run

```bash
bundle exec jekyll serve
```

This will serve the site on <http://localhost:4000>.


## Acknowledgements

The source code in this repository for generating the
[Working with data in R](https://uniexeterrse.github.io/r-data-course/)
website is based on the University of Exeter `UoE-workshop-template` template
repository. This template was developed with help from this
[tutorial](https://github.com/evanwill/go-go-ghpages). It was inspired and
influenced by [The Carpentries' template](https://github.com/carpentries/workshop-template)
for creating websites for workshops.


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
