## GPS Exchange Format (GPX) - Waterspeed

### Background

Waterspeed currently provides 4 different GPX exports, pertaining to 4 different applications but this really should not be necessary:

![img](img/waterspeed.png)



GPX is a clearly defined standard with a public XSD, defining how the structure of GPX files that are compatible with any application.

When they are examined closely, it can be seen that none of the GPX files created by Waterspeed are GPX-compliant.

Different applications are tolerant of different issues in GPX files, but a GPX-compliant file would be suitable for all of these applications.



### GPX Validation

There are numerous ways to check compliance and validate a GPX file against the XSD. Several approaches are described at the [GPX home](https://www.topografix.com/gpx_validation.asp), but the simplest approach is to use an online validator such as the one at [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html).

This example has been corrected by hand, and is 100% compliant with the GPX schema. Simply paste it into the [XML Validator](https://www.freeformatter.com/xml-validator-xsd.html) and press "Validate XML".

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="Waterspeed"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 https://www.topografix.com/GPX/1/1/gpx.xsd
       http://www.garmin.com/xmlschemas/TrackPointExtension/v2 https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
  <metadata>
    <time>2022-10-29T12:55:24.000Z</time>
  </metadata>
  <trk>
    <name>Waterspeed Activity 450bce8c-04cc-4dfc-8360-a55aade3f1c8
</name>
    <trkseg>
      <trkpt lat="50.5712706949" lon="-2.4565614465">
        <ele>0</ele>
        <time>2022-10-29T12:55:24.000Z</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:hr>120</gpxtpx:hr>
            <gpxtpx:speed>0.0028</gpxtpx:speed>
            <gpxtpx:course>248.19</gpxtpx:course>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### Changes Required

The above example was based on "GPX - Google Maps, Earth", but a number of changes were required for GPX compliance.

If these changes are implemented within Waterspeed then the GPX files will be universal and suitable for any application.



#### GPX Schema Location

The URL for the GPX schema at topografix needed to be fixed in `xsi:schemaLocation`:

```xml
<gpx xsi:schemaLocation="http://www.topografix.com/GPX/1/1 https://www.topografix.com/GPX/1/1/gpx.xsd>
```

n.b. This is the https endpoint because freeformatter.com does not support 301 redirects at this time.



#### Garmin Schema Version

TrackpointExtension/v1 does not support course or speed, TrackPointExtension/v2 is required:

```xml
<gpx xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2">
```

n.b. TrackPointExtension/v2 is the only public GPX extension that supports speed and course at this time.



#### Garmin Schema Location

The URL for the Garmin extension needs to be added to `xsi:schemaLocation`:

```xml
<gpx xsi:schemaLocation="http://www.topografix.com/GPX/1/1 https://www.topografix.com/GPX/1/1/gpx.xsd
       http://www.garmin.com/xmlschemas/TrackPointExtension/v2 https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
```

n.b. The subdomain hosting the Garmin extensions is now https://www8.garmin.com.



#### Timestamps

Timestamps can be formatted in one of two ways in GPX files, generally the "Z" approach is preferred:

```xml
<time>2022-10-29T12:55:24.000Z</time>
<time>2022-10-29T12:55:24.000+00:00</time>
```

The format "+0000" (missing colon) as used in the Google and Strava exports is not valid.



#### Ordering of Elements

The schemas for GPX and the Garmin TrackPointExtension specify a strict ordering of XML elements.

This trackpoint illustrates the correct ordering of elevation, time, heart rate, speed and course:

```xml
<trkpt lat="50.5712706949" lon="-2.4565614465">
  <ele>0</ele>
  <time>2022-10-29T12:55:24.000Z</time>
  <extensions>
    <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>120</gpxtpx:hr>
      <gpxtpx:speed>0.0028</gpxtpx:speed>
      <gpxtpx:course>248.19</gpxtpx:course>
    </gpxtpx:TrackPointExtension>
  </extensions>
</trkpt>
```

Notes:

- `<ele>` and `<time>` appear in the wrong order in the "GPX - Strava, Relive" export
- `<gpxtpx:hr>` should always come before `<gpxtpx:speed>` and `<gpxtpx:course>`.



#### Heart Rate

A heart rate of "0" of invalid according to the XSD for Garmin's TrackPointExtension.

When heart rate is unknown, it should be omitted from the trackpoint.



#### Elevation

An elevation of "0" should not be included in trackpoints, unless the elevation has actually been measured as zero.

When elevation is unknown, it should be omitted from the trackpoint.

Ideally, elevation as calculated by the GPS / GNSS receiver should be recorded.



### Additional Observations

#### GPX Compliance

- Strava export is missing "creator"
  - This is one of the mandatory elements in the GPX header
- The GPSAR export uses `<gpxdata:speed>` which is invalid as it has no associated schema
  - The authors of GPSAR and GPSResults has been notified that `<gpxtpx:speed>` should be supported
- The Garmin export uses "ns3" instead of "gpxtpx", and does not include course or speed
  - Garmin enforce strict GPX validation within their software but GPX-compliant files will always work
  - Garmin will validate GPX extensions that they recognise, and ignore extensions that they don't recognise
  - There is no reason to omit speed and course from the Garmin export, simply use TrackPointExtension/v2
  - GPX writers are free to choose any namespace prefix, but "gpxtpx" is a good (universal) choice



#### Data Values

- Times are out by one hour in the GpsarPro file
  - All times should be in UTC so the downstream application can calculate local time
- Precision of lat / lon is higher than required
  - 10 decimal places is equivalent to a resolution of 0.011 mm, which massively exceeds the accuracy of GPS / GNSS
  - 8 decimals would be more than adequate, precision of 1 mm
- Precision of speed is higher than required
  - 4 decimal places is equivalent to a resolution of 0.1 mm/s, which massively exceeds the accuracy of GPS / GNSS
  - 3 decimals would be more than adequate, precision of 1 mm/s



### Speed

The inclusion of `<gpxdata:speed>` invalidates a GPX file so it should be avoided. In the not too distant future GPSAR, GPSResults, and GPS-Speedsurfing will support `<gpxtpx:speed>`, now that it has been brought to their attention.

There may be a transition period where both `<gpxdata:speed>` and `<gpxtpx:speed>` are included in a single GPX file, but this should be regarded as a temporary measure. The inclusion of `<gpxdata:speed>` will definitely be regarded as invalid by Garmin who enforce strict GPX-compliance.

In the future, there will be no requirement for `<gpxdata:speed>` because GPX files including `<gpxtpx:speed>` will be fully compliant with the schemas for GPX 1.1 and TrackPointExtension v2.



### Summary

Ensuring that GPX exports from Waterspeed are GPX-compliant will mean that the 4 different GPX exports can replaced with one GPX export.

The changes are all relatively straightforward to implement, and validation of GPX files during development is extremely simple using [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html).

I hope this information is helpful, and I hope the Waterspeed developer(s) can find the time to implement these changes.

