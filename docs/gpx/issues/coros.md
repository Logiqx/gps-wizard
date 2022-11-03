## GPS Exchange Format (GPX) - COROS

### GPX 1.0

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Coros Wearables"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd
                         http://www.cluetrust.com/XML/GPXDATA/1/0 http://www.cluetrust.com/Schemas/gpxdata10.xsd">
```

COROS specify GPX 1.0 but they need to use GPX 1.1 + Trackpoint extensions V3 if they want to include heart rate and distance.

Issues:
- Mixing GPX 1.0 and 1.1

- Header wrong
  - missing version attribute

- Extension not allowed (GPX 1.1).

  - ClueTrust GPXData is for GPX 1.1, making xmlns:gpxdata invalid as well

  

### Incorrect names

- course / cog
- hr / heartrate

Note: heartrate" is "hr" in the GPXData and TrackPoint extensions



### Extensions


```xml
<extensions>
  <heartrate>100</heartrate>
  <distance>7</distance>
</extensions>
```

GPX 1.0 does not support extensions

```
xmlns:gpxdata="http://www.cluetrust.com/XML/GPXDATA/1/0"
xsi:schemaLocation="http://www.cluetrust.com/XML/GPXDATA/1/0 http://www.cluetrust.com/Schemas/gpxdata10.xsd"
```



### Recommendations

If possible, revert to pure GPX 1.0:

- Fix the GPX header accordingly (namespace, schema locations, etc)
- Rename `<cog>` to `<course>`
- Add `<speed>`

If GPX 1.1 must be maintained then the following is required:

- Do the extensions properly - "hr" (heartrate) and "distance" elements should specify the namespace
- Rename `<cog>` to `<course>` and move it into extensions, specifying the names
- Add `<speed>` to the extensions, specifying the namespace
