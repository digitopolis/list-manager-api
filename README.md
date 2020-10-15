# My Media Shelf API

## Description

This API provides the backend and database connection for the [My Media Shelf app](https://github.com/digitopolis/list-manager-app)

### Running Locally

Clone the project and change into the project directory:

```bash
$ git clone git@github.com:digitopolis/list-manager-api.git
$ cd list-manager-api
```

Install dependences:

```bash
$ bundle install
```

Create the database and run migrations:

```bash
$ rails db:create
$ rails db:migrate
```

Finally, start the server locally:

```bash
$ rails s
```

Run tests with:

```bash
$ rails test
```

## API Endpoints

The app interacts with the API through the Users, Lists, and Items endpoints – the url is in the form: `https://mm-list-manager-api.herokuapp.com/api/v1/users`. Data is sent in JSON format, serialized with nested properties.

#### Example data object (Users)

```json
// GET https://mm-list-manager-api.herokuapp.com/api/v1/users
{
    "id": 2,
    "email": "email@email.com",
    "lists": [
      {
        "id": 3,
        "title": "In Progress",
        "description": "What I'm curently watching/reading/playing/etc",
        "items": [
          {
            "id": 1,
            "title": "Evil Dead II",
            "creator": "Sam Raimi",
            "image_url": "https://upload.wikimedia.org/wikipedia/en/6/6d/Evil_Dead_II_poster.jpg",
            "medium": "Movie",
            "tags": [
              "Comedy",
              "Horror"
            ],
            "lists": [ ... ] // Lists item is currently in
          }
        ]
      },
      {
        "id": 4,
        "title": "Completed",
        "description": "Things I've finished",
        "items": [
          {
            "id": 1,
            "title": "Evil Dead II",
            "creator": "Sam Raimi",
            "image_url": "https://upload.wikimedia.org/wikipedia/en/6/6d/Evil_Dead_II_poster.jpg",
            "medium": "Movie",
            "tags": [
              "Comedy",
              "Horror"
            ],
            "lists": [ ... ]
          }
        ]
      },

    ...
```

## Built with

- [Ruby on Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)

# Author

[Matt Readout](https://github.com/digitopolis)
