### Watches

Summary:

- Series 3 is TBC - could be almost anything - Broadcomm, Quelcomm, MediaTek, etc.
- Series 4 is TBC - suspect **Intel** [XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html)
- Series 5 is TBC - suspect **Intel** [XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html)
- Series 6 confirmed to use **Broadcom** BCM47754
- Series 7 confirmed to use **Broadcom** BCM47764
- Series 8 is TBC - likely to be **Broadcom** (e.g. BCM47764, BCM4775 or BCM4778)

Links

- [Comparison of models](https://en.wikipedia.org/wiki/Apple_Watch#Comparison_of_models) on Wikipedia



#### Series 3

Released in Sep 2017

- [teardown](https://www.ifixit.com/Teardown/Apple+Watch+Series+3+Teardown/97521) shows an ST Microelectronics [ST33G1M2](http://www.st.com/content/ccc/resource/technical/document/data_brief/81/c6/7d/4e/ae/23/4e/72/DM00095982.pdf/files/DM00095982.pdf/jcr:content/translations/en.DM00095982.pdf) 32 bit MCU so the GPS chip must be separate
- Broadcom and Qualcomm components are [inside](https://seekingalpha.com/article/4113383-qualcomm-inside-apple-watch-series-3) the watch so it could be either supplier (or even someone like MediaTek)
- Bosch gyro + accelerometer (FY LEE C7P)



#### Series 4

Released Sep 2018, same time as iPhone XS / XR. One version used the Intel [XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html).

Technical specifications for [Series 4](https://support.apple.com/kb/SP778) - GPS, GLONASS, Galileo, and QZSS

- Intel [XMM 7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html) supports GPS, Galileo, GLONASS, and BeiDou
- iPhone 8 and X released a year earlier (Sep / Nov 2017) had Qualcomm and Intel versions. Maybe watch S4 uses Qualcomm?

[Teardown: Apple Watch Series 4 | Electronics360](https://electronics360.globalspec.com/article/13473/teardown-apple-watch-series-4)

- GNSS chip unidentified - maybe Broadcom, Qualcomm or **Intel**
  - Since the teardown shows an Intel baseband processor, suspect it is being used for GNSS

- Broadcom BCM15922 sensing SOC



#### Series 5

Similar to series 4 according to [teardown](https://www.ifixit.com/News/33117/apple-watch-series-5-teardown)

- iFixit says there are minor changes to connectors for the Taptic Engine, display, and battery, which means components are not generally interchangeable, but otherwise, the two devices are very similar on the inside.

Released Sep 2019, same time as iPhone 11 which used **Intel** [XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html).

Technical specifications for [Series 5](https://support.apple.com/kb/SP808) just say GPS / GNSS and do not list the systems. Maybe the same as watch series 4?

GNSS chip unidentified - maybe Broadcom, Qualcomm or **Intel**

- Since the series 4 teardown shows an Intel baseband processor, suspect it is being used for GNSS



#### Series 6

Released Sep 2020, along with SE (1st generation), one month before iPhone 12 (Qualcomm Snapdragon).

Technical specifications for [Series 6](https://support.apple.com/kb/SP826) and [SE](https://support.apple.com/kb/SP827) from Apple - GPS, GLONASS, Galileo, and QZSS

- Does not mention BeiDou although the chip supports it

Teardown - [Wearables: Apple Watch Series 6 evolution](https://www.reverse-costing.com/teardown-notes/apple-watch-series-6-evolution/):

- Apple processor
- **Broadcom** [BCM47754](chipsets/README.md) chipset (BCM47754KUBG) - not capable of dual frequency
- Broadcom BCM15924 sensing SOC
- Teardown suggest series 5 (or even 4) also included Broadcom GNSS chip



#### Series 7

Released Oct 2021. Supports Beidou according to Wikipedia.

Technical specifications for [Series 7](https://support.apple.com/kb/SP860) from Apple - GPS, GLONASS, Galileo, QZSS, and BeiDou

- **Broadcom** [BCM47764](http://www.szmjd.com/proclass-read-id-1193992.html) chipset (BCM47764KUBG). Is this the predecessor of the [BCM47765](https://www.broadcom.com/products/wireless/gnss-gps-socs/bcm47765)?
- Bosch-accelerometer and gyroscope chip
- [Apple watch7 features detailed Apple Watch 7 teardown evaluation did not find interesting new features](https://iphonewired.com/news/268068/) - iPhone Wired



#### Series 8

Released Oct 2022, along with SE (2nd generation) and Ultra.

Technical specifications for [SE (2nd generation)](https://support.apple.com/kb/SP877) from Apple - L1 GPS, GLONASS, Galileo, and QZSS

Technical specifications for [Series 8](https://support.apple.com/kb/SP878) and [Ultra](https://support.apple.com/kb/SP879) from Apple - L1 GPS, GLONASS, Galileo, QZSS, and BeiDou

Series 8 and ultra support Glonass but SE (2nd generation) does not.

Maybe uses a newish Broadcom chip - e.g. BCM47764 (like series 7), BCM47765, or BCM4778?



### Phones

[Where is a navigation chip in my iPhone?](https://medium.com/@ilyakorogodin/where-is-a-navigation-chip-in-my-iphone-92ab55a61863) by Ilya Korogodin May 2022

- iPhone 3G released Jul 2008 used the [Infineon PMB 2525 Hammer-head II](http://datasheet.elcodis.com/pdf2/118/83/1188394/pmb2525.pdf) and was GPS only
- iPhone 4 (GSM) released Jun 2010 used the **Broadcom BCM4750** and was GPS only
- iPhone 4 (CDMA) released Jun 2010 used the **Qualcomm MDM6600** and was GPS only
- iPhone 4S released in Oct 2011 added support for GLONASS using the **Qualcomm MDM6610**

> As we can see, the fusion of GNSS and telecommunication functions in a single chip became mainstream. Since the iPhone 4 model, we cannot isolate a special GNSS chip: repair it, calculate the cost, calculate power consumption, and so on. The GNSS receiver disappeared as a separated object.

- iPhone 5 released Sep 2012 used the **Qualcomm MDM9615** chip (gpsOneGen 8A)
  - In contrast to MDM6610 it is just a digital baseband processor, analogue processing was taken out to Qualcomm RTR8600.
- iPhone 5S, 5C released Sep 2013 began to support Beidou
  - iPhones 5S and 5C use a **Qualcomm** [WTR1605L](https://investor.qualcomm.com/news-events/press-releases/detail/63/qualcomm-introduces-28nm-mass-market-ltedc-hspa-chipsets) RF transceiver instead of the RTR one
- iPhone 6 released Sep 2014
  - Baseband processor was replaced by **Qualcomm MDM9625M** (IZat gpsOneGen 8B)
  - Assisted GPS and GLONASS - [Apple](https://support.apple.com/kb/SP705?locale=en_GB)
- iPhone 7 release Sep 2016 had two versions
  - One used an **Intel** PMB9943 (aka Intel XMM7360)
  - Was the other Qualcomm?
  - Assisted GPS, GLONASS, Galileo, and QZSS - [Apple](https://support.apple.com/kb/SP743?locale=en_GB)
  
- iPhone 8 and X released in Sep / Nov 2017 had **Qualcomm** and **Intel** versions
  - Built-in GPS/GNSS - [Apple](https://support.apple.com/kb/SP767?locale=en_GB)

- iPhone XS and XR released Oct / Nov 2018 replaced Qualcomm completely:
  - **Intel** PMB9955 ([XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html)) is used and supports all GNSS systems: GPS, GLONASS, Galileo and Beidou.
- iPhone 11 released in Sep 2019 has an **Intel** X927YD2Q ([XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html))
- iPhone 12 released Oct 2020 used the **Qualcomm** Snapdragon X55M SoC and Qualcomm [SDR865](https://insidegnss.com/qualcomms-new-chip-more-power-more-features-same-ol-gnss/) RF transceiver
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://www.apple.com/uk/iphone-12/specs/)

- iPhone 13 released Sep 2021 used **Qualcomm** Snapdragon X60M SoC and Qualcomm SDR868 RF transceiver
  - [teardown](https://uk.pcmag.com/mobile-phones/135925/teardown-confirms-qualcomm-modems-in-the-iphone-13-pro)


> So, how does a regular navigation receiver look in 2022? It has dissolved in telecommunication chips. The chips are developed by a few big companies.



### Future

- [Apple plans to drop key Broadcom chip to use in-house design](https://www.japantimes.co.jp/news/2023/01/10/business/apple-in-house-chip-plans/) -  The Japan Times

