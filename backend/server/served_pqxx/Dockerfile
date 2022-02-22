FROM debian 
LABEL benthumb.org="posgres_broker_debian"
COPY runtime_libs /usr/local/lib
COPY compile_libs /usr/local/lib
RUN mv /usr/local/lib/boost_1_77 /usr/lib
RUN mkdir /tmp/broker
COPY app/broker/ /tmp/broker
COPY configure_debian.sh /tmp/broker 
EXPOSE 8081
ENTRYPOINT /bin/bash 
