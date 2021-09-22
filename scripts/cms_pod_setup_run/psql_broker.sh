#!/usr/bin/sh

podman run -dt --pod cms_pod --name psql_bkr psql_broker
