## This stack depends on this R package

### [redditsuite](https://github.com/fdrennan/redditsuite)

## Required Directory Structure

    .
    ├── .Renviron (Must generate)
    ├── .env (Must generate)
    ├── .gitignore
    ├── Dockerfile
    ├── Makefile
    ├── README.md
    ├── dags
    ├── docker-compose.yaml
    ├── logs
    ├── main.R
    ├── plugins
    ├── pre-install.sh
    ├── redditstack.Rproj
    └── sql
        ├── authors.sql
        ├── submission_insertion_times.sql
        ├── submission_meta.sql
        └── submissions.sql

    4 directories, 15 files

## Setup

1.  Install required binaries and get the code

    ```{bash}
    #!/bin/bash

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

    sudo apt-get update -y
    sudo apt-get upgrade -y

    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        make \
        gcc \
        libz-dev \
        gnupg \
        ca-certificates \
        git \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        libgit2-dev \
        libsodium-dev \
        libpq-dev \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        net-tools \
        gdebi


    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    sudo groupadd docker | echo already in group
    sudo usermod -aG docker $USER

    git clone https://github.com/fdrennan/redditstack.git
    ```

2.  Exit shell and restart server to finish docker permissions update.

3.  Create the `.env` file in the new directory.\
    `echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" >> ./.env`

4.  Update `.Renviron` below and put in `./redditstack/.Renviron`

    If you are copying your `.Renviron` file from one computer to the other, the only required field to change will be the ip address. This can be found using `ifconfig` which is installed with `sudo apt install net-tools`.

    ```{bash}
    email=
    USERNAME=
    PASSWORD=
    REDDIT_CLIENT=
    REDDIT_AUTH=
    USER_AGENT="datagather by /u/(yourusername)"
    POSTGRES_PORT=5434
    POSTGRES_HOST=
    POSTGRES_USER=unicorn_user
    POSTGRES_PASSWORD=magical_password
    POSTGRES_DB=rainbow_database
    SUBREDDIT=all
    NROWS=100
    SLACK_API_KEY=
    ```

5.  `make init`
