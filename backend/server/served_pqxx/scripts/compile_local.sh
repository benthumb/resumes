#!/bin/sh

g++ -g psql_broker.cpp -std=c++2a -o  /home/paul/Documents/Projects/docx/backend/server/served_pqxx/app/broker/pgsql_broker -I/usr/lib/boost_1_77 -lserved -lpqxx -lpq


#---------------------------------------------------------------------- VARIATIONS ON A FAILED THEME
#g++ -g -DNDEBUG psql_broker.cpp -std=c++2a -o ./app/broker/psql_broker_a -I/usr/include/postgresql/backend/utils/mb -I/usr/lib/boost_1_77 -lserved -lpqxx -lpq -L/usr/include/postgresql/internal -lport -L/lib/x86_64-linux-gnu -lldap --static
#g++ -g psql_broker.cpp -std=c++2a -o /usr/local/bin/psql_broker -I/usr/lib/boost -lserved -lpqxx -lpq
#g++ -g psql_broker.cpp -std=c++2a -o psql_broker_b99 -I/usr/lib/boost_1_77 -lserved -lpqxx --static
# -- STATIC BUILD A PROBELM... NON-STATIC BUILD PRODUCES AN EXECUTABLE THAT CORE DUMPS... I DON'T KNOW WHY...
#g++ --static -g psql_broker.cpp -std=c++2a -o ./app/broker/psql_broker_local -L/usr/local/lib -I/opt/boost_1_77 -lserved -lpqxx -lpq
#g++ psql_broker.cpp -std=c++2a -o ./app/broker/psql_broker_local -L/usr/local/lib -I/opt/boost_1_77 -lserved -lpqxx -lpq
