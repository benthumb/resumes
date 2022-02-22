#!/usr/bin/sh

podman pod create --name cms_pod -p 8080:8080 -p 5432:5432 -p 8081:8081 |
podman run -dt --pod cms_pod --name nginx_cms nginx |
podman run -dt --pod cms_pod --name psql_bkr psql_broker |
podman run -d \
	--name psql_db \
	--pod cms_pod \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_USER=postgres \
	-v/home/paul/Documents/Projects/docx/backend/database/init_psql_db:/docker-entrypoint-initdb.d \
	postgres
