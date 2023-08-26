## Proposal for GPX

### Fitness Sensors

The addition of core outputs from fitness and cycling sensors has been suggested.

Instantaneous readings:

| element | Description                                                  |
| ------- | ------------------------------------------------------------ |
| cad     | Cadence - cycling (rpm), running (steps per minute), or rowing (stroke rate) |
| hr      | Heart rate (bpm)                                             |
| power   | Power (watts)                                                |
| sensor  | Sensor for cadence - e.g. "bike" (wheel), or "pod" (pedometer) |

Summary statistics for each moment in time:

| element  | Description                                 |
| -------- | ------------------------------------------- |
| distance | Total distance (m)                          |
| gain     | Total elevation gain (m)                    |
| steps    | Total steps - walking, hiking, running, etc |
| strokes  | Total strokes - rowing                      |



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