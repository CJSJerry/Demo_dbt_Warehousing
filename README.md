# Building a data warehouse with dimensional modeling
Feedback more than welcome; please reach me, Jerry, at CJJerryShieh@gmail.com.

## Technology
- Database: Postgres + pgadmin + docker-compose
- Data Warehouse: dbt + Postgres
- Diagrams: https://dbdiagram.io/

## Context
A company in the appliance business is proud to deliver and install high-quality products at customer's locations. They already have a relational database, consisting of 5 tables. A data warehouse is needed to simplify data querying and facilitate analytics need for business users. \
_Disclaimer_: The sample data, the text above, and `docker-compose.yml` is adapted from the repo (https://github.com/flvndh/awesome-inc) by `flvndh`

## Directory structure
- To start the database: `docker-compose.yml`, `data/`
- For the data warehouse: `warehouse/` \
Please see the [structure.md](structure.md) file for the full directory structure.

## Setup

### Part 0: Create environment
1. Clone this repo and `cd` into it
2. Create a virtual environment with **python 3.12.3** and **pip 24.0**, and then activate it 
3. Run `pip install -r requirements.txt` to install all the dependencies

### Part 1: Connect to the database
1. Create an .env file with the url to the database: \
`DATABASE_URL=postgresql://{username}:{password}@localhost:5432/demo_db` \
Replace the placeholders with your own postgres credentials 
- Credentials will not be found in documentations in real-life scenarios, but for the purpose of this demo, simply copy-paste: `DATABASE_URL=postgresql://demo_user:demo_pw@localhost:5432/demo_db`
2. Run `docker-compose up -d` to start the database
3. Go to http://localhost:8080 and login with your credentials to access pgadmin 
- For the purpose of this demo, use the following pgadmin credentials as given in `docker-compose.yml`: \
`email: demo_user@test.com` \
`password: demo_pw`
4. Check out the 5 pre-existing tables by accessing the side panel: Servers > Demo Inc > Databases > demo_db > Schemas > Public > Tables

    <img src="./assets/database.png" alt="Database Image" width="800"/>

### Part 2: Run and test the dbt project to build and query the data warehouse
1. Run `cd warehouse` to access the dbt project
2. Run `python run_dbt.py` (This script contains the correct .env and runs `dbt clean`, `dbt run`, and `dbt test` automatically)
3. Check the output to see if all 36 data tests are completed sucessfully; they test the following data quality:
    * (5 tests each) _unique_ and _not\_null_ for all ids of each table
    * (5 tests) _accepted\_values_ for the boolean column of the dim_customers table
    * (1 test) _accuracy_ check: to check if each cell in the source tables are the same as the output tables
    * (5 tests) _completeness_ check: to check if each id and therefore rows from the source tables are present
    * (5 tests) _consistency_ check: verify all referential integrity constraints are satisfied, i.e. testing all foreign keys
    * (5 tests) _data type_ check: to check if each cell in the output tables are of the correct data type
    * (5 tests) _uniqueness_ check: to check if each id in the output tables is unique (repeat of the bulit-in test, done again just for demonstration)
4. Go to pgadmin at http://localhost:8080 and check out the fact table and the 4 dimension tables under the "demoinc" database > Schemas > Warehouse > Tables

    <img src="./assets/dimensional.png" alt="Dimensional Image" width="800"/>

5. This dimensional model for this warehouse follows a denormalized STAR schema, with a factless fact table and 4 dimension tables. This is done to simplify the querying process.
6. Run some sample queries to answer business questions by running `python example_queries.py`

### Part 3: Clean up
1. Stop the database by running `docker-compose down`
2. Deactivate the virtual environment by running `deactivate`

## Contact
Jerry Shieh \
https://www.linkedin.com/in/cjjs/ \
CJJerryShieh@gmail.com