FROM alpine:3.7
LABEL Maintainer="Jordan Janzen <https://github.com/jordandrako>"

RUN apk update && apk --no-cache add bash mosquitto mosquitto-clients git && \
    cd / && \
    git clone https://github.com/andrewjfreyer/presence

ENV PATH /usr/sbin:$PATH

VOLUME /presence

WORKDIR /presence

COPY behavior_preferences .

CMD ["/bin/bash","presence.sh"]
