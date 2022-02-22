podman run -d \
	--name psql_db \
	--pod cms_pod \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_USER=postgres \
	-v /home/paul/Documents/Projects/docx/backend/database/init_psql_db:/docker-entrypoint-initdb.d \
	psql_cv_database
