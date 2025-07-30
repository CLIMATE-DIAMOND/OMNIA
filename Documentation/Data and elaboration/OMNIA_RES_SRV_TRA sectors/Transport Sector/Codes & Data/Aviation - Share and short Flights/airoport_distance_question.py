import csv
from math import radians, sin, cos, sqrt, atan2

# Function to calculate the distance using the Haversine formula
def haversine(lat1, lon1, lat2, lon2):
    R = 6371  # Earth's radius in kilometers
    # Convert degrees to radians
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    # Haversine formula
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

# Function to load airport data from the OpenFlights CSV
def load_airport_data(file_path):
    airports = {}
    with open(file_path, 'r', encoding='utf-8') as file:  # Explicitly set the encoding to utf-8
        reader = csv.reader(file)
        for row in reader:
            try:
                # Extract required fields: ID, Name, IATA/FAA, Latitude, Longitude
                airport_id = row[0]
                name = row[1]
                iata = row[4]
                latitude = float(row[6])
                longitude = float(row[7])
                airports[iata] = (name, latitude, longitude)
            except (IndexError, ValueError):
                # Skip rows with missing or invalid data
                continue
    return airports

# Function to calculate distance between two airports by IATA code
def get_airport_distance(file_path, airport_code1, airport_code2):
    airports = load_airport_data(file_path)
    if airport_code1 not in airports or airport_code2 not in airports:
        return "One or both airport codes not found."
    
    name1, lat1, lon1 = airports[airport_code1]
    name2, lat2, lon2 = airports[airport_code2]
    distance = haversine(lat1, lon1, lat2, lon2)
    
    return f"The distance between {name1} ({airport_code1}) and {name2} ({airport_code2}) is {distance:.2f} km."

# Example usage
if __name__ == "__main__":
    # Path to the OpenFlights database CSV file
    file_path = "C:\Users\mmalliar\OneDrive - Imperial College London\Documents\Imperial\DIAMOND\WP3\Transport secor\share of small planes"
    
    # Replace these with the IATA codes of the airports you want to calculate the distance between
    airport_code1 = input("Enter the IATA code for the first airport: ").upper()
    airport_code2 = input("Enter the IATA code for the second airport: ").upper()
    
    # Calculate and print the distance
    print(get_airport_distance(file_path, airport_code1, airport_code2))