## GSA - GNSS Active Satellites

### Summary

This is one of the sentences always supported by GPS / GNSS receivers.

The GSA sentence includes GPS / GNSS receiver operating mode, satellites used for navigation, and DOP values.

In a multi-GNSS receiver the GSA message will be output multiple times, once for each GNSS.

The number of unique SV IDs (or PRNs) should correspond with the number of satellites reported by [GGA](gga.md) (possibly limited to 12) and [GNS](gns.md).

In a multi-band receiver the GSA message will be output multiple times, once for each GNSS / signal.



### Structure

```
NMEA 4.10 onwards:
        1 2 3                        14 15  16  17 18 19
        | | |                         |  |   |   |  |  |
 $--GSA,a,a,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x.x,x.x,x.x,x*hh<CR><LF>

Prior to NMEA 4.10:
        1 2 3                        14 15  16  17  18
        | | |                         |  |   |   |   |
 $--GSA,a,a,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x.x,x.x,x.x*hh<CR><LF>
```

| #       | Field            | Format      | Example | Description                                                  |
| ------- | ---------------- | ----------- | ------- | ------------------------------------------------------------ |
| 0       | Sentence ID      | string      | $GPGSA  | [Talker ID](../lookups/talker-id.md) (GP) + message ID (GSA) |
| 1       | Op mode          | character   | A       | 2D / 3D operation mode; M = manual, A = automatic            |
| 2       | Fix mode         | digit       | 3       | [Fix mode](../lookups/fix-mode.md); 1 = no fix, 2 = 2D, 3 = 3D |
| -       | # Start of block | -           | -       | Start of repeated block (12 times)                           |
| 3 + idx | SV ID            | numeric     | 12      | Satellite ID or PRN number (leading zeros sent)              |
| -       | # End of block   | -           | -       | End of repeated block (12 times)                             |
| 15      | PDOP             | numeric     | 1.83    | Position dilution of precision (PDOP), typically 1 or 2 dp   |
| 16      | HDOP             | numeric     | 1.09    | Horizontal dilution of precision (HDOP), typically 1 or 2 dp |
| 17      | VDOP             | numeric     | 1.47    | Vertical dilution of precision (VDOP), typically 1 or 2 dp   |
| 18      | System ID        | hexadecimal | 1       | GNSS [system ID](../lookups/system-id.md) (NMEA 4.10 and later), or maybe [signal ID](../lookups/signal-id.md) |
| 19      | Checksum         | hexadecimal | \*7B    | Checksum                                                     |

Notes:

- The [talker ID](../lookups/talker-id.md) may be BD, GA, GB, GI, GL, GN, GP, GQ, IM, NC or QZ.
- If less than 12 SVs are used for navigation, the remaining fields are left empty.
- If more than 12 SVs are used for navigation, only the IDs of the first 12 are output.
- The system ID (field 18) was added in NMEA 4.10.
- Multi-band receivers may use field 18 to represent the signal ID, using the talker ID to identify the GNSS constellation.



### Examples

#### NMEA Revealed

```
$GNGSA,A,3,80,71,73,79,69,,,,,,,,1.83,1.09,1.47*17
```

#### Wikipedia

```
$GPGSA,A,3,10,07,05,02,29,04,08,13,,,,,1.72,1.03,1.38*0A
```

#### Locosys GT-31

```
$GPGSA,M,3,15,13,14,05,23,24,17,10,,,,,1.7,0.9,1.4*32
```



### Interpretation

The GSA sentence is being used in a number of different ways in modern GPS / GNSS receivers. When parsing the GSA sentence, code should be able to handle all of the scenarios described below.



#### Broadcom BCM4774

This example for the BCM4774 was captured from a Samsung Galaxy S7.

```
$GPGSA,A,3,10,12,13,14,15,17,19,24,32,,,,1.5,0.8,1.3*34
$GNGSA,A,3,10,12,13,14,15,17,19,24,32,,,,1.5,0.8,1.3*2A
$GNGSA,A,3,66,67,68,77,85,,,,,,,,1.5,0.8,1.3*20
```

Notes:

- Talker ID does not distinguish the different GNSS constellations:
  - $GPGSA reports the GPS satellites in use.
  - $GNGSA reports the GPS and GLONASS satellites in use.

- It is therefore necessary to de-duplicate the PRNs for each GNSS.



#### Samsung Exynos 1280

This example for the Exynos 1280 was captured from a Samsung Galaxy A53.

```
$GPGSA,A,3,02,03,04,08,14,17,19,21,22,32,,,0.6,0.4,0.6*32
$GNGSA,A,3,65,72,79,80,86,87,88,,,,,,0.6,0.4,0.6*29
$GAGSA,A,3,103,105,108,113,115,121,127,,,,,,0.6,0.4,0.6*18
$BDGSA,A,3,205,209,211,214,216,233,,,,,,,0.6,0.4,0.6*29
```

