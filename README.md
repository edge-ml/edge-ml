# Edge-ML
React based tool for collaborative, browser-based time series data annotation. Supports managing and interacting with datasets, videos, labels, users and has 2FA to improve compliance.

(Screenshots, hosted version, and detailed feature list coming soon)


## Installation

Clone with `--recurse-submodules`-flag to automatically initialize and update each submodule.

```
git clone --recurse-submodules git@github.com:edge-ml/edge-ml.git
```

## Install with docker
Please follow the instructions to install <a href="https://docs.docker.com/install/"> 
docker</a> and <a href="https://docs.docker.com/compose/install/">install docker-compose</a>.

### Build and deploy your own images

Run the following command to build the images and to pull the mongoDB image.

```
sudo docker-compose build
```

Running the following command will start the dockerized application on your local machine:

```
docker-compose up
```
Services are now available:
* explorer-frontend: localhost
* explorer-backend: localhost/api
* explorer-auth: localhost/auth
* documentation: localhost/docs


## Deploy on a server

Run the following command to automatically pull and start the latestest version of the dockerized application from Docker Hub.
```
curl https://raw.githubusercontent.com/edge-ml/edge-ml/master/run.sh | sh
```

# ACK
```
This work was supported by the Competence Center Karlsruhe for AI Systems Engineering (CC-KING, https://www.ai-engineering.eu)
sponsored by the Ministry of Economic Affairs, Labour and Tourism Baden-Württemberg. 
```
