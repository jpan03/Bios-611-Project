FROM rocker/verse
MAINTAINER Jiaqing Pan <jqp@unc.edu>
RUN apt update && apt-get -y update && apt-get install -y  libudunits2-dev libgdal-dev libgeos-dev libproj-dev
RUN R -e "install.packages(\"tidyverse\")"
RUN R -e "install.packages(\"data.table\")"
RUN R -e "install.packages(\"plyr\")"
RUN R -e "install.packages(\"tidygeocoder\")"
RUN R -e "install.packages(\"usmap\")"
RUN R -e "install.packages(\"here\")"
RUN R -e "install.packages(\"tidycensus\")"
RUN R -e "install.packages(\"labelled\")"
RUN R -e "install.packages(\"ggExtra\")"
RUN R -e "install.packages(\"patchwork\")"
RUN R -e "install.packages(\"tidycensus\")"
RUN R -e "install.packages(\"shiny\")"
RUN R -e "install.packages(\"shinythemes\")"
RUN R -e "install.packages(\"dplyr\")"
RUN R -e "install.packages(\"ggExtra\")"
RUN R -e "install.packages(\"maps\")"
RUN R -e "install.packages(\"ggplot2\")"
RUN R -e "install.packages(\"patchwork\")"
RUN R -e "install.packages(\"labelled\")"
RUN R -e "install.packages(\"ggthemes\")"
RUN R -e "install.packages(\"lubridate\")"
RUN R -e "install.packages(\"plotly\")"
RUN R -e "install.packages(\"ggalt\")"
RUN R -e "install.packages(\"leaflet\")"
RUN R -e "install.packages(\"tinytex\"); tinytex::install_tinytex(dir=\"/opt/tinytex\");"
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install pandas
RUN pip3 install seaborn
RUN pip3 install datetime
RUN pip3 install folium
RUN pip3 install matplotlib
RUN pip3 install numpy
