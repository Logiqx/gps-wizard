## Proposal for GPX

### New Elements in GPX 1.1.1

#### COG, SOG and ROC

The following elements can all be added to `<wpt>`, `<rtept>` and `<trkpt>` elements in the GPX 1.1.1 proposal.

They are all optional, although `<course>` and `<speed>` are highly recommended in GPX 1.1.1 files.

| Name       | Description                                                  |
| ---------- | ------------------------------------------------------------ |
| `<course>` | Course over ground (COG), sometimes (incorrectly) referred to as heading or bearing.<br/>Measured in degrees, COG is the actual direction of travel relative to due north.<br/>Course was available in GPX 1.0 but inadvertently removed in GPX 1.1. |
| `<speed>`  | Horizontal speed, often referred to as speed over ground (SOG).<br/>Measured in m/s it is typically derived from the Doppler observables and far more accurate than position-derived speeds.<br/>Speed was available in GPX 1.0 but inadvertently removed in GPX 1.1. |
| `<roc>`    | Rate of climb (ROC), sometimes referred to as climb rate or vertical speed.<br/>Measured in m/s, positive values indicate increasing altitude, whilst negative values indicate decreasing altitude.<br/>Only available from some GPS / GNSS chipsets (e.g. SiRF in their binary output). |


#### Accuracy Estimates

The following accuracy elements can all be added to `<wpt>`, `<rtept>` and `<trkpt>` elements in the proposed GPX 1.1.1.

| Name     | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `<hacc>` | Horizontal accuracy estimate, sometimes referred to as horizontal [position] error.<br/>Measured in meters it represents a likely accuracy of +/- the given value.<br/>Typically the estimated horizontal accuracy of this location at the 68th percentile confidence level. |
| `<vacc>` | Vertical accuracy estimate, sometimes referred to as vertical [position] error or altitude error.<br/>Measured in meters it represents a likely accuracy of +/- the given value.<br/>Typically the estimated vertical accuracy of this location at the 68th percentile confidence level. |
| `<cacc>` | Course accuracy estimate, sometimes (incorrectly) referred to as heading / bearing accuracy (or error).<br/>Measured in degrees it represents a likely accuracy of +/- the given value.<br/>Typically the estimated course accuracy at the 68th percentile confidence level. |
| `<sacc>` | Speed accuracy estimate, sometimes referred to as horizontal speed / velocity error.<br/>Measured in m/s it represents a likely accuracy of +/- the given value.<br/>Typically the estimated horizontal speed (SOG) accuracy at the 68th percentile confidence level. |
| `<racc>` | Rate of climb (ROC) accuracy estimate, sometimes referred to as vertical speed / velocity error.<br/>Measured in m/s it represents a likely accuracy of +/- the given value.<br/>Typically the estimated rate of climb (ROC) accuracy at the 68th percentile confidence level. |


#### Source Elements

GPX 1.0 and 1.1 both support `<src>` elements in `<wpt>`, `<rte>`, `<rtept>`, `<trk>`, and `<trkpt>` elements.

These are simply `xsd:string` types and may contain values such as "Garmin eTrex" or "Sailmon Max".

The GPX 1.1.1 proposal introduces a more sophisticated `<src>` element containing `<device>` and `<application>`.

**`<device>`** contains the following optional elements:

| Name             | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| `<manufacturer>` | Manufacturer of the GPS device / wearable.<br/>e.g. "Garmin", "Suunto", "Apple", "COROS", "Locosys", "Sailmon", etc. |
| `<product>`      | Product name of the GPS device / wearable, preferably without mentioning the product manufacturer.<br/>e.g. "Fenix 5" (Garmin), "Watch Series 8" (Apple), "VERTIX 2" (COROS), "GW-60" (Locosys), "Max" (Sailmon), etc. |
| `<serial>`       | Serial number of the GPS device / wearable.<br/>e.g. "5AEDF0" (COROS). |
| `<name>`         | Name of the GPS device / wearable, typically chosen by the owner.<br/>e.g. "Nathan's Apple Watch". |
| `<version>`      | Firmware / software / OS version of the GPS device / wearable.<br/>e.g. "13.22" (Garmin), "8.5.1" (Apple), "3.02.0" (COROS), "v1.4(B0803T)" (Locosys), "1.4.4" (Sailmon), etc. |

**`<application>`** contains the following optional elements:

| Name          | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| `<developer>` | Developer of the software / application used to capture + export the GPS data.<br/>This may match the "creator" attribute but unlike "creator", it should persist after (possible) post-processing.<br/>e.g. "Garmin", "Suunto", "COROS", "Massimiliano Picchi", "Matthias Koch", "Hoolan Ltd", etc. |
| `<product>`   | Product name of the software / application used to capture + export the GPS data.<br/>This may match the "creator" attribute but unlike "creator", it should persist after (possible) post-processing.<br/>e.g. "Garmin", "Suunto", "COROS", "Waterspeed", "WindsportTracker", "Hoolan", etc. |
| `<link>`      | Link to the software / application used to capture + export the GPS data.<br/>e.g. "`<href>https://www.hoolan.app/</href>`" |
| `<version>`   | Version of the software / application used to capture + export the GPS data.<br/>e.g. "1.6.0" (Hoolan), etc. |

Note: Since the `<src>` element is a "mixed" type you can still include a simple string to describe the device, such as "Garmin Fenix 5".

This approach will help ensure forward and backward compatibility with existing software.
