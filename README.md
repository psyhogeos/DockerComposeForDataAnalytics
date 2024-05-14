# Docker Compose for Data Analytics
This repo contains a Docker Compose project to spin up Jupyter Notebook and RStudio in Docker containers, for rapid setup for a simple data analytics project.

## Project Overview
In this sample project, pizza sales are read in as a CSV file into a Jupyter Notebook, which is used to generate a list of all pizzas in descending order by units sold. The list is then exported to an Excel file, which is read in to an RStudio script that generates a bar chart graphic. The graphic is then exported to a local directory, and can be accessed (alongside the source Excel file) beyond the lifetime of the containers.

## How to Get Started
Upon retrieving the source code, run ```docker compose up -d``` to spin up both containers (```-d``` is optional, and runs the containers in detached mode, or in the background).

Access Jupyter Notebooks by navigating to ```localhost:8888``` in your browser. From there, enter the token located in the ```jupyter.env``` file in the **config** directory ('jupyter1' by default, which can be changed).

Access RStudio by navigating to ```localhost:8787``` in your browser. From there, enter the password located in the ```rstudio.env``` file in the **config** directory ('jupyter1' by default, which can be changed). The default username to be entered is 'rstudio'.

Any scripts created or modified in the **work** directory in the Jupyter Notebooks container will be saved in the **data** directory within this project. Similarly, any changes made in the **rstudio** directory in the RStudio container are saved in the same location. Any packages installed (e.g., ggplot and its dependencies) will be stored in a directory called **r_pkgs** on the local filesystem. This way, the packages do not need to be re-installed each time the container is spun up and the script is run. (For more information on managing data in Docker with volumes, see [here](https://docs.docker.com/storage/volumes/#use-a-volume-with-docker-compose)).
