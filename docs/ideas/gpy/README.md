## Proposal for GPY v1.1

### Overview

The ESP GPS is gaining popularity and it would be great if the GPY format were to offer more flexible logging.

The following items have proven to be very useful when investigating GPS data quality.

- Altitude (MSL)
- Horizontal error

This proposal for GPY 1.1 introduces the concept of "minimal" type definitions, building upon the existing 0xE0 and 0xD0 frames. The concept also ensures forward and backward compatibility of any future GPY enhancements, without being overly complicated.



### New Record Types

It is perhaps easiest to describe the GPY 1.1 concepts using examples.

  - 0xE1 PVT frame (uncompressed)
    - Payload = 40 bytes, total = 44 bytes
    - Extends 0xE0 by adding altitude MSL (i4) and horizontal error (u4)
  - 0xD1 PVT frame (compressed)
    - Payload = 20 bytes, total = 24 bytes
    - Extends 0xD0 by adding delta altitude MSL (i2) and delta horizontal error (i2)
  - 0xF1 Type Definition frame
    - Payload = 4 bytes, total = 10 bytes
    - This includes the type ID (e.g. 0xE1), base Id (e.g. 0xE0), and payload length (e.g. 0x28)




### Forward and Backward Compatibility

The "minimal" type definition uses the idea of inheritance and extending base types.

- GPY readers can use the data items they recognise, whilst ignoring any unknowns
  - Compliant GPY readers will be able to handle all past, present and future files
- Type definitions utilise inheritance and can be thought of as a "daisy chain"
  - type ID = 0xD0, base Id = 0x00, payload length = 16 bytes (vanilla GPY)
  - type ID = 0xD1, base Id = 0xD0, payload length = 20 bytes (+ heightMsl and hErr)
  - type ID = 0xD2, base Id = 0xD1, payload length = 24 bytes (+ further additions)
- The type definition frames provide the framework for extending base types
  - The first 16 bytes of 0xD1 (and 0xD2) are identical to 0xD0
  - The first 20 bytes of 0xD2 are identical to 0xD1
- Ensuring forward and backward compatibility is relatively straightforward
  - Readers expecting 0xD1 (20 bytes payload) may encounter the "alien" 0xD2
    - Just use the first 20 bytes of the 0xD2 payload, and ignore the remainder
  - Readers expecting 0xD1 (20 bytes payload) may encounter the "vanilla" 0xD0
    - Use the entire 16 bytes of the 0xD0 payload
- Back in 2022 the concept of "custom" records was also discussed for the GPY format
  - The inheritence concept is a lot simpler, but it still meets most of the immediate requirements



### On-and-On (OAO)

It may also be worth adding the remaining OAO fields in GPY 1.1.

- 0xE2 uncompressed "reference" record
  - Payload = 48 bytes, total = 52 bytes
  - Extends 0xE1 by adding verticalErr (u4) and courseErr (u4)
- 0xD2 compressed "delta" record
  - Payload = 24 bytes, total = 28 bytes
  - Extends 0xD1 by adding delta verticalErr (i2) and courseErr (u2)



### Size Comparisons

How the new frame sizes compare to existing the existing GPY, OAO, and UBX.

- The 24 byte 0xD1 record type will be 20% larger than the original 0xD0 records
  - They will be 54% smaller than OAO (52 bytes), and 73% smaller than UBX (90 bytes)
- The 28 byte 0xD2 records will be 17% larger than 0xD1 records, 40 % larger than 0xD0
  - They will be 48% smaller than OAO (52 bytes), and 69% smaller than UBX (90 bytes)
- The 0xD2 record type will be roughly half the size of OAO, but with the same content

Anyone doing GNSS investigations may require the use of 0xE1 + 0xD1 or 0xE2 + 0xD2.



### Frame Definitions

The following tables may help to clarify the concepts within the GPY 1.1 proposal.



#### Header Frame

The header frame (0xF0) contains information about the device and its GNSS configuration.

| Name              |  Type   | Units | Scale | Description                |
| ----------------- | :-----: | :---: | :---: | -------------------------- |
| id                |   u1    |   -   |   -   | Type identifier (xF0)      |
| flags             |   u1    |   -   |   -   | Flags (default 0)          |
| length            |   u2    |   -   |   -   | Length (0x004C)            |
| deviceDescription | u1 * 16 |   -   |   -   | e.g. ESP-GPS               |
| deviceName        | u1 * 16 |   -   |   -   | e.g. K888                  |
| serialNumber      | u1 * 16 |   -   |   -   | e.g. 8B61FC1ADB0           |
| firmwareVersion   | u1 * 16 |   -   |   -   | e.g. V 6.05beta            |
| chipsetName       | u1 * 16 |   -   |   -   | e.g. u-blox M10            |
| chipsetVersion    | u1 * 16 |   -   |   -   | e.g. ROM SPG 5.10          |
| signals           |   u2    |   -   |   -   | GNSS signals               |
| maxSats           |   u1    |   -   |   -   | e.g. 28                    |
| sampleRate        |   u1    |  Hz   |   -   | e.g. 10 Hz                 |
| checksum          |   u2    |   -   |   -   | Checksum (u-blox Fletcher) |

