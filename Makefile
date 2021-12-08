.PHONY: clean
.PHONY: shiny
.RECIPEPREFIX=>

figures/seasonal_analysis.png: scripts/seasonal_analysis.py source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/seasonal_analysis.py

figures/pm25_temp.png: scripts/pm25_temp.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/pm25_temp.py

figures/seasonal_temp.png: scripts/seasonal_temp.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/seasonal_temp.py

figures/pm25_humi.png: scripts/pm25_humi.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/pm25_humi.py

figures/seasonal_humi.png: scripts/seasonal_humi.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/seasonal_humi.py

figures/pm25_pre.png: scripts/pm25_pre.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/pm25_pre.py

figures/seasonal_pre.png: scripts/seasonal_pre.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/seasonal_pre.py

figures/seasonal_daytime.png: scripts/seasonal_daytime.py\
source_data/Local_Air_Quality.csv
> mkdir -p figures
> python3 scripts/seasonal_daytime.py

report.html: Local_Air_Quality.csv figures/seasonal_analysis.png figures/pm25_temp.png figures/seasonal_temp.png figures/pm25_humi.png figures/seasonal_humi.png figures/pm25_pre.png figures/seasonal_pre.png figures/seasonal_daytime.png
> jupyter nbconvert --to html report.ipynb

clean:
> rm -f derived_data/*.csv
> rm -f figures/*.png
> rm -f report.html



# Shiny setup
shiny: scripts/shiny.R
> Rscript scripts/shiny.R ${PORT}