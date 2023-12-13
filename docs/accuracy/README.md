## GNSS Accuracy

### Background

GPS / GNSS chipsets generate accuracy estimates but they are not really intended for users.

Apple, Android, NMEA, Binary



### Derivation

[UERE](uere.md) + [DOP](dop.md)

[GPS.gov](gps.md)

[Estimates](estimates.md)



### Interpretation

[Estimation of the position error in GPS receivers](https://www.foi.se/rest-api/report/FOI-R--3840--SE) (Feb 2014) - show image

Relative values are most value, not absolute values from different hardware.

Bias errors will typically not be detected by EPE calculations.   [source](http://gpsinformation.net/main/epenew.txt)

1-sigma

[Android](android.md) vs Apple

[examples](examples.md)

Equivalences

- Diggelen, F. v., 2007. GNSS Accuracy: Lies, Damn Lies, and Statistics. GPS World. 18(1), pp. 26-32.



### Horizontal Accuracy

Elipse

lat / lon - squaring



### Example Filters

- [5-sigma](https://www.gigacalculator.com/img/calculators/six-sigma-process.png) for EHPE
  - Various watches: stdev * 5 = (4.75 / 2) * 5 = 11.875, roughly 12
  - Apple Watch 5: stdev * 5 = (4 / 2) * 5 = 10



### Origins of Error Estimates

- [Chipsets](chipsets/README.md)

- [NMEA](nmea/README.md)

- [Binary](binary/README.md)

