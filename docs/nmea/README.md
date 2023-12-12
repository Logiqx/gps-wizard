## NMEA

### Introduction

Pretty much all GPS / GNSS chipsets are [NMEA-0183](https://en.wikipedia.org/wiki/NMEA_0183) compliant which is a simple text based protocol. NMEA-0183 is a closed standard which is available for purchase from the NMEA [website](https://www.nmea.org/nmea-0183.html), and it is not freely available to the public.

This website contains details that have been gleaned from a variety of open sources, including [NMEA revealed](https://gpsd.gitlab.io/gpsd/NMEA.html) and entirely independently of the official / commercial documentation. You can also find a decent overview of NMEA-0183 messages on the [Trimble](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_MessageOverview.html) website.

A minimal NMEA implementation should support the [GGA](messages/gga.md) and [RMC](messages/rmc.md) sentences. Click on the titles below for further details about each NMEA sentence.



### Universal Sentences

The following NMEA sentences can be considered universal, apparently supported by all GPS / GNSS chipsets.


#### [GGA](messages/gga.md) - Global Positioning System Fix Data

- Includes **time** (UTC), **latitude**, **longitude**, status, **sats** (00-12), **HDOP**, **altitude**.
- The maximum number of SVs (satellites) reported may be limited to 12, depending on the GPS / GNSS chipset.

#### [GSA](messages/gsa.md) - GPS DOP and active satellites

- Includes mode (2d / 3d), **satellite and signal IDs**, **PDOP, HDOP, VDOP**.
- Some manufacturers have made proprietary modifications to the GSA sentence for multi-band receivers.

#### [GSV](messages/gsv.md) - Satellites in view

- Includes SVs for each constellation / signal and elevation + azimuth of each SV.
- Support for different signals from each satellite was added in NMEA 4.10.

#### [RMC](messages/rmc.md) - Recommended Minimum Navigation Information

- Includes **time** (UTC), warning, **latitude**, **longitude**, **SOG**, **COG**, **date**.
- RMC is perhaps the most useful of all the NMEA sentences.




### Common Sentences

The following NMEA sentences are relatively common, supported by many GPS / GNSS chipsets.

Most of the fields in these sentences are also available in GGA or GSV.

#### **[GLL](messages/gll.md)** - Geographic Position - Latitude/Longitude

- The GLL sentence includes **latitude** and **longitude**, with **time** of position fix and status
- All of the fields in GLL are also present in [RMC](messages/rmc.md).

#### **[GNS](messages/gns.md)** - Global Navigation Satellite System Fix Data

- Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**.
- The GNS sentence is a tweaked version of [GGA](messages/gga.md), reporting the correct number of SVs (satellites).

#### **[VTG](messages/vtg.md)** - Track made good and Ground speed

- Includes **COG** and **SOG.**
- All of the fields in VTG are also present in [RMC](messages/rmc.md), or can be derived from RMC.

#### **[ZDA](messages/zda.md)** - GNSS Time & Date

- Includes **time** (UTC) and **date** (ddmmyyyy).
- This sentence may also provide the local time zone, if known by the GPS / GNSS receiver.



### Support from Chipsets

Some example GPS / GNSS chipsets and their support for notable NMEA sentences:

| Chipset             | Example Device(s)                             | GGA  | GLL  | GNS  | GSA  | GSV  | RMC  | VTG  | ZDA  |
| ------------------- | --------------------------------------------- | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
| Airoha AG3335M      | COROS  VERTIX 2, Garmin Fenix 7, Suunto 9/5/7 | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  | Yes  |
| Broadcom BCM4774    | Samsung  Galaxy S7 + S8                       | Yes  |  -   |  -   | Yes  | Yes  | Yes  |  -   |  -   |
| Broadcom BCM47755   | Quectel  LC79D module                         | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  |  -   |
| Broadcom BCM47758   | Quectel  LC29D module                         | Yes  |  -   | Yes  | Yes  | Yes  | Yes  |  -   |  -   |
| Broadcom BCM4776    | Google  Pixel 7                               | Yes  |  -   |  -   | Yes  | Yes  | Yes  |  -   |  -   |
| MediaTek MTK3333    | Garmin  Fenix 3/5/5+                          | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  | Yes  |
| Qualcomm SDM845     | Samsung  Galaxy S10 Lite                      | Yes  |  -   | Yes  | Yes  | Yes  | Yes  | Yes  |  -   |
| Samsung Exynos 1280 | Samsung  Galaxy A53                           | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  |  -   |
| Samsung Exynos 1380 | Samsung  Galaxy A54                           | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  |  -   |
| SiRF Star III       | Locosys  GT-31                                | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  | Yes  |
| SiRF Star IV        | Locosys  GW-52 / GW-60                        | Yes  | Yes  |  -   | Yes  | Yes  | Yes  | Yes  | Yes  |
| SiRF Star V         | Suunto  Ambit 3                               | Yes  | Yes  | Yes  | Yes  | Yes  | Yes  | Yes  | Yes  |
| Sony CXD5603GF      | COROS  APEX Pro / VERTIX, Garmin  Fenix 6     | Yes  | Yes  | Yes  | Yes  | Yes  | Yes  | Yes  | Yes  |

Notes:

- All GPS / GNSS chipsets support GGA, GSA, GSV and RMC.
  - The majority of chipsets support GLL and VTG.
  - The minority of chipsets support GNS and ZDA.

- Locosys GT-31 firmware can output GGA, GLL, GSA, GSV, RMC, VTG and ZDA.
  - These can be selected in the "memory card" screen.

- Locosys GW-52 and GW-60 firmware only supports GGA, GSA, GSV and RMC with MediaTek chipsets.
  - This was determined by looking at text strings in the the firmware.

- GPSBabel outputs GGA , GSA (partially populated), RMC and VTG when processing SBP and SBN files.
  - GPSBabel is able to consume GGA, GLL, GSA, RMC, VTG and ZDA.



### Rare Sentences

A number of rare NMEA sentences may be output by specific manufacturers.

These include $DTM, $GBS, and $GST.

Some of these are described on a separate [page](rare.md).



### Proprietary Sentences

A number of proprietary NMEA sentences may be output by specific manufacturers.

These include $PGLOR, $PQ\*, $PSAM\*, $PSMSG, $PSRF\*, and $PSSGR

Some of these are described on a separate [page](proprietary/README.md).



### Accuracy Estimates

A number of NMEA sentences may be output by specific manufacturers which give an idea about PVT accuracy.

Some of these are described on a separate [page](../accuracy/nmea/README.md).

