## Solution Accuracy

### NMEA

GBS, GST and GRS are all supported by the UBX chipsets.

GST and GRS are supported by most MediaTek chipsets. GBS is supported by some MediaTek chipsets such as the MT3333.

- [**GBS**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gbs_gps_satellite_fault_detection) - GNSS Satellite Fault Detection - includes latitude, longitude, altitude errors (**1-sigma**)
  - This message outputs the results of the "Receiver Autonomous Integrity Monitoring" algorithm (RAIM)
- [**GST**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gst_gps_pseudorange_noise_statistics) - GNSS Pseudorange Noise Statistics (MediaTek) - includes UERE, latitude, longitude, altitude errors (**1-sigma**)
- [**EPE**](http://ozzmaker.com/wp-content/uploads/2016/08/M10478-M10578-NMEA_Sentence_Output.pdf) - Accuracy Estimates (MediaTek MT3333 - Antenova M10478 & M10578) - Horizontal and vertical accuracy estimates - probably **1-sigma**



NMEA 4.10:

- GFA (TBC) - GNSS Fix Accuracy and Integrity - Supports Galileo and other GNSS. Different than the GST sentence



Manufacturer specific:

- [**PGRME**](https://gpsd.gitlab.io/gpsd/NMEA.html#_pgrme_garmin_estimated_error) (Garmin) - Estimated Error Information - includes estimated horizontal position error (HPE) + vertical position error (VPE)
  - [Garmin Proprietary NMEA 0183 Sentences](https://developer.garmin.com/downloads/legacy/uploads/2015/08/190-00684-00.pdf) (2008) - see page 5
- **PSRFEPE** (SiRF) - EHPE, EVPE, EHVE, EHE. According to gpsd, SiRF have never confirmed whether it is 1-sigma.
  - [ERINOME-I User Manual](https://www.we-online.com/components/products/manual/2614011037000_Manual_Erinome-I_2614011037000_rev1.8.pdf) (Qualcomm SirfStar V 5e B01) - see page 73, or search for $PSRFEPE

  - [ELARA-I User Manual](https://www.we-online.com/components/products/manual/2613011037000_Elara-I%202613011037000%20Manual_rev1.8.pdf) (Qualcomm SirfStar V 5e B01) - see page 74, or search for $PSRFEPE
- **PUBX,0** (x-box) - Position - probably **1-sigma**
  - includes hAcc, vAcc but no sAcc or cAcc
- [PGLOR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pglor_quectel) (Broadcom) - **RMS** (comparable to 1-sigma) - 68% of 1-dimension, 63% for 2-dimensions
  - **PGLOR,...,LSQ** - Least squares - HErr, AltErr, HSpdErr, VSpdErr, TrkAngErr (RMS)
  - PGLOR,...,STA - GNSS latitude/longitude status - VelTrkQual - [poor/good] velocity + [poor/good] track
  - PGLOR,...,SPD - Speed status - includes cadance, etc.
- [**PJLTS**](https://gpsd.gitlab.io/gpsd/NMEA.html#_pjlts_jackson_labs_time_and_3d_velocity) - Jackson Labs Time and 3D velocity - TBC
  - [Micro-JLT GNSSTM board](https://www.jackson-labs.com/assets/uploads/main/Micro-JLT_User_Manual_v1.2.pdf) - Jun 2023
  - Includes speed accuracy estimate (cm/s)
  - Survey modes have a **variance** of average position, suggesting **standard deviation** is also used internally
  - See also XYZSPeed (speed accuracy) and PASHR (ROC) and GPS:DYNAMic:MODE (dynamic motion model for the Kalman filter)



