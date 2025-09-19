<div align=center>
  <h1>Inception</h1>
  <img alt="Project badge" src="https://github.com/miladrahmat/42-badges/blob/master/badges/inceptionn.png" /><img width="20%" alt="Grade for the project" src="https://github.com/user-attachments/assets/6fe0a756-7205-42f0-bc6d-84431210830b" />
  <p><b>A containerized WordPress blog platform with Nginx and MariaDB, orchestrated using Docker Compose</b></p>
</div>

## Content

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)

## Introduction

This **DevOps** project is a containerized WordPress blog platform built with **Docker Compose**. The project consists of 3 containers:
1. **WordPress** for content management
2. **MariaDB** for the database
3. **Nginx** for the web server

The **Docker Compose** file builds these containers and links them together via a **Docker network** so that the containers are able to communicate and serve a blog platform to the browser

## Features

- Multi-container architecture
- Easy and automated deployment with **Docker Compose**
- Presistent database storage
- Modular and portable stack that can run anywhere where **Docker** is supported

## Installation

1. Install [Docker](https://docs.docker.com/get-started/)
2. Install [Docker Compose](https://docs.docker.com/compose/)
3. Install **make** by running the following on the command line (Linux Ubuntu):
```bash
sudo apt update && apt install -y make
```
4. Clone the repository in your directory of choice:
```bash
git clone https://github.com/miladrahmat/Inception.git
cd Inception
```
5. Run the makefile:
```bash
make
```

To stop the containers press `Ctrl + C` and run:
```
make clean
```

To delete the volumes and all data:
```
make fclean
```

## Usage

Open your browser and navigate to:
```
https://localhost:443
```
- You will get a warning sign because of the self-signed TLS certificate. Click on `Advanced` and then `Proceed to localhost (usafe)` to proceed to the page.
