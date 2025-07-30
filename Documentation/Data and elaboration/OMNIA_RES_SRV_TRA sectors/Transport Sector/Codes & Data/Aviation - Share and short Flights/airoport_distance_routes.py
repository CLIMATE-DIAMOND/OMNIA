import csv
from math import radians, sin, cos, sqrt, atan2

# Haversine formula to calculate distance
def haversine(lat1, lon1, lat2, lon2):
    R = 6371  # Earth's radius in kilometers
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

# Load airport data with country
def load_airport_data_with_country(airports_file):
    airports = {}
    with open(airports_file, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            try:
                iata = row[4]
                country = row[3]
                latitude = float(row[6])
                longitude = float(row[7])
                airports[iata] = {'country': country, 'latitude': latitude, 'longitude': longitude}
            except (IndexError, ValueError):
                continue
    return airports

# Calculate route distances and country associations
def calculate_routes_with_countries(routes_file, airports):
    route_data = []
    with open(routes_file, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            try:
                source = row[2]  # Source airport IATA
                destination = row[4]  # Destination airport IATA
                if source in airports and destination in airports:
                    src_country = airports[source]['country']
                    dest_country = airports[destination]['country']
                    lat1, lon1 = airports[source]['latitude'], airports[source]['longitude']
                    lat2, lon2 = airports[destination]['latitude'], airports[destination]['longitude']
                    distance = haversine(lat1, lon1, lat2, lon2)
                    route_data.append({
                        'source': source,
                        'source_country': src_country,
                        'destination': destination,
                        'destination_country': dest_country,
                        'distance_km': distance
                    })
            except (IndexError, ValueError):
                continue
    return route_data

# Write route data with country to a CSV file
def write_routes_to_file(output_file, route_data):
    with open(output_file, 'w', encoding='utf-8', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=[
            'source', 'source_country', 'destination', 'destination_country', 'distance_km'
        ])
        writer.writeheader()
        writer.writerows(route_data)

# Main execution
if __name__ == "__main__":
    airports_file = "airports.dat"  # Path to airports.dat
    routes_file = "routes.dat"  # Path to routes.dat
    output_file = "routes_with_countries.csv"  # Output file

    print("Loading airport data...")
    airports = load_airport_data_with_country(airports_file)

    print("Processing routes and associating countries...")
    route_data = calculate_routes_with_countries(routes_file, airports)

    print("Writing route data to output file...")
    write_routes_to_file(output_file, route_data)

    print(f"Done! Route data with countries saved to {output_file}.")