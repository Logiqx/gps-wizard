## GPS Exchange Format (GPX) - Realspeed

### GPX 1.0

The GPX files created by Realspeed are almost compliant with the GPX 1.0 schema.

The GPX files created by Realspeed do include an appropriate header, as shown in the example below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="RealSpeed V1924 - http://www.intellimass.com"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
  <time>2008-01-14T20:46:24:00Z</time>
  <trk>
    <name>"13-1-8 2008-01-13"</name>
    <trkseg>
      <trkpt lat="+52.0482444760" lon="-.5684995650">
        <ele>0</ele>
        <time>2008-01-13T11:47:35Z</time>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### Notes

RealSpeed is no longer under development, so the following observations are unlikely to change:

- The following elements are not present:
  - `<course>`
  - `<speed>`
  - `<sat>`
  - `<hdop>`
- The `<time>` element is incorrect, using a colon instead of a dot for milliseconds:
  - `<time>2008-01-14T20:46:24:00Z</time>`

