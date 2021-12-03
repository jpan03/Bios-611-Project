import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import folium
import seaborn as sns
import os


f=pd.read_csv('Local_Air_Quality.csv')
time=f['Last_Check']
pm2_5=f['PM_2_5_10_Minute_Avg_']

plt.rcParams['figure.figsize'] = [10, 6]
# Humidity____
plt.scatter(f['Humidity____'],f['PM_2_5_10_Minute_Avg_'],label='Humidity',alpha=1/10)
plt.legend()
plt.xlabel('Humidity')
plt.ylabel('pm2.5_10')
plt.show()
plt.savefig("pm25_humi.png",bbox_inches="tight")