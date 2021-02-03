echo "Removing stuff"
sudo docker rm -vf $(sudo docker ps -a -q)
sudo docker rmi -f $(sudo docker images -a -q)
sudo docker-compose down -v
echo "Building"
sudo docker-compose build
echo "Running"
sudo docker-compose up
