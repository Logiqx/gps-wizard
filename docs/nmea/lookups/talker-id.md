## NMEA - Talker Identifier

### Overview

NMEA sentences include a talker identifier (aka "talker ID") which is a two-character prefix identifying the GNSS.



### Values

Official GNSS talker IDs according to NMEA 4.11:

| Talker ID | GNSS | Owner | Coverage |
| ---- | ---- | ---- | ---- |
| GA| Galileo | European Union | Global |
| GB| BeiDou System (BDS) | People's Republic of China | Global |
| GI| NavIC (formerly IRNSS) | Government of India | Regional - India |
| GL | GLONASS | Russian Federation | Global |
| GN | Global Navigation Satellite System (GNSS) | - | Global |
| GP | Global Positioning System (GPS) | U.S. Government | Global |
| GQ | QZSS | Government of Japan | Regional - Asia-Oceania |

Unofficial GNSS talker IDs, generated by receivers from various manufacturers:

| Talker ID | GNSS | Owner | Coverage |
| ---- | ---- | ---- | ---- |
| BD | BeiDou System (BDS) | People's Republic of China | Global |
| GN \* | GLONASS | Russian Federation | Global |
| IM | IMES | Government of Japan | Regional - Asia-Oceania |
| NC | NavIC (formerly IRNSS) | Government of India | Regional - India |
| QZ | QZSS | Government of Japan | Regional - Asia-Oceania |

Notes:

- It is fairly common for vendors / chipsets to use [$GNGSA](../messages/gsa.md) for reporting GLONASS satellites that are active.
