## GPS Exchange Format (GPX) - Motion

### GPX 1.0

The GPX files created by the Motion GPS are fine as of firmware 3084.

They use GPX 1.0 and include the correct header as shown in the example below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     version="1.0"
     creator="Motion-GPS"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
  <trk>
    <name>/logs/2023/11/0610_2023-11-19-1429.oao</name>
    <trkseg>
      <trkpt lat="52.0493617" lon="-0.5709269">
        <ele>43.195</ele>
        <time>2023-11-19T13:29:57.000Z</time>
        <course>319.456</course>
        <speed>2.600</speed>
        <sat>24</sat>
        <hdop>0.60</hdop>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### Notes

- GPX 1.0 compliance was introduced in firmware 3084 on 26 May 2022
- HDOP was added to GPX exports in firmware 3181 on 9 Nov 2022
- Could use two spaces instead of tabs for indentation
