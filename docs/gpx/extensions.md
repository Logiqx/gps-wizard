## GPX Extensions

### Overview

This document is a summary of the various GPX extension schemas that are commonly being used for generic trackpoint data.

This list will not be 100% exhaustive but it does cover all of the GPX (and FIT) files on my own laptop.



### Generic Elements

Table listing generic elements found in GPX (and FIT) files on my laptop:

| Common name | Garmin<br />Extension | ClueTrust<br />Extension | FIT name                     | GPX files                   | FIT Files                            |
| ----------- | --------------------- | ------------------------ | ---------------------------- | --------------------------- | ------------------------------------ |
| temp        | atemp                 | temp                     | temperature                  | Garmin                      | Garmin                               |
| hr          | hr                    | hr                       | heart_rate                   | Garmin + COROS <sup>1</sup> | Garmin + COROS                       |
| cad         | cad                   | cadence                  | cadence + fractional_cadence | Garmin + COROS              |                                      |
| course      | course                | -                        | cog <sup>2</sup>             | COROS <sup>2</sup>          |                                      |
| speed       | speed                 | -                        | speed /<br />enhanced_speed  | -                           | Garmin + COROS<br />+ Suunto + Timex |
| roc         | -                     | -                        | vertical_speed               | -                           | Suunto                               |
| distance    | -                     | distance                 |                              | COROS                       | Garmin + COROS<br />+ Suunto + Timex |

Notes:

1. COROS uses "heartrate" in GPX files, instead of "hr". This is in conflict with the ClueTrust extension schema.
2. COROS uses "cog" in GPX and FIT files, instead of "course". Neither "course" or "cog" are declared in the ClueTrust schema.



Comments about the data items in the table above:

- atemp - appears in Garmin GPX files, and appears in Garmin FIT files as "temperature"
- hr - appears in Garmin GPX files as "hr", and COROS GPX files as "heartrate", and appears in Garmin + COROS FIT files as "heart_rate"
- cad / cadence - appears in Garmin and COROS GPX files, and appears in Garmin and COROS FIT files
  - n.b. FIT files include "fractional_cadence" as well. GPX should perhaps allow decimal values, rather than integers?
- course - appears in COROS GPX files and FIT files as "cog" (developer field)
- speed - appears in Garmin, Suunto, Timex and COROS FIT files as "speed" / "enhanced_speed"
- roc - appears in Suunto FIT files as "vertical_speed"
- distance - appears in COROS GPX files as "distance", and appears in Garmin, Suunto, Timex and COROS FIT files as "distance"



The following elements from Garmin's Trackpoint Extension (V1 / V2) do not appear in GPX or FIT files on my laptop:

- wtemp
- depth
- bearing (aka heading)



### Topografix

Note: I searched on Google using the query "site:http://www.topografix.com/GPX".



#### GPX Overlay 0.3

