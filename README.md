# Goodnight application

This is a program that allows you check their bed time data, including clock-in and clock-out times.
Moreover, users can follow other users and check their followers bed time data as well

## Prerequisites

Make sure you have the following installed on your local machine:

- rvm
- postgres
- Docker

## Installation

### Clone the repository:

   ```bash
   git clone https://github.com/tinnguyenz/goodnight-app.git && cd goodnight-app
   ```

### Install Ruby 3.2.2 using rvm (or rbenv of choice)
    ```bash
    rvm install ruby-3.2.2
    rvm gemset create rails705
    rvm gem install rails -v 7.0.5
    rvm ruby-3.2.2@rails705 

    ## Trouble shooting:
    ## If there's an error saying SSL/TLS connection during the Ruby installation, try with this option:
    rvm install 3.2.2 --enable-shared --with-openssl-dir=/usr/local/etc/openssl@3 --with-out-ext=fiddle
    ## and continue the installation...
    ```

### Install Postgresql using Homebrew (please skip if you've already had Postgres installed)
    ```bash
    brew install postgresql@15

    ## Once complete:
    brew services restart postgresql@15
    export PKG_CONFIG_PATH="/usr/local/opt/postgresql@15/lib/pkgconfig
    ```

### Running the Program
    ```bash
    bundle install
    rails db:drop db:create db:migrate db:seed

    ## Once all gems installed and db created, start the web server:
    rails s
    ```

### Play with the application, either with Postman or curl. We'll try with curl:
    ```bash
    ## Optional, get jq for better format
    brew install jq

    ## GET your bed time data:
    curl -c session.txt localhost:3000/api/v1/clock-time | jq .
    ## Note that session.txt will be created in current directory, so subsequent requests will be known as the same user

    ## GET Cardi B. bed time data:
    curl -b session.txt localhost:3000/api/v1/clock-time/2 | jq .

    ## her second page of data
    curl -b session.txt localhost:3000/api/v1/clock-time/2\?page=2 | jq .

    ## POST to follower her
    curl -b session.txt -X POST localhost:3000/api/v1/follow/2

    ## and unfollow here
    curl -b session.txt -X POST localhost:3000/api/v1/unfollow/2

    ## We can't see here data again since we've already unfollow
    curl -b session.txt -X GET localhost:3000/api/v1/clock-time/2
    ```

### Currently there're still problem with Docker setup, so please try with the options above. Thank you
