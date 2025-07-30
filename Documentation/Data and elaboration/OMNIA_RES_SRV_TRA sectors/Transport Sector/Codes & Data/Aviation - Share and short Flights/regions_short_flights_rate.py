import pandas as pd

# Function to split data into regions and process each region
def process_routes_by_region(routes_file, output_dir):
    # Read the routes file
    routes_df = pd.read_csv(routes_file)

    # List of unique source regions
    regions = routes_df['source_region'].unique()

    # List of unique source destinations
    destinations = routes_df['destination'].unique()

    # Dictionary to store percentage of total kilometers for short flights (<1000 km)
    short_flight_km_percentages = {}

    # Process each region
    for region in regions:
        if region == "Unknown":  # Skip if region is unknown
            continue
        
        # Filter data for the current region
        region_df = routes_df[routes_df['source_region'] == region]
        
        # Sort by flight distance
        region_df = region_df.sort_values(by='distance_km')

        # Save to a CSV file named after the region acronym
        output_file = f"{output_dir}/{region}.csv"
        region_df.to_csv(output_file, index=False)
        
        # Calculate total kilometers for all flights and for short flights (<150 km)
        total_km = region_df['distance_km'].sum()
        short_flights_km = region_df[region_df['distance_km'] < 500]['distance_km'].sum() 
        short_flight_km_percentage = (short_flights_km / total_km) * 100 if total_km > 0 else 0
        
        # Store the result
        short_flight_km_percentages[region] = short_flight_km_percentage

    # Return the percentage results
    return short_flight_km_percentages

# Main execution
if __name__ == "__main__":
    routes_file = "routes_with_regions.csv"  # Input file with routes and regions
    output_dir = "region_csvs"  # Directory to save region-specific CSV files

    print("Processing routes by region and calculating short flight distance percentages...")

    # Create the output directory if it doesn't exist
    import os
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Process the routes and calculate short flight distance percentages
    short_flight_km_percentages = process_routes_by_region(routes_file, output_dir)

    # Print results
    print("\nShort flight distance percentages (<500 km) by region:")
    for region, percentage in short_flight_km_percentages.items():
        print(f"{region}: {percentage:.2f}%")