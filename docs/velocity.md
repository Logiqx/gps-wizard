## Velocity Links - WIP

Collection of (mostly) interesting links that are yet to be fully curated!




### Doppler Speed

#### Searches

- [Google search](https://www.google.com/search?ie=UTF-8&client=ms-android-samsung-rev2&source=android-browser&q=gps+%2Bdoppler+speed) - several good articles / links



#### Articles

- [VBOX Automotive - How does it work? - GPS Accuracy](https://www.vboxautomotive.co.uk/index.php/en/how-does-it-work-gps-accuracy)
  - There is a common misconception that speed measured via GPS is done so as a function of position against time
- [How does a GNSS receiver estimate velocity?](https://www.google.com/url?sa=t&source=web&rct=j&url=https://insidegnss.com/wp-content/uploads/2018/01/marapr15-SOLUTIONS.pdf&ved=2ahUKEwit74Sli7H7AhVahlwKHcpQDWwQFnoECCEQAQ&usg=AOvVaw2isyKWtJnp-9Zz1naQtNms) on Inside GNSS.com - [local mirror](doppler/pdf/marapr15-SOLUTIONS.pdf)
  - [How does a GNSS receiver estimate velocity?](https://insidegnss.com/how-does-a-gnss-receiver-estimate-velocity/) Q + A
    - The former approach is the most simple to implement, but it has a meter per second–level of accuracy due to the dependence on pseudorange-based position accuracy.
    - In contrast, Doppler frequency shifts of the received signal produced by user-satellite relative motion enables velocity accuracy of a few centimeters per second.
- [Doppler Shift](https://www.e-education.psu.edu/geog862/node/1786)
  - The ability to determine the instantaneous velocity of a moving vehicle has always been a primary application of GPS and is based on the fact that the Doppler-shift frequency of a satellite’s signal is nearly proportional to its range rate.
- [Principle of speed measurement using GPS](https://www.onosokki.co.jp/English/hp_e/products/keisoku/automotive/lc8_principle.htm) - explanation of how the ONO SOKKI [LC-8310](https://www.onosokki.co.jp/English/hp_e/products/keisoku/automotive/lc8310.htm) measures velocity
  - The speed can be calculated extremely more precisely because it receives almost none of the influence from the ionosphere.
- [GPS Determination of Course and Speed](http://www.aprs.net/vm/gps_cs.htm) by Tom Clark
- [GPS receivers calculate speed using algorithms in the Kalman filter](http://www.gpsinformation.net/main/gpsspeed.htm) - refers to NAVSTAR GPS and mentions 999 mph limit
- [Innovation: Doppler-Aided Positioning](https://www.gpsworld.com/gnss-systemalgorithms-methodsinnovation-doppler-aided-positioning-11601/) on GPS World
- [Revisiting why we went to Doppler based GPS speeds](https://www.seabreeze.com.au/forums/Windsurfing/Gps/Revisiting-why-we-went-to-Doppler-based-GPS-speeds?page=1) on Seabreeze in June 2016



#### Forums

- [Doppler GPS speed and heading](https://forums.garmin.com/developer/connect-iq/f/discussion/7609/doppler-gps-speed-and-heading) on Garmin forum



#### Papers

- [Reducing the Effect of Positioning Errors on Kinematic Raw Doppler (RD) Velocity Estimation Using BDS-2 Precise Point Positioning](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#__ffn_sectitle)
  - Particularly good article giving insight into velocity estimation and how PPP might help raw doppler estimates.
- [Evaluation of the performance of GNSS-based velocity estimation algorithms](https://satellite-navigation.springeropen.com/articles/10.1186/s43020-022-00080-4)
- [Precise Velocity Estimation with a Stand-Alone GPS Receiver](https://www.cambridge.org/core/journals/journal-of-navigation/article/abs/precise-velocity-estimation-with-a-standalone-gps-receiver/62603128918DBBD7D64059302D1AD33A#)
- [Modelling and assessment of Galileo and Galileo/GPS velocity determination with stand-alone receiver](https://www.cambridge.org/core/journals/journal-of-navigation/article/abs/modelling-and-assessment-of-galileo-and-galileogps-velocity-determination-with-standalone-receiver/C0C9824541B139001047AF23291B76EA)
- [Handheld-GPS based Speed-Measurements][https://web.archive.org/web/20120531035620/http://www.gps-results.com/GPS_Speed.pdf] by Manfred Fuchs (7 May 2007) - [local mirror](doppler/pdf/GPS_Speed.pdf)
- [High accuracy speed measurement using GPS](https://studylib.net/doc/18795194/high-accuracy-speed-measurement-using-gps) by Tom Chalko in 2007 - [local mirror](doppler/pdf/HighAccuracySpeed.pdf)
- [GPS Estimation Algorithms for Precise Velocity](http://acl.mit.edu/papers/2002_MSEC_93.pdf) in 2002 - racing car paper about Doppler speed
  -  Significant distances can be driven (≈500 m) while only incurring a 10–20 cm positioning error without any of the difficulties associated with determining the measurement biases.
- [On the relativistic Doppler Effects and high accuracy velocity determination using GPS](https://www.researchgate.net/publication/238619351_On_the_relativistic_Doppler_Effects_and_high_accuracy_velocity_determination_using_GPS) by Zhang et al (Jan 2004) - [local mirror](doppler/pdf/On_the_relativistic_Doppler_Effects_and_high_accur.pdf)
  - An old paper that describes very well the potential for speeds derived from the Doppler observables
- [An Overview of GNSS and GPS based Velocity Measurement in Comparison to Other Techniques](https://www.academia.edu/38076739/An_Overview_of_GNSS_and_GPS_based_Velocity_Measurement_in_Comparison_to_Other_Techniques) in 2018 - [local mirror](doppler/pdf/An_Overview_of_GNSS_and_GPS_based_Veloci.pdf)
  - High correlation exists between GPS velocity error and acceleration and deceleration (R<sup>2</sup> > 0.70) in variable speeds meaning that the error rises in higher acceleration and decelerations.
  - The accuracy of speed with DGPS was improved as compared tonon-differential GPS.
  - HDOP might be used as a quality indicator for speed data reliability.
  - Includes references to other studies.
- [Assessment of speed and position during human locomotion using nondifferential GPS](https://pubmed.ncbi.nlm.nih.gov/18091013/) by Townshend et al (Jan 2008)
- [Accuracy of non-differential GPS for the determination of speed over ground](https://pubmed.ncbi.nlm.nih.gov/15519597/) by Witte + Wilson (Dec 2004)
- [Evaluation of the accuracy of global positioning system (GPS) speed measurement via GPS simulation](https://www.researchgate.net/publication/282867917_Evaluation_of_the_accuracy_of_global_positioning_system_GPS_speed_measurement_via_GPS_simulation) - [local mirror](doppler/pdf/002_dinesh_speed.pdf)
  - Doppler shift method is able to provide accurate results as it is insensitive to the UERE of GPS receivers.
- [Evaluation of the performance of GNSS-based velocity estimation algorithms](https://satellite-navigation.springeropen.com/articles/10.1186/s43020-022-00080-4) in Sep 2022 - [local mirror](doppler/pdf/s43020-022-00080-4.pdf)
  - The method based on Doppler observations gives the accuracy in the order of cm/s.
  - When vehicle movement is in highly dynamic state, raw Doppler is the best because of its more rigorous mathematical model.
  - Thus, raw Doppler method can be applied in the scenarios where the vehicle motion state is changing greatly
- [[6] Van Graas, F., and A. Soloviev A., “Precise Velocity Estimation Using a Stand-Alone GPS Receiver,” Proceedings of the ION NTM 2003, Institute of Navigation, Anaheim, California, January 22–24, 2003, pp. 283-292](https://onlinelibrary.wiley.com/doi/10.1002/j.2161-4296.2004.tb00359.x)
- [[5] Szarmes, M., and S. Ryan, G. Lachapelle, and P. Fenton, “DGPS High Accuracy Aircraft Velocity Determination Using Doppler Measurements,” Proceedings of International Symposium on Kinematic Systems in Geodesy, Geomatics and Navigation – KIS97, pp. 167-174, Department of Geomatics Engineering, The University of Calgary, Banff, June 3–6, 1997](https://www.researchgate.net/publication/228886904_DGPS_High_Accuracy_Velocity_Determination_Using_Doppler_Measurements)
  - DGPS_High_Accuracy_Velocity_Determination_Using_Do.pdf

- [[4] Serrano L., and D. Kim D, R. B. Langley, K. Itani, and M. Ueno, “A GPS Velocity Sensor: How Accurate Can It Be? — A First Look,” Proceedings of the ION National Technical Meeting 2004, pp. 875-885, Institute of Navigation, San Diego, California, January 26–28, 2004](https://www.researchgate.net/publication/252975986_A_GPS_velocity_sensor_How_accurate_can_it_be_-_A_first_look)
  - A_GPS_velocity_sensor_How_accurate_can_it_be_-_A_f.pdf
  - We have investigated the feasibility of a low-cost GPS velocity sensor for applications such as vehicle testing.
    A receiver-generated Doppler measurement is a measure
    of instantaneous velocity, whereas the carrier-phasederived Doppler is a measure of mean velocity between
    observation epochs. The Doppler measurement is noisier
    than carrier-phase-derived Doppler because the receivergenerated Doppler is measured over a very small time
    interval. As carrier-phase-derived Doppler is computed
    over a longer time span than Doppler, the random noise is
    averaged and lowered. Therefore, very smooth velocity is
    obtained by carrier-phase-derived Doppler observation if
    there is no undetected cycle slips.

- [3] Olynik, M., and M. G. Petovello, M. E. Cannon, and G. Lachapelle, “Temporal Impact of Selected GPS Errors on Point Positioning,” GPS Solutions, 6(1-2): 47-57, 2002
  - This paper analyzes the temporal variations of the broadcast satellite clock model and orbit parameters, as well as ionospheric errors, because these will typically be the dominant errors for real-time point positioning.

- [Precise Velocity Estimation with a Stand-Alone GPS Receiver](https://www.researchgate.net/publication/228803246_Precise_Velocity_Estimation_with_a_Stand-Alone_GPS_Receiver)



### TDCP

- [tdcp gps velocity - Google Search](https://www.google.com/search?q=tdcp+gps+velocity&client=ms-android-samsung-rev2&source=android-browser&sxsrf=ALiCzsZJt7bTLTmnGFUPmLtsJDv9oEW6OQ%3A1668802736367&ei=sOh3Y4eAFouMgQbG35WgBQ&oq=tdcp+gps+velocity&gs_lcp=ChNtb2JpbGUtZ3dzLXdpei1zZXJwEAMyBQghEKABMgUIIRCgAToHCAAQHhCwAzoICAAQhgMQsAM6CggAEB4QogQQsAM6CAgAEKIEELADOgYIABAWEB46BQgAEIYDOgQIIRAVOgcIIRCgARAKSgQIQRgBUJoLWK8jYMcnaABwAHgAgAHPAYgBrAuSAQUxLjguMZgBAKABAcgBBMABAQ&sclient=mobile-gws-wiz-serp#ip=1&scso=_jux3Y4DbHMqpgQaYvJzoCA_1:510.6666564941406)
- [Time-differenced carrier phases technique for precise GNSS velocity estimation](https://www.researchgate.net/publication/270282162_Time-differenced_carrier_phases_technique_for_precise_GNSS_velocity_estimation) - TODO
  - Freda P., and A. Angrisano, S.Gaglione, and S. Troisi, ”Time-Differenced Carrier Phases Technique for Precise GNSS Velocity Estimation,” GPS Solutions, Doi: 10.1007/s10291-014-0425-1, 2014
  - Classically, a stand-alone GNSS receiver estimates its velocity by forming the approximate derivative of consecutive user positions or more often by using the Doppler observable. The first method is very inaccurate, while the second one allows estimation of the order of some cm/s. The time-differenced carrier phase (TDCP) technique, which consists in differencing successive carrier phases, enables accuracies at the mm/s level. 
- [Time-Differenced Carrier Phase Technique for Precise Velocity Estimation on an Android Smartphone](https://europepmc.org/article/MED/36366212) - [local mirror](doppler/pdf/sensors-22-08514-v2.pdf)
  - TODO
- [Time-differenced carrier phases technique for precise GNSS velocity estimation](https://link.springer.com/article/10.1007/s10291-014-0425-1)
- [Velocity estimations by combining time-differenced GPS and Doppler observations 2019](https://iopscience.iop.org/article/10.1088/1361-6501/ab375f)
  Time-differenced carrier phase velocity estimations (TDCPVE) and Doppler velocity estimations (DVE) are two commonly used methods for precise velocity estimation with a stand-alone GPS receiver. As TDCPVE require a minimum of four satellites for parameter estimation, the time-differenced velocity estimation (TDVE) model was developed by combining the TDCPVE model and time-differenced pseudo-range velocity estimation model. A limitation of the TDVE is that it can show reduced solution availability, particularly during harsh conditions. DVE model theory is stricter than that of the TDVE model, which yields more reliability when vehicle maneuverability is strong. However, its accuracy is low due to the low precision of Doppler observations. Nevertheless, the advantages and disadvantages of the TDVE and DVE are complementary. This study presents a TD–DVE method by combining the two models. This method can achieve improved performance by fully using all useful information contained in the GPS and Doppler observations. Static and dynamic data were used to verify and analyze the performance of the TD–DVE. The results show that the accuracy of the TD–DVE was improved compared with the DVE. Compared with the TDVE method, TD–DVE has a much higher solution rate at poor observation conditions and improved accuracy during changing vehicle dynamic conditions. Overall, the TD–DVE model enhances the robustness of the individual velocity estimation methods and improves usability.



### Hybrid

- [Vehicle's Instantaneous Velocity Reconstruction by Combining GNSS Doppler and Carrier Phase Measurements](https://ieeexplore.ieee.org/document/9416912)



### Summary

- Acceleration / deceleration pose a challenge
- Static tests provides a good illustration of the difference between speed and distance / time.
- Affected by HDOP (see scatter plot)
- When sationary, speed errors will always be positive. When moving they could be positive or negative.
- Speed errors / noise can be reduced using a Kalman
- Usage of a Kalman filter (SiRF and u-blox) confirms the presence of noise

