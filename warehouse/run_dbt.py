import os
from dotenv import load_dotenv
import subprocess

# Load environment variables from .env file
load_dotenv()

# Run dbt commands
print("Running dbt clean...")
subprocess.run(["dbt", "clean"])
print("Running dbt run...")
subprocess.run(["dbt", "run"])
print("Running dbt test...")
subprocess.run(["dbt", "test"])