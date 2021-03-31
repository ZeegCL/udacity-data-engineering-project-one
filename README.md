# 1. About this project

This is a sample project for the "Data Modeling" module in Udacity's Data Engineering Nanodegree. It presents the case of a fictional startup called "Sparkify", which has been collecting data on songs and user activity on their music streaming app. All the data has been stored as JSON files, which gives a hard time for the analytics team.

As a data engineer, you are required to build a small data warehouse optimized to analyze the operational data. This includes creating the database schema and the ETL pipeline to import the data from it's source files.

To demonstrate some analysis that can be done using the transformed data, the following indicators have been included in a demo dashboard:

**Users**
- Free vs. paid users
- Distribution per gender

**User activity**
- Songs played per session
- Songs played per day of the week

# 2. Requirements

To execute all the steps and see the end product, you will need the following installed in your machine:

- Python 3
- Docker
- Docker-compose
- Jupyter Notebook or Jupyter Lab, to check the _.ipynb_ files.
- A terminal capable of running bash scripts. On Windows you can use Git Bash if you are a Git user.

# 3. Files included in the project

- **data folder:** Includes all the data for the ETL process and mounting points for the Docker container volumes.
    - song_data folder: Includes JSON files which contain metadata about songs and their artists.
    - log_data: Includes JSON files with log events from the music stream app.
    - superset: Includes a config file for Apache Superset with the URI for the database backend.
- **create_tables.py:** Python script that drops and creates the database schema.
- **demo_dashboard.json:** JSON file with the definition of the demo dashboard. This must be imported into Apache Superset.
- **docker-compose.yml:** YAML file with the configuration to mount all the services required for this project using Docker containers.
- **etl.ipynb:** Jupyter notebook that let's you review each step of the ETL process used in this project.
- **etl.py:** Python script that executes the ETL process.
- **requirements.txt:** File that lists the Python modules required in this project.
- **sql_queries.py:** Python script that holds all the SQL queries used in the ETL and Notebook files.
- **superset_init.sh:** Bash script that initializes the database for Apache Superset and creates the default user.
- **test.ipynb:** Jupyter notebook that let's you check the data loaded in the database tables.

# 4. Getting started

This project relays on Docker to quickly run the services needed. In the source code you will find a `docker-compose.yml` file which contains the configuration to run the following: 

1. A PostgreSQL database instance.
2. A PgAdmin instance to help managing the database.
3. An Apache Superset instance to visualize the data through a dashboard.

## 4.1 Setting up the services

1. Open a terminal in the root folder of the project.
2. Run the following command to start the services: `docker-compose up`
3. Open another terminal and run the bash script `superset_init.sh` to create and initialize the database, create the default user and load basic configuration for Apache Superset. _Note: the superset_ui container will constantly throw errors in the console until you complete this step._


## 4.2 Using PgAdmin to inspect the database

1. In your web browser go to: [http://localhost:5050](http://localhost:5050)
2. Log in with the username `student@sparkifydemo.io` and password `student`.
3. Add a new server with the following:
    - Server name (connection): sparkify
    - Host: host.docker.internal
    - Port: 5432
    - Maintenance db: postgres
    - Username: student
    - Password: student
    
## 4.3 Loading the Sparkify database

1. Open a terminal in the root folder and run `python create_tables.py` to create the schema.
2. To load the data from the _data_ folder, run `python etl.py`.

## 4.4 Visualizing the data through Superset

1. In your web browser go to: [http://localhost:8088](http://localhost:8088)
2. Log in with the username `student` and password `student`.
3. In the navigation menu, under "Data", select "Databases".
4. Add a new database clicking on "+ Database" button in the upper right corner.
5. Configure the connection with the following parameters:
    - Database name: `sparkifydb`
    - SQLAlchemy URI: `postgresql+psycopg2://student:student@host.docker.internal:5432/sparkifydb`
6. Click on "Add" to create the connection.
7. In the navigation menu, under "Settings", select "Import Dashboards".
8. Choose the file `demo_dashboard.json` from the root file and assign it to the _sparkifydb_ database.

