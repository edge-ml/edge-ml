mkdir edge-ml-beta

REM Change directory to edge-ml-beta
cd edge-ml-beta

REM Download docker-compose-local.yaml file
curl -o docker-compose-local.yaml https://raw.githubusercontent.com/edge-ml/edge-ml/beta/docker-compose-local.yaml
curl -o .env-docker-local https://raw.githubusercontent.com/edge-ml/edge-ml/beta/.env-docker-local
crul -o nginx.conf https://raw.githubusercontent.com/edge-ml/edge-ml/beta/nginx-local.conf

docker-compose -f docker-compose-local.yaml pull
docker-compose -f docker-compose-local.yaml up -d