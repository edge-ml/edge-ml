echo "Backend stats"
docker exec explorer-backend npm run stats

echo "Auth stats"
docker exec explorer-authentication npm run stats