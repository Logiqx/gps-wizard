## Proposal for GPX

### Estimated Accuracy / Errors

#### Background

GPS / GNSS chipsets can often generate accuracy estimates as part of their PVT (position / velocity / time) solutions.

These accuracy estimates are easily accessible nowadays, especially via the location APIs of Android and Apple devices since around 2016 / 2017. These estimates can provide great value but there is currently no standard / agreed way to store them in a GPX 1.1 file without using extensions.

There is a great opportunity for the GPX schema to include accuracy estimates, facilitating a "standard" method for their storage and exchange.



#### PVT Solution

The GPS / GNSS chipset will typically use either [least squares](https://en.wikipedia.org/wiki/Least_squares) (LSQ) or a [Kalman filter](https://en.wikipedia.org/wiki/Kalman_filter) to determine the PVT solution.

The PVT solution will always involve a level of uncertainty, primarily because the raw [observables](https://gssc.esa.int/navipedia/index.php/GNSS_Basic_Observables) cannot provide an exact solution.

This can be illustrated visually with a diagram which shows the [UERE](https://www.e-education.psu.edu/geog862/node/1713) (user equivalent range error) for a receiver:

![img](uere.png)



A simple way to think of the positional error estimate is as the UERE multiplied by the [dilution of precision](https://en.wikipedia.org/wiki/Dilution_of_precision_(navigation)) (DOP). In practice the positional accuracy estimates will usually be determined using the covariance matrix of the LSQ or Kalman [filter](https://insidegnss.com/wp-content/uploads/2018/01/marapr13-Solutions.pdf).

Note: The image above is helpful when discussing horizontal and vertical positional accuracy. Speed accuracy can also be derived using a similar principle, but is dependent on the UERRE (user equivalent range rate error) and the method used to determine velocity. This will typically be dependent on the stability of the doppler observable that is used when determining the velocity of the receiver.



#### Interpretation

The accuracy estimates will typically be derived from the covariance matrix of the LSQ / Kalman filter but they do have their limitations:

- Firstly, they can be unaware of systemic biases which may not be easily identified
  - Such biases may not be apparent within the residuals of the LSQ / Kalman filter
- The accuracy estimates are typically produced using the covariance matrix of the LSQ / Kalman filter
  - They therefore represent the amount of confidence in the final solution, usually as 1-sigma (i.e. 68% confidence)
- The accuracy estimates must NOT be used to infer the precise accuracy of the PVT solution
  - They will however indicate when something abnormal has occurred and are thus extremely useful to software filters
- The accuracy estimates must NOT be used to compare the accuracy of different receivers
  - They are however useful within the context of single / multiple sessions from a single receiver



#### Effectiveness

This [study](https://www.foi.se/rest-api/report/FOI-R--3840--SE) was conducted using two u-blox 6 receivers and the content of the [GST](https://gpsd.gitlab.io/gpsd/NMEA.html#_gst_gps_pseudorange_noise_statistics) (GNSS Pseudorange Noise Statistics) message to determine the horizontal accuracy estimate (hAcc) as 1-sigma.

Blue shows the actual horizontal position error, and green shows the estimated horizontal error. These graphs have been included to illustrate the usefulness of estimated accuracy / errors, without going into a lengthy study or analysis.

The most important thing that accuracy estimates do is to highlight any abnormalities and when the quality of the PVT solution is compromised.

![img](hacc.png)



### Availability of Estimates

The availability of accuracy estimates can be categorised in the following ways:

- GPS / GNSS chipsets
- NMEA sentences
- Binary outputs
- Location services provided by operating systems - e.g. Android, iOS, iWatch, etc.



#### GPS / GNSS Chipsets

Accuracy estimates are typically available from NMEA sentences and / or binary messages being output by the GPS / GNSS chip:

The following is a list of popular chipset manufacturers who are known to produce accuracy estimates:

- Broadcom (e.g. Android smart phones and Apple watches)
- MediaTek (e.g. popular sports watches)
- Qualcomm (e.g. Snapdragon SoCs used in Android and Apple smart phones)
- Rockwell
- Samsung (e.g. Exynos SoCs used in smart phones and watches)
- Swift
- SiRF (e.g. sports watches and trackers)
- u-blox (e.g. proprietary tracking devices)



#### NMEA Sentences

Standard NMEA sentences provide horizontal and vertical (position) accuracy estimates:

- [**GBS**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gbs_gps_satellite_fault_detection) - GNSS Satellite Fault Detection
  - Includes latitude, longitude, altitude errors (1-sigma)
  - This message outputs the results of the "Receiver Autonomous Integrity Monitoring" algorithm (RAIM)
- [**GST**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gst_gps_pseudorange_noise_statistics) - GNSS Pseudorange Noise Statistics
  - Includes UERE, latitude, longitude, altitude errors (1-sigma)

Note: latitude / longitude accuracy can be converted to horizontal accuracy using hAcc = √ (latAcc<sup>2</sup> + lonAcc<sup>2</sup>)

Proprietary NMEA sentences including horizontal and vertical (position) accuracy estimates:

- [**EPE**](http://ozzmaker.com/wp-content/uploads/2016/08/M10478-M10578-NMEA_Sentence_Output.pdf) (MediaTek) - Estimated Position Errors
  - Horizontal and vertical accuracy estimates (probably 1-sigma)
- [**PGRME**](https://gpsd.gitlab.io/gpsd/NMEA.html#_pgrme_garmin_estimated_error) (Garmin) - Estimated Error Information
  - Includes estimated horizontal position error (HPE) + vertical position error (VPE)
- **PUBX,0** (x-box) - Position
  - Includes Horizontal and vertical accuracy estimates (1-sigma)

Proprietary NMEA sentences also including speed accuracy estimates:

- **PSRFEPE** (SiRF) - Estimated Position Errors
  - Includes EHPE, EVPE, EHVE, EHE
- [PGLOR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pglor_quectel) (Broadcom) - LSQ (least squares)
  - PGLOR originates from the Broadcom GNSS chips within Quectel GNSS modules
  - Includes HErr, AltErr, HSpdErr, VSpdErr, and TrkAngErr (stated as RMS in the Quectel documentation, rather than 1-sigma)
  - RMS stated in the Quectel documentation but is comparable to 1-sigma; 68% of 1-dimension, 63% for 2-dimensions
- [**PJLTS**](https://gpsd.gitlab.io/gpsd/NMEA.html#_pjlts_jackson_labs_time_and_3d_velocity) (Jackson Labs) - Time and speed
  - Includes speed accuracy estimate (1-sigma)




#### Binary Outputs

Various manufacturers are also known to provide position and speed accuracy estimates in their binary outputs:

- Rockwell - EHPE, EVPE, EHVE (1-sigma)
- Swift Navigation - hAcc, vAcc, sAcc, rAcc, cAcc (1-sigma)
- SiRF - EHPE, EVPE, EHVE
  - Locosys also provide SDOS (standard deviation of speed) and VSDOS (vertical equivalent) from SiRF chipsets (1-sigma)
- u-blox - hAcc, vAcc, sAcc, cAcc (1-sigma)

It is also likely that SoCs from the likes of Qualcomm and Samsung provide accuracy estimates via binary protocols.



#### Location Services

Since around 2016 or 2017, accuracy estimates (including speed accuracy) have been readily available on Android and Apple devices via their [location services](../../apis/location.md). The table below shows when the various accuracy estimates were added to the Android and Apple operating systems.

A quick summary:

- Horizontal accuracy estimates have been available from Apple and Android since 2008
- Speed accuracy estimates have been available from Apple and Android since around 2016 or 2017
- Course accuracy estimates have been available from Apple since 2020

|         | hAcc                        | vAcc                        | sAcc                        | cAcc                        |
| ------- | --------------------------- | --------------------------- | --------------------------- | --------------------------- |
| Android | Android 1.0<br />(Sep 2008) | Android 8.0<br />(Aug 2017) | Android 8.0<br />(Aug 2017) | Android 8.0<br />(Aug 2017) |
| iOS     | iOS 2.0<br />(Jul 2008)     | iOS 2.0<br />(Jul 2008)     | iOS 10.0<br />(Sep 2016)    | iOS 13.4<br />(Mar 2020)    |
| watchOS | watchOS 2.0<br />(Sep 2015) | watchOS 2.0<br />(Sep 2015) | watchOS 3.0<br />(Sep 2016) | watchOS 6.2<br />(Mar 2020) |



### Summary

This document provides some basic information about the 1-sigma accuracy estimates provided by GPS / GNSS chipsets:

- Horizontal / vertical position accuracy (m)
- Horizontal / vertical speed accuracy (m/s)
- Course accuracy (degrees)

These accuracy estimates are typically available via NMEA sentences and / or binary protocols. Around 2016 or 2017, speed accuracy estimates were added to the location services of Apple and Android devices, which probably account for the majority of GPS / GNSS receivers in use today.

The vast majority of the available documentation refers to accuracy estimates being 1-sigma. A 68% confidence level is mentioned in the Android documentation but is absent in the Apple documentation.

I suspect that Apple are multiplying the 1-sigma value provided by the GNSS chipset (e.g. Broadcom, Qualcomm or Intel) by a constant value to produce an estimate that is more intuitive to end users; e.g. 2-sigma (95% confidence) or 4-sigma (99.99% confidence).

There is a separate page about the accuracy estimates available from the Android and Apple [location services](../../apis/location.md).



### Proposal

There is an opportunity to add accuracy estimates to the GPX standard so that people can make use of them when exchanging GPS / GNSS data. The phrasing used in the GPX schema documentation is obviously a topic for discussion.

I feel that accuracy estimates should probably be stored without any adjustments, typically 1-sigma. Device manufacturers may adjust the 1-sigma values (e.g. Apple), but I think the estimates are best stored in the GPX file without modification.

