## GPS Exchange Format (GPX) - Hoolan

### GPX 1.1

The GPX files created by Hoolan are fully compliant with the GPX 1.1 schema as of v1.8.0 on 5 Sep 2023

The GPX files created by Hoolan do include an appropriate header, as shown in the example below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx xmlns="http://www.topografix.com/GPX/1/1" 
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2" 
     xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3" 
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         http://www.topografix.com/GPX/1/1/gpx.xsd 
                         http://www.garmin.com/xmlschemas/GpxExtensions/v3
                         http://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd 
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v2
                         http://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd"
     creator="Hoolan Ltd"
     version="1.1">
  <metadata>
    <name>Kiteboarding</name>
    <time>2023-11-05T12:40:25Z</time>
  </metadata>
  <trk>
    <trkseg>
      <trkpt lat="50.80604054503597" lon="-0.4174501493708683">
        <time>2023-11-05T12:40:26Z</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:speed>0.8672264218330383</gpxtpx:speed>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```



### Notes

- TrackPointExtension v2
  - `<gpxdata:speed>` was also added to the GPX export in v1.8.0 on 5 Sep 2023
  - `<gpxdata:hr>` was also added to the GPX export in v1.9.0 on 7 Nov 2023
- GpxExtensions v3 is not required
  - `xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3" `
  - `xsi:schemaLocation` containing `GpxExtensions/v3` and `GpxExtensionsv3.xsd`
- The following elements are not present, but might be considered in the future
  - `<ele>`
  - `<gpxdata:course>`
- The following elements are not present, and unavailable from Apple's [CLLocation](https://developer.apple.com/documentation/corelocation/cllocation) API
  - `<sat>`
  - `<hdop>`
