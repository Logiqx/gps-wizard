## Doppler vs Positional - WIP

### Introduction

Positional vs Doppler.

Kalman (GPS chip) + smoothing (watch).

Kalman filtering in the SiRFstar III chipset uses a combination of both position fixes and the doppler shift, mainly depending upon the strength of the satellite signals. Smoothing then occurs in devices produced by Garmin, etc.

Speeds are best on the Locosys GT-31 when track smoothing is disabled in the SiRF3 chipset navigation parameters. See appendix by Tom Chalko.



### SOG and COG

SiRF reference

u-box reference

Most GPS chips output SOG and COG in the NMEA sentences RMC and VTG.



### Protocols

#### NMEA

Pretty much all GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant.

I've written some [notes](../nmea.md) specific to NMEA and what is supported several common GPS / GNSS chipsets.



#### SiRF

A brief summary:

- SiRFstar II was the first chip to provide Doppler speed and was used in the Locosys GT-11.
- SiRFstar  III was used in the Locosys GT-31. It updates the tracking of doppler shift [10 times per second](http://greenhulk.net/forums/showthread.php?t=259199) internally.
- SiRFstar IV has a much improved Doppler shift algorithm internally, is faster to compute the Kalman filter variables, and can provide data from the chipset at 5 times per second. The SiRFstar IV chipset also at 100 ms, and the Kalman filter outputs every 200 ms.
- SiRFstar V added GLONASS capability alongside GPS for more precise positions. It also processes data internally faster.



SDOP / SDOS availabilty in SiRF binary data:

- Note that the name SDOP (GT-31) changed to SDOS (GW-52 / GW-60).
  - VSDOP (GT-31) was mentioned in the document by Tom Chalko but it is not mentioned alsewhere.

- Suspect SDOP and SDOS are both EHVE from SiRF binary message ID 41 (geodetic navigation data).
- The EHVE field was documented in the SiRF demo [user guide](chipsets/sirf/pdf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) from June 2007.

Regarding the propietary SiRF NMEA message $PSRFEPE:

- The $PSRFEPE message has been available from [SiRFstar IV](https://mikrokontroler.pl/wp-content/uploads/pliki/L50_GPS_Protocol_V1%200_Preliminary_20110727.pdf) onwards - see section 3.2.2.
- Erinome-I uses SiRFstar V and definitely supports $PSRFEPE.



Data sheets

- Qualcomm
  - [SiRFstar V](https://www.qualcomm.com/products/application/automotive/positioning-solutions/sirfstar-v-5ea) supports SiRFDRive™ dead-reckoning technology as does SiRFstar III.
  - [SiRFstar IV](https://www.qualcomm.com/products/application/automotive/positioning-solutions/sirfstar-iv-4e) doesn't mention SiRFDrive but is targeted at automotive industry.
  - Since $PSRFEPE and EHVE were available from SiRFstar IV then so was SiRFdrive.




Timeline:

- SiRFstar III was available in at least [2007](https://www.geospatialworld.net/news/sirfstariii-to-drive-industry/).
- SiRFstar IV was release in 2009 and it supported PSRFEPE.
- **Locosys S4-1513** was released in 2010, using SiRFstar IV and it had a 5 Hz update rate.
  - Message 7 is not defined but it is placed where PSRFEPE would go, relative to ZDA which was also added. See Table 5.2-8 Messages.
  - Product page in [2011](https://web.archive.org/web/20111208154333/http://www.locosystech.com/product.php?zln=en&id=62) says 5Hz and mentions marine navigation.
  - LOCOSYS S4-1513 range still listed in [2019](https://web.archive.org/web/20191218151108/https://www.locosystech.com/en/product/index.html) and May [2021](https://web.archive.org/web/20210410140345/https://www.locosystech.com/en/category/GPS-Modules/GPS-Modules.html).
    - ROM based - S4-0606, **S4-1513-2R**, S4-1612-2R
      - SiRFstar V - S5-0707-2R, S5-1010-2R
    - flash based - **S4-1513**, **S4-1513-2E**, S4-1612-2E, S4-1613
      - SiRFstar V - S5-1612-2E
  - SiRF based GPS modules no longer available in 2022, coincides with GW-60 becoming unavailable in 2021.
- SiRFstar V was launched in 2012 and it supports PSRFEPE, mentioned in ERINOME-I documentation.
- GW-52 was released in 2015. Would seem likely it used the Locosys S4-1613. Why MediaTek - what frame references?
- GW-60 was released in early 2017.



#### u-blox

TODO - sAcc, etc.



### Locosys

#### GW-52 + GW-60

If a SiRFstar chip is being used then binary will be the default mode so there would be no NMEA commands evident. It'd be a bit crazy for the controller to switch to NMEA.



### Smart Watches

#### COROS

The COROS APEX Pro and VERTIX use the Sony CXD5603GF.

The CXD5603GF outputs several standard NMEA messages; GGA, GLL, GNS, GSA, GSV, RMC, VTG and ZDA.

Sats, HDOP and COG are "developer fields" included in the FIT files exported by the APEX Pro and VERTIX.

These items are almost certainly obtained from common NMEA sentences:

- Speed and COG almost certainly come from RMC messages, possibly VTG.
- HDOP could come from GGA, GNS or GSA messages.



#### Garmin Fenix 3 + 5

The Garmin Fenix 3 and 5 use the MediaTek MTK3333.

The MTK3333 outputs several standard NMEA messages; GGA, GSA, GSV, RMC and VTG.

There is every reason to believe that reported "speed" is actually SOG from RMC messages, possibly VTG.

TODO - Screenshots



#### Garmin Fenix 6

The Garmin Fenix 6 uses the Sony CXD5603GF.

There is every reason to believe that reported "speed" is actually SOG from RMC messages, possibly VTG.

TODO - Screenshots



### References

- [GPS as a low-speed Speedometer](https://www.model-engineer.co.uk/forums/postings.asp?th=175442&p=2)
  - Includes two interesting responses from "Joseph Noci 1", regarding the SiRF chipset and Doppler speeds.
  - Joseph mentions spending many years developing autopilot and flight control systems for Military drones.
