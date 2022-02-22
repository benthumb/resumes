#!/bin/sh

buildah from --name psql_cv_db docker.io/library/postgres
buildah add psql_cv_db  '/home/paul/Documents/Projects/docx/backend/database/init_psql_db/resume_cv_db.sql' '/tmp'
#buildah add psql_cv_db  '/home/paul/Documents/Projects/docx/backend/database/docker-entrypoint.sh' '/usr/local/bin'
#buildah run psql_cv_db -- chmod +x /usr/local/bin/docker-entrypoint.sh
buildah run psql_cv_db -- /usr/local/bin/docker-entrypoint.sh

