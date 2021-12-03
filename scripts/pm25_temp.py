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
# Temp__F_
plt.scatter(f['Temp__F_'],f['PM_2_5_10_Minute_Avg_'],label='Temp',alpha=1/10)
plt.legend()
plt.xlabel('Temp')
plt.ylabel('pm2.5_10')
plt.show()
plt.savefig("pm25_temp.png",bbox_inches="tight")