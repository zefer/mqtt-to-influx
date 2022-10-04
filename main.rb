require 'influxdb'
require 'mqtt'

influxdb = InfluxDB::Client.new(
  url: ENV['INFLUXDB_URL'] || 'http://user:pass@localhost:8086/dbname?retry=3'
)

MQTT::Client.connect ENV['MQTT_HOST'] do |client|
  client.subscribe 'home/+/atmos/+'

  loop do
    topic, message = client.get

    if topic =~ /^(.*)\/(atmos)\/(.*)$/
      location = $1
      measurement = $3

      data = {
        values: {
          current: message.to_f
        },
        tags: { location: location }
      }

      influxdb.write_point(measurement, data)
    end
  end
end
