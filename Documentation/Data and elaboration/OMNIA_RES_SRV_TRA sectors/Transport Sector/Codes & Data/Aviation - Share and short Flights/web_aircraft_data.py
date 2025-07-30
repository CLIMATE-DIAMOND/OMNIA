import requests
from bs4 import BeautifulSoup
import csv

url = "https://contentzone.eurocontrol.int/aircraftperformance/default.aspx"

# Send HTTP request to the page
response = requests.get(url)
soup = BeautifulSoup(response.content, 'html.parser')

# Example: Find all rows or tables containing aircraft data
aircraft_data = []  # Initialize a list for storing aircraft data

# Parse the data (modify selectors based on actual HTML structure)
for row in soup.find_all('tr'):  # Assuming each aircraft is in a <tr>
    cells = row.find_all('td')   # Assuming data is in <td> cells
    if cells:
        aircraft = [cell.get_text(strip=True) for cell in cells]
        aircraft_data.append(aircraft)

# Save to CSV
with open('aircraft_performance.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(aircraft_data)
    