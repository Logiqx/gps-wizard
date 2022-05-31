## GPS Wizard

This [project](https://github.com/Logiqx/gps-wizard) contains a collection of Python modules that have been created to analyze speedsurfing GPS tracks.

The ultimate goal is to provide a generic data science toolkit to facilitate adhoc analysis of speedsurfing track data.

Some related articles are also included covering a variety of topics such as alpha racing and filtering.



### Core Functionality

#### File Readers

The following formats can all be loaded using dedicated file readers:

- FIT - Flexible and Interoperable Data Transfer
  - Support for COROS, Garmin and Suunto - see additional [notes](fit.md)

- GPX - GPS Exchange Format
  - Support for GPX 1.0 and GPX 1.1

- NMEA - National Marine Electronics Association
  - Support for RMC and GGA sentences - both required
- [OAO](formats/oao.md) - "OnAndOn" Binary
  - Support for GNSS frames - 0x0AD4 and 0x0AD5
- [SBN](formats/sbn.md) - Locosys SiRF Binary
  - 95-byte format without SDOP + VSDOP, GT-11
  - 97-byte format with SDOP + VSDOP, GT-31 onwards
- [SBP](formats/sbp.md) - Locosys SiRF Binary (packed)
  - 32-byte format without SDOP + VSDOP, GT-11
  - 32-byte format with SDOP + VSDOP, GT-31 onwards
- [UBX](formats/ubx.md) - u-blox Binary
  - Support for NAV-PVT messages

Note: The vast majority of the file readers are bespoke, instead of using generic NMEA, UBX, libraries. This provides vastly improved load performance, typically an order of magnitude faster.



#### Data Fields

The various data fields supported by the GPS Wizard readers are described on a separate [page](data.md).



#### Future

Further ideas and plans for the future are in the [TODO](todo.md) list.



### Articles

List of existing articles:

- [Alpha racing](alpha-racing/README.md) - optimizing an algorithm to determine alpha racing results
- [Filtering](filtering/README.md) - assessing the quality of GPS data and filtering out bad results



### Utilities

- Spike Finder
- Session Organizer
