# 42-Inception Project

Creating Docker container images for a full-stack development environment.

1. [Overview](#overview)
2. [Features](#features)
3. [Notes](#notes)
4. [Usage](#usage)
   - [Monitoring Container Status](#monitoring-container-status)
   - [Inspecting MariaDB Contents](#inspecting-mariadb-contents)
   - [Controlling Container Processes](#controlling-container-processes)
   - [Cleanup](#cleanup)
   - [Fresh Reinstall](#fresh-reinstall)
5. [DEBUGGING](#debugging)
6. [Collaborators](#collaborators)
7. [Special Thanks](#special-thanks)
8. [License](#license)

## Overview

The Inception Project is a multifaceted endeavor that involves creating diverse Docker container images for services running on Debian or Alpine. The challenge extends to encapsulating these services using Docker Compose, ensuring functionality between them, and even on machines lacking necessary libraries. This project allows for a deeper delve into full-stack development, using WordPress as the frontend, NGINX as the web server, and MariaDB as the backend.

## Features

- Automated setup for simple Debian:bullseye, use of MariaDB, WordPress, and NGINX.
- Docker Compose integration for easy orchestration of the entire stack.

## Notes

- This project was evaluated using a custom `.env` file that is not available. Refer to the various config and script files of the services to determine the variables you need to create in your environment file, which you will create at the root of the directory.
- Change the `-subj` option in the NGINX Dockerfile to your desired options; their explanations are referenced in the same file.
- Change on makefile line 11 `andvieir.42.fr` to the name of the domain/localhost alias that you want to use. You can verify if this change has been made after running `make` and checking the `/etc/hosts` file.
- Change on makefile lines 10 and 33 `andvieir` to your user or simply add your `${USERNAME}` env variable.

## Usage

1. Execute `make` and wait for the build and startup process to complete.
2. Open your preferred browser and navigate to localhost or the domain you specified in the makefile.
3. Log in to the page using `<domain>/wp-login.php`.

  ## Monitoring Container Status

  Check the status of the containers by executing `docker compose -p inception ps`.

  ## Inspecting MariaDB Contents

  Inspect the contents of MariaDB by running `docker compose -p inception exec mariadb bash`. This will open the container's terminal, enabling you to execute `mysql -u ${MYSQL_USER} -p ${MYSQL_DATABASE}`, using `${MYSQL_PASSWORD}`, and check `SHOW TABLES;` and `SHOW DATABASES;` (make sure these variables are added to your `.env` for this step).

  ## Controlling Container Processes

  - Use `make stop/start` to halt/resume the container's processes.

  ## Cleanup

  - Utilize `make fclean` to remove the entire project's containers, images, and volumes. This will essentially wipe your webpage and database contents.

  ## Fresh Reinstall

  Running `make re` essentially equates to a "fresh reinstall."

## DEBUGGING

- While the containers are running, execute `docker compose -p inception logs <container name>` to check for any error logs.
- If necessary, in each service script, add `tail -f /dev/null` at the beginning to make the script pause execution at that line. This is useful if you want to manually test each of the commands in the scripts inside each container's terminal.

## Collaborators

- [José Pedro](https://github.com/ZPedro99)
- [Rafael Soares](https://github.com/rafaSoares1)
- [Tiago Pereira](https://github.com/t-pereira06)
- [Luís Pereira](https://github.com/lubuper)
  
Special Thanks to:
- [Tiago Olbrien](https://github.com/olbrien) for providing insights on how to approach project debugging. This assistance was valuable in understanding how the project works internally and troubleshooting issues.

## License

This project was created as part of the 42 Porto curriculum.
