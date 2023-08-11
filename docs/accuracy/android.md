### Android

- [android.location](https://developer.android.com/reference/android/location/package-summary) classes used to produce CSV from the GPSTest app on Galaxy A51:
  - hAcc was available in Android 1.0
    - vAcc, sAcc, cAcc were added in Android 8.0 (Aug 2017)
  - NMEA - [NMEA Listener](https://developer.android.com/reference/android/location/OnNmeaMessageListener)
    - Galaxy S7 - Broadcom BCM4774
      - GSA, GSV, GGA, RMC. Does not include GLL or VTG. Nor does it include GST or GBS
      - **PGLOR** - RID (once... version information), STA (GLL status) and PFM (infrequent... platform status)
    - Galaxy A53 - Samsung Exynos 1280
      - GSA, GSV, GGA, GLL, RMC, VTG. Does not include GBS or GST
      - EVT (infrequent... date, time and one integer)
      - PSAMCLK (maybe clock info), PSAMID (infrequent... version), PSAMSA (time + lat + lon)
      - Thoughts
        - Maybe Android is only sending certain NMEA messages to the listener? Perhaps it filters out PGLOR?
        - Maybe the raw + accuracy data is internal to the Exynos 1280, thus being absent from NMEA?
    - If available, can easily use [GST](https://gpsd.gitlab.io/gpsd/NMEA.html#_gst_gps_pseudorange_noise_statistics) or [GBS](https://gpsd.gitlab.io/gpsd/NMEA.html#_gbs_gps_satellite_fault_detection) to determine hAcc and vAcc
    - Approximation may be possible using DOP from [GSA](https://gpsd.gitlab.io/gpsd/NMEA.html#_gsa_gps_dop_and_active_satellites) and C/N<sub>0</sub> (SNR) from [GSV](https://gpsd.gitlab.io/gpsd/NMEA.html#_gsv_satellites_in_view) - perhaps this is what the Galaxy S7 is doing?
  - Measuremenets (Raw) - [GnssMeasurement](https://developer.android.com/reference/android/location/GnssMeasurement) - **1 sigma**
    - Lots of stuff including PseudorangeRateMetersPerSecond and PseudorangeRateUncertaintyMetersPerSecond
  - GnssStatus - [GnssStatus](https://developer.android.com/reference/android/location/GnssStatus)
    - TBC
  - Orientation
    - n.b. This is not part of the location API
  - Location (Fix) - [Location](https://developer.android.com/reference/android/location/Location) - **68th percentile** confidence level
    - Fix,Provider,Latitude,Longitude,Altitude,Speed,**Accuracy**,(UTC)TimeInMs
    - Sadly it does not record bearing, vertical accuracy, speed accuracy, bearing accuracy - contact author?
  - Messages (Nav) - [GnssNavigationMessage](https://developer.android.com/reference/android/location/GnssNavigationMessage)
    - Nav,Svid,Type,Status,MessageId,Sub-messageId,Data(Bytes)
    - Note: It's possible to get these online after the event
  
- Articles
  - Use of Kalman filter on [maddevs](https://maddevs.io/blog/reduce-gps-data-error-on-android-with-kalman-filter-and-accelerometer/)
  - [Measuring GNSS accuracy on Android devices](https://barbeau.medium.com/measuring-gnss-accuracy-on-android-devices-6824492a1389) by  Sean Barbeau Jul 2019
  - [Decoding GNSS navigation messages on Android](https://barbeau.medium.com/decoding-android-gnss-navigation-messages-93bc62e2eb00) by Sean Barbeau Jul 2021
  - [GNSS, Interrupted: The hidden Android setting you need to know](https://barbeau.medium.com/gnss-interrupted-the-hidden-android-setting-you-need-to-know-d812d28a3821) by Sean Barbeau Jan 2021
  - [Positional Accuracy of Assisted GPS Data from High-Sensitivity GPS-enabled Mobile Phones](https://www.researchgate.net/publication/231849997_Positional_Accuracy_of_Assisted_GPS_Data_from_High-Sensitivity_GPS-enabled_Mobile_Phones) by Zandbergen and Barbeau 2011



#### Dual Frequency

- [Dual-frequency GNSS on Android devices](https://barbeau.medium.com/dual-frequency-gnss-on-android-devices-152b8826e1c) - blog post discusses the Broadcom BCM47755
- [Android devices that support raw GNSS measurements](https://developer.android.com/guide/topics/sensors/gnss#supported-devices) on Android developer site
