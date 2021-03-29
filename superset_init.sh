docker exec -it postgres_db createdb --username=student --owner=student superset

docker exec -it superset_ui superset fab create-admin \
               --username student \
               --firstname Sparkify \
               --lastname Student \
               --email student@sparkifydemo.io \
               --password student
               
docker exec -it superset_ui superset db upgrade

docker exec -it superset_ui superset init