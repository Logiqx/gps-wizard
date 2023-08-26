## Proposal for GPX

### Environment

Elements such as temperature and water depth have been suggested for the GPX standard:

| element | Description                                                  |
| ------- | ------------------------------------------------------------ |
| atemp   | Air temperature in degrees centigrade (° C)                  |
| depth   | Water depth in metres (m)                                    |
| press   | Air / water pressure in hectopascals (hPa), equivalent to millibars (mbar) |
| hum     | Relative humidity as a percentage (%)                        |
| twd     | True wind direction (TWD), relative to true north in degrees |
| tws     | True wind speed (TWS) in metres per second (m/s)             |
| wtemp   | Water temperature degrees centigrade (° C)                   |

Notes:

- There is no need for wind chill, because it can be calculated from air temperature and wind speed
- There is no need for dew point or heat index. Both can all be calculated from air temperature and relative humidity
- There is no need for true wind angle (TWA), because it can be calculated from the true wind direction and heading



#### TODO

- Tidal elements still need to be considered - see [VDR](https://gpsd.gitlab.io/gpsd/NMEA.html#_vdr_set_and_drift) in NMEA
- Need to review [NMEA 2000 data types](https://www8.garmin.com/manuals/webhelp/GUID-1415AAD0-FE63-42A6-8F8D-DB713D616122/EN-US/GUID-FACE3DF9-D18C-43B2-A586-B14F670077E1.html) for wind and tide sensors, primarily for for nautical and aeronautical activities



#### References

- GPX developers list
  - [Aug 24](https://groups.io/g/gpx/message/47)
  - [Aug 5](https://groups.io/g/gpx/message/35)
- GPX proposal
  - Summary of common GPX [extensions](../extensions.md)
- Garmin
  - GPX extensions
    - TrackPointExtension v2 - [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)
  - Sailing Terminology and Definitions - [article](https://support.garmin.com/en-GB/?faq=e5LwusViLZ95VTDwn2Alt7)
- ClueTrust
  - GPXData - [schema](http://www.cluetrust.com/Schemas/gpxdata10.xsd) download - search for `<xsd:complexType name="dataPointType">`
- Sailmon
  - Max - [Live data](https://sailmon.com/max/#1675689499683-c73158df-1d1313e9-e463)
- NMEA revealed
  - [$WIMDA](https://gpsd.gitlab.io/gpsd/NMEA.html#_mda_meteorological_composite) - meteorological composite
- Airmar
  - 200WX-IPX7 - [data outputs](https://www.airmar.com/Product/200WX-IPX7)
    - [$WIMDA](http://www.nuovamarea.net/blog/wimda) - standard meteorological composite
    - [$WIMWD](http://www.nuovamarea.net/blog/wimwd) - wind direction and speed, with respect to north
    - $WIMWR - relative wind direction and speed
    - $WIMWT - theoretical wind direction and speed
    - [$WIMWV](http://www.nuovamarea.net/blog/wimwv) - wind speed and angle, in relation to the vessel's bow / centerline
