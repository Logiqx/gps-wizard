## NMEA - System Identifier

### Overview

The GNSS system identifier (aka "system ID") was added to several messages in NMEA 4.10.

One might argue that system ID is slightly redundant, due to the presence of a [talker ID](talker-id.md) for all sentences.



### Messages

System ID was added to the following messages in NMEA 4.10:

| Message ID                                                   | Description                    |
| ------------------------------------------------------------ | ------------------------------ |
| GBS | GNSS Satellite Fault Detection |
| GRS | GNSS Residuals |
| [GSA](../messages/gsa.md)                                    | GNSS Active Satellites |

Notes:

- GSV does not include system ID, but the [talker ID](talker-id.md) serves the same purpose.



### Values

GNSS system IDs reported in NMEA 4.10 (and newer):

| System ID | GNSS                  | Owner                      | Coverage                |
| --------- | --------------------- | -------------------------- | ----------------------- |
| 1         | GPS                   | U.S. Government            | Global                  |
| 2         | GLONASS               | Russian Federation         | Global                  |
| 3         | Galileo               | European Union             | Global                  |
| 4         | BeiDou                | People's Republic of China | Global                  |
| 5         | QZSS                  | Government of Japan        | Regional - Asia-Pacific |
| 6         | NavIC, formerly IRNSS | Government of India        | Regional - India        |

Note:

- Trimble have been using a system ID of 0 for QZSS - see [GBS](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_gbs.html), [GRS](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_grs.html), and [GSA](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_gsa.html)
