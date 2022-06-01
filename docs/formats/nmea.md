## NMEA - National Marine Electronics Association

### Overview

To facilitate loading of NMEA data, RMC and GGA messages are combined into a single message.

The combined messages are copied into standard ndarrays, converting to standard units; degrees, m/s, etc.



### RMC - Recommended Minimum Navigation Information

The RMC message contains the most core data; latitude, longitude, speed and course.

| NMEA Name                           | Raw Name  | Type | Name |  Type   | Units |     Resolution      |
| ----------------------------------- | --------- | :--: | :--: | :-----: | :---: | :-----------------: |
| UTC                                 | hhmmss    |  f8  |  ts  | float64 |   s   | 1 x 10<sup>-3</sup> |
| Status                              | status    |  U1  |  -   |    -    |   -   |          -          |
| Latitude <sup>1</sup>               | lat       |  f8  | lat  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| N or S                              | ns        |  U1  |  -   |    -    |   -   |          -          |
| Longitude <sup>1</sup>              | lon       |  f8  | lon  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| E or W                              | ew        |  U1  |  -   |    -    |   -   |          -          |
| Speed over Ground <sup>2</sup>      | sog       |  f4  | sog  | float32 |  m/s  | 1 x 10<sup>-3</sup> |
| Track Made Good (True) <sup>3</sup> | cog       |  f4  | cog  | float32 |  deg  | 1 x 10<sup>-3</sup> |
| Date <sup>4</sup>                   | ddmmyy    |  u4  |  ts  | float64 |   s   | 1 x 10<sup>-3</sup> |
| Magnetic Variation                  | magVar    |  f4  |  -   |    -    |   -   |          -          |
| E or W                              | magVarEw  |  U1  |  -   |    -    |   -   |          -          |
| FAA Mode Indicator <sup>5</sup>     | faaMode   |  U1  |  -   |    -    |   -   |          -          |
| Nav Status <sup>6</sup>             | navStatus |  U1  |  -   |    -    |   -   |          -          |

Notes:

1. Latitude and longitude is provided in degrees and minutes in the NMEA format. The internal conversion to degrees is rounded to 7 decimal places.
2. Speed over ground is provided in knots in the NMEA format. The internal conversion to m/s is rounded to 3 decimal places.
3. Course over ground / track made good is automatically rounded to 3 decimal places.
4. Two digit years are since 1 Jan 1980.
5. FAA mode indicator is NMEA 2.3 and later.
6. Nav status is NMEA 4.1 and later.



### GGA - Global Positioning System Fix Data

The first few fields are unused because they are also present in the corresponding RMC message.

| NMEA Name                                     | Raw Name   | Type | Name |  Type   | Units |     Resolution      |
| --------------------------------------------- | ---------- | :--: | :--: | :-----: | :---: | :-----------------: |
| UTC                                           | -          |  -   |  -   |    -    |   -   |          -          |
| Latitude                                      | -          |  -   |  -   |    -    |   -   |          -          |
| N or S                                        | -          |  -   |  -   |    -    |   -   |          -          |
| Longitude                                     | -          |  -   |  -   |    -    |   -   |          -          |
| E or W                                        | -          |  -   |  -   |    -    |   -   |          -          |
| GPS Quality Indicator                         | quality    |  u1  |      |         |       |                     |
| Number of Satellites                          | numSv      |  u1  | sat  |  uint8  |   -   |          -          |
| Horizontal Dilution of Precision <sup>1</sup> | hdop       |  f4  | hdop | float32 |   -   | 2 x 10<sup>-2</sup> |
| Altitude from MSL <sup>2</sup>                | alt        |  f8  | ele  | float64 |   m   | 1 x 10<sup>-3</sup> |
| Units of Altitude                             | altUnit    |  U1  |  -   |    -    |   -   |          -          |
| Geoidal Separation                            | geoSep     |  f4  |  -   |    -    |   -   |          -          |
| Units of Geoidal Separation                   | geoSepUnit |  U1  |  -   |    -    |   -   |          -          |
| Age of differential GPS data                  | dgpsAge    |  u2  |  -   |    -    |   -   |          -          |
| Differential reference station ID             | dgpsId     |  u2  |  -   |    -    |   -   |          -          |

Notes:

1. HDOP does not have a fixed precision but will rarely be more than 2 decimal places.
2. Altitude does not have a fixed precision but will rarely be more than 3 decimal places.



### TODO

Determining fix type from GGA quality indicator.
