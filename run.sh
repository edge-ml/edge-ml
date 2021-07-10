curl https://raw.githubusercontent.com/teco-kit/explorer/master/docker-compose-production.yaml > docker-compose-production.yaml && 
curl https://raw.githubusercontent.com/teco-kit/explorer/master/nginx_https.conf > nginx_https.conf &&
mkdir docs &&
mkdir dockerVolume &&
mkdir dhparam &&
curl https://github.com/teco-kit/explorer/raw/master/docs/Datenbankschema_Explorer_v2.jpg > docs/Datenbankschema_Explorer_v2.jpg &&
curl https://raw.githubusercontent.com/teco-kit/explorer/master/docs/index.html > docs/index.html
docker-compose -f docker-compose-production.yaml pull && 
docker-compose -f docker-compose-production.yaml up -d && 
rm docker-compose-production.yaml
