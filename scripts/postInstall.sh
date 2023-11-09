#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;

docker-compose exec -T server corteza-server settings set auth.mail.from-address ${SMTP_FROM}
docker-compose down;
docker-compose up;

sleep 30s;
docker-compose exec -T server corteza-server users add ${ADMIN_EMAIL} --password ${ADMIN_PASSWORD}