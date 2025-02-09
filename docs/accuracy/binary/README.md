## Solution Accuracy

### Binary

- Broadcom Bream proprietary protocol
  - BRM-PVT-PVT in includes HAcc, Vacc, SAcc, HeadAcc
  - Documented in Quectel_LC29D_GNSS_Protocol_Specification_V1.0.pdf
- iTalk binary protocol used by FasTrax - undetermined
  - Accuracy in gpsd
  - [u-blox acquisition](https://insidegnss.com/u-blox-acquires-fastrax/)
  - Fastrax makes modules based on chips from CSR, MediaTek, STMicroelectronics, and - Rockwell Zodiac [Designer’s Guide](https://www.gpskit.nl/documents/rockwell/zodiac.pdf) (1996) - **1-sigma**
  - EHPE, EHVE, ETE, EVPE
  - "The standard deviation is representative of the error typically expected in a measured value of that quantity."
  - gpsd comment says "manual says these are 1-sigma."
- SiRF - likely to be **1-sigma**
  - Checked EHPE in existing files - GT-31 comparable to Motion
  - No reference to standard deviation, 1-sigma, etc.
- [Swift Navigation Binary Protocol](https://www.swiftnav.com/resource-files/Swift%20Navigation%20Binary%20Protocol/v2.4.0/Specification/Swift%20Navigation%20Binary%20Protocol%20Specification%20v2.4.0.pdf) - SBP - Chapter 6.5 (Navigation) - **1-sigma**
  - It is the native binary protocol used by the Piksi GPS receiver to transmit solutions, observations, status, and debugging messages
    - [Product page](https://support.swiftnav.com/support/solutions/articles/44001850753-piksi-multi-specification)
    - [Piksi Multi GNSS Module](https://www.swiftnav.com/resource-files/Piksi%20Multi/v2.2/Specification/Piksi%20Multi%20HW%20Specification%20v2.2%20%5B000-534-02-02%5D.pdf) hardware specification v2.2 (2019)
  - MSG_POS_ECEF - accuracy (position estimated standard deviation)
  - MSG_POS_ECEF_COV - Estimated variance / covariance (i.e. standard deviation ^ 2)
  - MSG_POS_LLH - h_accuracy + v_accuracy (position estimated standard deviation)
  - MSG_POS_LLH_COV - Estimated variance / covariance (i.e. standard deviation ^ 2)
  - MSG_BASELINE_ECEF - accuracy (position estimated standard deviation)
  - MSG_VEL_ECEF - accuracy (velocity estimated standard deviation) - note flags for Doppler derived
  - MSG_VEL_NED - h_accuracy, v_accuracy (velocity estimated standard deviation)
- Trimble - n/a
  - https://xdevs.com/doc/Trimble/sveight/sv8_app_a.pdf
  - No sign of accuracy information
- UBX - almost certainly **1-sigma**
  - "odometer estimates a 1-sigma accuracy value" (distanceStd)
  - Geofence state evaluation uses the "position solution uncertainty (standard deviation)"
  - Survey-in refers to "required 3D position standard deviation"
    - UBX-NAV-SOL pAcc?
  - Horizontal accuracy estimate >= 0.7 m and <= 1 km.
  - wtAccuracy is the standard deviation under normal operating conditions.
  - GBS - "The fields errLat, errLon and errAlt output the standard deviation of the position calculation"
  - UBX-CFG-GEOFENCE confLvl refers to "position's standard deviation (sigma)"
  - UBX-RXM-RAWX refers to "estimated ... measurement standard deviation"
  - UBX-TIM-SMEAS phaseUnc and freqUnc are "one standard deviation"
  - UBX-CFG-DOSC gainUncertainty says "Relative uncertainty (1 standard deviation)"
  - UBX-AID-INI posAcc is "Position accuracy (stddev)"
  - UBX-CFG-NAV5 pAcc is Position accuracy mask (m)
  - "Dynamic platforms designed for high acceleration systems (e.g. airborne <2g) can result in a higher standard deviation in the reported position."
  Intel

