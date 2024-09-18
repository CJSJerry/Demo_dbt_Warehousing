import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Load database url from the .env file from one level up
load_dotenv('../.env')
DATABASE_URL = os.getenv("DATABASE_URL").strip()

# Setup connection
engine = create_engine(DATABASE_URL)

# Define queries
# Query 1: Number of installations per month
query_group_month = '''
SELECT
    d.year AS year,
    d.month AS month,
    COUNT(*) AS number_of_installations
FROM warehouse.fact_installations fi
    JOIN warehouse.dim_dates d
    ON fi.installation_date_key = d.date_key
GROUP BY year, month
ORDER BY year, month;
'''
# Query 2: Rank product categories by total revenue (product price)
query_top_category = '''
SELECT
    p.category_name AS category_name,
    SUM(p.price) AS total_revenue
FROM warehouse.fact_Installations fi
    JOIN warehouse.dim_products p
    ON fi.product_id = p.product_id
GROUP BY p.category_name
ORDER BY total_revenue DESC;;
'''
# Query 3: Top region by number of installations
query_best_region = '''
SELECT
    c.region AS region_name,
    COUNT(*) AS number_of_installations
FROM warehouse.fact_Installations fi
    JOIN warehouse.dim_customers c
    ON fi.customer_id = c.customer_id
GROUP BY c.region
ORDER BY number_of_installations DESC
LIMIT 1;
'''

# Print results
print('=============================================')
# Query 1: Number of installations per month
df_group_month = pd.read_sql(query_group_month, engine)
print("What is the number of installations that the company is doing every month?")
print(df_group_month)
print('=============================================')
# Query 2: Rank product categories by total revenue (product price)
df_top_category = pd.read_sql(query_top_category, engine)
print("Which product category brings us more revenues?")
print(df_top_category)
print('=============================================')
# Query 3: Top region by number of installations
df_best_region = pd.read_sql(query_best_region, engine)
print("Which region of the world is our best market?")
print(df_best_region)
print('=============================================')
