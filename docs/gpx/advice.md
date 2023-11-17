## GPS Exchange Format (GPX) - Advice

### Readers

The following sections provide guidance for GPX readers.



#### Speed over Ground

SOG has been represented in many ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of SOG, if they wish to support legacy GPX files.

| GPX version | Element           | Path                                        | XSD? | Valid? | Comment                                                      |
| ----------- | ----------------- | ------------------------------------------- | :---: | :----------------------------------------------------------: | :---------------------------------------------------------- |
| 1.0         | `<speed>`         | .                                           | Y | Y | Original representation                  |
| 1.1         | `<speed>`         | .                                           | N | N | Common hack                   |
| 1.1         | `<gpxdata:speed>` | `<extensions>`                              | N | (N) | Invented for Suunto + GPSAR<br />- Motion GPS, prior to FW 3085 |
| 1.1         | `<gpxdata:speed>` | `<extensions>/<gpxtpx:TrackPointExtension>` | N | N | Invalidates TrackPointExtension<br />- Waterspeed (GPSAR) |
| 1.1         | `<gpxtpx:speed>`  | `<extensions>/<gpxtpx:TrackPointExtension>` | Y | Y | TrackPointExtension v2<br />- Hoolan<br />- Waterspeed (Strava + Google) |



#### Course over Ground

COG has been represented in many ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of COG, if they wish to support legacy GPX files.

| GPX version | Element           | Path                                        | XSD? | Valid? | Comment                                                      |
| ----------- | ----------------- | ------------------------------------------- | :---: | :----------------------------------------------------------: | :---------------------------------------------------------- |
| 1.0         | `<course>`    | .                                           | Y | Y | Original representation                  |
| 1.1         | `<course>`   | .                                           | N | N | Common hack                   |
| (1.1) | `<cog>` | . | N | N | COROS |
| 1.1         | `<gpxdata:course>` | `<extensions>`                              | N | (N) | Invented for Suunto + GPSAR<br />- TBC |
| 1.1         | `<gpxtpx:course>` | `<extensions>/<gpxtpx:TrackPointExtension>` | Y | Y | TrackPointExtension v2<br />- Waterspeed (Strava + Google) |



#### Heart Rate

Heart rate has been represented in many ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of heart rate, if they wish to support legacy GPX files.

| GPX version | Element        | Path           | XSD? | Valid? | Comment                                                      |
| ----------- | -------------- | -------------- | :--: | :----: | :----------------------------------------------------------- |
| 1.1         | `<gpxdata:hr>` | `<extensions>` |  Y   |   Y    | ClueTrust                                                    |
| 1.1         | `<gpxtpx:hr>`  | `<extensions>` |  Y   |   Y    | TrackPointExtension v1 + v2<br />- Hoolan<br />- Waterspeed (Strava + Google + GPSAR) |
| 1.1         | `<ns3:hr>`     | `<extensions>` |  Y   |   Y    | TrackPointExtension v1 + v2<br />- Garmin Connect<br />- Waterspeed (Garmin) |
| (1.1)       | `<heartrate>`  | `<extensions>` |  N   |   N    | COROS                                                        |



#### Cadence

Cadence has been represented in several ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of cadence, if they wish to support legacy GPX files.

| GPX version | Element             | Path           | XSD? | Valid? | Comment   |
| ----------- | ------------------- | -------------- | :--: | :----: | :-------- |
| 1.1         | `<gpxdata:cadence>` | `<extensions>` |  Y   |   Y    | ClueTrust |
| (1.1)       | `<cadence>`         | `<extensions>` |  N   |   N    | COROS     |



#### Distance

Distance has been represented in several ways historically, not all of which are truly valid.

However, GPX readers should search for all representations of distance, if they wish to support legacy GPX files.

| GPX version | Element              | Path           | XSD? | Valid? | Comment   |
| ----------- | -------------------- | -------------- | :--: | :----: | :-------- |
| 1.1         | `<gpxdata:distance>` | `<extensions>` |  Y   |   Y    | ClueTrust |
| (1.1)       | `<distance>`         | `<extensions>` |  N   |   N    | COROS     |

