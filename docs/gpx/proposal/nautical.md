## Proposal for GPX

### Nautical Elements

Nautical and aeronautical elements have been suggested.

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| aspeed  | Air speed is the speed of an aircraft relative to the air in m/s |
| heading | Direction in which the aircraft's nose or vessel's bow is pointed, relative to true north in degrees |
| pitch   | Fore / aft rotation of a aircraft or vessel (trim) about its transverse axis in degrees |
| roll    | Tilting rotation of a aircraft or vessel (heel) about its longitudinal axis in degrees |
| rot     | Rate of turn (ROT) in degrees per minute                     |
| wspeed  | Water speed / boat speed is the speed of a vessel through the water in m/s |

There are also some running totals available:

| Name  | Description                                     |
| ----- | ----------------------------------------------- |
| wdist | Cumulative distance through water in meters (m) |

Wind and tide measurements will be listed in the [environment](environment.md) document.

Notes:

- "wdist" is akin to the "dist" metric in on the [fitness](fitness.md) page and is available from the [VLW](https://gpsd.gitlab.io/gpsd/NMEA.html#_vlw_distance_traveled_through_water) sentence of NMEA
- This list ignores NMEA trawler data such as [TDS](https://gpsd.gitlab.io/gpsd/NMEA.html#_tds_trawl_door_spread_distance), [TFI](https://gpsd.gitlab.io/gpsd/NMEA.html#_tfi_trawl_filling_indicator), [TPC](https://gpsd.gitlab.io/gpsd/NMEA.html#_tpc_trawl_position_cartesian_coordinates), [TPR](https://gpsd.gitlab.io/gpsd/NMEA.html#_tpr_trawl_position_relative_vessel), and [TPT](https://gpsd.gitlab.io/gpsd/NMEA.html#_tpt_trawl_position_true)



#### TODO

- Tidal elements still need to be considered - see [VDR](https://gpsd.gitlab.io/gpsd/NMEA.html#_vdr_set_and_drift) in NMEA

- Engine speed or RPM, or whatever the boating and aviation community uses as their equivalent of a car's speedometer. (differs from speed made good due to wind or water speed or tire slippage).
  - See [RPM](https://gpsd.gitlab.io/gpsd/NMEA.html#_rpm_revolutions) sentence in NMEA

- Need to review [NMEA 2000 data types](https://www8.garmin.com/manuals/webhelp/GUID-1415AAD0-FE63-42A6-8F8D-DB713D616122/EN-US/GUID-FACE3DF9-D18C-43B2-A586-B14F670077E1.html)



#### References

- GPX developers list
  - [Aug 24](https://groups.io/g/gpx/message/47)
- GPX proposal
  - Summary of common GPX [extensions](../extensions.md)
- Garmin
  - GPX extensions
    - TrackPointExtension v2 - [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) - search for "bearing"
  - Sailing Terminology and Definitions - [article](https://support.garmin.com/en-GB/?faq=e5LwusViLZ95VTDwn2Alt7)
- NMEA revealed
  - [VHW](https://gpsd.gitlab.io/gpsd/NMEA.html#_vhw_water_speed_and_heading) - water speed and heading
  - [$PASHR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pashr_rt300_proprietary_roll_and_pitch_sentence) - RT300 proprietary roll and pitch sentence
- Wikipedia
  - Aircraft flight dynamics - [introduction](https://en.wikipedia.org/wiki/Aircraft_flight_dynamics)
  - Ships motions - [rotational](https://en.wikipedia.org/wiki/Ship_motions#Rotational)
- Sailmon
  - Max - [live data](https://sailmon.com/max/#1675689499683-c73158df-1d1313e9-e463) - display shows heel and pitch, although CSV export calls them heel and trim
- Vakaros
  - Atlas 2 - [tech specs](https://vakaros.com/en-eu/pages/tech-specs) - core measurements are position, velocity, heading, heel, pitch, and barometric pressure
