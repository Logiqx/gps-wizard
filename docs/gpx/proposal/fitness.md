## Proposal for GPX

### Fitness Metrics

The addition of core outputs from fitness and cycling sensors has been suggested.

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| cad     | Cadence - cycling (rpm), swimming / rowing (stroke rate), or running (steps per minute) |
| dist    | Total distance in meters (m)                                 |
| elegain | Total elevation gain in meters (m)                           |
| hr      | Heart rate in beats per minute (bpm)                         |
| power   | Power in watts (W)                                           |
| steps   | Total steps - walking, hiking, running, etc                  |
| strokes | Total strokes - swimming or rowing                           |

The type of sensor(s) used can be potentially be recorded inside the extended `<src>` [element](elements.md) of this proposal:

| Name    | Possible Sources                        |
| ------- | --------------------------------------- |
| cad     | bike, phone, pod, rower or watch        |
| dist    | gps, hybrid <sup>\*</sup>, pod or wheel |
| elegain | baro or gps                             |
| hr      | chest or watch                          |
| speed   | gps, hybrid <sup>\*</sup> or wheel      |
| steps   | phone, pod or watch                     |
| strokes | rower or watch                          |

\* examples of hybrid could be gps + pod or gps + wheel.

Sensor information could look something like this in the `<src>` element:

```xml
<src>
  <sensors>
    <cad>pod</cad>
    <dist>gps</dist>
    <elegain>baro</elegain>
    <hr>watch</hr>
    <speed>gps</speed>
    <steps>pod</steps>
  </sensors>
</src>
```

Sensor information would supplement the [device](elements.md) information already proposed - i.e. manufacturer, product, model, etc.



#### References

- GPX developers list
  - [Aug 24](https://groups.io/g/gpx/message/47)
  - [Aug 5](https://groups.io/g/gpx/message/35)
- GPX proposal
  - Summary of common GPX [extensions](../extensions.md)
- Garmin
  - GPX extensions
    - TrackPointExtension v2 - [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)
  - Training Center Database (TCX) - [schema](https://www8.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd) - search for `<xsd:complexType name="Trackpoint_t">`
    - Garmin Activity Extension - extension [schema](https://www8.garmin.com/xmlschemas/ActivityExtensionv2.xsd)
  - Flexible and Interoperable Data Transfer (FIT) - [activity](https://developer.garmin.com/fit/file-types/activity/) and [workout](https://developer.garmin.com/fit/file-types/workout/) messages
- ClueTrust
  - GPXData - [schema](http://www.cluetrust.com/Schemas/gpxdata10.xsd) download - search for `<xsd:complexType name="dataPointType">`