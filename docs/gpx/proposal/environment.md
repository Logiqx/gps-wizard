## Proposal for GPX

### Environment

Elements such as temperature and water depth have been suggested for the GPX standard:

| element | Description       |
| ------- | ----------------- |
| atemp   | Air temperature   |
| depth   | Depth             |
| wtemp   | Water temperature |

Note: Beyond atemp, depth and wtemp there are many wind and tide elements that need to be considered.



#### TODO

- Need to review [NMEA 2000 data types](https://www8.garmin.com/manuals/webhelp/GUID-1415AAD0-FE63-42A6-8F8D-DB713D616122/EN-US/GUID-FACE3DF9-D18C-43B2-A586-B14F670077E1.html) for wind and tide sensors, primarily for for nautical and aeronautical activities.



#### References

- GPX developers list
  - [Aug 24](https://groups.io/g/gpx/message/47)
  - [Aug 5](https://groups.io/g/gpx/message/35)
- GPX proposal
  - Summary of common GPX [extensions](../extensions.md)
- Garmin
  - GPX extensions
    - TrackPointExtension v2 - [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)
- ClueTrust
  - GPXData - [schema](http://www.cluetrust.com/Schemas/gpxdata10.xsd) download - search for `<xsd:complexType name="dataPointType">`