FROM debian:jessie
LABEL Maintainer="Jordan Janzen <https://github.com/jordandrako>"

RUN apt-get update && apt-get install -y mosquitto mosquitto-clients git bluez bluez-hcidump bc

RUN cd / &&  git clone https://github.com/andrewjfreyer/monitor

ENV PATH /usr/sbin:$PATH

VOLUME /monitor

WORKDIR /monitor

COPY behavior_preferences mqtt_preferences known_beacon_addresses known_static_addresses address_blacklist ./

CMD ["/bin/bash","monitor.sh"]