Notes:

- Talker ID distinguishes the different GNSS constellations:
  - $GPGSA reports the GPS satellites in use.
  - $GNGSA reports the GLONASS satellites in use.
  - $GAGSA reports the Galileo satellites in use.
  - $BDGSA reports the BeiDou satellites in use.
- The GSA sentences from the Exynos 1280 are reporting PRNs.



#### Samsung Exynos 1380

This example for the Exynos 1380 was captured from a Samsung Galaxy A54.

```
$GNGSA,A,3,05,13,14,15,20,22,23,24,30,,,,0.8,0.4,0.6,1*3B
$GNGSA,A,3,65,72,75,76,,,,,,,,,0.8,0.4,0.6,2*3D
$GNGSA,A,3,104,109,111,119,121,136,,,,,,,0.8,0.4,0.6,3*3A
$GNGSA,A,3,207,210,223,225,232,237,240,241,,,,,0.8,0.4,0.6,4*3A
```

Notes:

- Talker ID $GNGSA is used for all of the GNSS constellations.
  - Field 18 specifies the [system ID](../lookups/system-id.md).
- The GSA sentences from the Exynos 1380 are reporting PRNs.



#### Qualcomm SDM845

This example for the SDM845 was captured from a Samsung Galaxy S10 Lite.

```
$GNGSA,A,3,65,71,72,79,86,87,88,,,,,,0.7,0.5,0.6,2*39
$GNGSA,A,3,03,05,08,13,15,21,27,34,,,,,0.7,0.5,0.6,3*3E
$GNGSA,A,3,09,11,14,16,27,28,,,,,,,0.7,0.5,0.6,4*34
$GNGSA,A,3,02,03,04,08,14,17,19,21,32,,,,0.7,0.5,0.6,1*31
```

Notes:

- Talker ID $GNGSA is used for all of the GNSS constellations.
  - Field 18 specifies the [system ID](../lookups/system-id.md).
- The GSA sentences for Galileo and BeiDou are reporting satellite IDs, not PRNs.




#### Broadcom BCM4776 

This example for the BCM4776  was captured from a Google Pixel 7.

```
$GPGSA,A,3,04,06,07,09,11,20,30,,,,,,1.8,0.9,1.5*3B
$GPGSA,A,3,04,06,09,11,30,,,,,,,,1.8,0.9,1.5,8*2A
$GAGSA,A,3,103,107,108,113,115,125,126,,,,,,1.8,0.9,1.5,1*02
$GNGSA,A,3,04,06,07,09,11,20,30,,,,,,1.8,0.9,1.5*25
$GNGSA,A,3,71,72,,,,,,,,,,,1.8,0.9,1.5*2B
$BDGSA,A,3,219,221,222,234,236,244,245,246,,,,,1.8,0.9,1.5,5*34
$GAGSA,A,3,103,107,108,113,115,125,126,,,,,,1.8,0.9,1.5*1F
$BDGSA,A,3,211,219,221,222,234,236,244,245,246,,,,1.8,0.9,1.5*1F
```

Notes:

- Talker ID distinguishes the different GNSS constellations:
  - $GPGSA reports the GPS satellites in use.
  - $GAGSA reports the Galileo satellites in use.
  - $GNGSA reports the GLONASS satellites in use.
  - $BDGSA reports the BeiDou satellites in use.
- Field 18 is only present for some rows and specifies the signal ID.
  - The [signal ID](../lookups/signal-id.md) is only included when it is not the default signal.
- To determine the number of satellites being used some de-duplication will be required.
- The BCM4776 also outputs $PSSGR,GSA which is like $GPGSA, but includes system ID and signal ID.



### Summary

Determining the satellites in use for each system:

- When available use the [talker ID](../lookups/talker-id.md) to distinguish between different GNSS.
  - Take account of how $GNGSA is used by the Broadcom BCM4774 - i.e. combined GPS and GLONASS.
    - Therefore need to de-duplicate the SV IDs (or PRNs).
- When available use the [system ID](../lookups/system-id.md) (field 18) to distinguish between different GNSS.
  - Field 18 will probably be the system ID when all GSA sentences are $GNGSA.
  - Need to de-duplicate the SV IDs (or PRNs) on multi-band receivers.
- When available use the [signal ID](../lookups/signal-id.md) (field 18) to distinguish between signals - e.g. Broadcom BCM4776
  - Field 18 will probably be the signal ID when GSA sentences are present for different talker IDs.
  - Sometimes $PSSGR,GSA will also be available which is like GSA but includes system ID and signal ID.
- Vendors may use either SV IDs or PRNs in the GSA output, so code needs to be aware of this subtlety.
