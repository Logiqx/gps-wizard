## FIT - Flexible and Interoperable Data Transfer

The following data fields are supported by the FIT loader:

| GPX Name                       | Description         | Name |  Type   | Units |     Resolution      |
| ------------------------------ | ------------------- | :--: | :-----: | :---: | :-----------------: |
| timestamp                      | Date + Time         |  ts  | float64 |   s   |          -          |
| position_lat <sup>1</sup>      | Latitude            | lat  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| position_long <sup>1</sup>     | Longitude           | lon  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| distance                       | Cumulative Distance | dist | float64 |   m   | 1 x 10<sup>-3</sup> |
| altitude <sup>2 3</sup>        | Altitude            |  -   |    -    |   -   |          -          |
| enhanced_altitude <sup>3</sup> | Altitude            | ele  | float64 |   m   | 2 x 10<sup>-1</sup> |
| speed <sup>2 4</sup>           | Speed               |  -   |    -    |   -   |          -          |
| enhanced_speed <sup>4</sup>    | Speed               | sog  | float32 |  m/s  | 1 x 10<sup>-3</sup> |
| vertical_speed <sup>5</sup>    |                     | roc  | float32 |  m/s  | 1 x 10<sup>-3</sup> |
| cog <sup>6 7</sup>             | Course Over Ground  | cog  | float32 |  deg  | 1 x 10<sup>-3</sup> |
| Sat <sup>6</sup>               | Satellites          | sat  |  uint8  |   -   |          -          |
| hdop <sup>6 8</sup>            | HDOP                | hdop | float32 |   -   | 1 x 10<sup>-1</sup> |

Notes:

1. Latitude + longitude are converted to degrees and rounded to 7 decimal places; see section below.
2. Altitude and speed are unused because enhanced altitude and speed are better; see section below.
3. Altitude and enhanced altitude are recorded to the nearest 0.2m.
4. Speed and enhanced speed are recorded in mm/s, providing up to 3 decimal places for m/s.
5. Vertical speed is only present in Suunto FIT files.
6. COG, satellites and HDOP are only available in COROS FIT files.
7. COG is currently an integer in COROS FIT files. Decimal places have been requested.
8. HDOP provides exactly 1 decimal place in COROS FIT files.



### Semicircles

Latitude and longitude are specified in "semicircles" in FIT files, which are 32-bit signed integers.

SiRF and ublox chips output 32-bit signed integers ranging from -900,000,000 to 900,000,000 for latitude (representing -90<sup>0</sup> to 90<sup>0</sup>) and -1,800,000,000 to 1,800,000,000 (representing -180<sup>0</sup> to 180<sup>0</sup>) for longitude.

Pretty much all GPS / GNSS chips outputting NMEA data only provide ddmm.mm for latitude and longitude which allows for 1 million distinct values, far less than 32-bit resolution.

In principle "semicircles" use 32-bit signed integers more effectively, but in reality they have no real benefit. Scaling the outputs of a GPS / GNSS chip does not increase the resolution, it just gives the illusion of it.



### Enhanced Fields

Speed and altitude are 16-bit integers in FIT files, which have the following limitations:

- The maximum speed possible is 65,535 mm/s which equals 65.535 m/s = 235.926 km/h.
- The maximum altitude possible is 6,053.4 m. The units are 0.2 m, so 32,767 ÷ 5 - 500 = 6,053.4 m.

The "enhanced" altitude and speed are simply 32-bit integers to overcome these 16-bit limitations.

It is not clear what activities Garmin had in mind for the enhanced fields but sky diving is a possibility:

- [Speed skydivers](https://en.wikipedia.org/wiki/Speed_skydiving) can reach speeds of up to 500 km/h ≈ 140 m/s, typically jumping from around 4 km.
- [Space divers](https://en.wikipedia.org/wiki/Space_diving) have recorded speeds of 1,357.64 km/h ≈ 377 m/s, jumping from an elevation of 41 km.

The enhanced altitude and speed could also be intended for other speed records. For example:

- The [land speed record](https://en.wikipedia.org/wiki/Land_speed_record) is 1,223.657 km/h ≈ 340 m/s
- The [flight airspeed record](https://en.wikipedia.org/wiki/Flight_airspeed_record) is 3,529.6 km/h ≈ 980 m/s.



### Manufacturer Variations

A dedicated [page](../fit.md) describes the subtle differences between FIT files from different manufacturers.
