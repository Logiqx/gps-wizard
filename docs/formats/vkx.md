## VKX - Vakaros VKX Telemetry Log

### `0x02` - Position, Velocity, and Orientation

This is the VKX binary format used by Vakaros devices.

| UBX Name              | Raw Name     | Type | Name | Type    | Units | Resolution          |
| --------------------- | ------------ | ---- | ---- | ------- | ----- | ------------------- |
| UTC Time <sup>1</sup> | utc_time     | <u8  | ts   | float64 | s     | 1 x 10<sup>-3</sup> |
| Latitude              | latitude     | <i4  | lat  | float64 | deg   | 1 x 10<sup>-7</sup> |
| Longitude             | longitude    | <i4  | lon  | float64 | deg   | 1 x 10<sup>-7</sup> |
| Speed <sup>2</sup>    | speed        | <f4  | sog  | float32 | m/s   | 1 x 10<sup>-4</sup> |
| Course                | course       | <f4  | cog  | float32 | deg   | 1 x 10<sup>-1</sup> |
| Altitude <sup>3</sup> | altitude     | <f4  | -    | float32 | -     | -                   |
| Quaternion (w)        | quaternion_w | <f4  | -    | float32 | -     | -                   |
| Quaternion (x)        | quaternion_x | <f4  | -    | float32 | -     | -                   |
| Quaternion (y)        | quaternion_y | <f4  | -    | float32 | -     | -                   |
| Quaternion (z)        | quaternion_z | <f4  | -    | float32 | -     | -                   |

Notes:

1. Timestamps are not nicely aligned (e.g. multiples of 100 ms), so may not be from the GNSS receiver?
1. Speed is provided in m/s, but when converted to knots the precision is 1 decimal place.
1. Altitudes in the test file make no sense, perhaps two 16-bit floats?



### TODO

Resolve issue relating to altitude?

