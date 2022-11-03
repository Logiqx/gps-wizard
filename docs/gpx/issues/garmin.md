## GPS Exchange Format (GPX) - Garmin

### GPX 1.1

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

- Garmin use http://www.topografix.com/GPX/11.xsd  instead of http://www.topografix.com/GPX/1/1/gpx.xsd 

- This schemaLocation issue is not detected by online validation tools because the XSD is pasted into the web page.
- Garmin also omit the schema locations of GpxExtensions and TrackpointExtension



### Examples

Seen in track from Marti (Fenix 6).

Garmin example: gps-wizard/sessions/20220422/activity_8686414511.gpx
