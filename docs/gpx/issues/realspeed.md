## GPS Exchange Format (GPX) - Realspeed

### GPX 1.0

The GPX files created by Realspeed are almost compliant with the GPX 1.0 schema.

The example below has been slightly sanitized, introducing standard formatting / indentation:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     version="1.0"
     creator="RealSpeed V1928 - http://www.intellimass.com"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
  <time>2023-11-27T13:35:47Z</time>
  <trk>
    <name>"k888_168603881_20201226_173349"</name>
    <trkseg>
      <trkpt lat="+50.5854658000" lon="-2.4711146000">
        <ele>-5</ele>
        <time>2020-12-25T11:38:06.200Z</time>
        <speed>1.69</speed>
        <HDOP>2.2</HDOP>
        <sat>5</sat>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```

The original GPX file created by RealSpeed is not suitably formatted, especially for the `<trkpt>` elements:

```xml
<?xml version="1.0"?>
<gpx version="1.0" creator="RealSpeed V1928 - http://www.intellimass.com"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://www.topografix.com/GPX/1/0"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
  <time>2023-11-27T13:35:47Z</time>
<trk>
<name>"k888_168603881_20201226_173349"</name>
<trkseg>
<trkpt lat="+50.5854658000" lon="-2.4711146000"> <ele>-5</ele> <time>2020-12-25T11:38:06.200Z</time> <speed>1.69</speed> <HDOP>2.2</HDOP> <sat>5</sat> </trkpt>
</trkseg>
</trk>
</gpx>
```

 

### Notes

RealSpeed is no longer under development, so the following observations are unlikely to change:

- The `<course>` element is not present
- The `<hdop>` element is incorrectly named `<HDOP>` and is in the wrong position
  - The `<hdop>` element should be listed after the `<sat>` element to be valid GPX

- There is no proper formatting, which makes the file look somewhat unsightly! 



