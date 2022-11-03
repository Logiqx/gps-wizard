## GPS Exchange Format (GPX) - Waterspeed

### Summary

- http://www.topografix.com/GPX/11.xsd is wrong, should be http://www.topografix.com/GPX/1/1/gpx.xsd
- Time formats are wrong in the GPX 1.1 file. Should use Z, rather than +0000.
- Times are wrong by one hour in either the GPX 1.1 or GpsarPro file.
- gpxdata:speed does not belong in gpxtpx:TrackPointExtension
- should use gpxdata:speed AND gpxtpx:speed in GpsarPro file
- Has a GPX file using "ns3" and a GPX file using "gpxtpx"
- https://waterspeed.crunch.help/how-to/export-to-strava-relive-garmin-google-earth-gpx-csv-excel

Python loading GpsarPro file:

XMLSyntaxError: Namespace prefix gpxdata on speed is not defined, line 17, column 15



### Speed

`<gpxdata:speed>0.0089</gpxdata:speed>`

Google search "gpxdata:speed" returns 3 results.

Search for "gpxtpx:speed" returns 1,910 results.



### Precision

speed - n.nnnn (4 decimals from waterspeed = 1/10th millimeter/sec)



### Recommendations

Generate GPX 1.0 for GPSAR as it will also work with GPSResults and GPS-Speedsurfing.com
