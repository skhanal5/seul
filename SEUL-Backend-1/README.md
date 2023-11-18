# Environment Setup
### Tools to be used
- Postgres / PgAdmin
- Node.js
- Docker / Dockerhub


## Install Dependencies 
Clone this repository and install dependencies with 
`npm install`
## Creating Postgres Server
### Pulling image from docker image
- Login with `docker login`. Enter your credentials
- Run the commande: `docker pull dchoi315/seul-image`. This is the image that contains the postgres server that you will be running
- A docker image named *dchoi315/seul-image* will appear in docker desktop
### Running the Docker Image
- Desktop Version
  - Open Docker Desktop
  - Click *Images* in the sidebar; look for *dchoi315/seul-image*
  - Hover over the image and click run; open optional settings
  - Make Container name whatever you want
  - Port must be 5432
  - Click Run
  - Done
- CLI Version
  - Open Terminal
  - Run `docker run --name <Whatever you want> -p 5432:5432 dchoi315/seul-image`
  - Done

After following this procedure your postgres server will be up
### Using PgAdmin to Connect to the server
- Open PgAdmin
- Right Click *Server > Create > Server*
- For "Name", call it whatever you want, I suggest (SEUL)
- Click on Connection
- For "Host name / address", put localhost
- "Port" - 5432'
- "Maintenance Database" - SEUL
- "Username and Password" - postgres
- Click Save
At this point you should be connected to the postgres server you started with the docker image

### Made Changes to the database with PgAdmin
If changes were made to the database, you need to update the *seul-init.db* file in the db folder

Run 

`docker exec -u postgres <docker-container-name> pg_dump <db-name> > <path>/seul-init.sql`

- docker-container-name should be whatever you named your docker container (Without the carrots)
- db-name should be "SEUL" (Without quotations and carrots)
- path should be a place you'll be able to find easily (I suggest your desktop)

Once the seul-init.sql file is created replace it with the old seul-init.sql file in the db folder



