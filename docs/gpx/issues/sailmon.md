## GPS Exchange Format (GPX) - Sailmon

### GPX 1.1

The GPX files created by Sailmon are fully compliant with the GPX 1.1 schema.

The GPX files created by Sailmon do include an appropriate header, as shown in the example below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     version="1.1"
     creator="phpGPX/1.2.1"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
  <metadata>
    <desc>2023-04-07-Test</desc>
    <time>2023-04-07T12:20:19+00:00</time>
  </metadata>
  <trk>
    <src>Sailmon Max</src>
    <type>SAIL</type>
    <trkseg>
      <trkpt lat="50.571472" lon="-2.456538">
        <ele>0</ele>
        <time>2023-04-06T13:51:38+00:00</time>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### Notes

- Sailmon uses [phpGPX](https://github.com/Sibyx/phpGPX) to create its GPX exports which support TrackPointExtension [v1](https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd) and [v2](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)
- Some suggestions / requests for Sailmon have been documented as [observations](https://logiqx.github.io/gps-details/sailmon/)

