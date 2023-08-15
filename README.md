Берем машину минимум 50 ядер, 120 ЦПУ, 70 Гб диска
Коннектимся по ssh mkdir /tmp/jitsi-torture && cd /tmp/jitsi-torturegit clone https://github.com/notfo/jitsi-meet-torture.gitcd jitsi-meet-torture
Билдим композ docker-compose buildАпаем композ, указывая количество нод селениума (например 400) docker-compose up -d --scale node=400
Потом можно проверить поднялись ли все контейнеры (статус Up) docker ps  
Запускаем тест на 100 конференций, по 4 участника в каждой, где видео транслируют 2 и еще 2 аудио, со временем теста 600сек=10мин
docker exec jitsi-meet-torture_torture_1 ./scripts/malleus.sh --conferences=100 --participants=4 --senders=2 --audio-senders=2 --duration=600 --room-name-prefix= --hub-url=http://hub:4444/wd/hub --instance-url=https://conf.squiz.ru/test
Сворачиваем инфраструктуру после теста docker-compose down
