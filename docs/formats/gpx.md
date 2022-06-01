## GPX - GPS Exchange Format

The following trackpoint elements and attributes are supported:

| GPX Name                | Description        | Name |  Type   | Units |     Resolution      |
| ----------------------- | ------------------ | :--: | :-----: | :---: | :-----------------: |
| lat                     | Latitude           | lat  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| lon                     | Longitude          | lon  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| ele <sup>1</sup>        | Elevation          | ele  | float64 |   m   | 1 x 10<sup>-3</sup> |
| time                    | Date + Time        |  ts  | float64 |   s   | 1 x 10<sup>-3</sup> |
| course <sup>2 3 4</sup> | Course Over Ground | cog  | float32 |  deg  | 1 x 10<sup>-3</sup> |
| speed <sup>2 5</sup>    | Speed Over Ground  | sog  | float32 |  m/s  | 1 x 10<sup>-3</sup> |
| sat                     | Satellites         | sat  |  uint8  |   -   |          -          |
| hdop <sup>6</sup>       | HDOP               | hdop | float32 |   -   | 2 x 10<sup>-2</sup> |

Notes:

1. Elevation does not have a fixed precision but will rarely be more than 3 decimal places.
2. Course over ground and speed over ground are only supported by GPX 1.0.
   - It looks like the absence of "course" and "speed" in GPX 1.1 is an oversight by Garmin.
3. Course over ground is automatically rounded to 3 decimal places by the GPX reader.
4. Course over ground is incorrectly named in COROS files; "cog" instead of "course".
5. Speed over ground does not have a fixed precision but will rarely be more than 3 decimal places.
6. HDOP does not have a fixed precision but will rarely be more than 2 decimal places.



### TODO

Add support for "fix" element.
