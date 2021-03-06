# edge-ml
edge-ml is an embedded-first machine learning framework that helps developers build models faster and more robustly with an open-source toolchain for embedded machine learning. With a few simple steps edge-ml lets you record data, label samples, train models and deploy validated embedded machine learning directly on the edge. edge-ml requires minimal initilization and supports upload in real-time as well as in bulk from the edge. Pre-recorded data can also be drag-and-dropped as CSV files to the edge-ml cloud storage. Models are generated using AutoML therefore requiring minimal user configuration. The models are optimized for resource-constrained embedded chips based on hardware-aware neural network training.

## 🛸 New to edge-ml?
If you are interested in using _edge-ml_ please go to [app.edge-ml.org](https://app.edge-ml.org) and register!

Please visit our [wiki](https://github.com/edge-ml/edge-ml/wiki) for a comprehensive overview of edge-ml and some excellent tutorials on how to get started. 

## 🌟 Organizations using edge-ml
A growing number of organizations support and use _edge-ml_ in their workflows.
- [Karlsruhe Institute of Technology](https://kit.edu)
- [TECO (Telecooperation Office)](https://teco.edu)
- [Competence Center Karlsruhe for AI Systems Engineering](https://www.ai-engineering.eu)
- [SDIL - Smart Data Innovation Lab](https://www.sdil.de/de/home-page)

# 💻 For Developers

## Setup

A comprehensive installation and setup guide is provided [in the wiki](https://github.com/edge-ml/edge-ml/wiki#Join-the-development).
If you want to contribute, this is the recommended way to install and run edge-ml. 
Installing with Docker is also possible, but it's rather meant to be a quick and easy way to run edge-ml, not as development setup.

## Cloning the Repository

Clone with `--recurse-submodules`-flag to automatically initialize and update each submodule.

```
git clone --recurse-submodules git@github.com:edge-ml/edge-ml.git
```

## Install with Docker
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
* edge-ml-frontend: localhost
* edge-ml-backend: localhost/api
* edge-ml-auth: localhost/auth
* edge-ml documentation: localhost/docs


## Deploy on a server

Run the following command to automatically pull and start the latestest version of the dockerized application from Docker Hub.
```
curl https://raw.githubusercontent.com/edge-ml/edge-ml/master/run.sh | sh
```

## Debug components
Please follow the steps [here](https://github.com/edge-ml/edge-ml/wiki#Installation-Guide).

You can now easily debug the different components. Changes can be comitted in each sub-repository and pushed from there directly.


# Acknowledgements
This project was partially supported by the German Federal Ministry of Education and Research (BMBF) as part of the project AURA, grant 16SV8296.

This work was partially supported by the Competence Center Karlsruhe for AI Systems Engineering (CC-KING, https://www.ai-engineering.eu)
sponsored by the Ministry of Economic Affairs, Labour and Tourism Baden-Württemberg. 
