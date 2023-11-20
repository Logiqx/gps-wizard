## GPS Exchange Format (GPX) - COROS

### Background

This document describes a number of desirable changes to the GPX exports produced by COROS:

1. Ensuring GPX exports are compliant with the GPX 1.1 standard
2. Including speeds in the GPX exports for Windsurfing and Speedsurfing activities

The [GPX home](https://www.topografix.com/gpx_validation.asp) page summarises the importance of GPX validation and best practices. It is very simple and straightforward to ensure the COROS exports are fully compliant with the GPX 1.1 standard. This document describes how to achieve the goal of GPX compliance / compatibility.

The addition of speeds to GPX exports for Windsurfing and Speedsurfing activities is also very desirable, and straightforward. The inclusion of speeds in GPX 1.1 files is much sought after by the speedsailing community and is described towards the end of this document. 



### GPX Validation

There are numerous ways to validate a GPX file against the XSD and check compliance. Several approaches are described at the [GPX home](https://www.topografix.com/gpx_validation.asp), but the simplest approach is to use an online validator such as the one at [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html).

This example has been fixed by hand to ensure compliance with the GPX 1.1 schema. Simply paste it into the [XML Validator](https://www.freeformatter.com/xml-validator-xsd.html) and press "Validate XML".

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.cluetrust.com/XML/GPXDATA/1/0 
                         https://www.cluetrust.com/Schemas/gpxdata10.xsd"
     creator="Coros Wearables"
     version="1.1">
  <metadata>
    <link href="https://www.coros.com"><text>COROS</text></link>
    <time>2022-02-06T11:16:17Z</time>
  </metadata>
  <trk>
    <name>Speedsailing Example</name>
    <type>Other</type>
    <trkseg>
      <trkpt lat="53.3713950" lon="-3.1900331">
        <ele>3.42</ele>
        <time>2022-02-06T11:16:54Z</time>
        <sat>13</sat>
        <hdop>1.2</hdop>
        <extensions>
          <gpxdata:hr>101</gpxdata:hr>
          <gpxdata:distance>5.67</gpxdata:distance>
          <gpxdata:speed>12.345</gpxdata:speed>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### GPX Compliance

The GPX example shown above is based on the GPX export of a Speedsurfing activity, but a number of changes were required to make it GPX 1.1 compliant. Compliance with the GPX 1.1 standard will ensure that COROS exports are compatible with pretty much all other software, including applications that require full GPX 1.1 compliance, such as Garmin's Basecamp.



#### GPX Version

The `<gpx>` element needs be be tweaked as follows:

```xml
<gpx xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.cluetrust.com/XML/GPXDATA/1/0 
                         https://www.cluetrust.com/Schemas/gpxdata10.xsd"
     creator="Coros Wearables"
     version="1.1">
```

Changes:

- Inclusion of `version="1.1"`
- The GPX namespace is `xmlns="http://www.topografix.com/GPX/1/1`
- The GPX schema location is `https://www.topografix.com/GPX/1/1/gpx.xsd`
- Note: HTTPS links for both XSD files - `gpx.xsd` and `gpxdata10.xsd`
  - n.b. The namespaces are immutable (should always be HTTP), whereas the XSD links should be HTTPS



#### Metadata

The `<metadata>` element needs be be tweaked as follows:

```xml
<metadata>
  <link href="https://www.coros.com"><text>COROS</text></link>
  <time>2022-02-06T11:16:17Z</time>
</metadata>
```

Changes:

- The `<link>` element needs to include the `<text>` element, not just the word `COROS`
- The `<time>` element must come after the `<link>` element, not before it



#### ClueTrust Extension

The `<extensions>` element needs be be tweaked as follows:

```xml
<extensions>
 <gpxdata:hr>101</gpxdata:hr>
 <gpxdata:distance>5.67</gpxdata:distance>
 <gpxdata:speed>12.345</gpxdata:speed>
</extensions>
```

Changes:

- All items must use the  `gpxdata` prefix - e.g. `<gpxdata:distance>` and not just `<distance>` 
- Heart rate should be be `<gpxdata:hr>` instead of `<gpxdata:heatrate>`, and not just `<heartrate>` or `<hr>`

Notes:

- Activities such as walks and runs should use `<gpxdata:cadence>` and not just `<cadence>`
- Speed can be added as `<gpxdata:speed>` for Windsurfing and Speedsurfing activities, units = m/s



#### Course over Ground

The following element is invalid and needs to be removed from the Windsurfing and Speedsurfing exports:

```xml
<cog>164</cog>
```

n.b. The only legitimate way to include course over ground is using Garmin's TrackPoinExtension v2, which I will assume is undesirable for COROS.



#### Heart Rate

The following values for heart rate should never appear in GPX files:

```xml
<gpxdata:hr>0</gpxdata:hr>
<gpxdata:hr>-nan</gpxdata:hr>
```

When heart rate is unknown, it should be omitted from the `<trkpt>` element.

Both `0` and `-nan` can be found within `<heartrate>` of existing COROS exports.



#### Elevation

An elevation of "0" should not be included in trackpoints, unless the elevation has actually been measured as zero.

```xml
<ele>0</ele>
```

When elevation is unknown, it should be omitted from the trackpoint.

Ideally, elevation as calculated by the GPS / GNSS receiver should always be recorded, even for Windsurfing and Speedsurfing. The `<ele>` element is supposed to represent height above the geoid (aka MSL), and benefits from 2 decimal places.



#### Distance

The inclusion of distance within `<extensions>` is beneficial, although it would desirable to show 2 decimal places:

```xml
<extensions>
 <gpxdata:hr>101</gpxdata:hr>
 <gpxdata:distance>5.67</gpxdata:distance>
 <gpxdata:speed>12.345</gpxdata:speed>
</extensions>
```

The same is true within the FIT file, if possible.



### Additional GPX Elements

#### Speed over Ground

The `<speed>` element was accidentally removed from GPX 1.1 when it was being developed in 2004. This means the only valid way to include speed in GPX 1.1 files is within an `<extensions>` element.

Use of `<gpxdata:speed>` has been prevalent for quite some years and is supported by a number of speedsailing applications. Whilst it is not defined in ClueTrust's GPXDATA schema `<gpxdata:speed>` does not cause validation issues, because the GPX 1.1 schema uses `processContents="lax"` for elements within `<extensions>`.

```xml
<extensions>
 <gpxdata:distance>5.67</gpxdata:distance>
 <gpxdata:speed>12.345</gpxdata:speed>
</extensions>
```

The only alternative to this approach is Garmin's TrackPointExtension v2, which I am assuming COROS would not wish to use within their GPX exports. Although `<gpxdata:speed>` isn't defined in the ClueTrust XSD, it does provide a workable solution without relying upon the Garmin extension. The units for `<gpxdata:speed>` are m/s, just like `<speed>` in GPX 1.0. 



#### Course over Ground

The `<course>` element was accidentally removed from GPX 1.1 when it was being developed in 2004. This means the only valid way to include course in GPX 1.1 files is within an `<extensions>` element.

However, it is not possible to use `<gpxdata:course>` because that element serves a completely different purpose, and does not represent course over ground. Although course is supported by Garmin's TrackPointExtension v2, I am assuming COROS would not wish to use that extension within their GPX exports.

For this reason, I would suggest that `<cog>` is simply removed from the COROS exports, until such time as there is a legitimate way to include it in GPX 1.1 files. I am working alongside the original GPX developers to create a variety of official extensions for the GPX standard. I will notify COROS when this work is complete, and there is an official way to include course over ground.



#### Elevation

The `<ele>` element is supported by GPX and should be the very first element in `<trkpt>`:

```xml
<trkpt lat="53.3713950" lon="-3.1900331">
  <ele>3.42</ele>
  <time>2022-02-06T11:16:54Z</time>
</trkpt>
```

Ideally, elevation should be included for all activities, including Windsurfing and Speedsurfing.

The `<ele>` element is supposed to represent height above the geoid (aka MSL), and benefits from 2 decimal places.



#### Satellites and HDOP

The `<sat>` and `<hdop>` elements are supported by GPX and should be below the `<time>` element:

```xml
<trkpt lat="53.3713950" lon="-3.1900331">
  <ele>3.42</ele>
  <time>2022-02-06T11:16:54Z</time>
  <sat>13</sat>
  <hdop>1.2</hdop>
</trkpt>
```

It is advantageous to include these in Windsurfing exports and Speedsurfing exports. 

Note about satellites taken from [GitHub](https://github.com/Logiqx/gp3s-coros/issues/21) issue #21:

> The windsurfing and speedsurfing modes include "sats" in the GPX exports, and a developer field called "Sat" in the FIT file.
>
> Based on my observations, the satellite data does not appear to be correct in the windsurfing / speedsurfing exports.
>
> I suspect the value has been acquired from the NMEA sentence [$GPGSV](https://gpsd.gitlab.io/gpsd/NMEA.html#_gsv_satellites_in_view) because it does not reflect loss of signal. The $GPGSV sentence reports "satellites in view", not "satellites in use" which is what we require in the exports, so we know when the signals are lost.
>
> The sats value in the exports typically averages around 12 or 13 (I've seen a max of 15), never changing and certainly not dropping to 0 when the signals are lost after a crash or immersion. The sats average of 12 or 13 also suggests that it represents the number of visible GPS-only satellites - i.e. excluding BeiDou, GLONASS, Galileo.
>
> The number of "satellites in use" is available in the NMEA sentence [$GPGGA](https://gpsd.gitlab.io/gpsd/NMEA.html#_gga_global_positioning_system_fix_data) (n.b. some chipsets output a max value of 12) and [$GNGNS](https://gpsd.gitlab.io/gpsd/NMEA.html#_gns_fix_data) (max value of 99).
>
> Please can you check what is being done in the COROS firmware, and if using $GPGSV switch to using $GPGGA / $GNGNS.
>
> n.b. The $GNGNS sentence should be used in preference to $GPGGA (pre-dated multi-GNSS) since $GNGSS is designed to hold values > 12. See [thread](https://github.com/mikalhart/TinyGPSPlus/issues/52) for some background information.



### Summary

This document describes how to make the GPX exports from COROS be fully compliant with GPX 1.1. This has a number of technical advantages, including full compatibility with even the strictest of applications that support GPX files, such as Garmin's Basecamp.

All of the changes are straightforward to implement, and validation of GPX files during development / testing is extremely easy using [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html). You can copy / paste the GPX example from the top of this document when trying out the freeformatter service.

The addition of `<gpxdata:speed>` provides huge benefits to the speedsailing community. An overview of why speed is so important can be found on a separate [document](../speed.md). Although the examples are from an Apple Watch the issue of "spikes" in the positional data is common to all GPS / GNSS receivers, including COROS watches.  

I hope this information is helpful, and COROS developer(s) can be assigned some time to implement these changes, especially the addition of `<gpxdata:speed>` so that we can eliminate a number of data quality issues in the speedsailing community.

