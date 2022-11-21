## TODO

### Core Functionality

#### File Readers

Thoughts relating to the FIT reader:

- Add support for Timex Ironman tracks where speed and position are split into separate data records.
- Consider re-writing the reader to avoid the fitdecode library?
  - This could be a lot faster but will require a significant amount of development effort.

Thoughts relating to the GPX reader:

- Add support for track segments




#### File Writers

Thoughts relating to the GPX writer:

- Add support for GPX 1.1 and the Garmin TrackPointExtension V2

Consider adding the following writers:

- Consider adding an SBP writer



#### Processing

- Filtering - acceleration, satellites, HDOP, SDOP
- GP3S results - 2s, 10s, 100m, 250m, 500m, 1852m, 1/2 hour, 1 hour, alpha, distance + time



### General Utilities

- COROS simulator
  - Implement improved run detection
- Charts
  - Speed charts - Line for estimated speed + scatter for positional speeds
  - Application of central limit theorem and "sampling distribution of the sample the mean" 
- Format conversion
  - Most useful being to convert the variety of FIT files to GPX
  - Should allow SBP output where sat, COG and HDOP are present (e.g. COROS FIT)
- Smart reduction
  - Reduce tracks to minimal number of points for KML export.
  - Needs to be smart enough to avoid corners being cut, etc.

- Track collation
  - e.g. South West Coast Path walks combined into a single KML and / or GPX that provides an overall summary
- Locosys Tools
  - SBP splitter - split multiple days / sessions into separate files
  - SBP / SBN username updater



### Investigations

- Locosys checks
  - Compare filtered and non-filtered speeds in SBN files
  - Check for correlations using scatter charts
    - Accuracy information
      - Sats vs HDOP
      - EHPE vs HDOP
      - SDOP vs HDOP
      - SDOP vs EHPE
      - SDOP vs VSDOP
      - EVPE vs VSDOP
      - Explore fixType from u-blox - e.g. dead reckoning during crashes
    - Unfiltered data
      - SOG vs USOG
      - COG vs UCOG
    - Coloured scatter plots
      - HDOP vs position / speed / speed error
    - Horizontal vs vertical
      - Speed vs climb rate
      - SDOP vs VSDOP - expect vsdop to be worse
      - ehpe vs evpe (SiRF) - expect evpe to be worse
  - Search for Doppler spikes - e.g. 50 knots+ in historic GT-11 / GT-31 files
- u-blox checks
  - Equivalent of SiRF checks, where possible / applicable
  - hacc vs vacc - expect vacc to be worse
  - cacc
  - "tunnel mode" - clever detection?

- Sony
  - repeated speeds prior to crash then zero

- Check if Estimated Horizontal Position Error (SiRF) or Horizontal accuracy estimate (u-blox) are useful to identify spikes
  - https://logiqx.github.io/gps-wizard/formats/sbn.html
  -  https://logiqx.github.io/gps-wizard/formats/ubx.html
- Check fix type during crash - e.g. use of dead reckoning on u-blox
- Determine time shifts using RMSE
  - Estimated speed vs positional speed - same GPS device
  - Estimated speeds - different GPS devices
- 5 Hz + 10 Hz acceleration filter
  - Create project that implements proposal on Seabreeze
  - n.b. Stuey's WK track had a 3.7 m/s<sup>2</sup> spike which slips through existing filters



### Articles

- Move doppler-speed-resolution from gps-guides to gps-wizard
- Filtering
  - Acceleration
  - Crash detection
- Variations in reported results
  - Across devices
  - Doppler vs Positional
- Chipset summaries - page per chip
  - Note Sony UDS



### Check Links

https://validator.w3.org/checklink
