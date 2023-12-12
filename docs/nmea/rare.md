## NMEA

### Rare Sentences

Rare sentences include the following:

- **GBS** - GPS Satellite Fault Detection (e.g. $GPGBS or $GNGBS)
  - Includes **time** (UTC) and expected 1-sigma **errors** in latitude, longitude and altitude (meters)
- **GST** - GPS Pseudorange Noise Statistics (e.g. $GPGST or $GNGST)
  - Includes **time** (UTC) and **standard deviations** of latitude / longitude / altitude errors (m)

Both of these can be output by some common MediaTek chipsets.
