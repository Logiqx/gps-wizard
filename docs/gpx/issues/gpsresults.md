## GPS Exchange Format (GPX) - GPSResults

### GPX 1.0

GPSResults has a tiny header and uses its own XML namespace which is not correct.

```xml
<gpx xmlns="https://www.gps-speed.com"
     creator="GPSResults V6.185">
```

It should really use a standard GPX 1.0 header:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPSResults V6.185 - https://www.gps-speed.com"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
```



### Speed

Supports "speed", "hdop" and "sat" of GPX 1.0 but uses "cog" instead of course".

Does not support the non-standard gpxdata:speed introduced by the Kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) and used by [Waterspeed](https://waterspeedapp.com/).

Does not support GPX 1.1 + Trackpoint Extensions V3.



### Metadata

Various pieces of metadata that do not exist in the GPX 1.0 schema:

```xml
<metadata>
  <link href="http://www.gps-speed.com">
    <text>GPS-Results</text>
  </link>
  <time>2008-11-15T14:34:07Z</time>
  <username>unknown</username>
  <device>Forerunner205</device>
  <firmware>2.80</firmware>
  <serialno>3384310285</serialno>
</metadata>
```

The elements "username", "device", "firmware "and "serialno" are all invalid.



### Recommendations

- Enhance the GPX export to use a standard GPX 1.0 header to facilitate validation.
  - If custom metadata is required it would have to be via a schema extension with a suitable namespace.
- Change GPX export to use `<course>` instead of `<cog>`.
- Enhance GPX loader to recognize `<course>` in addition to `<cog>`.
- Enhance GPX loader to support `<gpxdata:speed>` which was introduced by the Kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) and used by [Waterspeed](https://waterspeedapp.com/).
- Enhance GPX loader to support GPX 1.1 + Trackpoint Extensions V3 for `<xxx:course>` and `<xxx:cog>`.
