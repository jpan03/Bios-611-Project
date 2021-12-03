import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import folium
import seaborn as sns
import os
plt.rcParams['figure.figsize'] = [10, 6]

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

#winter
winter2=pd.DataFrame()
for i in np.unique(hour):
    a=winter[winter['hour']==i][0:1]
    winter2=winter2.append(a)

# spring
spring2=pd.DataFrame()
for i in np.unique(hour):
    a=spring[spring['hour']==i][0:1]
    spring2=spring2.append(a)

# autumn
autumn2=pd.DataFrame()
for i in np.unique(hour):
    a=autumn[autumn['hour']==i][0:1]
    autumn2=autumn2.append(a)

# summer
summer2=pd.DataFrame()
for i in np.unique(hour):
    a=summer[summer['hour']==i][0:1]
    summer2=summer2.append(a)

##   
plt.plot(winter2['hour'],winter2['PM_2_5_10_Minute_Avg_'],label='winter')
plt.plot(spring2['hour'],spring2['PM_2_5_10_Minute_Avg_'],label='spring')
plt.plot(summer2['hour'],summer2['PM_2_5_10_Minute_Avg_'],label='summer')
plt.plot(autumn2['hour'],autumn2['PM_2_5_10_Minute_Avg_'],label='autumn')
plt.text(x=7,y=32,s='max:37.86 \n min: 2.09')
plt.axvline(x=21,c='darkblue')
plt.legend()
plt.xlabel('hour')
plt.ylabel('pm2.5_10')
plt.show()
max(winter2['PM_2_5_10_Minute_Avg_'])
print(max(winter2['PM_2_5_10_Minute_Avg_']))
plt.savefig("seasonal_daytime.png",bbox_inches="tight")
