echo "Stoping medialibdb"
docker stop medialibdb
echo "removing medialibdb container"
docker rm medialibdb
echo "clearing out old db files"
cd db
rm -rf *
cd ..
echo "rebuilding container"
./build.sh
echo "Starting medialibdb"
./run-db.sh
sleep 5
echo "Running migration"
./migrate.sh
echo "done!"
exit 0