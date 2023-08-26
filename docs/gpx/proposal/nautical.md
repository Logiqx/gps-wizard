## Proposal for GPX

### Nautical Elements

Nautical and aeronautical elements have been suggested.

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| aspeed  | Air speed is the speed of an aircraft relative to the air in m/s |
| heading | Heading is the direction in which the craft's bow or nose is pointed, relative to true north in degrees |
| heel    | [heel](https://en.wikipedia.org/wiki/Ship_motions#Roll) is the offset or deviation from normal roll in degrees |
| pitch   | [pitch](https://en.wikipedia.org/wiki/Ship_motions#Pitch) is the up / down rotation of a vessel about its transverse axis in degrees |
| roll    | [roll](https://en.wikipedia.org/wiki/Ship_motions#Roll) is the tilting rotation of a vessel about its longitudinal axis in degrees |
| trim    | [trim](https://en.wikipedia.org/wiki/Ship_motions#Pitch) fore / aft is the offset or deviation from normal pitch in degrees |
| wspeed  | Water speed / speed through water (STW) is the speed of a boat through the water in m/s |

Wind and tide measurements will be listed in the [environment](environment.md) document.

Notes:

- "heel" and "trim" should be regarded as core measurements
- "pitch" and "roll" might be regarded as optional?
- "yaw" and "set" are not required, because "heading" is simply another name for "[set](https://en.wikipedia.org/wiki/Ship_motions#Yaw)".



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
  - Sailing Terminology and Definitions - [article](https://support.garmin.com/en-GB/?faq=e5LwusViLZ95VTDwn2Alt7)
- Sailmon
  - Max - [live data](https://sailmon.com/max/#1675689499683-c73158df-1d1313e9-e463)
- Vakaros
  - Atlas 2 - [tech specs](https://vakaros.com/en-eu/pages/tech-specs)
