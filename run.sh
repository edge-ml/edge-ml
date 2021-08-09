curl https://raw.githubusercontent.com/edge-ml/edge-ml/master/docker-compose-production.yaml > docker-compose-production.yaml && 
curl https://raw.githubusercontent.com/edge-ml/edge-ml/master/nginx_https.conf > nginx_https.conf &&
mkdir docs &&
mkdir dockerVolume &&
mkdir dhparam &&
curl https://raw.githubusercontent.com/edge-ml/edge-ml/master/docs/index.html > docs/index.html
docker-compose -f docker-compose-production.yaml pull && 
docker-compose -f docker-compose-production.yaml up -d && 
rm docker-compose-production.yaml
