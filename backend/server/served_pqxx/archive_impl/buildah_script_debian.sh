#!/bin/sh

buildah from --name psql_broker_debian docker.io/library/debian
buildah add psql_broker_debian 'runtime_libs' 'usr/local/lib'
buildah add psql_broker_debian 'app/broker' 'tmp'
buildah add psql_broker_debian 'compile_libs/boost' 'usr/lib'
buildah add psql_broker_debian '/usr/local/lib/libboost_system.so.1.78.0' 'usr/local/lib'
buildah run psql_broker_debian '/tmp/configure_debian.sh' 
 
