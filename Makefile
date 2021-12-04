.PHONY: clean
.PHONY: shiny
.RECIPEPREFIX=>

seasonal_analysis.png: scripts/seasonal_analysis.py Local_Air_Quality.csv
> python3 seasonal_analysis.py

pm25_temp.png: scripts/pm25_temp.py Local_Air_Quality.csv
> python3 pm25_temp.py

seasonal_temp.png: scripts/seasonal_temp.py Local_Air_Quality.csv
> python3 seasonal_temp.py

pm25_humi.png: scripts/pm25_humi.py Local_Air_Quality.csv
> python3 pm25_humi.py

seasonal_humi.png: scripts/seasonal_humi.py Local_Air_Quality.csv
> ython3 seasonal_humi.py

pm25_pre.png: scripts/pm25_pre.py Local_Air_Quality.csv
> python3 pm25_pre.py

seasonal_pre.png: scripts/seasonal_pre.py Local_Air_Quality.csv
> python3 seasonal_pre.py

seasonal_daytime.png: scripts/seasonal_daytime.py Local_Air_Quality.csv
> python3 seasonal_daytime.py

report.html: Local_Air_Quality.csv seasonal_analysis.png pm25_temp.png seasonal_temp.png pm25_humi.png seasonal_humi.png pm25_pre.png seasonal_pre.png seasonal_daytime.png
> jupyter nbconvert --to html report.ipynb

clean:
	rm -f derived_data/*.csv
	rm -f figures/*.png
	rm -f report.html



# Shiny setup
shiny: scripts/shiny.R
	Rscript scripts/shiny.R ${PORT}