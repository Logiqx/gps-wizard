### Watches

Summary:

- Series 5 is TBC - maybe **Qualcomm** or **Intel**
- Series 6 uses **Broadcom** BCM47754KUBG
- Series 7 is also **Broadcom** - e.g. BCM47764KUBG or BCM47754KUBG
- Series 8 is TBC - maybe **Broadcom** (like series 7) as both support BeiDou

Links

- [Comparison of models](https://en.wikipedia.org/wiki/Apple_Watch#Comparison_of_models) on Wikipedia



#### Series 4

Released Sep 2018, same time as iPhone XS / XR which used Intel PMB9955 ([XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html))

Technical specifications for [Series 4](https://support.apple.com/kb/SP778) - GPS, GLONASS, Galileo, and QZSS

- Intel XMM 7560 supports GPS, Galileo, GLONASS, and BeiDou (so probably not in Watch Series 4)
- iPhone 8 and X released a year earlier (Sep / Nov 2017) had Qualcomm and Intel versions

[Teardown: Apple Watch Series 4 | Electronics360](https://electronics360.globalspec.com/article/13473/teardown-apple-watch-series-4)

- GNSS chip unidentified - maybe **Qualcomm** or **Intel**
- Broadcom BCM15922 sensing SOC + Broadcom BCM59356 wireless charger



#### Series 5

Released Sep 2019, same time as iPhone 11 which used **Intel** X927YD2Q ([XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html)).

- Intel XMM 7660 supports GPS, Galileo, GLONASS, and BeiDou

Technical specifications for [Series 5](https://support.apple.com/kb/SP808) - GPS / GNSS

GNSS chip unidentified - maybe **Qualcomm** or **Intel**



#### Series 6

Released Sep 2020, along with SE (1st generation), one month before iPhone 12 (Qualcomm Snapdragon).

Technical specifications for [Series 6](https://support.apple.com/kb/SP826) and [SE](https://support.apple.com/kb/SP827) from Apple - GPS, GLONASS, Galileo, and QZSS

Teardown - [Wearables: Apple Watch Series 6 evolution](https://www.reverse-costing.com/teardown-notes/apple-watch-series-6-evolution/):

- **Broadcom** [BCM4775x](chipsets/README.md) (BCM47754KUBG)
- Broadcom BCM15922 sensing SOC + Broadcom BCM59356 wireless charger
- Teardown suggest series 5 (or even 4) also included Broadcom GNSS chip



#### Series 7

Released Oct 2021. Supports Beidou according to Wikipedia.

Technical specifications for [Series 7](https://support.apple.com/kb/SP860) from Apple - GPS, GLONASS, Galileo, QZSS, and BeiDou

[Apple watch7 features detailed Apple Watch 7 teardown evaluation did not find interesting new features](https://iphonewired.com/news/268068/) - iPhone Wired

​	- **Broadcom** [BCM47764KUBG](http://www.szmjd.com/proclass-read-id-1193992.html) GNSS receiver. Possible typo and it is really a BCM47754KUBG?



#### Series 8

Released Oct 2022, along with SE (2nd generation) and Ultra.

Technical specifications for [SE (2nd generation)](https://support.apple.com/kb/SP877) from Apple - L1 GPS, GLONASS, Galileo, and QZSS

Technical specifications for [Series 8](https://support.apple.com/kb/SP878) and [Ultra](https://support.apple.com/kb/SP879) from Apple - L1 GPS, GLONASS, Galileo, QZSS, and BeiDou

Series 8 and ultra support Glonass but SE (2nd generation) does not.



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
- iPhone 7 release Sep 2016 used an **Intel** PMB9943 (aka Intel XMM7360)
  - Assisted GPS, GLONASS, Galileo, and QZSS - [Apple](https://support.apple.com/kb/SP743?locale=en_GB)

- iPhone 8 and X released in Sep / Nov 2017 had **Qualcomm** and **Intel** versions
  - Built-in GPS/GNSS - [Apple](https://support.apple.com/kb/SP767?locale=en_GB)

- iPhone XS and XR released Oct / Nov 2018 replaced Qualcomm completely:
  - **Intel** PMB9955 ([XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html)) is used and supports all GNSS systems: GPS, GLONASS, Galileo and Beidou.
- iPhone 11 released in Sep 2019 has an **Intel** X927YD2Q ([XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html))
- iPhone 12 released Oct 2020 used the **Qualcomm** Snapdragon X55M SoC
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://www.apple.com/uk/iphone-12/specs/)

- iPhone 13 released Sep 2021 used **Qualcomm** Snapdragon X60M SoC

> So, how does a regular navigation receiver look in 2022? It has dissolved in telecommunication chips. The chips are developed by a few big companies.



### Future

- [Apple plans to drop key Broadcom chip to use in-house design](https://www.japantimes.co.jp/news/2023/01/10/business/apple-in-house-chip-plans/) -  The Japan Times

