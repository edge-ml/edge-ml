curl https://raw.githubusercontent.com/teco-kit/explorer/master/docker-compose-production.yaml > docker-compose-production.yaml && 
docker-compose -f docker-compose-production.yaml up -d && 
rm docker-compose-production.yaml