Notes:

- signals TBC... perhaps the systems (e.g. GPS, + Galileo), or maybe the signals (e.g. GPS L1 C/A + Galileo E1)
- maxSats = CFG-NAVSPG-INFIL_MAXSVS
- sampleRate = 1000 / (CFG-RATE-MEAS * CFG-RATE-NAV)

The inclusion of signals, maxSats, and sampleRate is primarily for the ESP GPS, additional to the TXT file.




#### Record Type Definition

The type definition frames (0xF1) provide the information ensuring forward and backward compatibility.

| Name     | Type | Units | Scale | Description                                     |
| -------- | :--: | :---: | :---: | ----------------------------------------------- |
| id       |  u1  |   -   |   -   | Type identifier (xE0)                           |
| flags    |  u1  |   -   |   -   | Flags (default 0)                               |
| length   |  u2  |   -   |   -   | Length (0x00A0)                                 |
| typeId   |  u1  |   -   |   -   | Record type id (e.g. 0xE1)                      |
| baseId   |  u1  |   -   |   -   | Base type id (e.g. 0xE0)                        |
| payload  |  u2  |   -   |   -   | Payload length (excludes type, flags, checksum) |
| checksum |  u2  |   -   |   -   | Checksum (u-blox Fletcher)                      |

Notes:

- Length (0x00A0) is required for existing software to skip these frames, and for possible future extensions.
- Type definitions for 0xE0 and 0xD0 are optional, and should be omitted if the file only contains 0xE0 and 0xD0.



#### GNSS PVT Frame (uncompressed)

The uncompressed / reference frames come in 3 flavours:

- 0xE0 - "vanilla" GPY
- 0xE1 - adds heightMsl and horizontalErr
- 0xE2 - adds the remaining OAO items

The table below shows how they all share a common structure.

| Name     | Type | Units | Scale             | Description                            |  0xE0  |  0xE1  |  0xE2  |
| -------- | :----: | :----: | :----: | -------------------------------------- | :----: | :----: | :----: |
| id       | u1   | -     | -                   | Type identifier (xE0)                  |   ✅    |   ✅    |   ✅    |
| flags    | u1   | -     | -                   | Flags (default 0)                      |   ✅    |   ✅    |   ✅    |
| hdop     | u2   | -     | 1 x 10<sup>-2</sup> | Horizontal Dilution of Precision (HDOP) |   ✅    |   ✅    |   ✅    |
| dateTime | u8   | ms    | -                   | Unix time                              |   ✅    |   ✅    |   ✅    |
| speed    | u4   | m/s   | 1 x 10<sup>-3</sup> | Speed Over Ground (SOG) |   ✅    |   ✅    |   ✅    |
| speedErr | u4   | m/s   | 1 x 10<sup>-3</sup> | Speed error (SDOP / SDOS / sAcc) |   ✅    |   ✅    |   ✅    |
| latitude | i4   | deg   | 1 x 10<sup>-7</sup> | Latitude                               |   ✅    |   ✅    |   ✅    |
| longitude | i4   | deg   | 1 x 10<sup>-7</sup> | Longitude                              |   ✅    |   ✅    |   ✅    |
| course | i4   | deg   | 1 x 10<sup>-5</sup> | Course Over Ground (COG) |   ✅    |   ✅    |   ✅    |
| numSats | u1   | -     | -                   | Number of satellites                   |   ✅    |   ✅    |   ✅    |
| fixType | u1   | -     | -                   | GPS fix (0 = none, 2 = 2D, 3 = 3D fix) |   ✅    |   ✅    |   ✅    |
| heightMsl | i4   | m     | 1 x 10<sup>-3</sup> | Height above Mean Sea Level |   ❌    |   ✅    |   ✅    |
| horizontalErr | u4   | m     | 1 x 10<sup>-3</sup> | Horizontal error                 |   ❌    |   ✅    |   ✅    |
| verticalErr | u4   | m     | 1 x 10<sup>-3</sup> | Vertical error                   |   ❌    |   ❌    |   ✅    |
| courseErr | u4   | deg   | 1 x 10<sup>-5</sup> | Course over ground error               |   ❌    |   ❌    |   ✅    |
| checksum | u2   | -     | -                   | Checksum (u-blox Fletcher)             |   ✅    |   ✅    |   ✅    |
|          |      |       |                     | **Total bytes**          | **36** | **44** | **52** |

Notes:

- Scale of 1 x 10<sup>-3</sup> typically indicates mm or mm/s



#### GNSS PVT Frame (compressed)

The compressed / delta frames come in 3 flavours:

- 0xE0 - "vanilla" GPY
- 0xE1 - adds heightMsl and horizontalErrDelta
- 0xE2 - adds the remaining OAO items

