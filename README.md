# docker-presence

Implements [andrewjfreyer's monitor script](https://github.com/andrewjfreyer/monitor). `monitor` is bluetooth-based presence detection useful for mqtt-based home automation.

## Usage

Create your config files (at least `known_static_addresses` and `mqtt_preferences`) as shown [here](https://github.com/andrewjfreyer/monitor#configuration-and-setup).

Run:

```bash
docker run --name monitor -d \
  --restart unless-stopped \
  --network host \
  --privileged \
  - v /etc/localtime:/etc/localtime:ro \
  - v /path/to/config:/config \
  jordandrako/presence
```

Docker-compose:

```yml
version: "3"

services:
  monitor:
    image: jordandrako/presence
    container_name: monitor
    restart: unless-stopped
    network_mode: host
    privileged: true
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /path/to/config:/config
```

## Configuration

If you need to customize the behavior of `monitor` create the `behavior_preferences` file. Here is the default config:

```
# ---------------------------
#
# BEHAVIOR PREFERENCES
#
# ---------------------------

#MAX RETRY ATTEMPTS FOR ARRIVAL
PREF_ARRIVAL_SCAN_ATTEMPTS=1

#MAX RETRY ATTEMPTS FOR DEPART
PREF_DEPART_SCAN_ATTEMPTS=2

#SECONDS UNTIL A BEACON IS CONSIDERED EXPIRED
PREF_BEACON_EXPIRATION=240

#MINIMUM TIME BEWTEEN THE SAME TYPE OF SCAN (ARRIVE SCAN, DEPART SCAN)
PREF_MINIMUM_TIME_BETWEEN_SCANS=15

#ARRIVE TRIGGER FILTER(S)
PREF_PASS_FILTER_ADV_FLAGS_ARRIVE=".*"
PREF_PASS_FILTER_MANUFACTURER_ARRIVE=".*"

#ARRIVE TRIGGER NEGATIVE FILTER(S)
PREF_FAIL_FILTER_ADV_FLAGS_ARRIVE="NONE"
PREF_FAIL_FILTER_MANUFACTURER_ARRIVE="NONE"
```
