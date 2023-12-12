## NMEA

### Introduction

Pretty much all GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant which is a simple text based protocol.

You can find an [overview](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_MessageOverview.html) of NMEA-0183 messages on the Trimble website.

Full details about the NMEA-0183 standard itself can be found on the NMEA [website](https://www.nmea.org/nmea-0183.html).



### Universal Sentences

The following are universal NMEA sentences output by practically all GPS / GNSS chipsets:

- **[GGA](messages/gga.md)** - Global Positioning System Fix Data (e.g. $GPGGA or $GNGGA)
  - Includes **time** (UTC), **latitude**, **longitude**, status, **sats** (00-12), **HDOP**, **altitude**
- **[GSA](messages/gsa.md)** - GPS DOP and active satellites (e.g. $GPGSA or $GNGSA)
  - Includes mode (2d / 3d), **satellite IDs**, **PDOP, HDOP, VDOP**
- **[GSV](messages/gsv.md)** - Satellites in view (e.g. $GPGSV or $GNGSV)
  - Includes SVs for each constellation / signal and elevation + azimuth of each SV
- **[RMC](messages/rmc.md)** - Recommended Minimum Navigation Information (e.g. $GPRMC or $GNRMC)
  - Includes **time** (UTC), warning, **latitude**, **longitude**, **SOG**, **COG**, date (ddmmyy)

A minimal NMEA implementation should support the GGA and RMC sentences.



### Common Sentences

The following are the most common NMEA sentences output by GPS / GNSS chips:

- **GNS** - Fix data (e.g. $GPGNS or $GNGNS)
  - Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**
- **[GLL](messages/gll.md)** - Geographic Position - Latitude/Longitude (e.g. $GPGLL or $GNGLL)
  - Includes **time** (UTC), **latitude** and **longitude**, warning
- **[VTG](messages/vtg.md)** - Track made good and Ground speed (e.g. $GPVTG or $GNVTG)
  - Includes **COG** and **SOG**
- **[ZDA](messages/zda.md)** - GNSS Time & Date (e.g. $GPZDA or $GNZDA)
  - Includes **time** (UTC) and date (ddmmyyyy)




### GPS / GNSS Chipsets

Some example GPS / GNSS chipsets and their support for common NMEA sentences:

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

These include $PGLOR, $PQ\*, $PSAM\*, $PSMSG, $PSRFEPE, and $PSSGR

Some of these are described on a separate [page](proprietary/README.md).



### Accuracy Estimates

A number of NMEA sentences may be output by specific manufacturers which give an idea about PVT accuracy.

Some of these are described on a separate [page](../accuracy/nmea/README.md).
