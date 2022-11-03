## GPS Exchange Format (GPX) - GPSBabel

### GPX 1.0

The header is missing xmlns:xsi and xsi:schemaLocation

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0">
```

Without the schema location it is impossible to validate the GPX files using SAXCount as described by [TopoGrafix](https://www.topografix.com/gpx_validation.asp).



### Precision

The precision of various elements is unnecessarily high. For example:

- "lat" and "lon" = 9 decimal places when 8 decimal places = mm precision at the equator.
- "course" = 6 decimal places when most GPS chips output a maximum of 3 decimal places.
- "speed" = 6 decimal places when most GPS chips output a maximum of 3 decimal places (mm/s).
- "hdop" = 6 decimal places when most GPS chips output a maximum of 2 decimal places.



### Speed

It has been observed that GPSBabel will sometime calculates speed from positional data and save it in the GPX file.

This can lead to erroneous speeds (aka "spikes") in the output GPX and is undesirable.



### Recommendations

- Add xmlns:xsi and xsi:schemaLocation to the GPX header to enable validation with SAXCount.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
```

- Change the precision to something more appropriate:
  - "lat" and "lon" = 7 or 8 decimal places. 8 decimal places = mm precision at the equator.
  - "course" = 3 decimal places.
  - "speed" = 3 decimal places (mm/s).
  - "hdop" = 2 decimal places.
- Do not calculate speed from latitude and longitude. If speed is absent for any trackpoints, do not calculate it.