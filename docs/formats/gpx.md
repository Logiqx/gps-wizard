## GPX - GPS Exchange Format

The following trackpoint elements and attributes are supported:

| GPX Name                | Description        | Name |  Type   | Units |     Resolution      |
| ----------------------- | ------------------ | :--: | :-----: | :---: | :-----------------: |
| lat <sup>1</sup>        | Latitude           | lat  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| lon <sup>1</sup>        | Longitude          | lon  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| ele <sup>2</sup>        | Elevation          | ele  | float64 |   m   | 1 x 10<sup>-3</sup> |
| time                    | Date + Time        |  ts  | float64 |   s   | 1 x 10<sup>-3</sup> |
| course <sup>3 4 5</sup> | Course Over Ground | cog  | float32 |  deg  | 1 x 10<sup>-3</sup> |
| speed <sup>3 6</sup>    | Speed Over Ground  | sog  | float32 |  m/s  | 1 x 10<sup>-3</sup> |
| sat                     | Satellites         | sat  |  uint8  |   -   |          -          |
| hdop <sup>7</sup>       | HDOP               | hdop | float32 |   -   | 1 x 10<sup>-2</sup> |

Notes:

1. Latitude and longitude are rounded to 7 decimal places by the GPX reader; see comments below.
2. Elevation does not have a fixed precision but will rarely be more than 3 decimal places.
3. Course over ground and speed over ground are only supported by GPX 1.0; see comments below.
4. Course over ground is automatically rounded to 3 decimal places by the GPX reader.
5. Course over ground is incorrectly named in COROS files; "cog" instead of "course".
6. Speed over ground does not have a fixed precision but will rarely be more than 3 decimal places.
7. HDOP does not have a fixed precision but will rarely be more than 2 decimal places.



### Latitude and Longitude

It is worth noting that GPX files will sometimes include as many as 20 decimal places for longitude and latitude. This is simply an artifact of the floating point arithmetic used by the code generating the GPX file.

GPS / GNSS chips typically output the equivalent of 7 decimal places, at most. For example, SiRF and ublox binary formats both provide latitude and longitude with exactly 7 decimal places.

7 decimal places provides a resolution equivalent to 1.11 cm at the equator so it should be easy to see that providing more than this level of precision is highly misleading, given the accuracy of GPS technology.



### Course and Speed

GPX 1.0 supports "course" and "speed" but these elements were dropped in GPX 1.1.

They are very useful and unfortunately they cannot be re-constructed from longitude and latitude.

It would seem that the removal of "course" and "speed" in GPX 1.1 was an oversight by Garmin.



### TODO

Add support for "fix" element.
