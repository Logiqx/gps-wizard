## GPS Links - WIP

Collection of (mostly) interesting links that are yet to be fully curated!



### Overviews

GPS positioning can be described as using [trilateration](https://en.wikipedia.org/wiki/Trilateration) (distances), as opposed to [triangulation](https://en.wikipedia.org/wiki/Triangulation) (angles).

#### GPS / GNSS

- [GPS](https://ciechanow.ski/gps/) by [Bartosz Ciechanowski](https://ciechanow.ski/)
  - Interactive overview of how GPS works which is really quite fun!
- [GPS MOOC (Massive Open Online Course)](https://scpnt.stanford.edu/about/gps-mooc-massive-open-online-course) from Stanford
  - Watch the entire GPS Massive Open On-line Course on [YouTube](https://www.youtube.com/watch?v=o1Fyn_h6LKU&list=PLGvhNIiu1ubyEOJga50LJMzVXtbUq6CPo).
- [GEOG 862: GPS and GNSS for Geospatial Professionals](https://www.e-education.psu.edu/geog862/home.html)
  - Current and future capabilities of GPS and the emerging Global Navigation Satellite System.
- [An introduction to Global Navigation Satellite Systems](https://ntrs.nasa.gov/api/citations/20200000265/downloads/20200000265.pdf) by NASA (6 Jan 2020) - [local mirror](doppler/pdf/20200000265.pdf)
  - Good detailed overview of GNSS ending with a focus on space applications
- [GPS Basics](https://web.archive.org/web/20060715195054/http://telecom.tlab.ch/~zogg/Dateien/GPS_basics_u_blox_en.pdf) by Jean-Marie Zogg of u-blox (26 Mar 2002) - [local mirror](doppler/pdf/GPS_basics_u_blox_en.pdf)
  - Good detailed overview of GPS although becoming somewhat dated

#### Accuracy

- [GPS Accuracy: HDOP, PDOP, GDOP, Multipath & the Atmosphere](https://gisgeography.com/gps-accuracy-hdop-pdop-gdop-multipath/) on GIS Geography
  - A well-designed GPS receiver can achieve a horizontal accuracy of 3 meters or better (95% of the time)
- [Ice sailing - Feb 2004 by Bob Dill](https://www.idniyra.org/old/articles/IceboatSailingPerformance.html)
  - "When everything is working right, GPS's are very accurate relative to most other measurement methods.  The larger issue is that they can give spurious data when things are not working properly."
- [The 7 errors that your GPS watch regularly makes](https://www.montre-cardio-gps.fr/les-7-erreurs-que-fait-regulierement-votre-montre-gps/) on Montre Cardio GPS
  - Tip: Use Google translate for English!
- [Error analysis for GPS](https://en.wikipedia.org/wiki/Error_analysis_for_the_Global_Positioning_System) on Wikipedia




### Observables

e.g. Pseudorange, Carrier phase, Doppler shift.

- [GNSS Basic Observables](https://gssc.esa.int/navipedia/index.php/GNSS_Basic_Observables#:~:text=3%20Doppler%20shift-,Pseudorange,(at%20the%20reception%20time).) on Navipedia
- [Observables](https://gnss-sdr.org/docs/sp-blocks/observables/) on gnss-sdr.org
- [Positioning with Android: GNSS observables](https://www.gpsworld.com/positioning-with-android-gnss-observables/)
  - Nice chart showing that Doppler has less noise than pseudo range
- [Noise comparison of triple frequency GNSS carrier phase, doppler and pseudorange observables](https://www.sciencedirect.com/science/article/abs/pii/S0263224119304269) by Gethin Wyn Roberts (11 May 2019)
  - Full access is not available but it could be an interesting paper



### Kalman Filter

- [Kalman Filtering | GEOG 862: GPS and GNSS for Geospatial Professionals](https://www.e-education.psu.edu/geog862/node/1777)
- [kalman ublox - Google Search](https://www.google.com/search?q=kalman++ublox)
  - [ublox settings for single point solution](https://portal.u-blox.com/s/question/0D52p00008HKCQICA5/ublox-settings-for-single-point-solution)
  - [M8U performance: Kalman filter, course over ground and Magnetic variation issues](https://portal.u-blox.com/s/question/0D52p00008HKDzFCAX/m8u-performance-kalman-filter-course-over-ground-and-magnetic-variation-issues)
- [Practical implementation and performance assessment of an Extended Kalman Filter-based signal tracking loop](https://ieeexplore.ieee.org/document/6577275)



### Dead Reckoning

- [u-blox Dead Reckoning for Automotive Applications](https://content.u-blox.com/sites/default/files/documents/u-blox-ADR_WhitePaper_%28UBX-adr%29.pdf)



### GPS Augmentation

[GNSS augmentation - Wikipedia](https://en.m.wikipedia.org/wiki/GNSS_augmentation)

#### AGPS

-   Ephemeris data
   - Switch on early!
- Assisted GPS for quicker startup
   - GT-11 did weird things when "move long" not answered correctly

#### DGPS

[Differential GPS - Wikipedia](https://en.m.wikipedia.org/wiki/Differential_GPS)

#### RTK

- [Real-time kinematic positioning](https://en.wikipedia.org/wiki/Real-time_kinematic_positioning)
- History
  - [History of RTK—Part 1: A Really Tough Problem to Solve - The American Surveyor](https://amerisurv.com/2021/04/18/history-of-rtk-part-1-a-really-tough-problem-to-solve/)
  - [History of RTK—Part 4: Birth of a Utility - The American Surveyor](https://amerisurv.com/2021/10/12/history-of-rtk-part-4-birth-of-a-utility/amp/)
- [What is GPS RTK?](https://learn.sparkfun.com/tutorials/what-is-gps-rtk/all) by SparkFun Learn
- [Comparison : Standard GPS/GNSS Receiver vs RTK GPS/GNSS System](https://support.swiftnav.com/support/solutions/articles/44001850808-understanding-gps-gnss-rtk-technology)
- u-blox
  - [NEO-M8P](https://www.u-blox.com/en/product/neo-m8p-series#Documentation-&-resources?legacy=Current) modules includes RTK
  - [ZED-F9P](https://www.u-blox.com/en/product/zed-f9p-module) module includes RTK - [product summary](https://content.u-blox.com/sites/default/files/ZED-F9P_ProductSummary_UBX-17005151.pdf)
  - [Taoglas and u-blox bring centimeter-level GNSS positioning](https://www.u-blox.com/en/press-releases/taoglas-and-u-blox-bring-centimeter-level-gnss-positioning-solution-iot-applications) (7 Nov 2019)
- Trimble
  - [RTK Surveying Solution with VRS Now | Trimble GNSS Positioning](https://positioningservices.trimble.com/industries/survey/vrs-now/)
- V-Box
  - [VBOX Automotive - How does it work? - RTK](https://vboxautomotive.co.uk/index.php/en/how-does-it-work-rtk)
- Miscellaneous links
  - [Advantage of velocity measurements on instantaneous RTK positioning](https://www.researchgate.net/publication/225464771_Advantage_of_velocity_measurements_on_instantaneous_RTK_positioning)
  - [How GNSS & RTK Technology Achieve High-Precision Positioning?](https://www.fjdynamics.com/blog/91-GNSS--RTK.html)
  - [Google search](https://www.google.com/search?ie=UTF-8&client=ms-android-samsung-rev2&source=android-browser&q=rtk+velocity+estimate)
  - [simpleRTK2B using -blox ZED-F9P](https://www.ardusimple.com/question/velocity-estimation/) - [product](https://www.ardusimple.com/product/simplertk2b/)
- Li et al. [[7](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B7-sensors-19-03029)] applied the RD method to GPS kinematic positioning, which improved the ambiguity fixed rate and positioning accuracy.
- [Professional opinions](https://www.gpsworld.com/high-rate-rtk-helpful-or-hypeful/) on high solution rate:
  - “We can be creatures of habit and tie ourselves to beliefs that ‘this is the way I did it and it worked then.’ People should always ask themselves the question, ‘do I still need to do it this way?"
  - "We recommend 5 Hz and higher for a moving rover, but it can be overkill for a stationary one"
  - "The rover could even have a correction age of 5 or 10 seconds, and it will use the previous package to calculate the position. Since 1-Hz base and 5-Hz rover can work without degradation of precision, there’s no need to change the base to 5 Hz.”
  - "Autonomous applications also typically use between 10 Hz and 50Hz for GNSS, and often combine this with 100-Hz or 200-Hz IMU data. Aerospace and defense applications have demanding conditions and use 100-Hz to 200-Hz IMU data to navigate, often combined with 1-Hz, 10-Hz or 20-Hz GNSS data."
  - "High update rates on a base station do not provide advantages except in rare cases where the base is moving. While rovers are computing movements of the rover antenna, base stations are providing GNSS satellite corrections. A rate of more than 1 Hz for a static base station does not benefit rover accuracy; it only creates a burden on the communication between base and rover. Base and rover communication needs to be optimized to reduce bandwidth requirements. This is especially true as we continue to add constellations and signals to GNSS solutions."
  - “High rate can be considered a common default mode of operation,” said Stuart Riley, vice president, Technology – GNSS, Trimble. “Typical rover position solution rates are 5 Hz, 10 Hz and 20 Hz.”
     "Riley noted another relevant technology that Trimble has implemented: the use of precise satellite clock and orbit corrections — such as from the Trimble RTX precise point positioning (PPP) service — to augment RTK when there is a loss of the base correction stream."

#### PPP

- [Trimble’s Rtk And Dgps Solutions In Comparison With Precise Point Positioning | SpringerLink](https://link.springer.com/chapter/10.1007/978-3-540-85426-5_81)
- Compared with the SPP positioning accuracy of tens of meters, the BDS-2 kinematic PPP positioning accuracy is significantly improved to the dm level. <sup>[1](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#__ffn_sectitle)</sup>

#### Inertial Measurements

- [RTK-quality velocity and orientation accuracy without a base-station](https://www.oxts.com/achieve-rtk-velocity-and-orientation-accuracy/)




### Dual Frequency

- [Full article: On the accuracy of low-cost dual-frequency GNSS network receivers and reference data](https://www.tandfonline.com/doi/full/10.1080/15481603.2020.1822588) (15 Jun 2020)
- [new, More Accurate GPS Sports Watch | There's A Catch Though](https://the5krunner.com/2021/01/14/new-more-accurate-gps-sports-watch-theres-a-catch-though/) on the5krunner.com (14 Jan 2021)
- [No, dual band GPS does not replace dead reckoning](https://www.u-blox.com/en/blogs/insights/dual-band-gps-dead-reckoning) by u-blox (11 Mar 2022)
- [Is dual-band a GPS superpower?. New dual-band GPS/GNSS technology](https://medium.com/@mikehorton/is-dual-band-a-gps-superpower-f7ad6f047d98) by Mike Horton (6 May 2020)



### Manufacturers

#### Garmin

[Where should I go/contact for suggestions? - fēnix 7 series - Wearables - Garmin Forums](https://forums.garmin.com/outdoor-recreation/outdoor-recreation/f/fenix-7-series/311263/where-should-i-go-contact-for-suggestions/1508499)



#### u-blox

[NEO-M8 series | u-blox](https://www.u-blox.com/en/product/neo-m8-series) - used by the Gyro-1

[NEO-M9N](https://www.u-blox.com/en/product/neo-m9n-module) module (4 concurrent GNSS) uses [UBX-M9140-KB](https://www.u-blox.com/en/product/ubx-m9140-series) chip (professional grade) - https://insidegnss.com/new-4-constellation-chip-from-u-blox/



#### Taoglas

- [CGGBP.25.4.A.02](https://www.taoglas.com/product/cggbp-25-4-a-02-gpsglonassbeidou-patch-antenna-25mm-2/) 25 x 25 x 4mm GPS/GLONASS/GALILEO/BeiDou Patch Antenna is definitely used at Luderitz 2022 - [specification](https://www.taoglas.com/images/product_images/original_images/CGGBP.25.4.A.02.pdf)
  - CGGBP.25.4.A.02 is compatible with the [EVA-M8M-1](https://www.u-blox.com/en/product/eva-m8-series) - [product sheet](https://content.u-blox.com/sites/default/files/EVA-M8-FW3_DataSheet_%28UBX-16014189%29.pdf)
- [CGGP.25.4.E.02](https://www.taoglas.com/product/cggp-25-4-a-02-gpsglonass-dual-band-patch-antenna-25254mm-2/) 25 x 25 x 4mm GPS/GLONASS/Galileo Patch Antenna
  - CGGP.25.4.E.02 s compatible with the MAX-M10S
- [u-blox Antenna Reference Page - Taoglas](https://www.taoglas.com/taoglas-antenna-reference-guide/ublox-antenna-reference-page/?module=32838) - cross-reference Taoglas antenna with u-blox chips / modules
- [Experiences with low cost M8N GPS modules?](https://3drpilots.com/threads/experiences-with-low-cost-m8n-gps-modules.10441/post-121945) on 3D Robotics Drone Forum- mention of the CGGBP.25.4.A.02



### Mateksys

- [Mateksys GNSS & Compass M9N-5883](http://www.mateksys.com/?portfolio=m9n-5883) uses the Taoglas CGGBP.25.4.A.02 and u-blox [NEO-M9N-00B](https://www.u-blox.com/en/product/neo-m9n-module) (up to 25 Hz)
  - Appears to be used in the Luderitz devices
  - Superseded by the [Mateksys GNSS *&* COMPASS M10-5883](http://www.mateksys.com/?portfolio=M10-5883) with different antenna and u-blox MAX-M10S
    - 10 Hz in multi-constellation GNSS modes
- [Mateksys GNSS M9N-CAN](http://www.mateksys.com/?portfolio=m9n-can) uses the Taoglas CGGBP.25.4.A.02 and u-blox [NEO-M9N-00B](https://www.u-blox.com/en/product/neo-m9n-module) (up to 25 Hz)
- [Mateksys GNSS M10-L4-3100](http://www.mateksys.com/?portfolio=m10-l4-3100) uses the Taoglas CGGBP.25.4.A.02 + u-blox MAX-M10S
  - 10 Hz in multi-constellation GNSS modes




### Software

- [GPS Visualizer](https://www.gpsvisualizer.com/map_input)



### Events

[Luderitz 2022](https://www.gps-speed.com/LSC2022/AutoUpdateGPS.php)

[WSSRC course rules for 500m](https://www.sailspeedrecords.com/the-course-of-500-m)



### Forums

- [locosys vs garmin | Windsurfing Forums, page 4 - Seabreeze](https://www.seabreeze.com.au/forums/Windsurfing/Gps/locosys-vs-garmin?page=4)



### Blogs

- [The Windsurf Loop](https://boardsurfr.blogspot.com/search?updated-max=2022-10-23T18:59:00-04:00&max-results=4&reverse-paginate=true&m=1)
- https://web.archive.org/web/20171120010913/mtbest.net/speed_sailing_helmet.html
- https://web.archive.org/web/20170819093539/http://mtbest.net/GT32-resources.html
- https://web.archive.org/web/20171022140823/http://mtbest.net/setting-up-navi-GT31.htm



### Watches

- [Chips in watches](https://www.dropbox.com/sh/psdyxm93y2m12j3/AABNlbBRsF2E3edvzqnnMPC4a?dl=0&preview=Test+Results+-+All+Watches.xlsx)
- APEX 2 Pro
  - https://the5krunner.com/2022/11/03/coros-apex-2-pro-review/
  - https://www.reddit.com/r/Coros/comments/yl29t1/coros_launches_apex_2_and_apex_2_pro_kilian/
  - https://www.dcrainmaker.com/2022/11/coros-apex-2-vs-apex-2-pro-in-depth-review.html
