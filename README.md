# Project Overview
All data and files in this repository are used for the final project of [BIOS 611 Introduction to Data Science](https://github.com/Vincent-Toups/datasci611),  at the University of North Carolina at Chapel Hill.

# Summary
This dataset https://opendata-townofchapelhill.hub.arcgis.com/datasets/local-air-quality/explore?location=-0.000000%2C0.000000%2C1.56 contains air quality data collected using a PurpleAir Dual Laser Air Quality Sensor located at the Chapel Hill Public Library. The sensor measures fine airborne particulate matter with a diameter of 2.5 microns (PM 2.5) or less.
# Using This Project
*Attention: You will use [Docker](https://www.docker.com/)  to run this repository.

**Step 1:**
Fork and clone this repository to your local environment (if you don't know to do it, read [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo) for more instructions)

**Step 2:**
Build the docker image by using following:

    docker build . -t jpan03


**Step 1:**
To run RStudio, enter the following command:

    docker run -p 8787:8787 -p 8080:8080 -e PASSWORD=123456 -v ${pwd}:/home/rstudio -it jpan03


After you connected it, then open Browser, and navigate to http://localhost:8787/.

# Shiny App
To run Shiny app, you could explore more information about this data.

**Step 1:**


    docker run -p 8787:8787 -p 8080:8080 -e PASSWORD=123456 -v ${pwd}:/home/rstudio -it jpan03

**Step 2:**
Navigating to your terminal within rstudio and type the following:

    cd scripts; Rscript shiny.R
Then, you could access your http://localhost:8080/ on your browser

 


