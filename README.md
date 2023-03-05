# PetFinder Backend API

This project is a Sinatra-based API backend for the PetFinder application. It uses Active Record to interact with a database and provides endpoints for the React frontend to interact with the database via the API.
# Getting Started

To get started with the backend, clone this repository and run bundle install to install the required gems.

sh

$ git clone https://github.com/YOUR_USERNAME/petfinder-backend.git
$ cd petfinder-backend
$ bundle install

# Database Setup

This project uses SQLite as its database, which is already included in the project. To set up the database, run the following commands:

sh

$ rake db:create
$ rake db:migrate

# Starting the Server

You can start the server by running the following command:

sh

$ bundle exec rake server

This will start the server on http://localhost:9292.
API Endpoints

The API provides the following endpoints:
GET /pets

Returns a JSON array of all the available pets.
GET /pets/:id

Returns a JSON object of the pet with the specified ID.
POST /pets

Adds a new pet to the database. Requires the following parameters:

    name (string): the name of the pet
    breed (string): the breed of the pet
    age (integer): the age of the pet
    gender (string): the gender of the pet
    color (string): the color of the pet

Returns a JSON object of the added pet.
PUT /pets/:id

Updates an existing pet with the specified ID. Requires the following parameters:

    name (string): the new name of the pet
    breed (string): the new breed of the pet
    age (integer): the new age of the pet
    gender (string): the new gender of the pet
    color (string): the new color of the pet

Returns a JSON object of the updated pet.
DELETE /pets/:id

Deletes the pet with the specified ID.
Models

The API uses the following models:
Pet

Represents a pet that can be adopted. Attributes include:

    name (string): the name of the pet
    breed (string): the breed of the pet
    age (integer): the age of the pet
    gender (string): the gender of the pet
    color (string): the color of the pet

# User

Represents a user of the PetFinder application. Attributes include:

    username (string): the username of the user
    password_digest (string): the hashed password of the user

Conclusion

Thank you If you have any questions or concerns, please don't hesitate to contact us.
# Author
phylis njeri