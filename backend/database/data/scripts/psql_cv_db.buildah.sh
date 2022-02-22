#!/bin/sh

docker cp psql_cv_db_docker  '/home/paul/Documents/Projects/docx/backend/database/init_psql_db/resume_cv_db.sql' '/tmp'
#docker add psql_cv_db_docker  '/home/paul/Documents/Projects/docx/backend/database/docker-entrypoint.sh' '/usr/local/bin'
#docker run psql_cv_db_docker -- chmod +x /usr/local/bin/docker-entrypoint.sh
docker run psql_cv_db_docker -- /usr/local/bin/docker-entrypoint.sh

