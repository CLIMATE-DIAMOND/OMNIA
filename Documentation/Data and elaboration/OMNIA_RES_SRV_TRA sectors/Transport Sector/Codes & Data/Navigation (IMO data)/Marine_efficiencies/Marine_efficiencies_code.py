# Maria Ioanna Malliaroudaki . Imperial College London 2025

# Import necessary libraries
import pandas as pd
# ## Note
# The Marine_efficiencies_code was not used at the end but can be used as a starting point by another user to calculate shares between different types of shipping so thats why it is kept.
# Load Table 2 data
data_table2 = {
    "Ship Type": ["Bulk carrier", "Combination carrier", "Containership", "Cruise passenger ship", "Gas carrier", 
                  "General cargo ship", "LNG carrier", "Others", "Passenger ship", "Refrigerated cargo carrier", 
                  "Ro-ro cargo ship", "Ro-ro cargo ship (vehicle carrier)", "Ro-ro passenger ship", "Tanker"],
    "Diesel / Gas Oil (MDO / MGO) [tonnes]": [4439407, 13194, 4603965, 1688243, 608368, 1294802, 412077, 2852728, 210449, 168138, 
                                      393117, 779788, 755592, 5905242],
    "Heavy Fuel Oil (HFO) [tonnes]": [49427538, 100701, 52095315, 4950051, 4692209, 5341618, 2953889, 5007311, 583761, 1230226, 
                              1859403, 5226774, 2153461, 35805879],
    "Light Fuel Oil (LFO) [tonnes]": [871288, 4191, 2871069, 6015, 166454, 170615, 293183, 365496, 1385, 63545, 310136, 146343, 
                              625112, 1035229],
    "Liquefied Natural Gas (LNG) [tonnes]": [0, 0, 24893, 23209, 2733961, 8025, 7494993, 43399, 0, 0, 6167, 0, 69381, 78714]
}

data_table3 = {
    "Ship Type": ["Bulk carrier", "Combination carrier", "Containership", "Cruise passenger ship", "Gas carrier", 
                  "General cargo ship", "LNG carrier", "Others", "Passenger ship", "Refrigerated cargo carrier", 
                  "Ro-ro cargo ship", "Ro-ro cargo ship (vehicle carrier)", "Ro-ro passenger ship", "Tanker"],
    "Distance Travelled": [509249047, 1117911, 344843744, 20318620, 54365472, 98353160, 36945565, 58212490, 3464474, 
                            15866234, 21877441, 59864962, 21647299, 316372723]
}

# Convert dictionaries to dataframes
df_table2 = pd.DataFrame(data_table2)
df_table3 = pd.DataFrame(data_table3)

# Calculate fuel percentages for each ship type
fuel_columns = ["Diesel / Gas Oil (MDO / MGO) [tonnes]", "Heavy Fuel Oil (HFO) [tonnes]", "Light Fuel Oil (LFO) [tonnes]", "Liquefied Natural Gas (LNG) [tonnes]"]
df_table2["Total Fuel"] = df_table2[fuel_columns].sum(axis=1)

for fuel in fuel_columns:
    percentage_column = f"{fuel} (%)"
    df_table2[percentage_column] = (df_table2[fuel] / df_table2["Total Fuel"]) * 100

# Calculate efficiency: fuel used per distance travelled
df_efficiency = df_table2.merge(df_table3, on="Ship Type")
df_efficiency["Fuel Used per Distance"] = df_efficiency["Total Fuel"] / df_efficiency["Distance Travelled"]

# Display results
print("Fuel Percentages by Ship Type:")
print(df_table2[["Ship Type"] + [f"{fuel} (%)" for fuel in fuel_columns]])

print("\nEfficiency (Fuel Used per Distance Travelled):")
print(df_efficiency[["Ship Type", "Fuel Used per Distance"]])

