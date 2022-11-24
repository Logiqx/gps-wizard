## Sports - WIP

### Ice Sailing

An old article highlights some good points on early GSP performance, many of which still stand today:

- [Ice sailing - Feb 2004 by Bob Dill](https://www.idniyra.org/old/articles/IceboatSailingPerformance.html)



### Sky Diving

[Speed skydiving](https://en.wikipedia.org/wiki/Speed_skydiving) is a genuine sport and they have their own approved GPS device:

- [FlySight](https://www.flysight.ca/) by Bionic Avionics Inc
  - Uses the [NEO-6Q](https://www.u-blox.com/en/product/neo-6-series) which is an older generation GPS-only product from u-blox. See FlySight [schematics](http://flysight.ca/wiki/index.php/Schematics) page.
  - NED north + east velocity are recorded in the CSV output, taken from UBX-NAV-PVT.

A couple of statistics:

- [Speed skydivers](https://en.wikipedia.org/wiki/Speed_skydiving) can reach speeds of up to 500 km/h ≈ 140 m/s, typically jumping from around 4 km.
- [Space divers](https://en.wikipedia.org/wiki/Space_diving) have recorded speeds of 1,357.64 km/h ≈ 377 m/s, jumping from an elevation of 41 km.



### Drag Racing

The drag racing community feel the Dragy is very close to official laser times on a track, typically 0.01 to 0.03 seconds different for 1/4 mile.

A couple of videos give an quick overview of popular devices:

- [How to test your cars acceleration: Vbox Sport vs Dragy GPS 0-100 timer](https://www.youtube.com/watch?v=iaPqas6MQM0&t=8s) provides some background on the VBOX 1 / 2 + Sport and Dragy.
- [Is P-Gear better than Dragy?!?!](https://www.youtube.com/watch?v=3Ns5YuinVSs) by [Vancity Audi](https://www.youtube.com/@VancityAudi) (22 Mar 2021) introduces P-Gear as a rival to Dragy.



#### VBOX Sport

- VBOX Sport [product](https://www.vboxmotorsport.co.uk/index.php/en/vbox-sport) page with [datasheet](https://www.vboxmotorsport.co.uk/downloads/datasheets/VBOX%20Sport%20Datasheet.pdf) showing 10 Hz logging (GPS + GLONASS).
  - Worth noting that there was another product with the same name that was 20 Hz logging.
- VBOX Sport [support](https://en.racelogic.support/VBOX_Motorsport/Product_Info/Performance_Meters/VBOX__Sport) page contains a number of resources, including NMEA output details.
  - VBOX Sport only saves GGA and RMC messages, both of which are supported by [GPS Wizard](formats/nmea.md).

- Firmware [history](https://www.racelogic.co.uk/_downloads/history.php?file=_downloads/history/VBS2.hst&title=VBOX%20Sport&code=Serial%20number%207015757%20onwards&version=1.1.225&date=06/2019) mentions addition of u-blox and GLONASS in 1.1.225 (Jun 2019).
  - Suspect it may use the [MAX-8](https://www.u-blox.com/en/product/max-8-series) series or [NEO-8Q](https://www.u-blox.com/en/product/neo-8q-module) since they are amongst the few u-blox modules only supporting GPS + GLONASS.
  - Reduction from the previous 20 Hz appears to have caused some consternation in the car community.
- It's worth noting that VBOX have written great articles on [GPS Accuracy](https://www.vboxautomotive.co.uk/index.php/en/how-does-it-work-gps-accuracy) (explaining use of Doppler shift) and [Real Time Kinematic](https://www.vboxautomotive.co.uk/index.php/en/how-does-it-work-rtk) (RTK).

#### Dragy

- [Dragy Motorsports UK](https://dragymotorsports.co.uk/)
- [How Accurate Are DRAGY GPS Devices???](https://m.youtube.com/watch?v=LGWvSaXtSSE) by [Vancity Audi](https://www.youtube.com/@VancityAudi) (13 Jun 2021).
- [Dragy Teardown](https://m.youtube.com/watch?v=rOkQ3qqsSKk) by [Bald Man Motors](https://www.youtube.com/@BaldManMotors) (17 Feb 2019).
  - Confirms the [MAX-M8Q](https://www.u-blox.com/en/product/max-m8-series) series from u-blox.

#### P-Gear

There are two websites:
- [P-Gear Motorsports](https://pgearmotorsports.com/) is the main commercial website.
- [My P-Gear](http://www.mypgear.com/) also has product details but includes a leaderboard / rankings.
  - The website shows two products:
    - P-Gear P610 - 20Hz GPS/GLONASS/Beidou + 3D sensor.
    - P-Gear P610G - 10Hz GPS/GLONASS/Beidou.
  - It also mentions use of a u-blox chip for GPS / GLONASS / Beidou.
    - Only NEO-M8P is lacking Galileo but this chip seems unlikely.
  - It is not clear whether both models use the same manufacturer.



#### Comparisons

- [PGear Performance box Vs Dragy - Better or worse](https://www.youtube.com/watch?v=mqkNZ-gyACI&t=903s) by Peak Performance Reviews (19 Mar 2021).
  - Take performance comments with a pinch of salt. He is clearly not an expert on GPS / GNSS technology.
