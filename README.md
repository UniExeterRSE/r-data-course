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

This repository is based off the University of Exeter `UoE-workshop-template`
template repository. This template was developed with help from this
[tutorial](https://github.com/evanwill/go-go-ghpages). It was inspired and
influenced by [The Carpentries' template](https://github.com/carpentries/workshop-template)
for creating websites for workshops.
