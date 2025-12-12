FROM postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres 
ENV POSTGRES_MULTIPLE_DATABASES=medialib,lidarr_main,lidarr_log

COPY ./init/create-databases.sh /docker-entrypoint-initdb.d/
EXPOSE 5432
