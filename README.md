# Inception

## Summary
**Inception** is a system administration project that involves creating a personal virtual machine and deploying multiple services using Docker and Docker Compose.

## Introduction
The **Inception** project aims to broaden your system administration knowledge by using Docker to create and manage multiple services in a virtual machine. You will set up an infrastructure of interconnected services, each in its own Docker container, using Docker Compose to automate the setup.

## Installation
1. Clone the repository:
   ```
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```
   cd inception
   ```
3. Set up the virtual machine environment and ensure Docker is installed.
4. Run the Makefile to set up the Docker environment:
   ```
   make
   ```

## Usage
Run the setup using:
```
make up
```
This will use Docker Compose to build and start all services defined in the `docker-compose.yml` file.

## Features
- **Dockerized Services**: The project includes several Docker containers for different services:
  - **NGINX**: Configured with TLSv1.2 or TLSv1.3.
  - **WordPress + php-fpm**: Installed and configured without NGINX.
  - **MariaDB**: Database server to be used with WordPress.
  - **Volumes**: Persistent storage for WordPress files and database.
  - **Docker Network**: Network connecting all containers for seamless communication.
- **Security and Best Practices**:
  - Uses TLS for secure connections.
  - Environment variables and `.env` files are used for configuration.
  - No passwords or sensitive data are stored in Dockerfiles.
- **Makefile Automation**: Use the Makefile to automate the build and deployment process.

