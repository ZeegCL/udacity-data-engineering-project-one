# Database setup

For this project you will need a PostgreSQL database. In the source code you will find a `docker-compose.yml` file which contains the configuration to mount the database and, additionally, a PgAdmin instance which is a web application that helps you manage the PostgreSQL database.

Steps:

1. Open a terminal in the root folder of the project.
2. Run the command: `docker-compose up`
3. In your web browser go to: [http://localhost:8888]
4. Log in with the username `student@sparkifydemo.io` and password `student`.
5. Add a new server with the following:
    - Server name (connection): sparkify
    - Host: host.docker.internal
    - Port: 5432
    - Maintenance db: postgres
    - Username: student
    - Password: student

