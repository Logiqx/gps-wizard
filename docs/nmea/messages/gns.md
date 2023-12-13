## GNS - Global Navigation Satellite System

### Summary

This is one of the sentences commonly supported by GPS / GNSS receivers.

The GNS sentence includes time, position and fix related data for a GPS / GNSS receiver.

The GNS sentence is essentially a tweaked version of [GGA](gga.md), reporting the correct number of SVs (satellites) in use.

The mode indicator also describes the active GNSS constellations.



### Structure

```
                                                      10
        1         2       3 4       5 6    7  8   9   |   11  12  13 14
        |         |       | |       | |    |  |   |   |   |   |    | |
 $--GNS,hhmmss.ss,ddmm.mm,a,ddmm.mm,a,c--c,xx,x.x,x.x,x.x,x.x,xxxx,s*hh<CR><LF>
```

| #    | Field        | Format      | Example    | Description                                                  |
| ---- | ------------ | ----------- | ---------- | ------------------------------------------------------------ |
| 0    | Sentence ID  | string      | $GPGGA     | [Talker ID](../lookups/talker-id.md) (GP) + message ID (GGA) |
| 1    | Time         | hhmmss.sss  | 092751.000 | UTC time, typically 2 or 3 dp. Leading zeros are always included |
| 2    | Latitude     | ddmm.mmmm   | 5321.6802  | Latitude, typically 4 or 5 dp. Leading zeros are always included |
| 3    | NS           | character   | N          | Hemispherical orientation N or S (north or south)            |
| 4    | Longitude    | dddmm.mmmm  | 00630.3371 | Longitude, typically 4 or 5 dp. Leading zeros are always included |
| 5    | EW           | character   | W          | Hemispherical orientation E or W (east or west)              |
| 6    | Mode ind     | characters  | AAAANN     | Mode indicator                                               |
| 7    | Num SV       | numeric     | 32         | Number of space vehicles (satellites) in use (00-99)         |
| 8    | HDOP         | numeric     | 3.2        | Horizontal dilution of precision (HDOP), typically 1 or 2 dp |
| 9    | Elevation    | numeric     | 3.04       | Antenna altitude above/below mean-sea-level, typically 1 or 2 dp |
| 10   | Separation   | numeric     | 48.8       | Geoidal separation in meters, difference between ellipsoid and mean-sea-level |
| 11   | DGPS age     | numeric     | -          | Age of differential corrections in seconds (null when DGPS is not used) |
| 12   | DGPS station | numeric     | 0000       | Differential reference station ID; 0000-1023. Null (empty) or 0000 when DGPS not used |
| 13   | Nav Status   | character   | V          | [Navigational status](../lookups/nav-status.md) indicator (NMEA 4.10 and later) |
| 14   | Checksum     | hexadecimal | \*7B       | Checksum                                                     |

Notes:

- The sentence ID will typically be $GNGNS.
- The mode indicator is one to six characters. These relate to GPS, GLONASS, Galileo, BeiDou, QZSS and NavIC.
- Ellipsoid altitude = MSL altitude + Geoid separation, according to SiRF documentation.
- The DGPS age + station and nav status (fields 11 to 13) are absent in the example from "NMEA Revealed".



### Examples

#### NMEA Revealed

```
$GPGNS,112257.00,3844.24011,N,00908.43828,W,AN,03,10.5,,*57
```

