## Proposal for GPX

### Compatibility of GPX 1.1.1

It is important to emphasise that existing files that are already GPX 1.1 compliant will also be GPX 1.1.1 compliant.

Existing software should be expected to load / import GPX 1.1.1 files without any issues:

- Existing software that recognises `<course>` and `<speed>` in GPX 1.0 files will almost certainly recognise them in GPX 1.1.1 files.
- Existing software that recognises `<src>` elements will also recognise them fine in GPX 1.1.1 due to the use of mixed content.
- Existing software does not appear to rely upon the GPX version being either "1.0" or "1.1", so far as I have been able to ascertain.

Preliminary GPX 1.1.1 testing has been successful in several applications. Both `<course>` and `<speed>` were loaded successfully into the following speedsurfing applications, and GPX 1.1.1 files could be imported to Strava:

- [GPSResults](https://www.gps-speed.com/)
- [GpsarPro](http://gpsactionreplay.free.fr/)
- [GPS Speedreader](https://ecwindfest.org/GPS/GPSSpeedreader.html)
- [Strava](https://strava.com/)

n.b. Strava does not (currently) make use of the `<speed>` elements in GPX files and it simply calculates speed from the positional data. This results in large inconsistencies with sessions posted to websites such as [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/) or [GPS Team Challenge](https://www.gpsteamchallenge.com.au/). The use of position-derived speeds typically results in a boost of max speeds and often results in large spikes being reported as the max speed.



### Summary of GPX 1.1.1

The GPX 1.1.1 proposal has been described at some length but can be summarised as follows:

- Addition of `<course>`, `<speed>` in a way that is consistent with GPX 1.0.
  - Most existing software that can utilise `<course>` and `<speed>` in GPX 1.0 files will almost certainly recognise them in GPX 1.1.1.
- Addition of accuracy estimates in a way that is consistent with GPX 1.0 and 1.1 items such as "horizontal dilution of precision", etc.
  - Accuracy estimates will not interfere with existing apps but can be obviously used by applications that understand their utility.
- Addition of device / source information via the existing `<src>` elements.
  - Use of [mixed content](https://www.w3schools.com/xml/schema_complex_mixed.asp) ensures forwards and backwards compatibility with existing software and applications.
- Existing GPX 1.1 compliant files are also GPX 1.1.1 compliant, simply by changing the `<gpx>` attributes (e.g. schema and version).
  - Existing software need only tweak the `<gpx>` element for GPX 1.1.1 if they want to start including `<course>` and `<speed>`.

So, that's pretty much everything in quite a lot of detail, perhaps more detail than strictly necessary!

My apologies for the total length of this proposal, but I felt it worth covering the "[who, what, when, where, why, and how](https://en.wikipedia.org/wiki/Five_Ws)".

Please join the [GPX developers forum](https://groups.io/g/gpx) if you wish discuss this proposal and / or provide any feedback. Many thanks!

