# MySQL image with the installed demo database. The dump is produced by .docker/bake/bake.sh and
# imported by the official entrypoint on the first start of a container (no volume in the demo
# pod, so every pod start imports it; takes seconds instead of the full Pimcore/CoreShop install).
# User, password and database name come from the MYSQL_* environment of the deployment, as before.
ARG MYSQL_TAG=8
FROM mysql:${MYSQL_TAG}

COPY initdb/ /docker-entrypoint-initdb.d/
