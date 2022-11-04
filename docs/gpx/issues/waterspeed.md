## GPS Exchange Format (GPX) - Waterspeed

### UNDER CONSTRUCTION - JUST RANDOM POINTS!

### Summary

- http://www.topografix.com/GPX/11.xsd is wrong, should be http://www.topografix.com/GPX/1/1/gpx.xsd
- Time formats are wrong in the GPX 1.1 file. Should use Z, rather than +0000.
- Times are wrong by one hour in the GpsarPro file.
- gpxdata:speed does not belong in gpxtpx:TrackPointExtension
- should use gpxdata:speed AND gpxtpx:speed in GpsarPro file
- Has a GPX file using "ns3" and a GPX file using "gpxtpx"
- https://waterspeed.crunch.help/how-to/export-to-strava-relive-garmin-google-earth-gpx-csv-excel

Python loading GpsarPro file:

XMLSyntaxError: Namespace prefix gpxdata on speed is not defined



### Speed

`<gpxdata:speed>0.0089</gpxdata:speed>`

Google search "gpxdata:speed" returns 3 results.

Search for "gpxtpx:speed" returns 1,910 results.



### Extensions

- speed
- course
- hr - supported by GpsarPro



### Missing Elements

- sat
- hdop



### Precision

speed - n.nnnn (4 decimals from waterspeed = 1/10th millimeter/sec)



### Recommendations

Generate GPX 1.0 for GPSAR as it will also work with GPSResults and GPS-Speedsurfing.com

GpsarPro can be enhanced to support one a GPX 1.1 file including heartrate.
