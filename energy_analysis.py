import pandas as pd

# Load the GreenPower AI dataset
file_path = "GreenPowerAI_Energy_Dataset.csv"
df = pd.read_csv(file_path)

# Basic dataset information
print("GREENPOWER AI - ENERGY ANALYSIS")
print("-" * 35)
print("Dataset shape:", df.shape)
print("\nFirst 5 rows:")
print(df.head())

print("\nMissing values in each column:")
print(df.isnull().sum())

print("\nTotal energy consumption (kWh):",
      round(df["Energy_Consumption_kWh"].sum(), 2))

print("Average energy consumption (kWh):",
      round(df["Energy_Consumption_kWh"].mean(), 2))

print("\nEnergy consumption by building:")
print(
    df.groupby("Building")["Energy_Consumption_kWh"]
    .mean()
    .round(2)
    .sort_values(ascending=False)
)

# Save summary report
summary = df.groupby("Building")["Energy_Consumption_kWh"].agg(
    ["count", "mean", "sum"]
).round(2)

summary.to_csv(
    r"C:\Users\VICTUS\OneDrive\Desktop\GreenPower_AI\reports\building_energy_summary.csv"
)

print("\nSummary saved in the reports folder.")
