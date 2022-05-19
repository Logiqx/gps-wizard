## GPS Wizard

This [project](https://github.com/Logiqx/gps-wizard) contains a collection of Python modules that have been created to analyze speedsurfing GPS tracks.

Some related articles are also included covering a variety of topics such as alpha racing and filtering.



### Core Functionality

#### File Readers

The following formats can all be loaded using dedicated file readers:

- GPX - GPS Exchange Format
- NMEA - National Marine Electronics Association
  - Support for RMC and GGA sentences
- OAO - "OnAndOn" Binary
  - Motion Mini + Motion LCD
  - ESP-GPS
  - Support for GNSS frames - 0x0AD4 and 0x0AD5
- SBN - Locosys SiRF Binary
  - 95-byte format without SDOP + VSDOP, GT-11
  - 97-byte format with SDOP + VSDOP, GT-31 onwards
- SBP - Locosys SiRF Binary (packed)
  - 32-byte format without SDOP + VSDOP, GT-11
  - 32-byte format with SDOP + VSDOP, GT-31 onwards
- UBX - u-blox Binary
  - ESP-GPS
  - Support for NAV-PVT messages

Note: The majority of the file readers are bespoke, instead of using freely available generic libraries. This provides vastly improved load performance.



Further ideas and plans for the future are in the [TODO](TODO.md) list.



### Articles

List of existing articles:

- [Alpha racing](alpha-racing/README.md) - optimizing an algorithm to determine alpha racing results
- [Filtering](filtering/README.md) - assessing the quality of GPS data and filtering out bad results



### Utilities

- Spike Finder
- Session Organizer
