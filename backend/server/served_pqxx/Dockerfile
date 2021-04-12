FROM docker.io/library/debian
# FROM docker.io/library/alpine
# FROM docker.io/frolvlad/alpine-gxx
COPY runtime_libs /usr/local/lib
COPY app /usr/local/bin
EXPOSE 8081
RUN apt update && apt install -y \
        nmap \
        vim
RUN ldconfig 
CMD /usr/local/bin/psql_broker
	

