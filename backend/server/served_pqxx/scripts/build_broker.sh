#!/bin/sh

docker build -t psql_broker --build-arg BOOST_LIB_DIR=/opt/boost_1_77 .
