# README

# An image search app using Flickr API

## Instructions

### Configure environment variables

Create an .env file and copy contents from example-env

e.g.

`cp example-env .env`


### Config app for development

`bundle install`


* Set up the database

`rails db:create`

The database is not used. It was only created in order to deploy to heroku

* Fire the app

`rails s`

* Run tests

`rails spec`
