## Proposal for GPX

### Nautical and Aeronautical

Nautical and aeronautical elements have been suggested.

| Name    | Description                                                  |
| ------- | ------------------------------------------------------------ |
| aspeed  | Air speed is the speed of an aircraft relative to the air in meters per second (m/s) |
| drift   | Speed of the water / current in meters per second (m/s)      |
| heading | Direction in which the nose or bow is pointed, relative to true north in degrees (°) |
| pitch   | Fore / aft rotation of an aircraft or vessel (trim) about its transverse axis in degrees (°) |
| roll    | Tilting of an aircraft or vessel (heel) about its longitudinal axis in degrees (°) |
| set     | Direction of the water / current, relative to true north in degrees (°) |
| wdist   | Total distance through the water in meters (m) |
| wspeed  | Water speed / boat speed is the speed of a vessel through the water in meters per second (m/s) |

Omissions:

- There is no need for velocity made good (VMG) since it is derived from speed over ground (SOG) and true wind direction (TWD)
- This list ignores NMEA trawler data such as [TDS](https://gpsd.gitlab.io/gpsd/NMEA.html#_tds_trawl_door_spread_distance), [TFI](https://gpsd.gitlab.io/gpsd/NMEA.html#_tfi_trawl_filling_indicator), [TPC](https://gpsd.gitlab.io/gpsd/NMEA.html#_tpc_trawl_position_cartesian_coordinates), [TPR](https://gpsd.gitlab.io/gpsd/NMEA.html#_tpr_trawl_position_relative_vessel), and [TPT](https://gpsd.gitlab.io/gpsd/NMEA.html#_tpt_trawl_position_true)
- This list ignores [engine data](https://www8.garmin.com/manuals/webhelp/GUID-1415AAD0-FE63-42A6-8F8D-DB713D616122/EN-US/GUID-8C9B7F1D-846C-4FE3-A78C-65D38F17D2D2.html) in NMEA 2000 and the [RPM](https://gpsd.gitlab.io/gpsd/NMEA.html#_rpm_revolutions) sentence in NMEA 0183



#### References

- GPX developers list
  - [Aug 24](https://groups.io/g/gpx/message/47)
- GPX proposal
  - Summary of common GPX [extensions](../extensions.md)
- Garmin
  - TrackPointExtension v2 - [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) - search for "bearing"
  - Sailing Terminology and Definitions - [article](https://support.garmin.com/en-GB/?faq=e5LwusViLZ95VTDwn2Alt7)
  - Set and drift - [explanation](https://support.garmin.com/en-GB/?faq=eYNMvRuppZ2torMWs2pEk6)
- NMEA 0183
  - [VDR](https://gpsd.gitlab.io/gpsd/NMEA.html#_vdr_set_and_drift) - set and drift
  - [VHW](https://gpsd.gitlab.io/gpsd/NMEA.html#_vhw_water_speed_and_heading) - water speed and heading
  - [VLW](https://gpsd.gitlab.io/gpsd/NMEA.html#_vlw_distance_traveled_through_water) - distance traveled through water
  - [$PASHR](https://gpsd.gitlab.io/gpsd/NMEA.html#_pashr_rt300_proprietary_roll_and_pitch_sentence) - RT300 proprietary roll and pitch sentence
- NMEA 2000
  - Garmin - [data types](https://www8.garmin.com/manuals/webhelp/GUID-1415AAD0-FE63-42A6-8F8D-DB713D616122/EN-US/GUID-FACE3DF9-D18C-43B2-A586-B14F670077E1.html)
- Wikipedia
  - Aircraft flight dynamics - [introduction](https://en.wikipedia.org/wiki/Aircraft_flight_dynamics)
  - Ships motions - [rotational](https://en.wikipedia.org/wiki/Ship_motions#Rotational) motions
  - Set and drift - [article](https://en.wikipedia.org/wiki/Set_and_drift)
- Sailmon
  - Max - [live data](https://sailmon.com/max/#1675689499683-c73158df-1d1313e9-e463) - display shows heel and pitch, although CSV export calls them heel and trim
- Vakaros
  - Atlas 2 - [tech specs](https://vakaros.com/en-eu/pages/tech-specs) - core measurements are position, velocity, heading, heel, pitch, and barometric pressure
