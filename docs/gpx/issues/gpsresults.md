## GPS Exchange Format (GPX) - GPSResults

### Header

GPSResults uses its own namespace which is not correct.

```xml
<gpx xmlns="https://www.gps-speed.com"
     creator="GPSResults V6.185">
```



### Speed

Supports "speed", "hdop" and "sat" of GPX 1.0 but uses "cog" instead of course".

Supports the non-standard gpxdata:speed introduced by the Kickstarter [Trace](https://www.kickstarter.com/projects/activereplay/trace-the-most-advanced-activity-monitor-for-actio).

Does not support GPX 1.1 + Trackpoint Extensions V3.



### Metadata

Lots of invalid metadata:

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

The elements "username", "device", "firmware "and "serialno "are invalid.



### Recommendations

- Use a full header to facilitate validation.
- Change GPX export to use `<course>` instead of `<cog>`.
- Enhance GPX loader to recognize `<course>` in addition to `<cog>`.
- Enhance GPX loader to support `<gpxdata:speed>`.
- Enhance GPX loader to support GPX 1.1 + Trackpoint Extensions V3 for `<xxx:course>` and `<xxx:cog>`.
