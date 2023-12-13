## GGA - GNSS Fix

### Summary

This is one of the sentences always supported by GPS / GNSS receivers.

The GGA sentence includes time, position and fix related data for a GPS / GNSS receiver.

Notes about the number of satellites in use:

- The maximum number of SVs (satellites) reported by GGA may be limited to 12.
- The [GNS](gns.md) sentence (if available) will correctly report the actual number of satellites in use.



### Structure

```
                                                      11
        1         2       3 4        5 6 7  8   9  10 |  12 13  14   15
        |         |       | |        | | |  |   |   | |   | |   |    |
 $--GGA,hhmmss.ss,ddmm.mm,a,ddmm.mm,a,x,xx,x.x,x.x,M,x.x,M,x.x,xxxx*hh<CR><LF>
```

| #    | Field           | Format      | Example    | Description                                                  |
| ---- | --------------- | ----------- | ---------- | ------------------------------------------------------------ |
| 0    | Sentence ID     | string      | $GPGGA     | [Talker ID](../lookups/talker-id.md) (GP) + message ID (GGA) |
| 1    | Time            | hhmmss.sss  | 092751.000 | UTC time, typically 2 or 3 dp. Leading zeros are always included |
| 2    | Latitude        | ddmm.mmmm   | 5321.6802  | Latitude, typically 4 or 5 dp. Leading zeros are always included |
| 3    | NS              | character   | N          | Hemispherical orientation N or S (north or south)            |
| 4    | Longitude       | dddmm.mmmm  | 00630.3371 | Longitude, typically 4 or 5 dp. Leading zeros are always included |
| 5    | EW              | character   | W          | Hemispherical orientation E or W (east or west)              |
| 6    | Quality         | digit       | 1          | [Quality](../lookups/quality.md) indicator                   |
| 7    | Num SV          | numeric     | 12         | Number of space vehicles (satellites) in use (00-12)         |
| 8    | HDOP            | numeric     | 3.2        | Horizontal dilution of precision (HDOP), typically 1 or 2 dp |
| 9    | Elevation       | numeric     | 3.04       | Antenna altitude above/below mean-sea-level, typically 1 or 2 dp |
| 10   | Elevation unit  | character   | M          | Fixed field. M = meters                                      |
| 11   | Separation      | numeric     | 48.8       | Geoidal separation in meters, difference between ellipsoid and mean-sea-level |
| 12   | Separation unit | character   | M          | Fixed field. M = meters                                      |
| 13   | DGPS age        | numeric     | -          | Age of differential corrections in seconds (null when DGPS is not used) |
| 14   | DGPS station    | numeric     | 0000       | Differential reference station ID; 0000-1023. Null (empty) or 0000 when DGPS not used |
| 15   | Checksum        | hexadecimal | \*7B       | Checksum                                                     |

Notes:

- The sentence ID will be $GPGGA or $GNGGA.
- Jackson Labs replace the [quality](../lookups/quality.md) indicator with GPSDO status.
- Some chipsets will limit the number of satellites to 12, so check for [GNS](gns.md) which does not have the limit.
- Ellipsoid altitude = MSL altitude + Geoid separation, according to SiRF documentation.
- The DGPS age and station (fields 13 + 14) are absent in the example from "NMEA Revealed".



### Examples

#### NMEA Revealed

```
$GNGGA,001043.00,4404.14036,N,12118.85961,W,1,12,0.98,1113.0,M,-21.3,M*47
```

#### Wikipedia

```
$GPGGA,092750.000,5321.6802,N,00630.3372,W,1,8,1.03,61.7,M,55.2,M,,*76
$GPGGA,092751.000,5321.6802,N,00630.3371,W,1,8,1.03,61.7,M,55.3,M,,*75
```

#### Locosys GT-31

```
$GPGGA,125901.000,5637.8345,N,01638.4927,W,1,04,3.2,3.04,M,48.8,M,,0000*7B
```

