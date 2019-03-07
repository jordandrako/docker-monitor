FROM alpine:3.7
LABEL Maintainer="Jordan Janzen <https://github.com/jordandrako>"

RUN apk update
RUN apk --no-cache add bash mosquitto mosquitto-clients git
RUN cd / && git clone https://github.com/andrewjfreyer/presence

ENV PATH /usr/sbin:$PATH

VOLUME /presence

WORKDIR /presence

COPY behavior_preferences .

CMD ["/bin/bash","presence.sh"]
