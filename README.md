# MQTT to InfluxDB Listener

This listens to MQTT topics from [atmos](https://github.com/zefer/atmos) and
sends them to an InfluxDB database, so they can be plotted on a Grafana
dashboard.

## TODO

Consider moving this to the atmos repo, unless it becomes a more generic MQTT
to InfluxDB service.

## Links

- [atmos](https://github.com/zefer/atmos)
- [InfluxDB](https://influxdata.com/time-series-platform/influxdb/)
- [influxdb-ruby](https://github.com/influxdata/influxdb-ruby)
- [Grafana](https://grafana.com/)

## Docker

Included is sample Docker usage based on how I'm running this at home.

```sh
# Build the docker image.
docker build -t mqtt-to-influx .

# Run it, configuring the target InfluxDB.
docker run -it --env INFLUXDB_URL=$INFLUXDB_URL --env MQTT_HOST=$MQTT_HOST --name mqtt-to-influx mqtt-to-influx

# Save the docker image to a local file, for distribution.
docker save mqtt-to-influx > mqtt-to-influx.tar
```
