#!/bin/bash

docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d -v /root:/data postgres
docker exec -it postgres bash

echo Loading data...
psql -U postgres -f /data/person-data.sql

echo Loading finished...
psql -U postgres