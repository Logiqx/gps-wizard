## GPS Exchange Format (GPX)

### Doppler Speed

The term "doppler speed" was coined by the [GPS-Speedsurfing](https://www.gps-speedsurfing.com/) community and refers to the real-time speed calculated by the GPS receiver.

The "doppler speed" is derived from the observable [Doppler shift](https://en.wikipedia.org/wiki/Doppler_effect) of the satellite signals. Doppler shift is always evident due to the perpetual motion of the satellites and the receiver. Estimating the speed of the GPS receiver from the observed Doppler shift is far less susceptible to errors than any calculations using the positional data (i.e. longitude and latitude).

Conversely, speeds that are calculated from positional data are highly susceptible to "spikes" which are erroneous speeds due to blocked signals, imperfections in the GPS receiver, etc. Sometimes these "spikes" will be obvious (e.g. 60+ knots on a windsurfer) but other times they will be small enough for people to believe they are genuine speeds.

It's worth noting that every GPS and watch manufacturer will have their own way of calculating the speed of the receiver in real-time but they will often make use of the observable Doppler-shift (already a necessity when receiving the satellite data) and a [Kalman filter](https://en.wikipedia.org/wiki/Kalman_filter). For convenience, this document will simply refer to "doppler speed", regardless of how the GPS receiver calculated it.



#### Example 1

The first example is from an Apple Watch, recorded using the Waterspeed app.

There are obvious "spikes" of around 33.7 knots, 36.9 knots and 31.3 knots present in the non-Doppler speed graph on the right.

The fastest non-Doppler speed that was not an obvious spike was 23.9 knots. The fastest Doppler speed (most likely to be accurate) was 22.5 knots.

![img](img/spike-20220729.png)



#### Example 2

The second example is also from an Apple Watch, recorded using the Waterspeed app.

There are obvious "spikes" of around 42 knots and 45 knots present in the non-Doppler speed graph on the right.

The fastest non-Doppler speed that was not an obvious spike was 26.4 knots. The fastest Doppler speed (most likely to be accurate) was 25.4 knots.

![img](img/spike-20220929.png)





### GPX 1.0

The [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) format of 2002 allowed "speed" (typically "doppler speed") to be recorded in the GPX using the `<speed>` element. The same was also true for "[course of ground](https://en.wikipedia.org/wiki/Course_(navigation))" using the `<course>` element. 



### GPX 1.1

[GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd) was released in August 2004 which added lots of new capabilities, including extensions but for some reason it removed the `<speed>` and `<course>` elements. It looks like this was a simple oversight when reviewing the schema changes but it may have been a conscious decision.



### The "Hack" Approach

The kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) overcame the GPX 1.1 limitation by introducing an element called `<gpxdata:speed>`. 

Trace had no option but to invent a new element but they should really have created their own “trace” schema (including "speed" and "course"), declared it using a suitable xmlns:trace and xsi:schemaLocation and published the schema (defining "speed" and "course") on the web.

Unfortunately the use of `<gpxdata:speed>` has now percolated into other applications, including [Waterspeed](https://waterspeedapp.com/) which means yet more GPX files where the non-standard approach for speed is not supported by [GPSResults](https://www.gps-speed.com/), [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/), etc.

Side note: The [GPXData](GPXData) schema / namespace was created by ClueTrust and does not support "speed" or "course" (i.e. course over ground).



### The "Correct" Approach

Garmin have added "speed" and "course" to version 2 of their [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema, some time around 2015.

This means that with the appropriate GPX header (i.e. defining the namespace and schemaLocation) it is possible to include `<speed>` and `<course>` elements in GPX 1.1 files.

An example header:

```xml
<gpx version="1.1" creator="Garmin Connect"
  xmlns="http://www.topografix.com/GPX/1/1"
  xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd 
                      http://www.garmin.com/xmlschemas/TrackPointExtension/v2 http://www.garmin.com/xmlschemas/TrackPointExtensionv2.xsd"
```

Trackpoints can then record speed and course (plus data such as heartrate) inside an `<extensions>` element:

```xml
<extensions>
  <gpxtpx:TrackPointExtension>
    <gpxtpx:speed>0.5429</gpxtpx:speed>
    <gpxtpx:course>157.19</gpxtpx:course>
    <gpxtpx:hr>120</gpxtpx:hr>
  </gpxtpx:TrackPointExtension>
</extensions>
```



### Downside of the "Correct" Approach

At this time (Nov 2022), neither [GPSResults](https://www.gps-speed.com/) or [GpsarPro](http://www.gpsactionreplay.com/) support version 2 of Garmin's [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema.

This means that although you can create a 100% conformant GPX 1.1 document containing "speed" and "course" they will be ignored.

I will suggest to Manfred (GPSResults) and Yann (GpsarPro) that they add support for GPX 1.1 files using Garmin's [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema.



### Workaround using GPX 1.0

The `<speed>` element of GPX 1.0 is already supported by [GPSResults](https://www.gps-speed.com/) and [GpsarPro](http://www.gpsactionreplay.com/).

Unless you really need to generate GPX 1.1 (e.g. heartrate data must be recorded) then it makes sense to use GPX 1.0 for GPS-Speedsurfing.



### Workaround using GPX 1.1

If you really must use GPX 1.1 then you should use the correct approach (described earlier) but supplement it with `<gpsdata:speed>`.

```xml
<extensions>
  <gpxdata:speed>0.5429</gpxdata:speed>
  <gpxtpx:TrackPointExtension>
    <gpxtpx:speed>0.5429</gpxtpx:speed>
    <gpxtpx:course>157.19</gpxtpx:course>
    <gpxtpx:hr>120</gpxtpx:hr>
  </gpxtpx:TrackPointExtension>
</extensions>
```

You will also add the "gpxdata" namespace and schema location to the GPX, if it is to be a valid XML document:

```xml
<gpx version="1.1" creator="Garmin Connect"
  xmlns="http://www.topografix.com/GPX/1/1"
  xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
  xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd 
                      http://www.garmin.com/xmlschemas/TrackPointExtension/v2 http://www.garmin.com/xmlschemas/TrackPointExtensionv2.xsd
                      http://www.topografix.com/GPX/1/0/gpx.xsd http://www.cluetrust.com/XML/GPXDATA/1/0 http://www.cluetrust.com/Schemas/gpxdata10.xsd"
```

Notes:

1) As of now, this workaround will only work for GpsarPro. It won't work for GPSResults or GPS-Speedsurfing.com.
2) ClueTrust do not specify "speed" or "course" in their schema but most XML validation tools will not report and error, because they only verify items in the default namespace.