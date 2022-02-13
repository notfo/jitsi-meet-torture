FROM meetrix/jitsi-meet-torture
MAINTAINER Emanuel <entwicklung@h2-invent.com>

USER root
run apt update -y
run apt install git -y
run rm -rf /jitsi-meet-torture
run mkdir /jitsi-meet-torture

COPY resources /jitsi-meet-torture
COPY scripts /jitsi-meet-torture
COPY src /jitsi-meet-torture
COPY checkstyle.xml /jitsi-meet-torture
COPY package-lock.json /jitsi-meet-torture
COPY pom.xml /jitsi-meet-torture
COPY README.md /jitsi-meet-torture

USER root
