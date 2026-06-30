import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql://postgres:postgres@localhost:5433/ny_taxi")

print("Loading taxi zone lookup...")
zones = pd.read_csv("data/taxi_zone_lookup.csv")
zones.to_sql("taxi_zone_lookup", engine, if_exists="replace", index=False)
print("Loaded taxi_zone_lookup")

print("Loading green taxi trips...")
trips = pd.read_parquet("data/green_tripdata_2025-11.parquet")
trips.to_sql("green_tripdata_2025_11", engine, if_exists="replace", index=False)
print("Loaded green_tripdata_2025_11")

print("Done!")