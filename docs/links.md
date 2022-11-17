## GPS Links

Collection of (mostly) interesting links that are yet to be fully curated!



### Basics

- [GPS Basics](https://web.archive.org/web/20060715195054/http://telecom.tlab.ch/~zogg/Dateien/GPS_basics_u_blox_en.pdf) by Jean-Marie Zogg of u-blox (26 Mar 2002) - [local mirror](doppler/pdf/GPS_basics_u_blox_en.pdf)
  - Good detailed overview of GPS but no mention of Doppler speed
- [An introduction to Global Navigation Satellite Systems](https://ntrs.nasa.gov/api/citations/20200000265/downloads/20200000265.pdf) by NASA (6 Jan 2020) - [local mirror](doppler/pdf/20200000265.pdf)
  - Another good detailed overview of GNSS but no mention of Doppler speed

- [GPS Accuracy: HDOP, PDOP, GDOP, Multipath & the Atmosphere](https://gisgeography.com/gps-accuracy-hdop-pdop-gdop-multipath/) on GIS Geography
  - A well-designed GPS receiver can achieve a horizontal accuracy of 3 meters or better (95% of the time)
- [Les 7 erreurs que fait régulièrement votre montre GPS | Montre Cardio GPS](https://www.montre-cardio-gps.fr/les-7-erreurs-que-fait-regulierement-votre-montre-gps/) - use translation to read in English



### Observables

e.g. Pseudorange, Carrier phase, Doppler shift.

- Observables including [Psuedorange rate](https://gnss-sdr.org/docs/sp-blocks/observables/#pseudorange-rate-measurement) on gnss-sdr.org 
- [Noise comparison of triple frequency GNSS carrier phase, doppler and pseudorange observables](https://www.sciencedirect.com/science/article/abs/pii/S0263224119304269) by Gethin Wyn Roberts (11 May 2019)
- [Positioning with Android: GNSS observables](https://www.gpsworld.com/positioning-with-android-gnss-observables/)
- [GNSS Basic Observables](https://gssc.esa.int/navipedia/index.php/GNSS_Basic_Observables#:~:text=3%20Doppler%20shift-,Pseudorange,(at%20the%20reception%20time).) -onNavipedia



### Doppler Speed

[Google search](https://www.google.com/search?ie=UTF-8&client=ms-android-samsung-rev2&source=android-browser&q=gps+%2Bdoppler+speed) - several good articles / links

Articles:

- [VBOX Automotive - How does it work? - GPS Accuracy](https://www.vboxautomotive.co.uk/index.php/en/how-does-it-work-gps-accuracy)
- [How does a GNSS receiver estimate velocity?](https://www.google.com/url?sa=t&source=web&rct=j&url=https://insidegnss.com/wp-content/uploads/2018/01/marapr15-SOLUTIONS.pdf&ved=2ahUKEwit74Sli7H7AhVahlwKHcpQDWwQFnoECCEQAQ&usg=AOvVaw2isyKWtJnp-9Zz1naQtNms) on Inside GNSS.com - [local mirror](doppler/pdf/marapr15-SOLUTIONS.pdf)
  - [How does a GNSS receiver estimate velocity?](https://insidegnss.com/how-does-a-gnss-receiver-estimate-velocity/) Q + A
    - The former approach is the most simple to implement, but it has a meter per second–level of accuracy due to the dependence on pseudorange-based position accuracy.
    - In contrast, Doppler frequency shifts of the received signal produced by user-satellite relative motion enables velocity accuracy of a few centimeters per second.

- [Doppler Shift](https://www.e-education.psu.edu/geog862/node/1786)
  - The ability to determine the instantaneous velocity of a moving vehicle has always been a primary application of GPS and is based on the fact that the Doppler-shift frequency of a satellite’s signal is nearly proportional to its range rate.
- [Principle of speed measurement using GPS](https://www.onosokki.co.jp/English/hp_e/products/keisoku/automotive/lc8_principle.htm) - explanation of how the ONO SOKKI [LC-8310](https://www.onosokki.co.jp/English/hp_e/products/keisoku/automotive/lc8310.htm) measures velocity
- [GPS Determination of Course and Speed](http://www.aprs.net/vm/gps_cs.htm)
- [GPS receivers calculate speed using algorithms in the Kalman filter](http://www.gpsinformation.net/main/gpsspeed.htm) - refers to NAVSTAR GPS and mentions 999 mph limit
- [Innovation: Doppler-Aided Positioning](https://www.gpsworld.com/gnss-systemalgorithms-methodsinnovation-doppler-aided-positioning-11601/) on GPS World
- [Revisiting why we went to Doppler based GPS speeds](https://www.seabreeze.com.au/forums/Windsurfing/Gps/Revisiting-why-we-went-to-Doppler-based-GPS-speeds?page=1) on Seabreeze in June 2016

Forums:

- [Doppler GPS speed and heading](https://forums.garmin.com/developer/connect-iq/f/discussion/7609/doppler-gps-speed-and-heading) on Garmin forum

Papers:

- [Handheld-GPS based Speed-Measurements][https://web.archive.org/web/20120531035620/http://www.gps-results.com/GPS_Speed.pdf] by Manfred Fuchs (7 May 2007) - [local mirror](doppler/pdf/GPS_Speed.pdf)
- [High accuracy speed measurement using GPS](https://studylib.net/doc/18795194/high-accuracy-speed-measurement-using-gps) by Tom Chalko in 2007 - [local mirror](doppler/pdf/HighAccuracySpeed.pdf)
- [GPS Estimation Algorithms for Precise Velocity](http://acl.mit.edu/papers/2002_MSEC_93.pdf) in 2002 - racing car paper about Doppler speed
  -  Significant distances can be driven (≈500 m) while only incurring a 10–20 cm positioning error without any of the difficulties associated with determining the measurement biases.

- [An Overview of GNSS and GPS based Velocity Measurement in Comparison to Other Techniques](https://www.academia.edu/38076739/An_Overview_of_GNSS_and_GPS_based_Velocity_Measurement_in_Comparison_to_Other_Techniques) in 2018 - [local mirror](doppler/pdf/An_Overview_of_GNSS_and_GPS_based_Veloci.pdf)
  - Includes references to other studies

- [Evaluation of the accuracy of global positioning system (GPS) speed measurement via GPS simulation](https://www.researchgate.net/publication/282867917_Evaluation_of_the_accuracy_of_global_positioning_system_GPS_speed_measurement_via_GPS_simulation) - [local mirror](doppler/pdf/002_dinesh_speed.pdf)
  - Doppler shift method is able to provide accurate results as it is insensitive to the UERE of GPS receivers.

- [Evaluation of the performance of GNSS-based velocity estimation algorithms](https://satellite-navigation.springeropen.com/articles/10.1186/s43020-022-00080-4) in Sep 2022 - [local mirror](doppler/pdf/s43020-022-00080-4.pdf)
  - The method based on Doppler observations gives the accuracy in the order of cm/s.
  - When vehicle movement is in highly dynamic state, raw Doppler is the best because of its more rigorous mathematical model.
  - Thus, raw Doppler method can be applied in the scenarios where the vehicle motion state is changing greatly



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

#### DGPS

[Differential GPS - Wikipedia](https://en.m.wikipedia.org/wiki/Differential_GPS)

#### RTK

- [Real-time kinematic positioning](https://en.wikipedia.org/wiki/Real-time_kinematic_positioning)
- [What is GPS RTK?](https://learn.sparkfun.com/tutorials/what-is-gps-rtk/all) by SparkFun Learn
- [Comparison : Standard GPS/GNSS Receiver vs RTK GPS/GNSS System](https://support.swiftnav.com/support/solutions/articles/44001850808-understanding-gps-gnss-rtk-technology)
- u-blox
  - [NEO-M8P](https://www.u-blox.com/en/product/neo-m8p-series#Documentation-&-resources?legacy=Current) modules includes RTK
  - [ZED-F9P](https://www.u-blox.com/en/product/zed-f9p-module) module includes RTK - [product summary](https://content.u-blox.com/sites/default/files/ZED-F9P_ProductSummary_UBX-17005151.pdf)
  - [Taoglas and u-blox bring centimeter-level GNSS positioning](https://www.u-blox.com/en/press-releases/taoglas-and-u-blox-bring-centimeter-level-gnss-positioning-solution-iot-applications) (7 Nov 2019)




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



#### Taoglas

- [CGGBP.25.4.A.02](https://www.taoglas.com/product/cggbp-25-4-a-02-gpsglonassbeidou-patch-antenna-25mm-2/) 25 x 25 x 4mm GPS/GLONASS/GALILEO/BeiDou Patch Antenna is definitely used at Luderitz 2022 - [specification](https://www.taoglas.com/images/product_images/original_images/CGGBP.25.4.A.02.pdf)
  - CGGBP.25.4.A.02 appears to use the [EVA-M8M-1](https://www.u-blox.com/en/product/eva-m8-series) - [product sheet](https://content.u-blox.com/sites/default/files/EVA-M8-FW3_DataSheet_%28UBX-16014189%29.pdf)
- [CGGP.25.4.E.02](https://www.taoglas.com/product/cggp-25-4-a-02-gpsglonass-dual-band-patch-antenna-25254mm-2/) 25 x 25 x 4mm GPS/GLONASS/Galileo Patch Antenna
  - CGGP.25.4.E.02 appears to use the MAX-M10S
- [u-blox Antenna Reference Page - Taoglas](https://www.taoglas.com/taoglas-antenna-reference-guide/ublox-antenna-reference-page/?module=32838) - cross-reference Taoglas antenna with u-blox chips / modules
- [Experiences with low cost M8N GPS modules?](https://3drpilots.com/threads/experiences-with-low-cost-m8n-gps-modules.10441/post-121945) on 3D Robotics Drone Forum- mention of the CGGBP.25.4.A.02



### Software

- [GPS Visualizer](https://www.gpsvisualizer.com/map_input)



### Events

[Luderitz 2022](https://www.gps-speed.com/LSC2022/AutoUpdateGPS.php)

[WSSRC course rules for 500m](https://www.sailspeedrecords.com/the-course-of-500-m)

