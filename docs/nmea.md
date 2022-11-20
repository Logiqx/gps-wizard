## NMEA

### Introduction

Pretty much all GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant which is a simple text based protocol.

You can find an [overview](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_MessageOverview.html) of NMEA-0183 messages on the Trimble website.

Full details about the NMEA-0183 standard itself can be found on the NMEA [website](https://www.nmea.org/content/STANDARDS/NMEA_0183_Standard).



### Common Sentences

The following are the most common NMEA sentences output by GPS / GNSS chips:

- **GGA** \* - Global Positioning System Fix Data (e.g. $GPGGA or $GNGGA)
  - Includes **time** (UTC), **latitude**, **longitude**, status, **sats** (00-99), **HDOP**, altitude
- **GLL** - Geographic Position - Latitude/Longitude (e.g. $GPGLL or $GNGLL)
  - Includes **time** (UTC), **latitude** and **longitude**, warning
- **GSA** - GPS DOP and active satellites (e.g. $GPGSA or $GNGSA)
  - Includes **mode** (2d / 3d), **satellite IDs**, **PDOP, HDOP, VDOP**
- **GSV** - Satellites in view (e.g. $GPGSV or $GNGSV)
  - Includes **sats** (00-99) and elevation + azimuth of each satellite
- **RMC** \* - Recommended Minimum Navigation Information (e.g. $GPRMC or $GNRMC)
  - Includes **time** (UTC), warning, **latitude**, **longitude**, **SOG**, **COG**, date (ddmmyy)
- **VTG** - Track made good and Ground speed (e.g. $GPVTG or $GNVTG)
  - Includes **COG** and **SOG**

\* - Minimal NMEA implementation should support GGA and RMC.



### Less Common Sentences

Less common sentences include the following:

- **GBS** - GPS Satellite Fault Detection (e.g. $GPGBS or $GNGBS)
  - Includes **time** (UTC) and expected 1-sigma **errors** in latitude, longitude and altitude (meters)
- **GNS** - Fix data (e.g. $GPGNS or $GNGNS)
  - Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**
- **GST** - GPS Pseudorange Noise Statistics (e.g. $GPGST or $GNGST)
  - Includes **time** (UTC) and **standard deviations** of latitude / longitude / altitude errors (m)
- **ZDA** - GNSS Time & Date (e.g. $GPZDA or $GNZDA)
  - Includes **time** (UTC) and date (ddmmyyyy)



### Proprietary Sentences

#### SiRF NMEA

Message ID 129 is used to switch the serial port from binary to NMEA protocol and specify the message output rates.

Specifying the EPE message rate via message ID 129 will enable the proprietary $PSRFEPE.

A proprietary SiRF output sentence called **$PSRFEPE** provides accuracy estimates:

| Field | Description                         | Units   |
| ----- | ----------------------------------- | ------- |
| HDOP  | Horizontal Dilution of Precision    | -       |
| EHPE  | Estimated Horizontal Position Error | m       |
| EVPE  | Estimated Vertical Position Error   | m       |
| EHVE  | Estimated Velocity Error            | m/s     |
| EHE   | Estimated Heading Error             | degrees |

The proprietary $PSRFEPE sentence is documented by [Erinome-I](chipsets/sirf/pdf/Erinome-I_User_Manual_rev1.7.pdf) and was subtly documented, almost hidden away in the [SiRF Binary Protocol](chipsets/sirf/pdf/SiRF_Binary_Protocol_2.4_2008_11.pdf) 2.4 of Nov 2008 and onwards. Support for the PSRFEPE sentence was also added to the [gpsd](https://github.com/ukyg9e5r6k7gubiekd6/gpsd) library in [March 2019](https://github.com/ukyg9e5r6k7gubiekd6/gpsd/blob/master/driver_nmea0183.c).

$PSRFEPE has clearly been documented for SiRFNavIII since at least Nov 2008 and has been documented as being available in the  [SiRFstar IV](https://mikrokontroler.pl/wp-content/uploads/pliki/L50_GPS_Protocol_V1%200_Preliminary_20110727.pdf).



#### SiRF Binary Protocol

EHPE, EVPE and EHVE have also been well documented since an early SiRF binary protocol document, produced by NAVMAN in [2004](chipsets/sirf/pdf/SiRF_Binary_Protocol_1.x_2004_02.pdf).

The SiRF binary protocol document from 2009 describes them for message ID 41 (geodetic navigation data) as follows:

| Name                                | Bytes | Description                                      |
| ----------------------------------- | ----- | ------------------------------------------------ |
| Estimated Horizontal Position Error | 4 U   | EHPE in meters x 10<sup>2</sup>                  |
| Estimated Vertical Position Error   | 4 U   | EVPE in meters x 10<sup>2</sup>                  |
| Estimated Time Error                | 4 U   | ETE in seconds x 10<sup>2</sup> (SiRFDRive only) |
| Estimated Horizontal Velocity Error | 2 U   | EHVE in m/s x 10<sup>2</sup> (SiRFDRive only)    |

It is worth mentioning that EHPE, EVPE, ETE and EHVE are also described in the SiRF demo [user guide](chipsets/sirf/pdf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) from June 2007.

Note: The SiRF binary protocol outputs ETE (but not EHE) whereas the Erinome-I [documentation]((chipsets/sirf/pdf/Erinome-I_User_Manual_rev1.7.pdf)) describing $PSRFEPE includes EHE. The one socket protocol interface control [document](chipsets/sirf/pdf/One_Socket_Protocol_Interface_Control_Document_2009.pdf) from 2009 mentions EHE in the "DR NAV Status Output Message" but EHE is not included in the output of message ID 41.



#### MediaTek

The MediaTek MT3333 has some [proprietary sentences](chipsets/mediatek/pdf/M10478-M10578-NMEA_Sentence_Output.pdf), including the following accuracy / error estimates.

**EPE** – Accuracy estimate

| Description                  | Units | Format |
| ---------------------------- | ----- | ------ |
| Horizontal accuracy estimate | m     | xx.xx  |
| Vertical accuracy estimate   | m     | xx.xx  |

**GST** - GNSS Pseudo-range Error Statistics:

| Description                               | Units | Format                 |
| ----------------------------------------- | ----- | ---------------------- |
| Standard deviation of **latitude error**  | m     | x.x - max 5 characters |
| Standard deviation of **longitude error** | m     | x.x - max 5 characters |
| Standard deviation of **altitude error**  | m     | x.x - max 5 characters |




### Summary

Popular GPS / GNSS chips output a number of standard NMEA sentences:

|          |                                                          | SiRF<br />Star III |   SiRF<br />Star IV   | SiRF<br />Star V | MediaTek<br />MTK3333 |             Sony<br />CXD5603GF             |                 Airoha<br />AG3335M                  |
| :------: | -------------------------------------------------------- | :----------------: | :-------------------: | :--------------: | :-------------------: | :-----------------------------------------: | :--------------------------------------------------: |
|          |                                                          |   Locosys GT-31    | Locosys GW-52 / GW-60 |  Suunto Ambit 3  |  Garmin Fenix 3/5/5+  | COROS APEX Pro / VERTIX<br />Garmin Fenix 6 | COROS VERTIX 2<br />Garmin Fenix 7<br />Suunto 9/5/7 |
|   GBS    | time, 1-sigma errors for lat + long + alt                |         -          |           -           |        -         |           -           |                      -                      |                          -                           |
| **GGA**  | time, lat, long, status, sats (00-99), HDOP, alt         |        Yes         |          Yes          |       Yes        |          Yes          |                     Yes                     |                         Yes                          |
|   GLL    | time, lat, long, warning                                 |        Yes         |          Yes          |       Yes        |           -           |                     Yes                     |                         Yes                          |
|   GNS    | time, lat, long, sats, HDOP                              |         -          |           -           |       Yes        |           -           |                     Yes                     |                          -                           |
|   GSA    | mode (2d/3d), sat IDs, PDOP, HDOP, VDOP                  |        Yes         |          Yes          |       Yes        |          Yes          |                     Yes                     |                         Yes                          |
|   GST    | time + standard deviations of lat / lon / alt errors (m) |         -          |           -           |        -         |           -           |                      -                      |                          -                           |
|   GSV    | sats \(00-99) and elevation + azimuth of each satellite  |        Yes         |          Yes          |       Yes        |          Yes          |                     Yes                     |                         Yes                          |
| **RMC**  | time, warning, lat, long, SOG, COG, date                 |        Yes         |          Yes          |       Yes        |          Yes          |                     Yes                     |                         Yes                          |
|   VTG    | COG, SOG                                                 |        Yes         |          Yes          |       Yes        |          Yes          |                     Yes                     |                         Yes                          |
|   ZDA    | time + date                                              |        Yes         |          Yes          |       Yes        |           -           |                     Yes                     |                         Yes                          |
| $PSRFEPE | time, HDOP, EHPE, EVPE, EHVE, EHE                        |         -          |          TBC          |       Yes        |           -           |                      -                      |                          -                           |

Notes:

- Locosys GT-31 firmware can output GGA, GLL, GSA, GSV, RMC, VTG and ZDA.
- Locosys GW-52 and GW-60 firmware only supports GGA, GSA, GSV and RMC from a MediaTek chip.
- GPSBabel outputs GGA , GSA (partially populated), RMC and VTG when processing SBP and SBN files.
- Minimal NMEA implementation should support GGA and RMC.

