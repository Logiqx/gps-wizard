## GPS Exchange Format (GPX) - Doppler Speed

### Introduction

The term "doppler speed" was coined by the [GPS-Speedsurfing](https://www.gps-speedsurfing.com/) community and refers to the speed that is calculated by the GNSS chip in real-time.

The "doppler speed" is derived from the observable [Doppler shift](https://en.wikipedia.org/wiki/Doppler_effect) of the satellite signals. Doppler shift is always evident due to the perpetual motion of the GPS satellites and the receiver. Estimating the speed of the GNSS receiver from the observable Doppler shift is far less susceptible to errors than retrospective calculations using the positional data (i.e. longitude and latitude).

Conversely, speeds that are calculated retrospectively from positional data are highly susceptible to "spikes" which are erroneous speeds due to blocked signals, imperfections in the GNSS chip, etc. Sometimes these "spikes" will be very obvious (e.g. 60+ knots on a windsurfer) but other times they will be small enough for people to believe they are genuine speeds.

It's worth noting that every GNSS / GPS / watch manufacturer will have their own way of calculating the speed of the receiver in real-time but they will typically make use of the observable Doppler-shift (already a necessity in order to receive the satellite data) and a [Kalman filter](https://en.wikipedia.org/wiki/Kalman_filter) to reduce "noise". For convenience, this document will simply refer to "doppler speed", regardless of how the GNSS chip calculates it.



#### Example 1

The first example is from an Apple Watch, recorded using the Waterspeed app.

There are very obvious "spikes" of around 33.7 knots, 36.9 knots and 31.3 knots present in the non-Doppler speed graph (bottom).

The fastest non-Doppler speed that was not an obvious spike was 23.9 knots. The fastest Doppler speed (more likely to be accurate) was 22.5 knots.

![img](img/spike-20220729.png)



#### Example 2

The second example is also from an Apple Watch, recorded using the Waterspeed app.

There are very obvious "spikes" of around 42 knots and 45 knots present in the non-Doppler speed graph (bottom).

The fastest non-Doppler speed that was not an obvious spike was 26.4 knots. The fastest Doppler speed (more likely to be accurate) was 25.4 knots.

![img](img/spike-20220929.png)



### GPX 1.0

The [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) format of 2002 allowed speed (typically "doppler speed" in a modern GNSS chip) to be recorded in GPX files using the `<speed>`element. The same was also true for [course of ground](https://en.wikipedia.org/wiki/Course_(navigation)) (COG) using the `<course>` element. 

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <course>157.19</course>
  <speed>0.5429</speed>
  <sat>6</sat>
  <hdop>1.4</hdop>
</trkpt>
```



### GPX 1.1

[GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd) was released in August 2004 which made some structural changes and introduced `<extensions>` but the developers accidentally removed the `<speed>` and `<course>` elements. This 



#### The Interim Approach

The kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) overcame the GPX 1.1 oversight using an element called `<gpxdata:speed>` as a trackpoint extension.

An example header:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Demo App"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.cluetrust.com/XML/GPXDATA/1/0
                         https://www.cluetrust.com/Schemas/gpxdata10.xsd">
```

The track points can then include `<gpxdata:speed>` as follows:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxdata:speed>0.5429</gpxdata:speed>
  </extensions>
</trkpt>
```

Use of `<gpxdata:speed>` has now been prevalent for quite some years and is supported by a number of speedsailing applications. Whilst it is not defined in the ClueTrust schema, `<gpxdata:speed>` does not cause validation issues, because the GPX 1.1 schema uses `processContents="lax"` for elements within `<extensions>`.



#### The Garmin Approach

Garmin added speed and course to v2 of their [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema, some time around 2015.

This means that with the appropriate GPX header (i.e. defining the namespace and schemaLocation) it is possible to include `<speed>` and `<course>` elements in GPX 1.1 files.

An example header:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 https://www.topografix.com/GPX/1/1/gpx.xsd 
       http://www.garmin.com/xmlschemas/TrackPointExtension/v2 https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd"
```

Trackpoints can then include speed and course (plus data such as heartrate) inside the `<extensions>` element:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>60</gpxtpx:hr>
      <gpxtpx:speed>0.5429</gpxtpx:speed>
      <gpxtpx:course>157.19</gpxtpx:course>
    </gpxtpx:TrackPointExtension>
  </extensions>
</trkpt>
```

Notes:

- The prefix "gpxtpx" is not special and may be chosen by the GPX creator
- Numerous applications use `gpxtpx` as a namespace prefix so it would be `<gpxtpx:speed>`
- Garmin Connect typically uses `ns3` as a namespace prefix so it would be `<ns3:speed>` 
- No assumptions should be made about prefix(es) being used in GPX files



#### Downside of the Garmin Approach

At this time (Nov 2023), neither [GpsarPro](http://www.gpsactionreplay.com/), [GPSResults](https://www.gps-speed.com/) nor [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/) support version 2 of Garmin's [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema, although both authors plan to add support in the near future.

This means that although you can create a GPX 1.1 compliant file containing speed and course thanks to the Garmin extension, both elements will be ignored by some popular speed surfing software.



### Workaround using GPX 1.0

The `<speed>` element of GPX 1.0 is already supported by [GpsarPro](http://www.gpsactionreplay.com/), [GPSResults](https://www.gps-speed.com/), [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/) and many other popular pieces of software.

Unless you really need GPX 1.1 (e.g. heart rate data being required) then it might make sense to use GPX 1.0 for GPS-Speedsurfing applications.

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <course>157.19</course>
  <speed>0.5429</speed>
  <sat>6</sat>
  <hdop>1.4</hdop>
</trkpt>
```



### Workaround using GPX 1.1

If you wish to use GPX 1.1 then you should probably use the Garmin approach, but can supplement it with `<gpxdata:speed>`.

This suggestion / workaround is only really intended for Waterspeed, so that GPX files remain compatible with older versions of GpsarPro.

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>60</gpxtpx:hr>
      <gpxtpx:speed>0.5429</gpxtpx:speed>
      <gpxtpx:course>157.19</gpxtpx:course>
    </gpxtpx:TrackPointExtension>
    <gpxdata:speed>0.5429</gpxdata:speed>
  </extensions>
</trkpt>
```

You will also need to add the "gpxdata" namespace and schema location to the GPX:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v2
                         https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd
                         http://www.cluetrust.com/XML/GPXDATA/1/0
                         https://www.cluetrust.com/Schemas/gpxdata10.xsd">
```

Notes:

1) As of Nov 2022, this workaround will only work for GpsarPro. It won't work for GPSResults or GPS-Speedsurfing.com.

2) Although `<gpxdata:speed>`  is not defined in ClueTrust's GPXDATA schema it does not cause validation issues, because the GPX 1.1 schema uses `processContents="lax"` for elements within `<extensions>`.

3) The namespace prefixes may be "gpxtpx", "gpxdata", ns3" or something else entirely. A possible hack is to ignore the namespace prefixes within `<extensions>` and use anything named "speed", regardless of the namespace prefix.
