# Docker for Moodle&trade; Develop over self-signed SSL on localhost

A mínimal configurable stack for Moodle&trade; Developers

## All you need

To create the project requires:

- Unix (WSL2 compatible)
- curl
- git
- docker
- docker-compose

### The Simple Install Proccess

Execute this script:

```
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/install.sh > install.sh

chmod +x install.sh

./install.sh

```

>This proccess create a folder-tree and clone Moodle&trade; official repo.
>When finished you only need to execute `docker-compose up -d`

#### Some details

[WIP]
