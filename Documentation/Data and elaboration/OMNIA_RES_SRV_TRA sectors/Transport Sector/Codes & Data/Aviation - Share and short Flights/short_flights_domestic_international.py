import pandas as pd
import os

# Function to determine flight type
def classify_flight_type(row):
    return 'Domestic' if row['source_country'] == row['destination_country'] else 'International'

# Process and compute short/long breakdown per region
def process_per_region_flight_stats(routes_file, output_csv="flight_type_stats_by_region.csv"):
    routes_df = pd.read_csv(routes_file)
    routes_df['flight_type'] = routes_df.apply(classify_flight_type, axis=1)

    results = []

    all_regions = routes_df['source_region'].unique()

    for region in all_regions:
        if region == "Unknown":
            continue

        region_df = routes_df[routes_df['source_region'] == region]
        region_total_km = region_df['distance_km'].sum()

        for flight_type in ['Domestic', 'International']:
            sub_df = region_df[region_df['flight_type'] == flight_type]
            total_km = sub_df['distance_km'].sum()
            short_km = sub_df[sub_df['distance_km'] < 500]['distance_km'].sum()
            long_km = total_km - short_km

            result = {
                "region": region,
                "flight_type": flight_type,
                "share_of_total_km": (total_km / region_total_km) * 100 if region_total_km > 0 else 0,
                "short_km_pct": (short_km / total_km) * 100 if total_km > 0 else 0,
                "long_km_pct": (long_km / total_km) * 100 if total_km > 0 else 0,
            }
            results.append(result)

    summary_df = pd.DataFrame(results)

    # Reorder the DataFrame based on the specified region order
    region_order = [
        "AFE", "AFN", "AFW", "AFZ", "ANZ", "ASC", "ASE", "ASO",
        "BRA", "CAN", "CHL", "CHN", "ENE", "ENW", "EUE", "EUM", "EUW",
        "IDN", "IND", "JPN", "LAM", "MDA", "MEA", "MEX", "NIG", "RUS", "SKT", "USA"
    ]
    summary_df['region'] = pd.Categorical(summary_df['region'], categories=region_order, ordered=True)
    summary_df = summary_df.sort_values(['region','flight_type'])

    # Save the result
    summary_df.to_csv(output_csv, index=False)
    print(f"\n✔️ Regional flight stats saved to: {output_csv}")

    return summary_df

# Main block
if __name__ == "__main__":
    routes_file = "routes_with_regions.csv"  # Replace with actual path if needed
    output_csv = "flight_type_stats_by_region.csv"
    summary_df = process_per_region_flight_stats(routes_file, output_csv=output_csv)
    print(summary_df)
