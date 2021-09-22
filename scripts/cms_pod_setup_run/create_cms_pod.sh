#!/usr/bin/sh

podman pod create --name cms_pod -p 127.0.0.1:8080 -p 127.0.0.1:5432 -p 127.0.0.1:8081
