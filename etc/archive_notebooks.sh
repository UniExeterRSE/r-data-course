#!/bin/bash

# Note: run from the project root directory

starting_dir=$(pwd)
cd R_notebooks/
tar -cvzf ../assets/materials/course_materials.tar.gz 01_Introducing_Tidyverse.Rmd 02_Loading_data.Rmd 03_Manipulating_a_dataframe.Rmd 04_Piping.Rmd 05_Combining_datasets.Rmd 06_Reshaping_data.Rmd 07_Strings_and_dates.Rmd 08_Summary.Rmd Working_with_data_in_R.Rproj data/
zip -r ../assets/materials/course_materials.zip 01_Introducing_Tidyverse.Rmd 02_Loading_data.Rmd 03_Manipulating_a_dataframe.Rmd 04_Piping.Rmd 05_Combining_datasets.Rmd 06_Reshaping_data.Rmd 07_Strings_and_dates.Rmd 08_Summary.Rmd Working_with_data_in_R.Rproj data/
tar -cvzf ../assets/materials/complete_course_materials.tar.gz 01_Introducing_Tidyverse_complete.Rmd 02_Loading_data_complete.Rmd 03_Manipulating_a_dataframe_complete.Rmd 04_Piping_complete.Rmd 05_Combining_datasets_complete.Rmd 06_Reshaping_data_complete.Rmd 07_Strings_and_dates_complete.Rmd 08_Summary.Rmd Working_with_data_in_R.Rproj data/
zip -r ../assets/materials/complete_course_materials.zip 01_Introducing_Tidyverse_complete.Rmd 02_Loading_data_complete.Rmd 03_Manipulating_a_dataframe_complete.Rmd 04_Piping_complete.Rmd 05_Combining_datasets_complete.Rmd 06_Reshaping_data_complete.Rmd 07_Strings_and_dates_complete.Rmd 08_Summary.Rmd Working_with_data_in_R.Rproj data/
cd "$starting_dir"