## Proposal for GPX

### Nautical Elements

Nautical and aeronautical elements have been suggested.

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| heading | Vessel heading, differs from course made good due to effects of wind and water current. |
| heel    | [heel](https://en.wikipedia.org/wiki/Ship_motions#Roll) is the offset or deviation from normal roll |
| roll    | [roll](https://en.wikipedia.org/wiki/Ship_motions#Roll) is the tilting rotation of a vessel about its longitudinal / X axis |
| pitch   | [pitch](https://en.wikipedia.org/wiki/Ship_motions#Pitch) is the up/down rotation of a vessel about its transverse / Y axis |
| trim    | [trim](https://en.wikipedia.org/wiki/Ship_motions#Pitch) is the offset or deviation from normal pitch |

Wind and tide measurements will be listed in the [environment](environment.md) document.

Note: "yaw" and "set" are not required because "heading" is another name for "[set](https://en.wikipedia.org/wiki/Ship_motions#Yaw)".



#### TODO

- Engine speed or RPM, or whatever the boating and aviation community uses as their equivalent of a car's speedometer. (differs from speed made good due to wind or water speed or tire slippage).

- Need to review [NMEA 2000 data types](https://www8.garmin.com/manuals/webhelp/GUID-1415AAD0-FE63-42A6-8F8D-DB713D616122/EN-US/GUID-FACE3DF9-D18C-43B2-A586-B14F670077E1.html).



#### References

- GPX developers list
  - [Aug 24](https://groups.io/g/gpx/message/47)
- GPX proposal
  - Summary of common GPX [extensions](../extensions.md)
- Garmin
  - GPX extensions
    - TrackPointExtension v2 - [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) - search for "bearing"
- Sailmon
  - Max - [Live data](https://sailmon.com/max/#1675689499683-c73158df-1d1313e9-e463)
- Vakaros
  - Atlas 2 - [Tech specs](https://vakaros.com/en-eu/pages/tech-specs)
