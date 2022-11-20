## Chipsets - WIP

### Introduction

Inputs, outputs, estimated errors, masking and filtering.

Protocol documents provide some insight into the inner workings of GPS / GNSS chips.

- [SiRF Binary Protocol Reference Manual](pdf/SiRF_Binary_Protocol.pdf) - Revision 2.4, Nov 2008
  - See "Geodetic Navigation Data – Message ID 41"
  - [Decoding the SiRF Binary Protocol](pdf/Decoding_of_SiRF_Binary_Protocol.pdf)
- [u-blox 8 / u-blox M8 - Receiver description - Including protocol specification](pdf/u-blox8-M8_ReceiverDescrProtSpec_UBX-13003221.pdf) - Revision 26, Nov 2021



### Latitude + Longitude

WGS 84

- SiRF
  - lat + long om degrees x 10^7
  - altitude from Ellipsoid in meters x 10^2
- u-blox - Latitude and longitude to a precision of one millionth of a degree
  - 7 digits after the decimal point in "high precision" mode


Note: Some older NMEA applications expect the NMEA output to be formatted in a specific way, for example, they will only work if the latitude and longitude have exactly four digits behind the decimal point.



### Dilution of Precision

The idea of [Dilution of Precision](https://en.wikipedia.org/wiki/Dilution_of_precision_(navigation)) (DOP) is to state how errors in the measurement will affect the final state estimation.

These can help to determine the potential accuracy of GPS readings:

- HDOP – horizontal dilution of precision
- VDOP – vertical dilution of precision
- PDOP – position (3D) dilution of precision
- TDOP – time dilution of precision
- GDOP – geometric dilution of precision

Simple summary - https://gisgeography.com/gps-accuracy-hdop-pdop-gdop-multipath/

[paper](pdf/3381-Manuscript-11481-1-10-20151214.pdf)



**SiRF**

- HDOP is the only DOP available for output, resolution of 0.2
- VDOP is not mentioned
- PDOP is only involved in mask control
- TDOP is only mentioned in error control
- GDOP not output but can be used in mask control



**u-blox**

- HDOP, VDOP, PDOP, TDOP, GDOP are available
- NDOP, EDOP - northing and easting DOP also included
- All DOP values have a resolution of 0.01



**Sony CXD5603GF**

COROS APEX Pro + VERTIX

- HDOP is available for output, resolution of 0.2



**Airoha AG3335M**

COROS VERTIX 2

- HDOP is available for output, resolution of 0.2




### Doppler Speed

**SiRF**

- SOG - Speed Over Ground (m/s to 2 decimal places)
- COG - Course Over Ground (degrees from true north to 2 decimal places)



**u-blox 8**

- SOG - speed over ground (cm/s is output as knots and km/h to 3 decimal places)
- COG - course over ground (degrees to 2 decimal places)

Note that there is a low-speed COG filter, also dependent on positional accuracy (pAcc)



**Sony CXD5603GF**

COROS APEX Pro + VERTIX:

- Speed - Speed Over Ground (m/s to 3 decimal places) but with [resolution issue](devices/coros/data-issues.md)
- COG - Course Over Ground but with no decimal places



**Airoha AG3335M**

COROS VERTIX 2:

- Speed - Speed Over Ground (m/s to 3 decimal places) but with cm resolution
- COG - Course Over Ground but with no decimal places



Note: Doppler frequencies and carrier frequencies mentioned in SiRF and u-blox spec



### General Accuracy

**SiRF**

- EHPE - Estimated Horizontal Position Error (cm)
- EVPE - Estimated Vertical Position Error (cm)
- EHVE - Estimated Horizontal Velocity Error (cm/s) - SiRFDRive only - SDOP?
- ETE - Estimated Time Error (hundredths of a second) - SiRFDRive only

SiRF command $PSRFEPE



**u-blox 8**

- sAcc - Speed accuracy estimate (mm/s or cm/s)
- cAcc - Course / heading accuracy estimate (degrees to 5 decimal places)
- pAcc - 3D Position accuracy estimate (mm or cm)
- hAcc - Horizontal accuracy estimate (mm)
- vAcc - Vertical accuracy estimate (mm)
- tAcc - Time accuracy estimate (nanoseconds)



**Sony CXD5603GF**

The COROS APEX Pro + VERTIX do not provide accuracy estimates.



**Airoha AG3335M**

The COROS VERTIX 2 does not provide accuracy estimates.





### Speed Accuracy

Doppler measurements are affected by vibrations and this is mentioned in the u-blox documentation, mentioning the typical dynamics of cars.

Speed Accuracy thread 

[https://www.seabreeze.com.au/forums/Windsurfing/Gps/Speed-Accuracy](https://www.seabreeze.com.au/forums/Windsurfing/Gps/Speed-Accuracy)

Garmin:

> It appears that the Garmin and Suunto GPS Watches use only positional data. What sometimes appears to be Doppler speed data in analysis programs, seems to actually be a smoothed or filtered Positional output.

Patent by Honeywell in 2008 / 2009 describes horizontal and vertical velocity error estimates: https://patents.google.com/patent/US20090182493
another https://patents.google.com/patent/WO1995000861A1/en

SiRF command $PSRFEPE
- Star V: https://www.mouser.com/pdfDocs/2613021137000_Elara-II2613021137000Manual_rev1-2.pdf

- THIS ONE - Star V: https://www.we-online.com/catalog/manual/2614011037000_Manual_Erinome-I_2614011037000_rev1.7.pdf

- Star IV: https://mt-system.ru/sites/default/files/docs/documents/sim18%20module%20osp%20manual%20(cs-129291-dc-8)[1].pdf

  


####  SDOP + VSDOP (SiRF)

[SDOP](pdf/SDOP.pdf) paper written by Tom Chalko in 2009

Tom's analysis - and thus the Sirf error-values - *are* 4 SD.... the analysis targeted > 99 percentile, so that we could be extremely confident of the error-bounds. TBC - did they mean 3?

SDOP is not in the .fit data exported by the COROS app. Suspect it is also not uploaded to the COROS backend for GP3S.

The Course Over Ground (COG) error COGDOP can be estimated on the basis of SDOP as follows: 

```COGDOP=arctan(SDOP/speed)```

Where “speed” is the Speed over Ground (SOG) ± speed error. From equation it is clear that Course Over Ground (COG) error decreases when speed increases and than for small speeds the error rapidly grows.

GW-52 specification refers to Standard Deviation of Speed (SDOS) - resolution 1 cm/s. Also specified as cm/s in Tom's document.

- Accuracy of specific measurement can be determined from SDOS of speed samples used to compute average speed.
- Seems to equate to 4 SD?



#### sAcc (u-blox)

The u-blox GPS chips generate a speed accuracy metric (sAcc) which isn't dissimilar to SDOP on Locosys devices.

According to the u-blox 7 specification, "Speed accuracy estimate" appears in NAV-VELECEF messages and is measured in m/s.

sAcc is very consistent on the Motion Mini and usually suggests speeds are accurate to within +/- 0.5 knots.

sAcc > 1 should be regarded as bad data.

sAcc

- Receiver protocol specifications
  - cm/s for "Speed accuracy estimate" in NAV-VELECEF messages, according to the ublox7 specs
  - Likely to be 1 standard deviation as that is used for pAcc and many other variables



#### SDOP vs sAcc

SDoP (speed dilution of precision) / sAcc (Speed accuracy) use closed source algorithms and are not directly comparable.

SDOP is lower for Motion than GW-60, leading to smaller +/-

- GW-60; +/- 0.08
- Motion; +/- 0.02

SDOP / sAcc (u-blox; speed accuracy)

Be careful comparing brands

- GW-52 is better than GW-60 which is the most uncertain. Both can be rather iffy!
  - Better antenna and view of Sky on GW-52
- GT-31 is more certain than GW-52 and GW-60
- GT-31 is comparable to Motion but more consistent on the Motion



#### Maximum Speed

Really "max speed + noise"

Awesome thread about accuracy, putting aside the occasional bickering!

http://seabreaze.com.au/forums/Windsurfing/Gps/Speed-Accuracy?page=3

> This is a very good example of why GPSTC does not allow posting from Phones or other non "Doppler-Error" devices:
>
> 3 Motions all agreed well within the reported error margins. GPS-Logit, using the Android Phones internal GPS, was more than 1 knot out on the two best 2 second runs!!!
>
> There would have been no way to tell how wrong Logit was if not for the other devices worn. The satellite numbers were high for GPS unit (8 sats) and, HDoP was 0.2, which does not indicate any problems.



#### Wrist Watches

Check out underhand / overhand grip in GW-60 track on 27 March.

- Also described in https://www.seabreeze.com.au/forums/Windsurfing/Gps/Speed-Accuracy

![img](sessions/20220327/img/gw60_underhand.png)

Far from ideal for GPS due to underhand / overhand and sail flips.

Greatly affects GW-60 and likely affects other watches.

Helmet, bicep or forearm is best.

Boom and wrist tend to show micro-accelerations caused by chop.



### Hardware Filters

#### u-blox

- 8.1 - Platform Settings implement sanity checks

  - Portable, stationary, pedestrian, auomotive, at sea, airborne, wrist, bike
  - "At sea" has a max horizontal velocity of 25 m/s

- 8.2 - Navigation Input Filters

  - The navigation input filters mask the input data of the navigation engine

- 8.3 - Navigation Output Filters

  - Fix

  - Speed (3-D) Low-pass Filter

  - Course over Ground Low-pass Filter

  - Low-speed Course Over Ground Filter

- 8.4 - Static Hold

- 8.5 - Freezing the Course Over Ground

  

A fix is only valid if it passes the navigation output filters as defined in UBX-CFGNAV5. In particular, both PDOP and accuracy values must lie below the respective limits.

The UBX-CFG-NAV5 message also defines TDOP and time accuracy values that are used in order to establish whether a fix is regarded as locked to GNSS or not, and as a consequence of this, which time pulse setting has to be used. Fixes that do not meet both criteria will be regarded as unlocked to GNSS, and the corresponding time pulse settings of UBX-CFG-TP5 will be used to generate a time pulse.

Odometer Configuration - The algorithm behaviour can be optimized by setting up a profile (odoCfg field) representative of the context in which the receiver is operated; running, cycling, swimming, car.



### Device Filters

TODO



### Analysis Filters

- Maximum speed error (knots); 2.0 for 1 Hz, 4.0 for 5 Hz / 10 Hz
  - Recommend using 1.0 for 5 Hz / 10 Hz - sailquick
  - Use 2.0 for GW-60 due to wrist mounting during gybes
- Maximum acceleration (m/s<sup>2</sup>); 4.0 @ 1 Hz, 8.0 @ 5 Hz, **10.0** @ 10 Hz
- Error propagation; average @ 1 Hz, Gaussian @ 5 Hz / 10 Hz



#### GPS Speedreader

- Error estimates  
  - The default maximum allowed error estimate (SDoP or sAcc) is 2.0 for 1-Hz data, and 4.0 for 5 Hz and higher data.
- Acceleration  
  - The maximum allowed acceleration is 4.0 m/second squared for 1 Hz data; 8.0 for 5 Hz data; and **16.0** for 10 Hz data.



### Summary

- COG and SOG
- DOP
- Accuracy Estimates
- Filters - GPS hardware, device firmware and analysis software



## References

[Kalman Filter](https://en.wikipedia.org/wiki/Kalman_filter) on WIkipedia

[Dead Toys and Lots of Noise](https://boardsurfr.blogspot.com/2016/07/dead-toys-and-lots-of-noise.html?utm_source=seabreeze.com.au) blog about 5 Hz noise on GW-52

https://www.seabreeze.com.au/forums/Windsurfing/Gps/GW-52-5-Hz-Spikes-are-noise
