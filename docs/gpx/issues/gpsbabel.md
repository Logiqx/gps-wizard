## GPS Exchange Format (GPX) - GPSBabel

### Summary

The GPX 1.0 files produced by GPSBabel are pretty decent, but can potentially be improved:

- Addition of schema location(s) to the `<gpx>` element
- Reduction of precision for `<course>`, `<speed>` and `<hdop>`
- Do not impute `<speed>` from positional data

These topics are described in more detail in the following sections.




### Discussion

#### Schema Location

The header is missing `xmlns:xsi` and `xsi:schemaLocation` which are recommended by the GPX [guidance](https://www.topografix.com/gpx_for_developers.asp):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0">
```

Without the schema location it is impossible to validate the GPX files using SAXCount as described by [TopoGrafix](https://www.topografix.com/gpx_validation.asp).

An example of a GPX 1.0 file specifying `xmlns:xsi` and `xsi:schemaLocation`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0
                         https://www.topografix.com/GPX/1/0/gpx.xsd">
```

GPX 1.0 files can be validated using the method(s) described in the [overview](../README.md) document.



#### Precision

The precision of various elements is probably too high:

- `<course>` = 6 decimal places. Most GNSS chips output a maximum of 3 decimal places
- `<speed>` = 6 decimal places. Most GNSS chips output a maximum of 3 decimal places, equating to a precision of 1 mm/s
  - Some sources will have converted a speed in knots or km/h to m/s, giving the illusion of higher precision

- `<hdop>` = 6 decimal places. Most GNSS chips output a maximum of 2 decimal places

The precision of latitude and longitude are fine as they are suitable for technologies such as RTK:

- "lat" and "lon" = 9 decimal places, equating to a precision of around 0.11 mm



#### Speed

It has been observed that GPSBabel will sometimes impute speed from positional data and save it in the GPX file. This can lead to erroneous speeds (aka "spikes") in the output GPX and is undesirable. I have personally observed this issue when converting Garmin FIT files to GPX format using GPSBabel.



### Recommendations

#### Schema Location

- Add `xmlns:xsi` and `xsi:schemaLocation` to the GPX header to enable validation with SAXCount and other tools:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSBabel - https://www.gpsbabel.org"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0
                         https://www.topografix.com/GPX/1/0/gpx.xsd">
```



#### Precision

Reduce the precision of the following elements:
- `<course>` = 3 decimal places
- `<speed>` = 3 decimal places, equating to a precision of 1 mm/s
- `<hdop>` = 2 decimal places



#### Speed

Do not impute speed from latitude and longitude (well, not by default).

If speed is absent for any trackpoints, it should simply be omitted.
