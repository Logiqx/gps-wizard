## GPS Exchange Format (GPX) - ESP-GPS

### GPX 1.0

The GPX files created by the ESP-GPS are fine as of firmware 5.81bis.

They use GPX 1.0 and include the correct header.

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<gpx version="1.0" creator="ESP-GPS SW 5.81bis" xmlns="http://www.topografix.com/GPX/1/0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/0 https://www.topografix.com/GPX/1/0/gpx.xsd">
  <trk>
    <trkseg>
      <trkpt lat="51.0919304" lon="4.5245247">
        <ele>11</ele>
        <time>2023-12-01T11:38:51Z</time>
        <course>303</course>
        <speed>1.88</speed>
        <sat>31</sat>
        <hdop>0.49</hdop>
    </trkseg>
  </trk>
</gpx>
```



### Notes

- GPX 1.0 support was added in firmware 5.62 during Dec 2022
- Indentation was originally lacking but was added in 5.81bis during Dec 2023