Namespace: [https://www.topografix.com/GPX/gpx_overlay/0/3/](https://www.topografix.com/GPX/gpx_overlay/0/3/)

Schema: [http://www.topografix.com/GPX/gpx_overlay/0/3/gpx_overlay.xsd](http://www.topografix.com/GPX/gpx_overlay/0/3/gpx_overlay.xsd)

Note: GPX Overlay 0.3 imports GPX Style 0.2



#### GPX Style 0.2

Namespace: [http://www.topografix.com/GPX/gpx_style/0/2](http://www.topografix.com/GPX/gpx_style/0/2)

Schema: [https://www.topografix.com/GPX/gpx_style/0/2/gpx_style.xsd](https://www.topografix.com/GPX/gpx_style/0/2/gpx_style.xsd)

Referred to by "OS Maps" app, but unused in my GPX exports:

```xmlns:gs="http://www.topografix.com/GPX/gpx_style/0/2"```



#### GPX Modified 0.1

Schema: [https://www.topografix.com/GPX/gpx_modified/0/1/gpx_modified.xsd](https://www.topografix.com/GPX/gpx_modified/0/1/gpx_modified.xsd)



### Garmin

#### Trackpoint Extension v2

Namespace: [http://www.garmin.com/xmlschemas/TrackPointExtension/v2](http://www.garmin.com/xmlschemas/TrackPointExtension/v2)

Schema: [https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)

Contains the following generic trackpoint items:

```xml
<xsd:element name="atemp" type="DegreesCelsius_t" minOccurs="0"/>
<xsd:element name="wtemp" type="DegreesCelsius_t" minOccurs="0"/>
<xsd:element name="depth" type="Meters_t" minOccurs="0"/>
<xsd:element name="hr" type="BeatsPerMinute_t" minOccurs="0"/>
<xsd:element name="cad" type="RevolutionsPerMinute_t" minOccurs="0"/>
<xsd:element name="speed" type="MetersPerSecond_t" minOccurs="0"/>
<xsd:element name="course" type="DegreesTrue_t" minOccurs="0"/>
<xsd:element name="bearing" type="DegreesTrue_t" minOccurs="0"/>
```

Notes:

- Trackpoint Extension v2 supersedes Trackpoint Extension v1.
  - Trackpoint Extension v2 is compatible with v1.
  - It simply added `<speed>`, `<course>` and `<bearing>`.
  - However... I am yet to see Trackpoint Extension v2 used by Garmin Connect.



#### Trackpoint Extension v1 - superseded

Namespace: [http://www.garmin.com/xmlschemas/TrackPointExtension/v1](http://www.garmin.com/xmlschemas/TrackPointExtension/v1)

Schema: [https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd)

Contains the following generic trackpoint items:

```xml
<xsd:element name="atemp" type="DegreesCelsius_t" minOccurs="0"/>
<xsd:element name="wtemp" type="DegreesCelsius_t" minOccurs="0"/>
<xsd:element name="depth" type="Meters_t" minOccurs="0"/>
<xsd:element name="hr" type="BeatsPerMinute_t" minOccurs="0"/>
<xsd:element name="cad" type="RevolutionsPerMinute_t" minOccurs="0"/>
```

Used by Garmin Connect, G7ToWin and Waterspeed.

```xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"```

Used by Garmin Connect:

```xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"```

Notes:

- Trackpoint Extension v1 supersedes GPX Extensions v3.
  - "Temperature" was renamed to "atemp".
  - "Depth" was renamed to "depth".

- Trackpoint Extension v1 is superseded by Trackpoint Extension v2.



#### GPX Extensions v3 - superseded

Namespace: [http://www.garmin.com/xmlschemas/GpxExtensions/v3](http://www.garmin.com/xmlschemas/GpxExtensions/v3)

Schema: [https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd)

Contains the following generic trackpoint items:

```xml
<xsd:element name="Temperature" type="DegreesCelsius_t" minOccurs="0"/>
<xsd:element name="Depth" type="Meters_t" minOccurs="0"/>
```

Sometimes declared in GPX files from Garmin Connect but seemingly unused:

```xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3"```

Used by G7ToWin for "DisplayColor" of a track:

```xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3"```

Notes:

- GPX Extensions v3 is superseded by Trackpoint Extension v1.
  - "Temperature" was renamed to "atemp".
  - "Depth" was renamed to "depth".




### Miscellaneous

#### ClueTrust

Namespace: http://www.cluetrust.com/XML/GPXDATA/1/0

Schema: [http://www.cluetrust.com/Schemas/gpxdata10.xsd](http://www.cluetrust.com/Schemas/gpxdata10.xsd)

Contains the following generic trackpoint items:

```xml
<xsd:element name="hr" type="xsd:nonNegativeInteger"/>
<xsd:element name="cadence" type="xsd:nonNegativeInteger"/>
<xsd:element name="temp" type="xsd:decimal"/>
<xsd:element name="distance" type="distanceType"/>
```

Used by COROS and Waterspeed:

```xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"```

Notes:

- COROS uses uses `<heartrate>` (although it should be `<hr>`), `<cadence>` and `<distance>`.
- COROS does not use namespace prefixes as it should; e.g. `<cadence>` instead of `<gpxdata:cadence>`.



#### Ordnance Survey

Namespace: [https://ordnancesurvey.co.uk/public/schema/route/0.1](https://ordnancesurvey.co.uk/public/schema/route/0.1)

Used by "OS Maps" app:

```xmlns:os="https://ordnancesurvey.co.uk/public/schema/route/0.1"```



#### Graphhopper

Namespace: https://graphhopper.com/public/schema/gpx/1.1

Referred to by "OS Maps" app but apparently unused in my GPX exports:

```xmlns:gh="https://graphhopper.com/public/schema/gpx/1.1"```



#### GpsarPro

Used by GpsarPro:

```xmlns:gpsarPro="http://www.gpsactionreplay.com/xml"```



### Notes

GPX files using schema extensions were identified on my laptop using the following Linux command:

```find . -name "*gpx" -exec grep xmlns: {} \; | sed 's/ /\n/g' | grep xmlns: | sed 's/[\r>]//g' | sort -u```

Files using a specific extension schema were identified as follows:

```find . -name '*.gpx' -exec grep -Hc ':gpxx' {} \; | grep -v :0$```
