## Technical Info - WIP

### Introduction

This article is just a high-level summary of various technical considerations which can affect the accuracy of GPS recordings when speed sailing.

It is specifically focused on speed sailing because it is a very different use-case to many other GPS activities; driving, running, cycling, etc.

Factors that affect the accuracy of speeds recorded by the GPS include the following:

- Hardware - GPS / GNSS chipset, antenna and ground plane / plate
- Configuration - activity mode and hardware-level filtering - e.g. low pass filters, etc.
- Software - app processing performed by the GPS manufacturer - e.g. Locosys, Garmin, COROS
- Satellites - GNSS constellations, number of satellites, geometries, etc.
- Device placement - where the GPS device is being worn - e.g. helmet, bicep, forearm or wrist.



### GPS Placement

Although I mentioned it last in the introduction, I will cover this specific topic first. Placement of the GPS is often overlooked and can have a big impact on the accuracy of the GPS recording, sometimes even resulting in a failure to record any data.

GPS relies upon radio signals from the satellites and those signals struggle to pass through water. To be specific, each GPS satellite transmits data on two frequencies; L1 (1575.42 Mhz) and L2 (1227.60 MHz). Frequencies above 1 MHz are absorbed very quickly by water and are in essence blocked by water and also by the human body.

You should avoid wearing your GPS on your torso (e.g. in a front pocket or backpack) because you are made up of about 60% water. If the GPS is in a front pocket then your body will block out most of the satellites behind you. If your orientation suddenly changes the GPS will often lose some of its satellites and then have to lock on to new ones. This is one of the worst things that you can do to degrade your GPS accuracy.

Some people mount their GPS on their helmet to maintain the clearest possible view of the available satellites. The next best options are strapped to a bicep (facing directly upwards) or on your forearm which also tends to maintain an upwards view, regardless of underhand or overhand grip. It is well recognised GPS watches worn on the wrist will be adversely affected by underhand grip. This will be shown in more detail later on.



### GNSS Constellations

There 5 GNSS constellations at this moment in time:

- GPS - US
- QZSS - Japan
- BEIDOU - China
- GALILEO - EU
- GLONASS - Russia

It is generally a good idea to use multiple constellations if your GPS allows you to do so.

Article about Galileo - https://www.euspa.europa.eu/newsroom/news/sample-galileo-enabled-wearables-test-results-are-in

You can find more information in [The 5 GNSS Constellations Explained](https://blog.bliley.com/the-differences-between-the-5-gnss-satellite-network-constellations).



### Available Satellites

As a rule of thumb, using more satellites increasing the level of accuracy Typical figures from my own GPS devices are as follows:

- Locosys GW-60 = 6 to 9
- COROS APEX Pro = 11 to 13
- Motion Mini = 16 to 18

Setting up a device to use multiple GNSS constellations will usually increase the number of available satellites.



### GPS Chipsets

Here is a brief summary of the GPS / GNSS chips being used in various popular devices:

- SiRF
  - Star II was used in the [Locosys GT-11](devices/locosys/gt-11/README.md)
  - Star III was used in the [Locosys GT-31](devices/locosys/gt-31/README.md)
  - Star IV was used in the Suunto Ambit + Ambit2
  - Star V was used in the [Suunto Ambit3](devices/suunto/ambit3/README.md)

- MediaTek 
  - MT3318 was suspected to have been used by Locosys in the [GW-52](devices/locosys/gw-52/README.md) and [GW-60](devices/locosys/gw-60/README.md).
  - MT3333 was favoured by Garmin between 2012 and 2018; e.g. Fenix 2, [Fenix 3](devices/garmin/fenix-3/README.md), [Fenix 5](devices/garmin/fenix-5/README.md) and [Fenix 5 Plus](devices/garmin/fenix-5-plus/README.md).
  - MT3339 was used in the Suunto Spartan Trainer, released in in 2017.
- Sony
  - CXD5603GF was popular with several manufacturers between 2018 to 2020; COROS, Garmin, Suunto and Polar.
    - There was an Issue impacting positional [accuracy](https://www.dcrainmaker.com/2021/01/gps-accuracy-impacting-devices.html) in early 2021.
    - FIT files from the COROS APEX Pro and VERTIX exhibit a number of [data issues](devices/coros/data-issues.md).
- Airoha, subsidiary of MediaTek
  - AG3335M has gained popularity since 2021; [COROS VERTIX 2](devices/coros/vertix-2/README.md), Garmin Fenix 7, etc.

I have created a separate article with notes about what data the above [chipsets](chipsets.md) provide.

An article on the [performance](https://inf.news/en/fitness/a0e724b10c23386846c99d40c3ff225c.html) of mainstream sports watches was used to identify the GPS / GNSS chips in various sports watches.

There are also lots of decent GPS reviews, albeit focused mainly on runners (not considering the accuracy of speed) at [www.dcrainmaker.com](https://www.dcrainmaker.com/).



#### Antenna

It should be noted the quality of data from a GPS device is not solely to do with the the GPS / GNSS chipset.

The quality of the antenna and ground plane are equally important. A good GPS chip with a bad antenna may perform worse than a poor GPS chip with a good antenna.

Wrist watches have limited space for a quality antenna and the watch casing may also impact the quality of GPS signals.



### Dilution of Precision

The idea of [Dilution of Precision](https://en.wikipedia.org/wiki/Dilution_of_precision_(navigation)) (DOP) is to calculate how errors in the various GPS measurements will affect the final state estimation.

HDOP can potentially say when data quality may be suspect but equally, it can often give no indication that there was an issue with the accuracy of speeds being reported.

I have written up the availability of the various DOP metrics within specific chipsets in a separate [article](chipsets.md).



### Speed Accuracy

It is a limited number of devices that can provide estimates on the accuracy of the speeds being reported and logged.

These is a key requirement of devices approved for use by GPSTC and GP3S records:

- [Locosys](devices/locosys/README.md) - GT-31, GW-52 and GW-60.
- [Motion](devices/motion/README.md) - LCD and Mini.
- [Gyro1](devices/gyro1/README.md)
- [ESP-GPS](devices/esp-gps/README.md)

Estimating the accuracy of speeds being reported is quite a detailed topic so it has been described in a separate [article](chipsets.md).



### Filters

TODO



### Summary

- Placement
- GNSS + Satellites
- Chipset + Antenna
- DOP
- Speed Accuracy
- Filters

