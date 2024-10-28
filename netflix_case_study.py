import csv
import pandas as pd
import math
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('netflix_userbase.csv')

df['Join Date'] = pd.to_datetime(df['Join Date'], format='%d-%m-%y')
df['Last Payment Date'] = pd.to_datetime(df['Last Payment Date'], format='%d-%m-%y')
df['Subscription_Length_Days'] = (df['Last Payment Date'] - df['Join Date']).dt.days
df['Subscription_Length_Months'] = df['Subscription_Length_Days'].apply(lambda x: int(math.ceil(x / 30)))

plt.figure(figsize=(10, 6))
sns.boxplot(x='Subscription Type', y='Subscription_Length_Months', data=df)

plt.title('Distribution of Subscription Length by Subscription Type')
plt.xlabel('Subscription Type')
plt.ylabel('Subscription Length (Months)')
plt.xticks(rotation=45)


plt.tight_layout()
plt.show()

