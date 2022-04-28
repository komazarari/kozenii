# kozenii

It's a study. App for a treasurer of amateur orchestra club.

## Development

### Prepare

    docker compose build
    docker compose run sh bundle install
    docker compose run sh rake db:setup

### Run server

    docker compose up rails

and open http://localhost:3000 .


### Cleanup All

    docker-compose down --rmi all --volumes
