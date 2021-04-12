#!/bin/sh

g++ -g psql_broker.cpp -std=c++2a -o ./app/psql_broker -lserved -lpqxx -lpq