The table below shows how they all share a common structure.

| Name           | Type | Units | Scale             | Description                            | 0xD0 | 0xD1 | 0xD2 |
| -------------- | :----: | :----: | :----: | -------------------------------------- | :--: | :--: | :--: |
| id             | u1   | -     | -                   | Type identifier (xD0)                  |  ✅   |  ✅   |  ✅   |
| flags          | u1   | -     | -                   | Flags (default 0)                      |  ✅   |  ✅   |  ✅   |
| hdop           | u2   | -     | 1 x 10<sup>-2</sup> | Horizontal Dilution of Precision (HDOP) |  ✅   |  ✅   |  ✅   |
| timeDelta      | i2   | ms    | -                   | Delta time                             |  ✅   |  ✅   |  ✅   |
| speedDelta     | i2   | m/s   | 1 x 10<sup>-3</sup> | Speed Over Ground (SOG)    |  ✅   |  ✅   |  ✅   |
| speedErrDelta  | i2   | m/s   | 1 x 10<sup>-3</sup> | Speed error (SDOP / SDOS / sAcc) |  ✅   |  ✅   |  ✅   |
| latitudeDelta  | i2   | deg   | 1 x 10<sup>-7</sup> | Latitude                               |  ✅   |  ✅   |  ✅   |
| longitudeDelta | i2   | deg   | 1 x 10<sup>-7</sup> | Longitude                              |  ✅   |  ✅   |  ✅   |
| courseDelta | i2 | deg | 1 x 10<sup>-2</sup> | Course Over Ground (COG) | ✅ | ✅ | ✅ |
| numSats    | u1   | -     | -                   | Number of satellites                   |  ✅   |  ✅   |  ✅   |
| fixType        | u1   | -     | -                   | GPS fix (0 = none, 2 = 2D, 3 = 3D fix) |  ✅   |  ✅   |  ✅   |
| heightMslDelta | i2   | m     | 1 x 10<sup>-3</sup> | Height above Mean Sea Level |  ❌   |  ✅   |  ✅   |
| horizontalErrDelta | i2   | m     | 1 x 10<sup>-3</sup> | Horizontal error                |  ❌   |  ✅   |  ✅   |
| verticalErrDelta | i2   | m     | 1 x 10<sup>-3</sup> | Vertical error                   |  ❌   |  ❌   |  ✅   |
| courseErr    | u2   | deg   | 1 x 10<sup>-2</sup> | Course Over Ground error (scaled) |  ❌   |  ❌   |  ✅   |
| checksum  | u2   | -     | -                   | Checksum (u-blox Fletcher)             |  ✅   |  ✅   |  ✅   |
|  |  |  |  | **Total bytes** | **20** | **24** | **28** |

Notes:

- Scale of 1 x 10<sup>-3</sup> typically indicates mm or mm/s
- course and courseErr are potentially affected by truncation issues, should delta processing use integer division
- courseErr can simply be rounded and scaled in 0xD1 and 0xD2 (i.e. values of 0 to 360.00) to avoid such issues



### Implementation

A few initial thoughts about the work required:

- Implementing the different types of logging should be relatively straightforward in the ESP GPS
  - Users will need to choose the type of logging, perhaps referred to as level 1 (default) / 2 / 3
  - The appropriate data can then be logged, but it requires some minor changes to existing code
- GPSResults and GPS Speedreader will also require some minor modifications
  - However, they only really need to know the structure of 0xE2 and 0xD2
  - The 0xE1, 0xE0, 0xD1, and 0xD0 frames simply contain a subset of 0xE2 and 0xD2
  - The record type definitions (0xF1) provide the actual sizes of GNSS PVT frames in the GPY
- Websites such as GPS-Speedsurfing, speedsurf.app, and KA-72 will also require modifications
  - Similar updates will be required by any software that currently supports GPY files


Once implemented, further GPY enhancements should be possible without impacting existing applications.



### Summary

This proposal aims to enhance GPY in a way that is pragmatic, and not overly complicated.

  - It addresses the immediate requirement for additional PVT fields in GPY files
  - ESP GPS users can choose the required logging, perhaps referred to as 1 / 2 / 3
  - The default needs to be 1 in the short term, whilst apps and websites are updated

The main concept introduced into GPY is the "minimal" type definition (0xF1).

  - 0xE1 + 0xD1 are derived from 0xE0 + 0xD0, and often useful during track verification
  - 0xE2 + 0xD2 include everything from OAO, and often useful during GNSS investigations
  - Type definitions for 0xE0 and 0xD0 should be omitted when the logging level is 1

Some thoughts about altitude / elevation, which is often useful when diagnosing issues.

  - A geodesist may prefer height above the ellipsoid, instead of height above MSL
  - Our community do not apply different geoids, so height above MSL is most relevant

Various other items are in UBX-NAV-PVT, but they are rarely required for speed sailing.
