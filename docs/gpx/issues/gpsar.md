## GPS Exchange Format (GPX) - GpsarPro

### GPX 1.0

The header is fine:

```xml
<gpx creator="GpsarPro 5.3"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:gpsarPro="http://www.gpsactionreplay.com/xml"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
```

Note: There is no schema location for the gpsarPro namespace.



### Speed

Supports "speed", "hdop" and "sat" of GPX 1.0 but not "course".

Supports the non-standard gpxdata:speed introduced by the Kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) and used by [Waterspeed](https://waterspeedapp.com/).

Does not support GPX 1.1 + Trackpoint Extensions V3.



### Extensions

Includes its own elements like `<gpsarPro:satsInView>70254721</gpsarPro:satsInView>`



### Recommendations

- Enhance GPX export to include `<course>`.
- Enhance GPX loader to recognize `<course>` (GPX 1.0) and `<cog>` (existing COROS files).
- Enhance GPX loader to support GPX 1.1 + Trackpoint Extensions V3 for `<xxx:course>` and `<xxx:cog>`.
