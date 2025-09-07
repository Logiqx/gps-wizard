## Apple Watches

### Summary

#### History

- 1st Gen (Apr 2015) - no GPS
- Series 1 (Sep 2016) - no GPS
- Series 2 (Sep 2016) - suspect Qualcomm
  - Suspect the baseband processor - e.g. Qualcomm MDM9635M
- Series 3 (Sep 2017) - suspect the **Qualcomm** baseband processor
  - Baseband processor is the Qualcomm MDM9635M
- Series 4 (Sep 2018) - suspect the **Intel** baseband processor
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
- Series 5 (Sep 2019) - suspect the **Intel** baseband processor
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
- SE "1st Gen" (Sep 2020) - suspect the **Intel** baseband processor
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
    - Same systems supported as the iPhone 8 / X - GPS, GLONASS, Galileo, and QZSS
- Series 6 (Sep 2020) - confirmed as **Broadcom** BCM47754
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
  - Skyworks LNA / filter + Broadcom BCM47754 in teardown
- Series 7 (Oct 2021) - confirmed as **Broadcom** BCM47764
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
  - Skyworks RF power amplifier + Broadcom BCM47764 in teardown
    - The multi-band capability of the BCM47764 is not utilized
- SE "2nd Gen" (Sep 2022) - confirmed as the **Intel** baseband processor
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
    - Same systems as the iPhone 8 / X - GPS, GLONASS, Galileo, and QZSS
  - Skyworks front-end module + Intel baseband processor in teardown
    - Skyworks GPS LNA with filter and LB (low band) front-end module
    - Intel baseband processors/RF transceiver
- Series 8 (Sep 2022) - suspect Broadcom
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
  - Perhaps Broadcom - e.g. BCM47764, BCM47765 or BCM4778?
- Ultra (Sep 2022) - suspect Broadcom
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
  - Perhaps Broadcom - e.g. BCM47764, BCM47765 or BCM4778?
    - Needs to be something that supports multi-band GNSS...
- Series 9 (Sep 2023) - suspect Broadcom
  - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
  - Perhaps Broadcom - e.g. BCM47764, BCM47765 or BCM4778?
- Ultra 2 (Sep 2023) - suspect Broadcom
  - Apple S9 SiP (System-in-Package)
    - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
    - Perhaps Broadcom for GNSS - e.g. BCM47764, BCM47765 or BCM4778?
      - Needs to be something that supports multi-band GNSS...
- Series 10 (Sep 2024) - suspect Broadcom
  - Apple System in Package (SiP) Assembly
    - Baseband processor is the Intel PMB9955 which contains an Intel XMM7560
    - Perhaps Broadcom for GNSS - e.g. BCM47764, BCM47765 or BCM4778?

