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



### Precision

GPX files created by Garmin often include unnecessary levels of precision, far exceeding that of the GPS chips.

- "lat" and "lon" = 29 decimal places but 8 decimal places = mm precision at the equator.
- "ele" = 23 decimal places but 3 decimal places = mm precision.



### Recommendations

- Fix the schema location of GPX 1.1 so that SAXCount does not report "fatal error during schema scan".

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Garmin Connect"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:ns2="http://www.garmin.com/xmlschemas/GpxExtensions/v3"
     xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
```

- Consider adding the schema locations (i.e. URLs of the XSD files) for GpxExtensions and TrackPointExtension.
- Use a sensible number of decimal places:
  - "lat" and "lon" = 7 or 8 decimal places. 8 decimal places = mm precision at the equator.
  - "ele" = 2 or 3 decimal places. 3 decimal places = mm precision.