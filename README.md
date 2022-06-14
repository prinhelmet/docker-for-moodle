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

Download, modify and execute one of this file:

Without SSL
```curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/install.sh > install.sh```

OR with SSL (self-signed certificate)
```curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/install-with-ssl.sh > install.sh```

Change permision to can execute
```chmod +x install.sh```

And execute the script
```./install.sh```

>This proccess create a folder-tree and clone Moodle&trade; official repo.
>When finished you only need to execute `docker-compose up -d`

#### Some details

[WIP]
