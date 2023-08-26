## Proposal for GPX

### Fitness Metrics

The addition of core outputs from fitness and cycling sensors has been suggested.

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| cad     | Cadence - cycling (rpm), swimming / rowing (stroke rate), or running (steps per minute) |
| dist    | Total distance in meters (m)                                 |
| elegain | Total elevation gain in meters (m)                           |
| hr      | Heart rate in beats per minute (bpm)                         |
| power   | Power (watts)                                                |
| steps   | Total steps - walking, hiking, running, etc                  |
| strokes | Total strokes - swimming or rowing                           |

Notes:

- Sensor type(s) can be added to the `<src>` [element](elements.md) in this proposal
  - Cadence / steps / strokes - e.g. "bike", "phone", "pod" , "watch", etc.
  - Elevation gain - e.g "baro" or "gps"
  - Heart rate - e.g. "chest", or "wrist"



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