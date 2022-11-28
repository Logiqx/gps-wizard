## Velocity Links - WIP

Collection of (mostly) interesting links that are yet to be fully curated!



### Introduction

There are several major velocity estimation methods for satellite-based applications, often referred to as follows:

- Position derivation (PD)
- Raw Doppler (RD)
- Time-differenced pseudorange (TDPR)
- Carrier-phase-derived Doppler (DD)
- Time-differenced carrier phase (TDCP)
- Double-differenced carrier phase (DDCP)

You will note from the descriptions and equations that all of the Doppler and carrier phase methods are affected by positional accuracy. This is because the equations involve line-of-sight vectors to the satellites. Satellite geometry will also play a role in their accuracy so there is a loose relationship between HDOP and speed accuracy. There are quite a few papers on these specific topics but I haven't curated my list of references, yet.

Understanding the 5 methods listed above provides some insight into why positional errors can sometimes bleed into speed readings, even on trusted devices such as the GT-11 and GT-31.

Here are links to some papers which describe the common speed / velocity derivation methods.

1. A great article on Inside GNSS.com (Mar 2015) also describes these methods:

   - [How does a GNSS receiver estimate velocity?](https://insidegnss.com/wp-content/uploads/2018/01/marapr15-SOLUTIONS.pdf) - [local mirror](doppler/pdf/marapr15-SOLUTIONS.pdf)
   - The text based article is [How does a GNSS receiver estimate velocity?](https://insidegnss.com/how-does-a-gnss-receiver-estimate-velocity/)
2. The introduction of the following paper from Jul 2019 gives a good overview of the main four methods:
   - [Reducing the Effect of Positioning Errors on Kinematic Raw Doppler (RD) Velocity Estimation Using BDS-2 Precise Point Positioning](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#__ffn_sectitle)
3. A paper from September 2022 also provides a good overview of the main methods:
   - [Evaluation of the performance of GNSS-based velocity estimation algorithms](https://satellite-navigation.springeropen.com/articles/10.1186/s43020-022-00080-4)


We already know that SiRF and u-blox devices use Doppler observations and Kalman filters. Indeed, presence of a Kalman filter tells us that raw Doppler can be prone to errors. Regardless of the method of derivation, I think most would require a Kalman filter to clean the data. 

I have a suspicion that some popular sports watches on the market may use TDPR and a Kalman filter. Pseudorange-rate is the first derivative of a basic GNSS observable (pseudorange) so chip designers will more than likely implement RD or TDPR imho.



### Summary of Velocity Estimation Methods

#### Position derivation (PD)

The PD velocity estimation method makes use of the first-order derivation of consecutive positions. If the positions are obtained by single point positioning with meter-level accuracy and the time interval is one second, a velocity of accuracy on the order of a few meters per second is possible.

Previous studies prove that the velocity estimation accuracy of the PD method is highly vulnerable to the positioning accuracy and the moving condition. For example, He et al. [[1](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B1-sensors-19-03029)] analyzed the differential GPS (DGPS) PD velocity estimation method by airborne experiments, and the maximum velocity error reached 2 m/s in the airplane taking-off stage.

Another study showed the velocity accuracy of the combined GPS/BeiDou navigation satellite system (BDS) solution was improved by 39% over that of the GPS-only solution.

Li et al. [[2](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B2-sensors-19-03029)] performed a comprehensive velocity estimation analysis based on three global navigation satellite system (GNSS) positioning modes, including single point positioning (SPP), pseudorange-based DGPS and carrier-phase-based real-time kinematic (RTK) in Antarctica. Experimental results showed that the RTK velocity solution achieved an accuracy of 3 mm/s in the vertical direction.



#### Raw Doppler (RD)

The RD velocity estimation method refers to the raw Doppler measurements for velocity determination. The Doppler frequency shifts of the received signal produced by user-satellite relative motion enables velocity accuracy of a few centimeters per second.

Among the four velocity estimation methods, the RD method is most suitable for kinematic velocity estimation applications with complex movements.

Zheng et al. [[6](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B6-sensors-19-03029)] analyzed the BDS-only and GPS-only SPP RD velocity estimation method, whose stability and accuracy could be remarkably improved by the combination of GPS/BDS. Ye et al. [[11](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B11-sensors-19-03029)] analyzed the BDS SPP-based velocity with the RD and DD methods. The static data showed that the RD accuracy was primarily related to the receiver type.

The design matrix of the Doppler-based velocity model is the same as for the pseudorange case. For this reason the constellation geometry influences the velocity accuracy according to the DOP (dilution of precision).

A [study](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#__ffn_sectitle) in 2019 showed that RD velocity estimation can be improved using Precise Point Positioning (PPP).



#### Carrier-phase-derived Doppler (DD)

The DD method utilizes the Doppler measurements derived from carrier phase observations, rather than the Raw Doppler measurement in the RD method, at two consecutive epochs to calculate the velocity.

This is sometimes referred to as a Time-differenced carrier phase (TCDP) algorithm for instantaneous velocity. The carrier phase measurement is used to estimate the Doppler shift and then the valocity is calculated as per the RD approach.

The benefit of this approach is that the reduced noise of the carrier phase measurements yields less noisy Doppler measurements than using the “raw” Doppler directly. In turn, this generates more accurate velocity estimates

 A series of studies have shown that the RD method is more suitable for kinematic applications than the DD method, whereas the DD method is best suited to static or low kinematic applications (e.g., seismic monitoring).



#### Time-differenced carrier phase (TDCP) 

The TDCP method takes advantage of the pseudorange and carrier phase observations at two consecutive epochs to determine the velocity. The TDCP algorithm (precise position change) is based on the time-difference of successive carrier phases to the same satellite at small data rates (≤1 hertz) to obtain delta position information. 

The carrier phase ambiguity issue usually limits the use of carrier phase observables, but the TDCP technique overcomes this problem because, in the absence of cycle slips, the ambiguity is constant and is removed by differencing two consecutive carrier phase measurements.

The TDCP method was first proposed by Graas [[12](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B12-sensors-19-03029)] in 2004. Wendel et al. [[13](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B13-sensors-19-03029)] and Soon et al. [[14](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#B14-sensors-19-03029)] applied this method to GPS/INS integrated navigation, which improved the velocity estimation accuracy in the integrated system. The GPS static experiment proved that the velocity accuracy of this method could reach the order of mm/s.



#### References

1) [Reducing the Effect of Positioning Errors on Kinematic Raw Doppler (RD) Velocity Estimation Using BDS-2 Precise Point Positioning](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#__ffn_sectitle)
2)  [How does a GNSS receiver estimate velocity?](https://insidegnss.com/wp-content/uploads/2018/01/marapr15-SOLUTIONS.pdf) on Inside GNSS.com (Mar 2015)




### Doppler Speed

#### Searches

- [Google search](https://www.google.com/search?ie=UTF-8&client=ms-android-samsung-rev2&source=android-browser&q=gps+%2Bdoppler+speed) - several good articles / links



#### Articles

- [VBOX Automotive - How does it work? - GPS Accuracy](https://www.vboxautomotive.co.uk/index.php/en/how-does-it-work-gps-accuracy)
  - There is a common misconception that speed measured via GPS is done so as a function of position against time
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
    than carrier-phase-derived Doppler because the receiver generated Doppler is measured over a very small time
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

#### PPP

- [Reducing the Effect of Positioning Errors on Kinematic Raw Doppler (RD) Velocity Estimation Using BDS-2 Precise Point Positioning](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6651602/#__ffn_sectitle)
  - Positioning error of the pseudorange-based global navigation satellite system (GNSS) single point positioning (SPP) solution affects the accuracy of the velocity estimation through the station-satellite unit cosine vector.
  - The BDS-2 PPP RD method has better velocity estimation precision than the SPP RD method in various kinematic scenarios by 1–2 cm/s in the three directions. The vehicle-borne experimental result shows that when the observation environment becomes worse, the PPP RD method can significantly improve the velocity estimation performance. Through ship-borne and air-borne experiments, it can be seen that, when the magnitude and direction of the moving object’s velocity suffer from active changes, the PPP RD method can also provide more precise velocity than the SPP RD method.



### Summary

- Acceleration / deceleration pose a challenge
- Static tests provides a good illustration of the difference between speed and distance / time.
- Multiple GNSS improves accuracy - e.g. GPS + Beidou
  - https://support.garmin.com/en-US/?faq=13CvcPK8Um0mekc3F2eVmA&productID=552982&tab=topics

- Positional accuracy impacts speed accuracy - TODO show with real data
- Affected by HDOP (see scatter plot)
- When sationary, speed errors will always be positive. When moving they could be positive or negative.
- Speed errors / noise can be reduced using a Kalman
- Usage of a Kalman filter (SiRF and u-blox) confirms the presence of noise

