#!/bin/bash
(trap 'kill 0' SIGINT; (
cd ~/edge-ml/authentication && nodemon server.js &
cd ~/edge-ml/backend && nodemon server.js &
cd ~/edge-ml/frontend && npm start &
cd ~/edge-ml/ml && uvicorn main:app --reload --port 3003 --host 0.0.0.0
))
