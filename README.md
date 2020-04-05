# Explorer
React based tool for collaborative, browser-based time series data annotation. Supports managing and interacting with datasets, videos, labels, users and has 2FA to improve compliance.

(Screenshots, hosted version, and detailed feature list coming soon)


## Installation

Clone with `--recurse-submodules`-flag to automatically initialize and update each submodule.

```
git clone --recurse-submodules git@github.com:teco-kit/explorer.git

```

## Docker Environment

```
sudo docker-compose build
docker-compose up
```

Services are now available:
* explorer-frontend: localhost
* explorer-backend: localhost/api
* explorer-auth: localhost/auth
* documentation: localhost/docs
