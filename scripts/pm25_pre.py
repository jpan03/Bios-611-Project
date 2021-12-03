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
# Pressure__mbar_
plt.scatter(f['Pressure__mbar_'],f['PM_2_5_10_Minute_Avg_'],label='Pressure',alpha=1/10)
plt.legend()
plt.xlabel('Pressure__mbar_')
plt.ylabel('pm2.5_10')
plt.show()
plt.savefig("pm25_pre.png",bbox_inches="tight")