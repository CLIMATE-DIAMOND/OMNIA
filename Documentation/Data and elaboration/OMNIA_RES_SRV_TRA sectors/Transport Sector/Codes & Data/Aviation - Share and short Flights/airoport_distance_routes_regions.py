import pandas as pd
import csv
from math import radians, sin, cos, sqrt, atan2

# Function to calculate great-circle distance (in km) between two points on the Earth
# using the Haversine formula.
def haversine(lat1, lon1, lat2, lon2):
    R = 6371  # Earth's radius in kilometers
    # Convert degrees to radians
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    # Compute deltas
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    # Apply Haversine formula
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c  # Distance in kilometers

# Function to load airport data from a .dat or .csv file.
# It maps IATA airport codes to a dictionary with country, latitude, and longitude.
def load_airport_data_with_country(airports_file):
    airports = {}
    with open(airports_file, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            try:
                iata = row[4]  # IATA airport code
                country = row[3]
                latitude = float(row[6])
                longitude = float(row[7])
                airports[iata] = {
                    'country': country,
                    'latitude': latitude,
                    'longitude': longitude
                }
            except (IndexError, ValueError):
                continue  # Skip rows with missing or invalid data
    return airports

# Function to load regional mappings from an Excel file.
# The first column contains region names; remaining columns contain countries.
def load_region_data_from_excel(region_file):
    country_to_region = {}
    df = pd.read_excel(region_file, sheet_name=0)  # Load the first worksheet
    for _, row in df.iterrows():
        region = row.iloc[0]  # Region name
        countries = row.iloc[1:]  # List of countries in that region
        for country in countries.dropna():
            country_to_region[country.strip()] = region
    return country_to_region

# Function to read route data, compute distances, and associate each route
# with both source and destination regions (via country mapping).
def calculate_routes_with_regions(routes_file, airports, country_to_region):
    route_data = []
    with open(routes_file, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            try:
                source = row[2]  # Source airport IATA code
                destination = row[4]  # Destination airport IATA code
                if source in airports and destination in airports:
                    # Look up source and destination metadata
                    src_country = airports[source]['country']
                    dest_country = airports[destination]['country']
                    src_region = country_to_region.get(src_country, "Unknown")
                    dest_region = country_to_region.get(dest_country, "Unknown")
                    lat1, lon1 = airports[source]['latitude'], airports[source]['longitude']
                    lat2, lon2 = airports[destination]['latitude'], airports[destination]['longitude']
                    distance = haversine(lat1, lon1, lat2, lon2)
                    
                    # Append all relevant route metadata
                    route_data.append({
                        'source': source,
                        'source_country': src_country,
                        'source_region': src_region,
                        'destination': destination,
                        'destination_country': dest_country,
                        'destination_region': dest_region,
                        'distance_km': distance
                    })
            except (IndexError, ValueError):
                continue  # Skip invalid rows
    return route_data

# Writes the resulting enriched route data into a CSV file
def write_routes_with_regions(output_file, route_data):
    with open(output_file, 'w', encoding='utf-8', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=[
            'source', 'source_country', 'source_region',
            'destination', 'destination_country', 'destination_region',
            'distance_km'
        ])
        writer.writeheader()
        writer.writerows(route_data)

# Main script execution
if __name__ == "__main__":
    airports_file = "airports.dat"  # Input: airport information
    routes_file = "routes.dat"  # Input: flight routes
    region_file = "OMNIA_regions_adopted_IEA.xlsx"  # Input: regional mapping
    output_file = "routes_with_regions.csv"  # Output: enriched route data

    print("Loading airport data...")
    airports = load_airport_data_with_country(airports_file)

    print("Loading region data from Excel file...")
    country_to_region = load_region_data_from_excel(region_file)

    print("Processing routes and associating regions...")
    route_data = calculate_routes_with_regions(routes_file, airports, country_to_region)

    print("Writing route data with regions to output file...")
    write_routes_with_regions(output_file, route_data)

    print(f"Done! Route data with regions saved to {output_file}.")

# Load and display the final dataset (optional, for verification)
data = pd.read_csv("routes_with_regions.csv")
data.head()  # Displays first few rows