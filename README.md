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

The course material is adapted from Eliza Wood's
<a href="https://liza-wood.github.io/tidyverse_intro/" target="_blank" rel="external noreferrer">Tidyverse: Data wrangling & visualization</a>
course, which is licensed under
<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank" rel="external noreferrer">Creative Commons BY-NC-SA 4.0</a>.
This in itself is based on material from <a href="https://gge-ucd.github.io/R-DAVIS/index.html" target="_blank" rel="external noreferrer">UC Davis's R-DAVIS course</a>,
which draws heavily on <a href="https://datacarpentry.org/R-ecology-lesson/" target="_blank" rel="external noreferrer">Carpentries</a> R lessons.
The penguin artwork is from Allison Horst <a href="https://allisonhorst.com/" target="_blank" rel="external noreferrer">@allison_horst</a>.

The source code in this repository for generating the
[Working with data in R](https://uniexeterrse.github.io/r-data-course/)
website is based on the University of Exeter `UoE-workshop-template` template
repository. This template was developed with help from this
[tutorial](https://github.com/evanwill/go-go-ghpages). It was inspired and
influenced by [The Carpentries' template](https://github.com/carpentries/workshop-template)
for creating websites for workshops.
