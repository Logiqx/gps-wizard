## NMEA

### Rare Sentences

Rare sentences include the following:

- [**DTM**](https://gpsd.gitlab.io/gpsd/NMEA.html#_dtm_datum_reference) - Datum Reference
- **EPE** - Accuracy Estimates - Horizontal and vertical accuracy estimates - probably **1-sigma**
  - Documented in the Antenova [M10478 & M10578](http://ozzmaker.com/wp-content/uploads/2016/08/M10478-M10578-NMEA_Sentence_Output.pdf) NMEA sentence output
- [**GBS**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gbs_gps_satellite_fault_detection) - GNSS Satellite Fault Detection - includes latitude, longitude, altitude errors (**1-sigma**)
- [**GRS**](https://gpsd.gitlab.io/gpsd/NMEA.html#_grs_gps_range_residuals) - GPS Range Residuals - includes residuals for up to 12 satellites
- [**GST**](https://gpsd.gitlab.io/gpsd/NMEA.html#_gst_gps_pseudorange_noise_statistics) - GNSS Pseudorange Noise Statistics - includes UERE, latitude, longitude, altitude errors (**1-sigma**)

These sentences are known to be supported by MediaTek and UBX chipsets.
