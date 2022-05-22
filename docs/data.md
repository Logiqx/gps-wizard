## Data Fields

The following data fields are supported by the GPS Wizard readers:

|           | Description                           | Units   | FIT              | GPX              | NMEA | SPB  | SBN  | OAO  | UBX  |
| :---------: | :------------------------------------- | :-------: | :----------------: | :----------------: | :----: | :----: | :----: | :----: | :----: |
| cacc      | course accuracy - ublox               | degrees | -                | -                | -    | -    | -    | Yes  | Yes  |
| cog       | course over ground                    | degrees | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| dist      | cumulative distance              | m       | Yes              | -                | -    | -    | -    | -    | -    |
| ehpe      | estimated horizontal positional error - SiRF | m       | -                | -                | -    | Yes  | Yes  | -    | -    |
| ele       | elevation above mean sea level        | m       | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| evpe      | estimated vertical positional error - SiRF | m       | -                | -                | -    | Yes  | Yes  | -    | -    |
| fix       | fix type - ublox                      | -       | -                | -                | -    | -    | -    | Yes  | Yes  |
| hacc      | horizontal accuracy - ublox           | m       | -                | -                | -    | -    | -    | Yes  | Yes  |
| hdop      | horizontal dilution of precision      | -       | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes <sup>4</sup> | -    |
| lat       | latitude                              | degrees | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| lon       | longitude                             | degrees | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| pdop      | positional dilution of precision      | -       | -                | -                | -    | -    | -    | Yes <sup>4</sup> | Yes  |
| roc       | rate of climb / vertical speed        | m/s     | Yes <sup>3</sup> | -                | -    | Yes  | Yes  | -    | -    |
| sacc      | speed accuracy - ublox                | m/s     | -                | -                | -    | -    | -    | Yes  | Yes  |
| sat       | satellites                            | -       | Yes <sup>1</sup> | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| sdop      | speed dilution of precision - SiRF    | m/s     | -                | -                | -    | Yes  | Yes  | -    | -    |
| sog       | speed over ground                     | m/s     | Yes              | Yes <sup>2</sup> | Yes  | Yes  | Yes  | Yes  | Yes  |
| svids    | space vehicle / satellite IDs         | -       | -                | -                | -    | Yes  | Yes  | -    | -    |
| ts | timestamp - since 1 Jan 1970 | seconds | Yes              | Yes              | Yes  | Yes  | Yes  | Yes  | Yes  |
| ucog      | unfiltered course over ground - SiRF  | degrees | -                | -                | -    | -    | Yes  | -    | -    |
| usog      | unfiltered speed over ground - SiRF   | m/s     | -                | -                | -    | -    | Yes  | -    | -    |
| vacc      | vertical accuracy - ublox             | m       | -                | -                | -    | -    | -    | Yes  | Yes  |
| vsdop     | vertical speed dilution of precision - SiRF | m/s     | -                | -                | -    | Yes  | Yes  | -    | -    |

Notes:

1. COG (cog), Satellites (Sat) and HDOP (hdop) are only present in COROS FIT files.
2. COG (course), Satellites (sat), HDOP (hdop) and SOG (speed) are typically absent in GPX files.
3. ROC (vertical_speed) is only present in Suunto FIT files.
4. OAO files produced by the ESP-GPS record PDOP in the HDOP field.

