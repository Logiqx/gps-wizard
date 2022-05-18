## GPS Wizard

This project contains a collection of Python modules that have been created to analyze speedsurfing GPS tracks.

Some related [articles](https://logiqx.github.io/gps-wizard/) on a variety of topics such as alpha racing an filtering can be found on GitHub pages.



### Core Functionality

#### File Readers

- GPX
- OAO - "OnAndOn" Binary
  - Motion Mini + Motion LCD
  - ESP-GPS
- SBN - Locosys SiRF Binary
  - 95-byte format without SDOP + VSDOP, GT-11
  - 97-byte format with SDOP + VSDOP, GT-31 onwards
- SBP - Locosys SiRF Binary (packed)
  - 32-byte format without SDOP + VSDOP, GT-11
  - 32-byte format with SDOP + VSDOP, GT-31 onwards
- UBX - u-blox Binary
  - ESP-GPS
  - Support for NAV-PVT messages - "Navigation position velocity time solution"



### Examples

- Alpha Racing 500m
- Haversine vs Pythagoras



### Utilities

- Spike Finder
- Session Organizer
