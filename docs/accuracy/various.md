## Various

### FocalPoint

- [Are GPS running watches accurate? Why your watch, phone & apps often get it wrong](https://www.youtube.com/watch?v=K0kVrB_4omo) with Dr Ramsey Faragher

- [Enabling the Next Generation of GPS Technology with Supercorrelation](https://www.youtube.com/watch?v=WDATFeVTUHs) with Dr Ramsey Faragher

- [Why you can’t trust Strava to help you run your backyard COVID marathon](https://focalpointpositioning.com/insights/why-you-cant-trust-strava-to-help-you-run-your-backyard-covid-marathon)

  

### Kalman Filters

[GNSS Filtering Options - Inside GNSS - Global Navigation Satellite Systems Engineering, Policy, and Design](https://insidegnss.com/wp-content/uploads/2018/01/marapr13-Solutions.pdf)


- Models
  - UBX
  - Jackson Micro JLT
  - Sony




#### Speed

- [How does a GNSS receiver estimate velocity?](https://insidegnss.com/wp-content/uploads/2018/01/marapr15-SOLUTIONS.pdf) - Inside GNSS
  
- [Time-Differenced Carrier Phase Technique for Precise Velocity Estimation on an Android Smartphone](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9655395/) (Xiaomi Mi8) - Angrisano 2022
  - "The most adopted technique for velocity estimation exploits the Doppler shift"
  - "GNSS receivers usually estimate velocity by processing the Doppler measurement"
- [Android GNSS Measurements - Inside the BCM47755](https://www.researchgate.net/publication/329581011_Android_GNSS_Measurements_-_Inside_the_BCM47755) - Shade et al. 2018 - PPT available
  - Confirms the use of the [Costas loop](https://en.wikipedia.org/wiki/Costas_loop) in GPS / GNSS receivers
  - [GnssMeasurement::getPseudorangeRateMetersPerSecond()](https://developer.android.com/reference/android/location/GnssMeasurement#getPseudorangeRateMetersPerSecond())
  - [GnssMeasurement::getPseudorangeRateUncertaintyMetersPerSecond()](https://developer.android.com/reference/android/location/GnssMeasurement#getPseudorangeRateUncertaintyMetersPerSecond()) - 1-sigma



