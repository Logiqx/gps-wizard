## TCX - Training Center XML

The following trackpoint elements and attributes are supported:

| TPX Name                      | Description       | Name |  Type   | Units |     Resolution      |
| ----------------------------- | ----------------- | :--: | :-----: | :---: | :-----------------: |
| Time                          | Date + Time       |  ts  | float64 |   s   | 1 x 10<sup>-3</sup> |
| LatitudeDegrees <sup>1</sup>  | Latitude          | lat  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| LongitudeDegrees <sup>1</sup> | Longitude         | lon  | float64 |  deg  | 1 x 10<sup>-7</sup> |
| AltitudeMeters <sup>2</sup>   | Elevation         | ele  | float64 |   m   | 1 x 10<sup>-3</sup> |
| HeartRateBpm                  | Heart Rate        |  hr  | uint16  |  bpm  |          -          |
| Speed <sup>3 4</sup>          | Speed Over Ground | sog  | float32 |  m/s  | 1 x 10<sup>-3</sup> |

Notes:

1. Latitude and longitude are rounded to 7 decimal places by the TCX reader; see comments below.
2. Elevation does not have a fixed precision but will rarely be more than 3 decimal places.
3. Speed over ground relies on Garmin's ActivityExtension - either v1 or v2.
4. Speed over ground does not have a fixed precision but will rarely be more than 3 decimal places.



### Latitude and Longitude

It is worth noting that TCX files will sometimes include as many as 16 decimal places for longitude and latitude. This is simply an artifact of the floating point arithmetic used by Garmin Connect, whilst generating the TCX file.

GPS / GNSS chips typically output the equivalent of 7 decimal places. For example, SiRF and ublox binary formats both provide latitude and longitude with exactly 7 decimal places.

7 decimal places provides a resolution equivalent to 1.11 cm at the equator so it should be easy to see that providing more than this level of precision is highly misleading, given the accuracy of GPS technology.



### Elevation

Elevation is recorded to the nearest 0.2m in Garmin TCX files and the same resolution in FIT + GPX files from Garmin Connect.

However, TCX files from Garmin Connect will often show as many as 16 decimal places despite the true resolution being 0.2m.

This spurious precision is ignored by the GPS Wizard when it loads TCX files into memory.



### Speed

Garmin added support for speed in [ActivityExtensionv1](https://www8.garmin.com/xmlschemas/ActivityExtensionv1.xsd) and [ActivityExtensionv2](https://www8.garmin.com/xmlschemas/ActivityExtensionv2.xsd) for use with TCX.

It should be noted that the native TCX units are m/s, but COROS are using km/h. This is obviously a bug on the part of COROS.



### TODO

De-duplication of trackpoints, due to the implementation of laps within TCX files.

