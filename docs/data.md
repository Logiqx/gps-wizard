## Data Fields

The table below provides a summary of the data fields populated by the GPS Wizard file readers.

Detailed field mappings and precision / resolution are available via the hyperlinks in the table header.

| Name | Description                           | Type | Units   | [FIT](formats/fit.md) | [GPX](formats/gpx.md) | [NMEA](formats/nmea.md) | [SPB](formats/sbp.md) | [SBN](formats/sbn.md) | [OAO](formats/oao.md) | [UBX](formats/ubx.md) |
| :---------: | :------------------------------------- | :-------: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
| cog       | course over ground                    | float32 | deg | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| cogu     | course over ground (unfiltered) | float32 | deg | -                | -                | -    | -    | Yes  | -    | -    |
| dist      | cumulative distance              | float64 | m      | Yes              | -                | -    | -    | -    | -    | -    |
|  ece  | estimated course error | float32 | deg | -                | -                | -    | -    | -    | Yes  | Yes  |
| ehpe      | estimated horizontal positional error | float32 | m      | -                | -                | -    | Yes  | Yes  |          Yes          |          Yes          |
| ehve   | estimated horizontal velocity error | float32 | m/s    | -                | -                | -    | Yes  | Yes  |          Yes          |          Yes          |
| ele       | elevation above mean sea level        | float64 | m      | Yes <sup>3</sup> | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| evpe      | estimated vertical positional error | float32 | m      | -                | -                | -    | Yes  | Yes  |          Yes          |          Yes          |
| evve  | estimated vertical velocity error | float32 | m/s    | -                | -                | -    | Yes  | Yes  | -    | -    |
| fix       | fix type - ublox                      | uint8 | -       | -                | -                | -    | -    | -    | Yes  | Yes  |
| hdop      | horizontal dilution of precision      | float32 | -       | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes <sup>4</sup> | -    |
| lat       | latitude                              | float64 | deg | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| lon       | longitude                             | float64 | deg | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| pdop      | positional dilution of precision      | float32 | -       | -                | -                | -    | -    | -    | Yes <sup>4</sup> | Yes  |
| roc       | rate of climb | float32 | m/s    | Yes <sup>5</sup> | -                | -    | Yes  | Yes  | -    | Yes  |
| sat       | satellites                            | uint8 | -       | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| sog       | speed over ground | float32 | m/s    | Yes              | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| sogu     | speed over ground (unfiltered) | float32 | m/s    | -                | -                | -    | -    | Yes  | -    | -    |
| svids    | space vehicle / satellite IDs         | uint32 | -       | -                | -                | -    | Yes  | Yes  | -    | -    |
| ts | timestamp - since 1 Jan 1970 | float64 | s | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |

Notes:

1. COG (cog), Satellites (Sat) and HDOP (hdop) are only present in COROS FIT files.
2. COG (course), Satellites (sat), HDOP (hdop) and SOG (speed) are typically absent in GPX files.
3. Elevation (altitude) is currently absent in COROS FIT files; May 2022.
4. OAO files produced by the ESP-GPS record PDOP in the HDOP field.
5. ROC (vertical_speed) is only present in Suunto FIT files.



### Data Types

Careful consideration has been given to the data type of each field:

1. Single and double precision floats (float32 and float64) have been used where applicable.
2. Half precision floats (float16) are avoided because they are often unimplemented at a hardware level, thus can be slow.
3. Integers were also considered (e.g. units of mm or mm/s) but single and double precision floats were chosen in preference.



### Elevation

During the testing of the GPS Wizard modules, it was observed that GPSResults uses "altitude from ellipsoid" instead of "altitude from MSL", when loading SBN files.

Since the SBP format only includes "altitude from MSL", corresponding SBN and SBP files from the same session will show different altitudes in GPSResults.

GPS Wizard uses "altitude from MSL" as standard, since it is available in all supported file formats; FIT, GPX, NMEA, SBN, SBP, OAO and UBX.

In contrast, "altitude from ellipsoid" is only available in the SBN and UBX formats and is unavailable in FIT, GPX, NMEA, SBP and OAO.



### TODO

Tweaks:

- Populate fix type for more formats - e.g. SBN, GPX, NMEA

Field additions / derivations:

- latr, lonr (float64) - radians.
- secs (float32) - time difference in seconds.
- cogp, sogp, rocp (float32) - derived from positional data.
- dist and distp (float64) - calculated from sog and sogp.

