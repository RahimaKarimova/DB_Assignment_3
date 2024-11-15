import pandas as pd
from sqlalchemy import create_engine

# Load the dataset from a CSV file
data = pd.read_csv('/Unnormalized1.csv')  # Path inside the container

# PostgreSQL connection string
# Since you're running inside the container, 'localhost' refers to the PostgreSQL service
engine = create_engine('postgresql://postgres:timetowork17@localhost:5432/assignment_3')

# Write data to the PostgreSQL table
try:
    data.to_sql('unnormalizedData', engine, if_exists='append', index=False)  # Replace table name if needed
    print("Data has been successfully loaded into PostgreSQL.")
except Exception as e:
    print(f"An error occurred: {e}")
