## GPS Exchange Format (GPX) - Advice

Date created: 17 Nov 2023

Date updated: 18 Jul 2024



### Readers

The following sections are to provide guidance for software that is importing GPX files.

Common elements such as speed, course, and heartrate may be represented in a number of different ways.

This document catalogues the different representations of these elements that need to be supported by GPX readers.



#### Speed over Ground

SOG has been represented in many ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of SOG, if they wish to support legacy GPX files.

| GPX version | Element           | Path                                        | XSD? | Valid? | Comment                                                      |
| ----------- | ----------------- | ------------------------------------------- | :---: | :----------------------------------------------------------: | :---------------------------------------------------------- |
| 1.0         | `<speed>`         | .                                           | Y | Y | Original representation                  |
| 1.1         | `<speed>`         | .                                           | N | N | Possible hack but rarely seen |
| 1.1         | `<gpxdata:speed>` | `<extensions>`                              | N | (N) | COROS and various phone applications, originally used by Suunto app(s) |
| 1.1         | `<gpxdata:speed>` | `<extensions>/<gpxtpx:TrackPointExtension>` | N | N | Invalidates TrackPointExtension<br />- Waterspeed (GPSAR) |
| 1.1         | `<gpxtpx:speed>`  | `<extensions>/<gpxtpx:TrackPointExtension>` | Y | Y | TrackPointExtension v2<br />- Hoolan<br />- Waterspeed (Strava)<br />- Waterspeed (Google) |
| 1.1 | `<ns3:speed>` | `<extensions>/<ns3:TrackPointExtension>` | Y | Y | TrackPointExtension v2<br />- Garmin (proposed) |

Namespaces:

| Prefix  | Namespace                                                    |
| ------- | ------------------------------------------------------------ |
| gpxdata | http://www.cluetrust.com/XML/GPXDATA/1/0<br/>[https://www.cluetrust.com/Schemas/gpxdata10.xsd](https://www.cluetrust.com/Schemas/gpxdata10.xsd) |
| gpxtpx  | http://www.garmin.com/xmlschemas/TrackPointExtension/v2<br />[https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) |
| ns3     | http://www.garmin.com/xmlschemas/TrackPointExtension/v2<br />[https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) |



#### Course over Ground

COG has been represented in many ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of COG, if they wish to support legacy GPX files.

| GPX version | Element           | Path                                        | XSD? | Valid? | Comment                                                      |
| ----------- | ----------------- | ------------------------------------------- | :---: | :----------------------------------------------------------: | :---------------------------------------------------------- |
| 1.0         | `<course>`    | .                                           | Y | Y | Original representation                  |
| 1.1         | `<course>`   | .                                           | N | N | Possible hack but rarely seen |
| 1.0 | `<cog>` | . | N | N | Wrong name:<br />- GPSResults |
| 1.1 | `<cog>` | . | N | N | Wrong name:<br />- COROS |
| 1.1         | `<gpxtpx:course>` | `<extensions>/<gpxtpx:TrackPointExtension>` | Y | Y | TrackPointExtension v2<br />- Waterspeed (Strava)<br />- Waterspeed (Google) |
| 1.1 | `<ns3:course>` | `<extensions>/<ns3:TrackPointExtension>` | Y | Y | TrackPointExtension v2<br />- Garmin (proposed) |

Namespaces:

| Prefix | Namespace                                                    |
| ------ | ------------------------------------------------------------ |
| gpxtpx | http://www.garmin.com/xmlschemas/TrackPointExtension/v2<br />[https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) |
| ns3    | http://www.garmin.com/xmlschemas/TrackPointExtension/v2<br />[https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) |



#### Heart Rate

Heart rate has been represented in many ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of heart rate, if they wish to support legacy GPX files.

| GPX version | Element        | Path           | XSD? | Valid? | Comment                                                      |
| ----------- | -------------- | -------------- | :--: | :----: | :----------------------------------------------------------- |
| 1.1         | `<heartrate>`  | `<extensions>` |  N   |   N    | ClueTrust<br />- COROS (legacy)                              |
| 1.1         | `<gpxdata:hr>` | `<extensions>` |  Y   |   Y    | ClueTrust<br />- COROS (future)                              |
| 1.1         | `<gpxtpx:hr>`  | `<extensions>` |  Y   |   Y    | TrackPointExtension v1 + v2<br />- Hoolan<br />- Waterspeed (Strava)<br />- Waterspeed (Google)<br />- Waterspeed (GPSAR) |
| 1.1         | `<ns3:hr>`     | `<extensions>` |  Y   |   Y    | TrackPointExtension v1 + v2<br />- Garmin Connect<br />- Waterspeed (Garmin) |

Namespaces:

| Prefix  | Namespace                                                    |
| ------- | ------------------------------------------------------------ |
| gpxdata | http://www.cluetrust.com/XML/GPXDATA/1/0<br/>[https://www.cluetrust.com/Schemas/gpxdata10.xsd](https://www.cluetrust.com/Schemas/gpxdata10.xsd) |
| gpxtpx  | http://www.garmin.com/xmlschemas/TrackPointExtension/v2<br />[https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) |
| ns3     | http://www.garmin.com/xmlschemas/TrackPointExtension/v2<br />[https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) |



#### Cadence

Cadence has been represented in several ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of cadence, if they wish to support legacy GPX files.

| GPX version | Element             | Path           | XSD? | Valid? | Comment                         |
| ----------- | ------------------- | -------------- | :--: | :----: | :------------------------------ |
| 1.1         | `<cadence>`         | `<extensions>` |  N   |   N    | ClueTrust<br />- COROS (legacy) |
| 1.1         | `<gpxdata:cadence>` | `<extensions>` |  Y   |   Y    | ClueTrust<br />- COROS (future) |

Namespaces:

| Prefix  | Namespace                                                    |
| ------- | ------------------------------------------------------------ |
| gpxdata | http://www.cluetrust.com/XML/GPXDATA/1/0<br/>[https://www.cluetrust.com/Schemas/gpxdata10.xsd](https://www.cluetrust.com/Schemas/gpxdata10.xsd) |



#### Distance

Distance has been represented in several ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of distance, if they wish to support legacy GPX files.

| GPX version | Element              | Path           | XSD? | Valid? | Comment                         |
| ----------- | -------------------- | -------------- | :--: | :----: | :------------------------------ |
| 1.1         | `<distance>`         | `<extensions>` |  N   |   N    | ClueTrust<br />- COROS (legacy) |
| 1.1         | `<gpxdata:distance>` | `<extensions>` |  Y   |   Y    | ClueTrust<br />- COROS (future) |

Namespaces:

| Prefix  | Namespace                                                    |
| ------- | ------------------------------------------------------------ |
| gpxdata | http://www.cluetrust.com/XML/GPXDATA/1/0<br/>[https://www.cluetrust.com/Schemas/gpxdata10.xsd](https://www.cluetrust.com/Schemas/gpxdata10.xsd) |



### Namespaces

#### gpxdata

- Numerous apps make use of the ClueTrust extension as a speed hack - e.g. `<gpxdata:speed>` 
- V1 is `xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"`



#### gpxtpx

- G7ToWin files as as far back as 2007 have used `xmlns:gpxtpx`
- GPSBabel reference files use `xmlns:gpxtpx`
- Waterspeed uses `xmlns:gpxtpx`
- V1 is `xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"`
- V2 is `xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"`



#### ns3

- Garmin Connect uses `xmlns:ns3`
- V1 is `xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"`
- V2 is `xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"`



### Links

- [Garmin extension for speed](https://code.google.com/archive/p/toolsdotnet/wikis/gpx.wiki) on gps.wiki
