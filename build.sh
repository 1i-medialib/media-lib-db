docker login registry.gitlab.com

time docker build . \
	-t medialib/pgdb \
	-t registry.gitlab.com/media-lib-fargue/media-lib-db

docker push registry.gitlab.com/media-lib-fargue/media-lib-db
