docker run -d \
	--name psql_db_1.0 \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_USER=postgres \
	-v /home/paul/Documents/Projects/docx/backend/database/init_psql_db:/docker-entrypoint-initdb.d \
	postgres
