## Proposal for GPX

### New Elements in GPX 1.1.1

#### COG, SOG and ROC

The following elements can all be added to `<wpt>`, `<rtept>` and `<trkpt>` elements in the GPX 1.1.1 proposal.

They are all optional, although the values of `<course>` and `<speed>` as provided by the GPS / GNSS chipset are highly recommended in GPX 1.1.1 files.

| Name       | Description                                                  |
| ---------- | ------------------------------------------------------------ |
| `<course>` | Course over ground (COG) in degrees is the actual direction of travel relative to true north.<br/>COG is an independent measurement from position, so it is possible (and not an error) for the difference between two successive positions to be inconsistent with the COG values. |
| `<speed>`  | Speed over ground (SOG) in m/s is the horizontal speed calculated by the GPS / GNSS chipset.<br/>SOG is an independent measurement from position, so it is possible (and not an error) for the difference between two successive positions to be inconsistent with the SOG values. |
| `<roc>`    | Rate of climb (ROC) in m/s is the vertical speed calculated by the GPS / GNSS chipset.<br/>ROC is an independent measurement from position, so it is possible (and not an error) for the difference between two successive positions to be inconsistent with the ROC values. |


#### Accuracy Estimates

The following accuracy elements can all be added to `<wpt>`, `<rtept>` and `<trkpt>` elements in the proposed GPX 1.1.1.

These are available from a variety of NMEA sentences, binary messages and location services provided by Apple and Android.

| Name     | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `<hacc>` | Horizontal accuracy / error estimate in meters, such that the difference from the true position and the reported position is less than the accuracy / error estimate 68% of the time. 68% corresponds to 1-sigma of a normal distribution, but this does not imply that errors are independent or normally distributed. |
| `<vacc>` | Vertical accuracy / error estimate in meters, such that the difference from the true position and the reported position is less than the accuracy / error estimate 68% of the time. 68% corresponds to 1-sigma of a normal distribution, but this does not imply that errors are independent or normally distributed. |
| `<cacc>` | Course over ground (COG) accuracy / error estimate in degrees, such that the difference from the true COG and the reported COG is less than the accuracy / error estimate 68% of the time. 68% corresponds to 1-sigma of a normal distribution, but this does not imply that errors are independent or normally distributed. |
| `<sacc>` | Speed over ground (SOG) accuracy / error estimate in m/s, such that the difference from the true SOG and the reported SOG is less than the accuracy / error estimate 68% of the time. 68% corresponds to 1-sigma of a normal distribution, but this does not imply that errors are independent or normally distributed. |
| `<racc>` | Rate of climb (ROC) accuracy / error estimate in m/s, such that the difference from the true ROC and the reported ROC is less than the accuracy / error estimate 68% of the time. 68% corresponds to 1-sigma of a normal distribution, but this does not imply that errors are independent or normally distributed. |


#### Source Elements

GPX 1.0 and 1.1 both support `<src>` elements in `<wpt>`, `<rte>`, `<rtept>`, `<trk>`, and `<trkpt>` elements.

These are simply `xsd:string` types and may contain values such as "Garmin eTrex" or "Sailmon Max".

The GPX 1.1.1 proposal introduces a more sophisticated `<src>` element containing `<device>` and `<software>`.

**`<device>`** contains the following optional elements:

| Name             | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| `<manufacturer>` | Manufacturer of the GPS device / wearable.<br/>e.g. "Samsung" |
| `<product>` | Product name of the GPS device / wearable, preferably without mentioning the product manufacturer.<br/>e.g. "Galaxy A53" |
| `<model>` | Model number of the GPS device / wearable.<br/>e.g. "‎SM-A536BZKNEUB" |
| `<serial>`       | Serial number of the GPS device / wearable.<br/>e.g. "ABCDE9ABC9X" |
| `<name>`         | Name of the GPS device / wearable, typically chosen by the owner.<br/>e.g. "Mike's A53" |
| `<version>`      | Firmware / software / OS version of the GPS device / wearable.<br/>e.g. "android13-5.10-A536BXXS7CWG2" |

**`<software>`** contains the following optional elements:

| Name            | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| `<developer>`   | Developer of the software / application used to capture + export the GPS data.<br/>This may match the "creator" attribute but unlike "creator", it should persist after (possible) post-processing.<br/>e.g. "barbeauDev" |
| `<application>` | Name of the software / application used to capture + export the GPS data.<br/>This may match the "creator" attribute but unlike "creator", it should persist after (possible) post-processing.<br/>e.g. "GPSTest" |
| `<link>`        | GPX link to the software / application used to capture + export the GPS data.<br/>e.g. `<link href="https://github.com/barbeau/gpstest"><text>GitHub</text></link>` |
| `<version>`     | Version of the software / application used to capture + export the GPS data.<br/>e.g. "3.10.3" |

Note: Since the `<src>` element is a "mixed" type you can still include a simple string to describe the device, such as "Apple Watch Series 8".

This approach will help ensure forward and backward compatibility with existing software.
