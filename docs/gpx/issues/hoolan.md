## GPS Exchange Format (GPX) - Hoolan

### GPX 1.1

The GPX files created by the Hoolan are fine as of v1.8.0 on 5 Sep 2023. They use GPX 1.1 and include the correct header:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Hoolan Ltd"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd      
       http://www.garmin.com/xmlschemas/TrackPointExtension/v2 http://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
```



### Notes

Heart rate was also added to the GPX export in v1.9.0 on 7 Nov 2023.