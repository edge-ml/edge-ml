git config --global --add safe.directory /home/ubuntu/edge-ml/backend
git config --global --add safe.directory /home/ubuntu/edge-ml/frontend

cd /home/ubuntu/edge-ml

docker-compose -f docker-compose-production.yaml pull

cd frontend
git checkout beta
sudo -u ubuntu git pull
cd ../ml
git checkout beta
sudo -u ubuntu git pull
cd ../backend
git checkout beta
sudo -u ubuntu git pull
cd ../authentication
git checkout beta
sudo -u ubuntu git pull
cd ../Dataset-store
git checkout beta
sudo -u ubuntu git pull

cd ..
docker-compose -f docker-compose-production.yaml build

docker-compose -f docker-compose-production.yaml up -d --remove-orphans

