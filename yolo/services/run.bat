@echo off
docker compose up -d --force-recreate
docker compose logs -f -t yolo