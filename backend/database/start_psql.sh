podman run -d \
	--name psql_db \
	--pod cms_pod \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_USER=postgres \
	-v /home/paul/psql/psql_cust_image/database/init_psql_db:/docker-entrypoint-initdb.d \
	postgres
