#### Modelling of Accuracy Estimates

#### TBC

- [A Run-Time Method Based on Observable Data for the Quality Assessment of GNSS Positioning Solutions](https://www.researchgate.net/figure/Average-UERE-estimates-of-the-classical-and-run-time-UERE-method_fig9_277341499) - Dovis et al. 2015
- [GNSS Position Accuracy Considering GDOP and UERE for Different Constellation over Bangladesh](https://www.semanticscholar.org/paper/GNSS-Position-Accuracy-Considering-GDOP-and-UERE-Sadman-Hossam-E.-Haider/ab397db6cc751a75020203d7bbbce4b97bccd4b3) - Sadman et al. 2019
  - [GNSS Position Accuracy Considering GDOP and UERE for Different Constellation over Bangladesh](https://ieeexplore.ieee.org/document/9038577)
- [Error analysis for the Global Positioning System](https://en.wikipedia.org/wiki/Error_analysis_for_the_Global_Positioning_System) - Wikipedia
- [GNSS Measurements Modelling](https://gssc.esa.int/navipedia/index.php/GNSS_Measurements_Modelling) - ESA Navipedia
- [Positioning Error](https://gssc.esa.int/navipedia/index.php/Positioning_Error) - ESA Navipedia, shows how to derive hErr = sqrt(nErr ^2  + eErr^2)
- [Raw Residuals Analysis and Measurement Quality](https://rtklibexplorer.wordpress.com/2016/10/14/raw-residuals-analysis-and-measurement-quality/) - rtklibexplorer
- [GNSS Error Sources](https://www.intechopen.com/chapters/60049) - Karaim et al. 2018
  - Oddly it mentions 2-sigma
- Android Smartphones - https://www.sciencedirect.com/science/article/pii/S0263224121001858?via%3Dihub



- Numerous ways this can be calculated but the most obvious is UERE * DOP, giving 1-sigma.
- [Dilution of Precision](http://gauss.gge.unb.ca/papers.pdf/gpsworld.may99.pdf) by Richard Langley in GPS World May 1999 - explains general process
- [GPS Errors & Estimating Your Receiver's Accuracy ](https://pvts.net/pdfs/Estim_GPS_acc1.pdf)
  - Bias errors will typically not be detected by EPE calculations.  [source](http://gpsinformation.net/main/epenew.txt)

- [Estimation of the position error in GPS receivers](https://www.foi.se/rest-api/report/FOI-R--3840--SE) (Feb 2014) shows use of [**GST**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gst_gps_pseudorange_noise_statistics) message on page 16
  - **sqrt(sigmaN^2 + sigmaE^2)**
  - Comes from Kalman filter or LSQ estimator
  - C/N0 also reduces when position fix is degraded
  - Doppler spread deviation seems to increase in a region close to the increased position error. 
  - Pseudo ranges are affected approximately during the time of increased position error.
  - The range residuals are the differences between the measured pseudo ranges and the distances from the satellites to the position solution calculated by the receiver. The deviation from zero increases in the neighborhood of the larger position error. 
  - Figure 13 and 14 are good. Shows actual errors vs predicted errors. Repeated in figure 22.

- [How is the error computed in NMEA-GST](https://portal.u-blox.com/s/question/0D52p0000BCyfxhCQB/how-is-the-error-computed-in-nmeagst) - u-blox forum
- [Calculating VRMS and HRMS from NMEA data?](https://gis.stackexchange.com/questions/217481/calculating-vrms-and-hrms-from-nmea-data) - this person seemed confused but links might be helpful
  - [Positioning Error](https://gssc.esa.int/navipedia//index.php/Positioning_Error) - how to derive hErr
- Garmin
  - [EPE -Estimated Probable Error](http://gpsinformation.net/main/epenew.txt) -  Garmin Engineering
    - "Bias errors cannot be measured and will typically not be detected in the EPE calculation."

  - [GPS Accuracy Estimate (EPE) What is It ?](https://interpine.nz/gps-accuracy-estimate-epe-what-is-it/)
    - most regard Garmin GPS to use an EPE based of 50% circular error probable (CEP).
  - [GNS 530(A) - Pilot’s Guide and Reference](https://static.garmin.com/pumac/GNS530_PilotsGuide.pdf)
    - "EPE uses DOP and other factors to calculate a horizontal position error, in feet or meters."
