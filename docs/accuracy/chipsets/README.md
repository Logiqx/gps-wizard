## Chipsets

### Overview

- [GNSS Chip and Module Unit Shipment to Top 2.2 Billion Units by 2027](https://www.eetasia.com/gnss-chip-and-module-unit-shipment-to-top-2-2-trillion-units-by-2027/)
> GNSS integrated in SoC or modem for smartphones - mainly by **Qualcomm**, **Mediatek**, **Intel**, **Samsung**, and **Hi-Silicon**.
>
> GNSS standalone chipset is smartwatches - mainly by **Broadcom**, **Sony**, and **Airoha**.
>
> Samsung and Wear OS smartwatches have embedded integrated GNSS solutions provided by **Samsung** and **Qualcomm**.



### Broadcom

[GNSS/GPS SoCs](https://www.broadcom.com/products/wireless/gnss-gps-socs)



#### BCM4751

- Used in Samsung Galaxy S, S II and S III
- Features on my Samsung Galaxy S III (GT-I9305, Android 4.4.4), according to GPSTest
  - GPS and GLONASS
  - Estimated hAcc is reported as "E H Acc"
  - No vAcc - support added in Android 8.0
  - No sAcc or bAcc - support added in Android 8.0



#### BCM4752

- Used in Samsung Galaxy S4 and S5
- Used in Samsung Gear Sport



#### BCM4773

- Used in Samsung Galaxy S6



#### BCM4774

- Used in Samsung Galaxy S7, S8, and Galaxy Note 8
- Features on my Samsung Galaxy S7 (SM-G930F, Android 8.0.0), according to GPSTest
  - GPS, GLONASS and BeiDou
  - Estimated hAcc is typically in 2m increments - e.g. 4.0, 6.0, 8.0 but 3.0 has been observed.
  - No vAcc accompanying hAcc - support added in Android 8.0 but maybe not in Samsung or BCM4774?
  - No sAcc or bAcc (blank) - support added in Android 8.0 but maybe not in Samsung or BCM4774?



#### BCM4775x

World's first dual frequency GNSS receiver:

- BCM47752 used in Exynos versions of Samsung Galaxy S9, S10, Note 9 and Note 10.
- BCM47754 used in Apple Watch Series 6
- BCM47755 used in Exynos versions of Samsung Galaxy S20, S21, Note 20. Sometimes in Note 10 according to GPSTest Database.
- BCM47755 also used in Xiaomi Mi 8 and Mix 3 (note that "lite" models just use the Snapdragon)
- BCM47758 used in Samsung Galaxy Watch, Watch Active. Probably used in Galaxy Watch Active 2 and Watch 3 as well.
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



#### BCM4776x

Second generation dual frequency GNSS chip - e.g. BCM47764, BCM47765:

- BCM47764 used in Apple Watch Series 7 and possible Apple Watch Series 8
  - TODO - Need to confirm whether series 8 uses BCM4776x or BCM4778.

- Used in Google Pixel 6 / 6a / 6 Pro and 7 / 7a / 7 Pro
- [Second Generation Dual-Frequency GNSS chip](https://www.broadcom.com/products/wireless/gnss-gps-socs/bcm47765) on Broadcom
- Cannot find product brief...
- Quectel_LC29D_GNSS_Protocol_Specification_V1.0 lists PGLOR_SPD, PGLOR_FIX, PGLOR_SAT, **PGLOR_LSQ**, PGLOR_PWR, PGLOR_STA



#### BCM4778

Third generation dual frequency GNSS chip:

- TODO - Need to confirm whether Apple Watch Series 8 uses BCM4776x (like series 7) or BCM4778.
- Dual frequency is only available on Apple Watch Ultra
- [Ultra-Low Power Dual-frequency L1L5 GNSS Receiver Product Brief](https://docs.broadcom.com/docs/4778-PB1) 22/09/2021
- [Broadcom launches its lowest power GNSS receiver for mobile, wearables](https://www.gpsworld.com/broadcom-launches-its-lowest-power-gnss-receiver-for-mobile-wearables/)
- [Product brief](https://docs.broadcom.com/doc/4778-PB1) on Broadcom



#### BCM47531

Fourth generation multi-constellation Global Navigation Satellite System (GNSS)

[Broadcom website](https://www.broadcom.com/products/wireless/gnss-gps-socs/bcm47531)

Used in some models of the Samsung Galaxy Tab



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



### Qualcomm

[Wiki](https://en.wikipedia.org/wiki/List_of_Qualcomm_Snapdragon_systems_on_chips#Snapdragon_8_Series) lists various models



#### Snapdragon 845

See [product overview](https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-845-mobile-platform).

- Xiaomi Mi 8 uses BCM47755, not the Snapdragon GNSS
  - [Observation Quality Assessment and Performance of GNSS Standalone Positioning with Code Pseudoranges of Dual-Frequency Android Smartphones](https://www.researchgate.net/publication/350177748_Observation_Quality_Assessment_and_Performance_of_GNSS_Standalone_Positioning_with_Code_Pseudoranges_of_Dual-Frequency_Android_Smartphones) by Robustelli at et al. Mar 2021
  - [Inherent Limitations of Smartphone GNSS Positioning and Effective Methods to Increase the Accuracy Utilizing Dual-Frequency Measurements](https://www.researchgate.net/publication/366335309_Inherent_Limitations_of_Smartphone_GNSS_Positioning_and_Effective_Methods_to_Increase_the_Accuracy_Utilizing_Dual-Frequency_Measurements) by Yun et al. Dec 2022
- Galaxy S9 (non-Exynos) uses Snapdragon GNSS



#### Snapdragon 855

Supports dual frequency according to [product overview](https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-855-mobile-platform).

Used [Barbeau](https://barbeau.medium.com/dual-frequency-gnss-on-android-devices-152b8826e1c) article to determine that hAcc, vAcc and sAcc are supported.

- Exynos S10 has hAcc (8.0), vAcc (0.0), but sAcc blank (not moving).
- LG G8 ThinQ shows hAcc (5.4), vAcc (8.2), and sAcc (0.2)
- Xiaomi Mi 9 shows hAcc (3.8), vAcc (2.5), sAcc (0.1) 
  - Questionable whether it is using the 855 when I look at the GPSTest database
- Lenovo Z6 Pro and Youth Edition shows hAcc (1.4), vAcc (0.0), but sAcc blank (not moving).
- OnePlus 7T shows hAcc (12.4), vAcc (8.2) and sAcc (0.4)
- [Galaxy S10](https://barbeau.medium.com/galaxy-s10-pics-from-a-sprint-store-in-tampa-fl-for-the-sm-g973xu-model-b040c819b87a) shows hAcc (8.8), vAcc (7.1) and sAcc (0.1)



#### Snapdragon 865

- Used in iPhone 12

- [InsideGNSS](https://insidegnss.com/qualcomms-new-chip-more-power-more-features-same-ol-gnss/)



#### Snapdragon 868

Used in iPhone 13 with [X60](https://www.macrumors.com/2021/02/24/iphone-13-snapdragon-x60-5g-modem/) 5G modem - [teardown](https://uk.pcmag.com/mobile-phones/135925/teardown-confirms-qualcomm-modems-in-the-iphone-13-pro)

Not listed on the Wiki?



### MediaTek

#### MT6631

Used in some Samsung A-series phones, but no other manufacturers according to GPSTest database.



### AirPrime XM/XA Series

MT3333 and MT3339

AirPrime_XM_XA_Series_Software_User_Guide_r3

- GLL (0), RMC (1), VTG (2), GGA (3), GSA (4), GSV (5), GRS (6) and **GST** (7)

- PLT (8), PLP (9), PLS (10), PLI (11), PLH (12), MALM (13), MEPH (14), MDGP (15), MDBG (16)

- ZDA (17), MCHN (18)

PMTK500 GNSS FIX CONTROL ACK

- HAcc: 1-sigma estimated Horizontal position accuracy mask at which point a suitable fix is deemed to have been obtained and the receiver may prematurely switch into its minimum power sleep mode. (m)
- VAcc: 1-sigma estimated Vertical position accuracy mask at which point a suitable fix is deemed to have been obtained and the receiver may prematurely switch into its minimum power sleep mode. (m)



### Telit MT

MediaTek chipset - model TBC

Telit MT GNSS Software User Guide - 2016-05-16

- GLL (0), RMC (1), VTG (2), GGA (3), GSA (4), GSV (5), GRS (6) and **GST** (7)
- ZDA (17), MCHN (18), DTM (19) and **GBS** (20)