- Ultra 3 (probably 2025) - continue with Broadcom?
  - [TechNode](https://technode.com/2024/12/12/mediatek-beats-intel-to-supply-modem-chips-for-apple-watch/) story about MediaTek replacing the Intel modem in the new Ultra
  - The [MediaTek 5G Modems](https://www.mediatek.com/technology/5g/5g-modem) do not mention GNSS, so suspect staying with Broadcom



#### Intel

- [Intel XMM modems](https://en.m.wikipedia.org/wiki/Intel_XMM_modems) - Wikipedia
  - 5G - cancelled
  - 4G
    - XMM 7660 released Q3 2019
    - XMM 7560 released Q3 2018
      - [Intel® XMM™ 7560 Modem Product Brief](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html)
    - XMM 7480 released Q3 2017
    - XMM 7360 released Q3 2016




#### Links

- Apple watch comparisons
  - [Apple Watch Ultra 2 vs Apple Watch Series 10](https://www.apple.com/uk/watch/compare/?modelList=watch-ultra-2,watch-series-10)
  - [Comparison of models](https://en.wikipedia.org/wiki/Apple_Watch#Comparison_of_models) on Wikipedia
- Apple [Wiki](https://theapplewiki.com/wiki/Baseband_Device) for possible baseband processors
  - Intel PMB9955 is used quite extensively
    - TechInsights believe it to be the Intel XMM7560 LTE Advanced Pro 4G LTE Baseband Processor
    - Intel XMM7560 was used in the iPhone 8 and X, which were both released in Nov 2017
  - Another source that lists the baseband processors is available at [TechLabz](https://www.techlabz.uk/blog/apple-watch-prices)
- [MediaTek beats Intel to supply modem chips for Apple Watch](https://technode.com/2024/12/12/mediatek-beats-intel-to-supply-modem-chips-for-apple-watch/) - TechNode
  - See [MediaTek 5G Modems](https://www.mediatek.com/technology/5g/5g-modem) which do not mention GNSS
  - See [MediaTek Dimensity 9400](https://www.mediatek.com/products/smartphones/mediatek-dimensity-9400) for processor, unlikely to be used because it competes with Apple



### Watch Details

#### 1st Gen

Released in Apr 2015. No GPS.

No GPS.



#### Series 1

Released in Sep 2016. No GPS.

[teardown](https://www.ifixit.com/Teardown/Apple+Watch+Teardown/40655) + [another](https://appleinsider.com/articles/15/04/30/teardown-shows-apple-watch-s1-chip-has-custom-cpu-512mb-ram-8gb-storage) + [techinsights](https://www.techinsights.com/blog/apple-watch-teardown)

Apple [specification](https://support.apple.com/kb/sp745?locale=en_GB) confirms lack of support for GPS



#### Series 2

No cellular capabilities, so not baseband (modem) from the likes of Qualcom

Released in Sep 2016.

iFixIt [teardown](https://www.ifixit.com/Teardown/Apple+Watch+Series+2+Teardown/67385)

TechInsights [teardown](https://www.techinsights.com/blog/apple-watch-series-2-teardown) includes a photo after plasma etching, possibly showing a Broadcom chip - BCM????? but no sure if it is GPS

Apple [specification](https://support.apple.com/kb/SP746?locale=en_GB) says it supports GPS and GLONASS

Suspect Qualcomm MDM9635M which was used in the iPhone 6s and iPhone 6s Plus (Sep 2015) and series 3 watch (Sep 2017).



#### Series 3

Released in Sep 2017.

- [teardown](https://www.ifixit.com/Teardown/Apple+Watch+Series+3+Teardown/97521) shows an ST Microelectronics [ST33G1M2](http://www.st.com/content/ccc/resource/technical/document/data_brief/81/c6/7d/4e/ae/23/4e/72/DM00095982.pdf/files/DM00095982.pdf/jcr:content/translations/en.DM00095982.pdf) 32 bit MCU so the GPS chip must be separate
- Broadcom and Qualcomm components are [inside](https://seekingalpha.com/article/4113383-qualcomm-inside-apple-watch-series-3) the watch so it could be either supplier (or someone like Intel or MediaTek)
  - [techinsights](https://www.techinsights.com/blog/apple-watch-series-3-teardown) shows the Qualcomm MDM9635M LTE modem which sits between iPhone 6 and 7 - see [theapplewiki](https://theapplewiki.com/wiki/MDM9635) and [wikipedia](https://en.wikipedia.org/wiki/Qualcomm_Gobi)
  - [EDN asia](https://www.ednasia.com/apple_watch_packs_qualcomm_lte/) has some details about the MDM9635M
  - Qualcomm MDM9635M was used in iPhone 6s and iPhone 6s, released in Sep 2015

- Bosch gyro + accelerometer (FY LEE C7P)



#### Series 4

Released Sep 2018, same time as iPhone XS / XR. One version used the Intel [XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html).

Technical specifications for [Series 4](https://support.apple.com/kb/SP778) - GPS, GLONASS, Galileo, and QZSS

- Intel [XMM 7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html) supports GPS, Galileo, GLONASS, and BeiDou
- iPhone 8 and X released a year earlier (Sep / Nov 2017) had Qualcomm and Intel versions. Maybe watch S4 uses Qualcomm?

[Teardown: Apple Watch Series 4 | Electronics360](https://electronics360.globalspec.com/article/13473/teardown-apple-watch-series-4)

- GNSS chip unidentified - maybe Broadcom, Qualcomm or **Intel**
  - Since the teardown shows an Intel baseband processor with integrated RF transceiver, suspect it is being used for GNSS

- Broadcom BCM15922 sensing SOC



#### Series 5

Similar to series 4 according to [teardown](https://www.ifixit.com/News/33117/apple-watch-series-5-teardown)

- iFixit says there are minor changes to connectors for the Taptic Engine, display, and battery, which means components are not generally interchangeable, but otherwise, the two devices are very similar on the inside.

Released Sep 2019, same time as iPhone 11 which used **Intel** [XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html).

Technical specifications for [Series 5](https://support.apple.com/kb/SP808) just say GPS / GNSS and do not list the systems. Maybe the same as watch series 4?

GNSS chip unidentified - maybe Broadcom, Qualcomm or **Intel**

- Series 4 teardown shows an Intel baseband processor with integrated RF transceiver, so suspect it is being used for GNSS



#### Series 6

Released Sep 2020, along with SE (1st generation), one month before iPhone 12 (Qualcomm Snapdragon).

Technical specifications for [Series 6](https://support.apple.com/kb/SP826) and [SE](https://support.apple.com/kb/SP827) from Apple - GPS, GLONASS, Galileo, and QZSS

- Does not mention BeiDou although the chip supports it?

Teardown - [Wearables: Apple Watch Series 6 evolution](https://www.reverse-costing.com/teardown-notes/apple-watch-series-6-evolution/):

- Apple processor
- **Skyworks** LNA / filter Skyxxxx44
- **Broadcom** [BCM47754](chipsets/README.md) chipset (BCM47754KUBG) - not capable of dual frequency
- Broadcom BCM15924 sensing SOC
- Teardown suggest series 5 (or even 4) also included Broadcom GNSS chip



#### Series 7

Released Oct 2021. Supports Beidou according to Wikipedia.

Technical specifications for [Series 7](https://support.apple.com/kb/SP860) from Apple - GPS, GLONASS, Galileo, QZSS, and BeiDou

- **Skyworks** RF power amplifier
- **Broadcom** [BCM47764](http://www.szmjd.com/proclass-read-id-1193992.html) chipset (BCM47764KUBG). Is this the predecessor of the [BCM47765](https://www.broadcom.com/products/wireless/gnss-gps-socs/bcm47765)?
- Bosch-accelerometer and gyroscope chip
- [Apple watch7 features detailed Apple Watch 7 teardown evaluation did not find interesting new features](https://iphonewired.com/news/268068/) - iPhone Wired



#### SE First generation

Released Oct 2021.

Technical specifications for [SE](hhttps://www.apple.com/uk/apple-watch-se/specs/) from Apple - L1 GPS, GNSS, Galileo and QZSS.

No BeiDou like Series 7.



#### Series 8

Released Oct 2022, along with SE (2nd generation) and Ultra.

Technical specifications for [Series 8](https://support.apple.com/kb/SP878) and [Ultra](https://support.apple.com/kb/SP879) from Apple - L1 GPS, GLONASS, Galileo, QZSS, and BeiDou

Series 8 and ultra support Glonass but SE (2nd generation) does not.

Maybe uses a newish Broadcom chip - e.g. BCM47764 (like series 7), BCM47765, or BCM4778?

[teardown of ultra](https://www.gsmarena.com/ifixit_takes_apart_an_apple_watch_ultra_finds_it_difficult_to_repair-news-55956.php)



#### SE Second generation

Released: September 2022

Technical specifications for [SE (2nd generation)](https://support.apple.com/kb/SP877) from Apple - L1 GPS, GLONASS, Galileo, and QZSS - no BeiDou like Series 8 or Ultra

Skyworks GPS LNA with filter and LB (low band) front-end module + Intel baseband processors/RF transceiver with memory.



#### Ultra 2

[teardown](https://electronics360.globalspec.com/article/19799/techinsights-teardown-apple-watch-second-generation) shows "MB/HM front-end module" from Broadcom.





## Apple Phones

#### History

[Where is a navigation chip in my iPhone?](https://medium.com/@ilyakorogodin/where-is-a-navigation-chip-in-my-iphone-92ab55a61863) by Ilya Korogodin May 2022

- iPhone 3G released Jul 2008 used the [Infineon PMB 2525 Hammer-head II](http://datasheet.elcodis.com/pdf2/118/83/1188394/pmb2525.pdf) and was GPS only
- iPhone 4
  - GSM released Jun 2010 used the **Broadcom** [BCM4750](https://web.archive.org/web/20100124164839/https://www.broadcom.com/products/GPS/GPS-Silicon-Solutions/BCM4750) and was GPS only (up to 2 Hz) - [product brief](http://www.droid-developers.org/images/e/e5/BCM4750.pdf)
    - TechnInsights [teardown](https://www.techinsights.com/blog/apple-iphone-4-teardown) shows the Broadcom BCM4750
  - CDMA released Jun 2010 used the **Qualcomm** MDM6600 baseband processor and was GPS only - main role was as a modem
    - Fuses a multichannel analog transceiver HJ11-VF535–200 and a multisystem digital baseband processor HJ11-VJ130 into a single module
    - The solution was named by Qualcomm as IZat gpsOneGen 8.
- iPhone 4S released in Oct 2011
  - **Qualcomm** MDM6610 baseband processor 
  - Added support for GLONASS but only enabled in cases of weak GPS signals or a low number of visible GPS satellites
  - Teardowns [1](https://www.macrumors.com/2011/10/13/iphone-4s-teardown-underway/) and [2](https://www.techinsights.com/blog/apple-iphone-4s-teardown) identify the MDM6610 and refer to the MDM6600 in the CDMA iPhone 4

> As we can see, the fusion of GNSS and telecommunication functions in a single chip became mainstream. Since the iPhone 4 model, we cannot isolate a special GNSS chip: repair it, calculate the cost, calculate power consumption, and so on. The GNSS receiver disappeared as a separated object.

- iPhone 5 released Sep 2012
  - **Qualcomm** MDM9615 Snapdragon X5 LTE Modem (IZat gpsOneGen 8A) - [fun fact](https://disruptive.asia/qualcomm-chip-iphone-5-android/)
  - In contrast to MDM6610, MDM9615 is just a digital baseband processor
  - The analogue processing was taken out to the Qualcomm RTR8600 RF transceiver.  
  - TechInsights [teardown](https://www.techinsights.com/blog/apple-iphone-5-teardown) describes the Qualcomm MDM9615 and RTR8600
- iPhone 5S, 5C released Sep 2013, adding support for BeiDou - [teardown](https://www.ifixit.com/Teardown/iPhone+5s+Teardown/17383)
  - **Qualcomm** MDM9615 Snapdragon X5 LTE Modem
  - iPhones 5S and 5C used a Qualcomm [WTR1605L](https://investor.qualcomm.com/news-events/press-releases/detail/63/qualcomm-introduces-28nm-mass-market-ltedc-hspa-chipsets) RF transceiver instead of the RTR8600
- iPhone 6 released Sep 2014
  - **Qualcomm** [MDM9625](https://www.qualcomm.com/products/technology/modems/snapdragon-modems-4g-lte-x5) Snapdragon X5 LTE Modem (IZat gpsOneGen 8B) with WTR1625L RF transceiver - teardowns [1](https://www.ifixit.com/Teardown/iPhone+6+Teardown/29213) + [2](https://www.techinsights.com/blog/apple-iphone-6-and-iphone-6-plus-teardown)
  - A-GPS and GLONASS but no mention of BeiDou - [Apple](https://support.apple.com/kb/SP705?locale=en_GB)
- iPhone 6s and iPhone 6s Plus released Sep 2015
  - TechInsights [teardown](https://www.techinsights.com/blog/apple-iphone-6s-teardown) confirms the **Qualcomm** MDM9635M LTE Cat. 6 Modem
- iPhone 7 release Sep 2016 had two versions
  - **Intel** [XMM7360](https://www.intel.com/content/www/us/en/products/sku/66649/intel-xmm-7360/specifications.html) LTE Modem paired with two Intel SMARTi 5 RF transceivers (PMB5750)
    - AT&T and T-Mobile - [teardown](https://www.macrumors.com/2016/09/16/iphone-7-chipworks-teardown/)
    - TechInsights show the following in their [teardown](https://www.techinsights.com/blog/apple-iphone-7-teardown) of the Intel version of the iPhone 7
      - **Intel** PMB9943 LTE modem - confirmed as the Intel XMM7360 modem
      - **Broadcom** BCM47734
  - **Qualcomm** [MDM9645](https://www.qualcomm.com/products/technology/modems/snapdragon-modems-4g-lte-x12) Snapdragon X12 LTE Modem with Qualcomm WTR3925 RF transceiver - see [teardown](https://www.ifixit.com/Teardown/iPhone+7+Teardown/67382) 
    - Verizon and Sprint, due to lack of support for CDMA from Intel because of licensing issues
  - Assisted GPS, GLONASS, Galileo, and QZSS - [Apple](https://support.apple.com/kb/SP743?locale=en_GB)
- iPhone 8 and X released in Sep / Nov 2017 had several versions:
  - **Intel** XMM7560 modem - TBC
    - AT&T and T-Mobile
  - **Qualcomm** [MDM9655](https://www.qualcomm.com/products/technology/modems/snapdragon-modems-4g-lte-x16) Snapdragon X16 LTE Modem with Qualcomm RF transceiver - see [teardown](https://www.ifixit.com/Teardown/iPhone+8+Teardown/97481)
    - Verizon and Sprint, due to lack of support for CDMA from Intel because of licensing issues
  - "Built-in GPS/GNSS" - [Apple](https://support.apple.com/kb/SP767?locale=en_GB)
- iPhone XS and XR released Oct / Nov 2018 replaced Qualcomm completely, due to CDMA support:
  - **Intel** [XMM7560](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7560-brief.html) modem - GPS, GLONASS, Galileo and Beidou
    - TechnInsights [teardown](https://www.techinsights.com/blog/apple-iphone-xs-max-teardown) confirms the Intel XMM7560 LTE Advanced Pro 4G LTE Baseband Processor
- iPhone 11 released in Sep 2019
  - **Intel** [XMM7660](https://www.intel.com/content/www/us/en/products/docs/wireless-products/mobile-communications/xmm-7660-brief.html) modem paired with Intel 5765 P10 A15 08B13 H1925 RF transceiver - GPS, Galileo, GLONASS, and BeiDou
- iPhone 12 released Oct 2020
  - **Qualcomm** Snapdragon [X55](https://www.qualcomm.com/products/technology/modems/snapdragon-x55-5g-modem) 5G modem-RF system, plus Qualcomm [SDR865](https://www.techinsights.com/blog/analysis-qualcomms-snapdragon-sdr865-transceiver-supporting-5g-sub-6-ghz-and-lte-services) RF transceiver - [WikiChip](https://en.wikichip.org/wiki/qualcomm/snapdragon_800/865?utm_content=cmp-true) / [Inside GNSS](https://insidegnss.com/qualcomms-new-chip-more-power-more-features-same-ol-gnss/)
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://support.apple.com/en-gb/111876)
- iPhone 13 released Sep 2021
  - **Qualcomm** Snapdragon [X60](https://www.qualcomm.com/products/technology/modems/snapdragon-x60-5g-modem) 5G modem-RF system, plus Qualcomm [SDR868](https://www.techinsights.com/products/bfr-2102-801) RF transceiver
  - [teardown summary](https://uk.pcmag.com/mobile-phones/135925/teardown-confirms-qualcomm-modems-in-the-iphone-13-pro) + [teardown](https://www.ifixit.com/Teardown/iPhone+13+Pro+Teardown/144928)
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://support.apple.com/en-gb/111872)
- iPhone 14 released Sep 2022
  - **Qualcomm** Snapdragon [X65](https://www.qualcomm.com/products/technology/modems/snapdragon-x65-5g-modem-rf-system) 5G modem-RF system, plus (presumably) Qualcomm RF transceiver
  - iFixit [teardown](https://www.ifixit.com/News/64865/iphone-14-teardown) shows the Qualcomm X65
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://support.apple.com/en-gb/111850)
  - Telit's 5G M.2 module also uses the X65 and may provide some insights - [Inside GNSS](https://insidegnss.com/snapdragon-modem-rf-systems-power-telits-new-5g-m-2-module)
- iPhone 15 released Sep 2023
  - **Qualcomm** Snapdragon [X70](https://www.qualcomm.com/products/technology/modems/snapdragon-x70-modem-rf-system) 5G modem-RF system, plus (presumably) Qualcomm RF transceiver
  - iFixit [teardown](https://www.ifixit.com/News/82867/iphone-15-teardown-reveals-software-lockdown) shows the Qualcomm X70
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://www.apple.com/uk/iphone-15/specs/)
- iPhone 16 released Sep 2024
  - **Apple** [C1](https://www.computerworld.com/article/3829149/everything-we-know-about-apples-c1-5g-modem-in-iphone-16e.html) modem
  - iFixit [teardown](https://www.ifixit.com/News/108430/iphone-16e-teardown-never-before-has-skipping-the-upgrade-made-more-sense) shows the Qualcomm X70
  - GPS, GLONASS, Galileo, QZSS and BeiDou - [Apple](https://support.apple.com/en-gb/121029)

> So, how does a regular navigation receiver look in 2022? It has dissolved in telecommunication chips. The chips are developed by a few big companies.

Note about the Qualcomm Snapdragon [X75](https://www.qualcomm.com/products/technology/modems/snapdragon-x75-5g-modem-rf-system) 5G Modem-RF System:

- "Snapdragon X75 is designed for superior 5G performance and AI-based GNSS location accuracy"



### Future

- [Apple plans to drop key Broadcom chip to use in-house design](https://www.japantimes.co.jp/news/2023/01/10/business/apple-in-house-chip-plans/) -  The Japan Times
  - Mentions replacing Broadcom and Qualcomm components but not sure of they mean GNSS.
