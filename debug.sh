#!/bin/bash
cd ~/edge-ml && sudo docker-compose up -d mongo && (
cd ~/edge-ml/authentication && nodemon server.js &
cd ~/edge-ml/backend && nodemon server.js &
cd ~/edge-ml/frontend && npm start &
cd ~/edge-ml/ml && python3 main.py
)