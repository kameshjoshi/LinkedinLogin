# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

CREATE USER 'linkedin_api'@'localhost' IDENTIFIED BY 'linkedin_api';

GRANT ALL PRIVILEGES ON linkedin_api.* TO 'linkedin_api'@'localhost';

create database linkedin_api;