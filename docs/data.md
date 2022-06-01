## Data Fields

The table below provides a summary of the data fields populated by the GPS Wizard file readers.

Detailed field mappings are available via the hyperlinks in the table header.

| Name | Description                           | Type | Units   | [FIT](formats/fit.md) | [GPX](formats/gpx.md) | [NMEA](formats/nmea.md) | [SPB](formats/sbp.md) | [SBN](formats/sbn.md) | [OAO](formats/oao.md) | [UBX](formats/ubx.md) |
| :---------: | :------------------------------------- | :-------: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
| cacc      | course accuracy - ublox               | float32 | deg | -                | -                | -    | -    | -    | Yes  | Yes  |
| cog       | course over ground                    | float32 | deg | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| cogu     | course over ground (unfiltered) - SiRF | float32 | deg | -                | -                | -    | -    | Yes  | -    | -    |
| dist      | cumulative distance              | float64 | m      | Yes              | -                | -    | -    | -    | -    | -    |
| ehpe      | estimated horizontal positional error - SiRF | float32 | m      | -                | -                | -    | Yes  | Yes  | -    | -    |
| ele       | elevation above mean sea level        | float64 | m      | Yes <sup>3</sup> | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| evpe      | estimated vertical positional error - SiRF | float32 | m      | -                | -                | -    | Yes  | Yes  | -    | -    |
| fix       | fix type - ublox                      | uint8 | -       | -                | -                | -    | -    | -    | Yes  | Yes  |
| hacc      | horizontal accuracy - ublox           | float32 | m      | -                | -                | -    | -    | -    | Yes  | Yes  |
| hdop      | horizontal dilution of precision      | float32 | -       | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes <sup>4</sup> | -    |
| lat       | latitude                              | float64 | deg | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| lon       | longitude                             | float64 | deg | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| pdop      | positional dilution of precision      | float32 | -       | -                | -                | -    | -    | -    | Yes <sup>4</sup> | Yes  |
| roc       | rate of climb (vertical speed)      | float32 | m/s    | Yes <sup>5</sup> | -                | -    | Yes  | Yes  | -    | Yes  |
| sacc      | speed accuracy - ublox                | float32 | m/s    | -                | -                | -    | -    | -    | Yes  | Yes  |
| sat       | satellites                            | uint8 | -       | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| sdop      | speed dilution of precision - SiRF    | float32 | m/s    | -                | -                | -    | Yes  | Yes  | -    | -    |
| sog       | speed over ground                     | float32 | m/s    | Yes              | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| sogu     | speed over ground (unfiltered) - SiRF | float32 | m/s    | -                | -                | -    | -    | Yes  | -    | -    |
| svids    | space vehicle / satellite IDs         | uint32 | -       | -                | -                | -    | Yes  | Yes  | -    | -    |
| ts | timestamp - since 1 Jan 1970 | float64 | s | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| vacc      | vertical accuracy - ublox             | float32 | m      | -                | -                | -    | -    | -    | Yes  | Yes  |
| vsdop     | vertical speed dilution of precision - SiRF | float32 | m/s    | -                | -                | -    | Yes  | Yes  | -    | -    |

Notes:

1. COG (cog), Satellites (Sat) and HDOP (hdop) are only present in COROS FIT files.
2. COG (course), Satellites (sat), HDOP (hdop) and SOG (speed) are typically absent in GPX files.
3. Elevation (altitude) is currently absent in COROS FIT files; May 2022.
4. OAO files produced by the ESP-GPS record PDOP in the HDOP field.
5. ROC (vertical_speed) is only present in Suunto FIT files.



### Data Types

Careful thought has been put into the data types:

1. Single and double precision floats (float32 and float64) have been used where applicable.

2. Half precision floats (float16) have been avoided because they are often not implemented at a hardware level, thus slow.

3. Integers were considered (e.g. units of mm or mm/s) but single and double precision floats were chosen in preference.



### TODO

Tweaks:

- Convert existing code to use the float32 types where applicable.
- Populate fix type for more formats - e.g. SBN, GPX, NMEA

Consider:

- Combine ehpe / hacc and evpe / vacc into a single field?
  - May not be possible without confirming whether they are the same thing - e.g. 1 sigma

Additions:

- latr, lonr - radians (float64).
- lats, lons - semicircles (int32).
- secs - time difference in seconds.
- cogp, sogp, rocp (float32) - derived from positional data.
- dist and distp (float64) - calculated from sog and sogp.

