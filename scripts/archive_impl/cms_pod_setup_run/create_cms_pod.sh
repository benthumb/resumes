#!/usr/bin/sh

# podman pod create --name cms_pod -p 127.0.0.1:8080 -p 127.0.0.1:5432 -p 127.0.0.1:8081
podman pod create --name cms_pod -p 8080:8080 -p 5432:5432 -p 8081:8081
