FROM postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres 
ENV POSTGRES_DB medialib
COPY ./init/ /docker-entrypoint-initdb.d/
EXPOSE 5432
