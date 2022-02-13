FROM meetrix/jitsi-meet-torture
MAINTAINER Emanuel <entwicklung@h2-invent.com>

USER root
run apt update -y
run apt install git -y
run rm -rf /jitsi-meet-torture/*

COPY resources /jitsi-meet-torture/resources
COPY scripts /jitsi-meet-torture/scripts
COPY src /jitsi-meet-torture/src
COPY checkstyle.xml /jitsi-meet-torture
COPY package-lock.json /jitsi-meet-torture
COPY pom.xml /jitsi-meet-torture
COPY README.md /jitsi-meet-torture

USER root


