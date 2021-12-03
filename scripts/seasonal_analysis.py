import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

f=pd.read_csv('Local_Air_Quality.csv')
time=f['Last_Check']
pm2_5=f['PM_2_5_10_Minute_Avg_']

month=[]
for i in time:
    d=i.split()[0].split('/')[1]
    month.append(int(d))

d={12:'winter',1:'winter',2:'winter',
   3:'spring',4:'spring',5:'spring',6:'summer',7:'summer',8:'summer',
  9:'autumn',10:'autumn',11:'autumn'}

season=[]
for i in month:
    season.append(d[i])

f['season']=season

# 

hour=[]
for i in time:
    a=i.split()[1].split(':')[0]
    hour.append(int(a))
f['hour']=hour
#
winter=f[f['season']=='winter']
spring=f[f['season']=='spring']
summer=f[f['season']=='summer']
autumn=f[f['season']=='autumn']
#
plt.plot(winter['Last_Check'],winter['PM_2_5_10_Minute_Avg_'],label='winter')
plt.plot(spring['Last_Check'],spring['PM_2_5_10_Minute_Avg_'],label='spring')
plt.plot(summer['Last_Check'],summer['PM_2_5_10_Minute_Avg_'],label='summer')
plt.plot(autumn['Last_Check'],autumn['PM_2_5_10_Minute_Avg_'],label='autumn')
plt.legend()
plt.xlabel('time')
plt.ylabel('pm2.5_10')
plt.xticks([f['Last_Check'][i] for i in range(0,len(f['Last_Check']),3000)], rotation=90)
plt.show()
plt.savefig("seasonal_analysis.png",bbox_inches="tight")