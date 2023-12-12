## NMEA

### Proprietary Sentences

#### SiRF NMEA

Message ID 129 is used to switch the serial port from binary to NMEA protocol and specify the message output rates.

Specifying the EPE message rate via message ID 129 will enable output of the proprietary $PSRFEPE message.

The $PSRFEPE message provides accuracy estimates for use in the SiRFNavIII software:

| Field | Description                         | Units   |
| ----- | ----------------------------------- | ------- |
| HDOP  | Horizontal Dilution of Precision    | -       |
| EHPE  | Estimated Horizontal Position Error | m       |
| EVPE  | Estimated Vertical Position Error   | m       |
| EHVE  | Estimated Velocity Error            | m/s     |
| EHE   | Estimated Heading Error             | degrees |

The proprietary $PSRFEPE sentence is fully documented by [Erinome-I](chipsets/sirf/pdf/Erinome-I_User_Manual_rev1.7.pdf) (SiRFstar V) and was subtly documented, almost hidden away in the [SiRF Binary Protocol](chipsets/sirf/pdf/SiRF_Binary_Protocol_2.4_2008_11.pdf) 2.4 of Nov 2008 and onwards. Support for the PSRFEPE sentence was also added to the [gpsd](https://github.com/ukyg9e5r6k7gubiekd6/gpsd) library in [March 2019](https://github.com/ukyg9e5r6k7gubiekd6/gpsd/blob/master/driver_nmea0183.c).

$PSRFEPE has been documented clearly for SiRFNavIII, since at least Nov 2008 and has also been documented as for the  [SiRFstar IV](https://mikrokontroler.pl/wp-content/uploads/pliki/L50_GPS_Protocol_V1%200_Preliminary_20110727.pdf).



#### SiRF Binary Protocol

EHPE, EVPE and EHVE have also been well documented since an early SiRF binary protocol document, produced by NAVMAN in [2004](chipsets/sirf/pdf/SiRF_Binary_Protocol_1.x_2004_02.pdf).

The SiRF binary protocol document from 2009 describes them for message ID 41 (geodetic navigation data) as follows:

| Name                                | Bytes | Description                                      |
| ----------------------------------- | ----- | ------------------------------------------------ |
| Estimated Horizontal Position Error | 4 U   | EHPE in meters x 10<sup>2</sup>                  |
| Estimated Vertical Position Error   | 4 U   | EVPE in meters x 10<sup>2</sup>                  |
| Estimated Time Error                | 4 U   | ETE in seconds x 10<sup>2</sup> (SiRFDRive only) |
| Estimated Horizontal Velocity Error | 2 U   | EHVE in m/s x 10<sup>2</sup> (SiRFDRive only)    |

It is worth mentioning that EHPE, EVPE, ETE and EHVE are also described in the SiRF demo [user guide](chipsets/sirf/pdf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) from June 2007.

Note: The SiRF binary protocol outputs ETE (but not EHE) whereas the Erinome-I [documentation]((chipsets/sirf/pdf/Erinome-I_User_Manual_rev1.7.pdf)) describing $PSRFEPE includes EHE. The one socket protocol interface control [document](chipsets/sirf/pdf/One_Socket_Protocol_Interface_Control_Document_2009.pdf) from 2009 mentions EHE in the "DR NAV Status Output Message" but EHE is not included in the output of message ID 41.


