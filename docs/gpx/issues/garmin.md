## GPS Exchange Format (GPX) - Garmin

### GPX 1.1

Garmin tend to use GPX 1.1 but have a slight error in the schema location:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3"
     xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/11.xsd">
```

Notes:

- Garmin GPX files include a bad schema location which refers to http://www.topografix.com/GPX/11.xsd  instead of http://www.topografix.com/GPX/1/1/gpx.xsd 
- This schemaLocation issue is not detected by online validation tools because the XSD is pasted into the web page.
- Garmin also omit the schema locations of GpxExtensions and TrackpointExtension



### Missing Elements

The following trackpoint elements would be very useful in windsurfing tracks:

- "sat" which is standard to GPX 1.0 and GPX 1.1
- "hdop" which is standard to GPX 1.0 and GPX 1.1
- "speed" using TrackPointExtension v2 for GPX 1.1
- "course" using TrackPointExtension v2 for GPX 1.1

Note: Speed and course are available in FIT files so they could also be included in GPX files.



### Precision

GPX files created by Garmin often include unnecessary levels of precision, far exceeding that of the GPS chips.

- "lat" and "lon" = 29 decimal places but 8 decimal places is mm precision at the equator.
- "ele" = 23 decimal places but 3 decimal places is mm precision.



### Recommendations

- Fix the schema location of the XSD for GPX 1.1 so that SAXCount does not report "fatal error during schema scan".

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3"
     xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
```

- Add "sat" and "hdop" to the trackpoints:

```xml
<trkpt lat="52.0486800" lon="-0.5688999">
    <ele>0</ele>
    <time>2022-04-04T12:41:50Z</time>
    <sat>14</sat>
    <hdop>0.8</hdop>
</trkpt>
```

- Add "course" and "speed" using TrackPointExtension v2:

```xml
<trkpt lat="52.0486800" lon="-0.5688999">
    <ele>0</ele>
    <time>2022-04-04T12:41:50Z</time>
    <sat>14</sat>
    <hdop>0.8</hdop>
    <extensions>
        <ns3:TrackPointExtension>
            <ns3:hr>100</ns3:hr>
            <ns3:speed>0.5429</ns3:speed>
            <ns3:course>157.19</ns3:course>
        </ns3:TrackPointExtension>
    </extensions>
</trkpt>
```

- Consider adding the schema locations (i.e. URLs of the XSD files) for GpxExtensions and TrackPointExtension.
- Use a sensible number of decimal places:
  - "lat" and "lon" = 7 or 8 decimal places. 8 decimal places = mm precision at the equator.
  - "ele" = 2 or 3 decimal places. 3 decimal places = mm precision.