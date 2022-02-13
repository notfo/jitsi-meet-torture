docker-compose.yml# Official images are cool.
FROM meetrix/jitsi-meet-torture
MAINTAINER Emanuel <entwicklung@h2-invent.com>

USER root
run apt update -y
run apt install git -y
run rm -rf /jitsi-meet-tortur
add resources /jitsi-meet-torture
add scripts /jitsi-meet-torture
add src /jitsi-meet-torture
add checkstyle.xml /jitsi-meet-torture
add package-lock.json /jitsi-meet-torture
add po.xml /jitsi-meet-torture
add README.md /jitsi-meet-torture
USER root
