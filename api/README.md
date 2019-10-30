# API Platform DEMO
The "Symfony Demo Application" is a reference application created to show how to develop applications following the Symfony and API Platform.
## Setup and Installation
This application runs on docker. Execute the following commands
```bash
docker-compose up --build -d
docker exec -ti php-fpm composer install
```
## Usage
There's no need to configure anything to run the application.
To execute commands using the built symfony console run the following.

An example to clear the cache
```bash
docker exec -ti php-fpm bin/console cache:clear
```
## Updates from `library`
Once you have made a change to the shared library bundles, you need to update the package in composer to pull the new features into the application (this is important simply due to the way i structured the docker env).
```bash
docker exec -ti php-fpm composer update `package-name`
```
## Tests
Tests have been written using behat. Since behat for an api is able to run headless execute the following command:
```bash
docker exec -ti php-fpm APP_ENV=test vender/bin/behat
```
for code coverage of behat the following package could be considered [https://github.com/leanphp/behat-code-coverage]