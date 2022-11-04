## GPS Exchange Format (GPX) - GPSResults

### GPX 1.0

GPSResults has a tiny header and uses its own XML namespace which is not correct.

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
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



### Speed and Course

#### GPX 1.0

GPSResults supports the "speed" and "course" elements of GPX 1.0.

#### GPX 1.1

Does not support the non-standard "gpxdata:speed" introduced by the Kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) and used by [Waterspeed](https://waterspeedapp.com/).

Does not support GPX 1.1 + Trackpoint Extension v2 for "course" and "speed". See [document](../speed.md) for details.



### Element Order

The order of the elements does not conform to the GPX 1.0 schema:

```xml
<trkpt lat="50.154425200" lon="-5.027364900">
    <ele>-0.60</ele>
    <time>2022-09-29T10:44:55.000Z</time>
    <sat>18</sat>
    <speed>2.295</speed>
    <cog>249.859</cog>
</trkpt>
```

The correct order is shown below, also with "cog" renamed to "course" to conform with the GPX 1.0 schema:
```xml
<trkpt lat="50.154425200" lon="-5.027364900">
    <ele>-0.60</ele>
    <time>2022-09-29T10:44:55.000Z</time>
    <course>249.859</course>
    <speed>2.295</speed>
    <sat>18</sat>
</trkpt>
```

HDOP is also absent and could be exported. The `<hdop>` element should appear immediately after `<sat>`.



### Metadata

The metadata element does not exist in the GPX 1.0 schema:

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

It should also be noted that "username", "device", "firmware "and "serialno" are not part of GPX 1.1.



### Recommendations

- Enhance the GPX export to use a standard GPX 1.0 header to facilitate validation using SAXCount.
  - If the "metadata" element is desired it will necessitate GPX 1.1 and a schema extension with a suitable namespace.
  - However, GPX 1.1 has serious implications relating to the "[doppler speed](../speed.md)" so it is probably advisable to stick with GPX 1.0.
- Change GPX export to use `<course>` instead of `<cog>` thus matching the GPX schema.
- Enhance GPX export to include `<hdop>`.
- Enhance GPX export to use the element order mandated by the GPX schema - "ele", "time", "course", "speed", "sat", hdop".
- Enhance GPX loader to support `<gpxdata:speed>` which was introduced by the Kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio) and is used by [Waterspeed](https://waterspeedapp.com/).
- Enhance GPX loader to support GPX 1.1 + Trackpoint Extension v2 for `<xxx:course>` and `<xxx:speed>`. See [document](../speed.md) for details.
