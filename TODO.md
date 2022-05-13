## GPS Wizard - TODO

### Core Functionality

#### File Readers

- OAO *
- GPX *
- FIT * - including support for COROS, Garmin, Suunto, Timex, etc.
- NMEA
- UBX

\* = priorities



#### File Writers

- SBP *
- SBN *
- GPX *
- NMEA

\* = priorities



#### Processing

- Filtering - acceleration, satellites, HDOP, SDOP
- GP3S results - 2s, 10s, 100m, 250m, 500m, 1852m, 1/2 hour, 1 hour, alpha, distance + time.



### General Utilities

- COROS simulator
  - Implement improved run detection
- Charts
  - Speed charts - Line for estimated speed + scatter for positional speeds

- Format conversion
  - Most useful being to convert the variety of FIT files to GPX
  - Might allow SBP output where sat, COG and HDOP are present (e.g. COROS FIT)
- Track collation
  - e.g. South West Coast Path walks combined into a single GPX that provides an overall summary
- Locosys Tools
  - SBP splitter - split multiple days / sessions into separate files
  - SBP / SBN username updater



### Investigations

- Locosys checks
  - Compare filtered and non-filtered speeds in SBN files
  - Check for correlations using scatter charts
    - Accuracy information
      - EHPE vs HDOP
      - SDOP vs HDOP
      - SDOP vs EHPE
      - SDOP vs VSDOP
      - EVPE vs VSDOP
    - Unfiltered data
      - SOG vs USOG
      - COG vs UCOG
  - Search for Doppler spikes - e.g. 50 knots+ in historic GT-11 / GT-31 files
- Determine time shifts using RMSE
  - Estimated speed vs positional speed - same GPS device
  - Estimated speeds - different GPS devices
- 5 Hz + 10 Hz acceleration filter
  - Create project that implements proposal on Seabreeze
  - n.b. Stuey's WK track had a 3.7 m/s<sup>2</sup> spike which slips through existing filters




### Articles

- Variations in reported results
  - Across devices
  
  - Doppler vs Positional
  
- Chipset summaries - page per chip

  - Note Sony UDS

