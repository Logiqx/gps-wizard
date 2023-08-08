## Chipsets

### Overview

- [GNSS Chip and Module Unit Shipment to Top 2.2 Billion Units by 2027](https://www.eetasia.com/gnss-chip-and-module-unit-shipment-to-top-2-2-trillion-units-by-2027/)
> GNSS integrated in SoC or modem for smartphones - mainly by **Qualcomm**, **Mediatek**, **Intel**, **Samsung**, and **Hi-Silicon**.
>
> GNSS standalone chipset is smartwatches - mainly by **Broadcom**, **Sony**, and **Airoha**.
>
> Samsung and Wear OS smartwatches have embedded integrated GNSS solutions provided by **Samsung** and **Qualcomm**.



### Broadcom

#### BCM4775x

World's first dual frequency GNSS receiver:

- [Product Brief](https://docs.broadcom.com/docs/12379501) 20/09/2017 - BCM47752KUB1G, BCM47754KUBG, BCM47755KUB1G, BCM47758KUB1G
- BCM47755 - [Third-Generation GNSS Location Hub with Dual Frequency Support](https://www.broadcom.com/products/wireless/gnss-gps-socs/bcm47755) on Broadcom
- [Broadcom announces world’s first dual frequency GNSS receiver for smartphones](https://www.euspa.europa.eu/newsroom/news/broadcom-announces-world%E2%80%99s-first-dual-frequency-gnss-receiver-smartphones) on EUSPA
- [Broadcom Highly-Accurate, Low-Power GPS Chips to Reach Market in 2018](https://www.eweek.com/mobile/power-saving-highly-accurate-broadcom-mobile-gps-chips-coming-in-2018/)
- [Swift Navigation Introduces Starling with Broadcom’s BCM47755 Chip](https://www.swiftnav.com/news/swift-navigation-introduces-starling-gnss-positioning-engine-and-availability-broadcoms-dual) - press release
- [Android GNSS Measurements - Inside the BCM47755](https://www.researchgate.net/publication/329581011_Android_GNSS_Measurements_-_Inside_the_BCM47755) on ResearchGate
  - [Time-Differenced Carrier Phase Technique for Precise Velocity Estimation on an Android Smartphone](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9655395/) (Xiaomi Mi8) - Angrisano 2022
- NMEA revealed lists undocumented [PGLOR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pglor_quectel) messages, found in Quectel LC79D.
  - Includes [PGLOR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pglor_quectel) messages in NMEA

- Quectel_LC29D_GNSS_Protocol_Specification_V1.0 lists PGLOR_SPD, PGLOR_FIX, PGLOR_SAT, **PGLOR_LSQ**, PGLOR_PWR, PGLOR_STA



#### BCM47765

Second generation dual frequency GNSS chip:

- [Second Generation Dual-Frequency GNSS chip](https://www.broadcom.com/products/wireless/gnss-gps-socs/bcm47765) on Broadcom
- [Product Brief](https://docs.broadcom.com/doc/12379501) on Broadcom
- Quectel_LC29D_GNSS_Protocol_Specification_V1.0 lists PGLOR_SPD, PGLOR_FIX, PGLOR_SAT, **PGLOR_LSQ**, PGLOR_PWR, PGLOR_STA



#### BCM4778

- [Ultra-Low Power Dual-frequency L1L5 GNSS Receiver Product Brief](https://docs.broadcom.com/docs/4778-PB1) 22/09/2021



### Quectel

[Quectel GNSS Module Product Overview](https://sisoog.com/wp-content/uploads/2021/03/Quectel_GNSS_Module_Product_Overview_V3.2-1.pdf) - Dec 2020



#### LC79D

[GNSS LC79D series](https://www.quectel.com/product/gnss-lc79d-series) - [Quectel_LC79D(A)_GNSS_Protocol_Specification_V1.1](https://forums.quectel.com/uploads/short-url/puf1M03onUPgaQf377LQI5T1U5I.pdf) - 2022-05-20

[Specification](https://www.sigmaelectronica.net/wp-content/uploads/2020/09/Quectel_LC79D_GNSS_Specification_V1.0.pdf) + [Data sheet](https://cdn.sparkfun.com/assets/2/0/9/a/7/LC79DA_Datasheet.pdf).

Possibly \>1 Hz update rate with special firmware, 5 Hz is [mentioned](https://forums.quectel.com/t/lc79d-position-update-rate/4366)

Broadcom BCM47755 - [announcement](https://www.prnewswire.co.uk/news-releases/quectel-announces-dual-band-high-precision-positioning-module-based-on-broadcom-bcm47755-gnss-chip-888528760.html)

- RMC, GGA, GSV, GSA, VTG, GLL
- NMEA revealed lists undocumented [PGLOR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pglor_quectel) messages, found in LC79D.



#### LC29D

[GNSS LC29D series](https://www.quectel.com/product/gnss-lc29d-series) - Quectel_LC29D_GNSS_Protocol_Specification_V1.0 - 2021-06-21

[Specification](https://www.mouser.com/datasheet/2/1052/Quectel_LC29D_GNSS_Specification_V1_2-3009875.pdf) on mouser.com shows chipsets - Broadcom BCM47758 (A), BCM47765 (B), BCM47755 (C)

- GGA, GSA, GSV, RMC, GNS
- PGLOR_SPD, PGLOR_FIX, PGLOR_SAT, **PGLOR_LSQ**, PGLOR_PWR, PGLOR_STA
  - Horizontal error RMS
  - Altitude error RMS
  - Horizontal speed error RMS
  - Vertical speed error RMS
  - Track error RMS




### LC86L & LG77L

Quectel_Lx0&Lx6&LC86L&LG77L_GNSS_Protocol_Specification_V2.1

Airoha AG3331

- RMC, GGA, GSV, GSA, VTG,  GLL

- TXT, DTM and **GBS**



#### L96

Airoha MT3333

L96_GNSS_Protocol_Specification_V1.0 - 2017-10-27

- GLL (0), RMC (1), VTG (2), GGA (3), GSA (4), GSV (5), GRS (6) and **GST** (7)

- ZDA (17) and MCHN (18)




#### MC20 & MC30

Airoha MT3333, 3329, 3339, 3333, 3337

MC20&MC30_GNSS_Protocol_Specification_V1.2 - 2018-08-29

- GLL (0), RMC (1), VTG (2), GGA (3), GSA (4), GSV (5), GRS (6) and **GST** (7)

- ZDA (17), MCHN (18)



### Intel

#### XMM 7360

- [Intel Corporation Launches New LTE and Connectivity Solutions](https://www.fool.com/investing/general/2015/03/03/intel-corporation-launches-new-lte-and-connectivit.aspx)
  - "Intel is also offering an in-house GNSS solution, as well as an in-house NFC solution. I believe the former comes from Intel's acquisition of ST-Ericsson's GNSS solutions"



### AirPrime XM/XA Series

MT3333 and MT3339

AirPrime_XM_XA_Series_Software_User_Guide_r3

- GLL (0), RMC (1), VTG (2), GGA (3), GSA (4), GSV (5), GRS (6) and **GST** (7)

- PLT (8), PLP (9), PLS (10), PLI (11), PLH (12), MALM (13), MEPH (14), MDGP (15), MDBG (16)

- ZDA (17), MCHN (18)

PMTK500 GNSS FIX CONTROL ACK

- HAcc: One-sigma estimated Horizontal position accuracy mask at which point a suitable fix is deemed to have been obtained and the receiver may prematurely switch into its minimum power sleep mode. (m)
- VAcc: One-sigma estimated Vertical position accuracy mask at which point a suitable fix is deemed to have been obtained and the receiver may prematurely switch into its minimum power sleep mode. (m)



### Telit MT

MediaTek chipset - model TBC

Telit MT GNSS Software User Guide - 2016-05-16

- GLL (0), RMC (1), VTG (2), GGA (3), GSA (4), GSV (5), GRS (6) and **GST** (7)
- ZDA (17), MCHN (18), DTM (19) and **GBS** (20)