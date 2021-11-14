#!/bin/bash

docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d -v /root:/data postgres
docker exec -it postgres bash

sleep(1)

psql -U postgres -f /data/person-data.sql

psql -U postgres