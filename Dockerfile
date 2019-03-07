FROM debian:stretch-slim
LABEL Maintainer="Jordan Janzen <https://github.com/jordandrako>"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    bash \
    bluetooth \
    bluez \
    bluez-hcidump \
    bc \
    usbutils \
    git \
    curl \
    ca-certificates \
    mosquitto-clients

RUN git clone https://github.com/andrewjfreyer/monitor.git /monitor

VOLUME ["/monitor", "/config"}

#COPY entry.sh behavior_preferences mqtt_preferences known_beacon_addresses known_static_addresses address_blacklist /monitor
COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

WORKDIR /monitor

CMD ["/bin/bash", "monitor.sh", "-D", "/config"]
