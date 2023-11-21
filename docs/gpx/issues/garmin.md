## GPS Exchange Format (GPX) - Garmin

### Background

This document describes a number of desirable changes to the GPX exports produced by Garmin:

1. Ensuring GPX exports are compliant with the GPX 1.1 standard
2. Ensuring the XSD files for GPX extensions are accessible
3. Appropriate precision for elements such as `<ele>`, `<lat>`, and `<lon>`
4. Inclusion of speed and course in the GPX exports

The [GPX home](https://www.topografix.com/gpx_validation.asp) page summarises the importance of GPX validation and best practices. It is very simple and straightforward to ensure the Garmin exports are fully compliant with the GPX 1.1 standard. This document describes how to achieve the goal of GPX compliance / compatibility.

The addition of speed and course to GPX exports is also very desirable, and straightforward. The inclusion of speeds in GPX 1.1 files would be beneficial to a number of sports and is described towards the end of this document. 



### Validation

There are numerous ways to check compliance and validate a GPX file against the XSD. Several approaches are described at the [GPX home](https://www.topografix.com/gpx_validation.asp), but the simplest approach is to use an online validator such as the one at [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html).

This example has been fixed by hand to ensure compliance with the GPX 1.1 schema. Simply paste it into the [XML Validator](https://www.freeformatter.com/xml-validator-xsd.html) and press "Validate XML".

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3"
     xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.garmin.com/xmlschemas/GpxExtensions/v3
                         https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v1
                         https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd">
  <metadata>
    <link href="connect.garmin.com">
      <text>Garmin Connect</text>
    </link>
    <time>2022-06-11T12:23:41.000Z</time>
  </metadata>
  <trk>
    <name>Weymouth and Portland Windsurf</name>
    <type>windsurfing</type>
    <trkseg>
      <trkpt lat="50.57713455520570278167724609375" lon="-2.46620426885783672332763671875">
        <ele>2.2000000476837158203125</ele>
        <time>2022-06-11T12:23:41.000Z</time>
        <extensions>
          <ns3:TrackPointExtension>
            <ns3:atemp>25.0</ns3:atemp>
            <ns3:hr>97</ns3:hr>
          </ns3:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### Issues

#### Schema Locations

The exports from Garmin Connect have an issue with the URL in `<xsi:schemaLocation>`:

```xml
<gpx xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         http://www.topografix.com/GPX/11.xsd">
```

The correct schema location for GPX 1.1 is as follows:

```xml
<gpx xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd">
```
Ideally the schema location of TrackPointExtension v1 should also be added for clarity:

```xml
<gpx xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v1
                         https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd">
```



#### Redundant Namespace

The following namespace appears to be redundant in the GPX exports of Garmin Connect:

```xml
<gpx xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3">
```

The namespace can either be removed, or the URL can be added to the `xsi:schemaLocation` attribute:

```xml
<gpx xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.garmin.com/xmlschemas/GpxExtensions/v3
                         https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v1
                         https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd">
```



#### 301 Redirects

There is an issue with the server redirects on the Garmin website. For example:

```
http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd ->
https://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd ->
https://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd/ ->
https://www.garmin.com/en-US
```

The correct redirects should be as follows:

```
http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd ->
https://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd ->
https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd
```



#### Excessive Precision

GPX files created by Garmin Connect use far too much precision:

```xml
<trkpt lat="50.57713455520570278167724609375" lon="-2.46620426885783672332763671875">
  <ele>2.2000000476837158203125</ele>
</trkpt>
```

An appropriate level of precision for typical GNSS receivers is as follows:

```xml
<trkpt lat="50.5771346" lon="-2.4662043">
  <ele>2.20</ele>
</trkpt>
```

Notes:

- `lat` and `lon` - 7 decimal places is equivalent to a precision of 1.11 cm, so no more than 7 or 8 are required
- `<ele>` - 2 decimal places is equivalent to a precision of 1 cm, so no more than 2 or 3 are required



### Speed and Course

A variety of activities would greatly benefit from speed and course elements in GPX exports.

This would only require a minor change to the `<gpx>` element, switching to `TrackPointExtension/v2`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3"
     xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.garmin.com/xmlschemas/GpxExtensions/v3
                         https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v2
                         https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
```

With the `<gpx>` element referring to `TrackPointExtension/v2` it is then possible to include `<ns3:speed>` and `<ns3:course>`:

```xml
<trkpt lat="50.5771346" lon="-2.4662043">
  <ele>2.20</ele>
  <time>2022-06-11T12:23:41.000Z</time>
  <extensions>
    <ns3:TrackPointExtension>
      <ns3:atemp>25.0</ns3:atemp>
      <ns3:hr>97</ns3:hr>
      <ns3:speed>10.78</ns3:speed>
      <ns3:course>248.2</ns3:course>
    </ns3:TrackPointExtension>
  </extensions>
</trkpt>
```

Speed and course are already available in the FIT exports, so they should also be possible in GPX exports.

- The precision of `<ns3:speed>` should be either 2 or 3 decimal places, equivalent of 1 cm/s or 1 mm/s
- The precision of `<ns3:course>` should be either 1 or 2 decimal places