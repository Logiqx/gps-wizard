## GPS Exchange Format (GPX) - GPSBabel

### GPX 1.0

The header is missing xmlns:xsi and xsi:schemaLocation

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0">
```

Without the schema location it is impossible to validate the GPX files using the tool described by [TopoGrafix](https://www.topografix.com/gpx_validation.asp).



### Recommendations

Add xmlns:xsi and xsi:schemaLocation to the header.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
```