## GPS Exchange Format (GPX)

### Introduction

[GPX](https://www.topografix.com/gpx.asp), or GPS Exchange Format, is an XML schema hosted by Topografix as a common GPS data format for software applications. GPX comes in two main flavors with schema defining the structure and content; [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) and [GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd).

Proper use of the GPX format and compliance with the official schema are essential if attributes such as speed are to be used by popular applications such as [GPSResults](https://www.gps-speed.com/) and [GpsarPro](http://www.gpsactionreplay.com/). This is particularly important because speed calculations from positional data alone are highly suspectable to errors.

A separate page discussing ["Doppler speed"](speed.md) in GPX files provides a brief overview about why it is so important that the "doppler speed" originally calculated by the GNSS chip is recorded correctly. If not recorded correctly in the GPX file, subsequent speed analysis may be forced to perform calculations using the positional data which is highly susceptible to spurious speeds, AKA "spikes".



### GPX 1.0

[GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) was released in 2002 and is still suitable for the majority of GPS-Speedsurfing applications.

The GPX 1.0 schema includes support for `<course>` (course over ground) and `<speed>` (speed over ground):

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <course>157.19</course>
  <speed>0.5429</speed>
  <sat>6</sat>
  <hdop>1.4</hdop>
</trkpt>
```

[GpsarPro](http://www.gpsactionreplay.com/), [GPSResults](https://www.gps-speed.com/) and [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/) all support GPX 1.0, including the `<course>` and `<speed>` elements.



### GPX 1.1

[GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd) was released on 9 August 2004 and improved upon the GPX 1.0 standard, introducing support for `<extensions>`.

Unfortunately the `<speed>` and `<course>` elements were accidentally removed from GPX 1.1, necessitating the use of `<extensions>`.

It was not until some time around 2015 when Garmin released a GPX extension [schema](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) that supported speed and course.

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>60</gpxtpx:hr>
      <gpxtpx:speed>0.5429</gpxtpx:speed>
      <gpxtpx:course>157.19</gpxtpx:course>
    </gpxtpx:TrackPointExtension>
  </extensions>
</trkpt>
```

Note: The example above also includes `<gpxtpx:hr>`, simply to illustrate how heart rate can also be included in GPX 1.1.

Another approach that can sometimes be seen is the use of an element called `<gpxdata:speed>`. 

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxdata:speed>0.5429</gpxdata:speed>
  </extensions>
</trkpt>
```

Whilst speed is not defined in the ClueTrust schema, `<gpxdata:speed>` does not cause validation issues, because the GPX 1.1 schema uses `processContents="lax"` for elements within `<extensions>`.



### Validation

One of the great benefits of an XML file is that it can be validated against a schema.

Validation is deemed significant enough for it to have been listed as the first requirement on the page "[GPX for Developers](https://www.topografix.com/gpx_for_developers.asp)".

#### Validation from the Command Line

Topografix provide the page "[Validating your GPX output](https://www.topografix.com/gpx_validation.asp)" which describes why you should validate GPX output and how to validate it.

I installed the recommended SAXCount tool into my Ubuntu environment using the following command:

```sh
$ sudo apt install libxerces-c-samples
```

Validation of a single GPX file can then be performed as follows:

```sh
$ SAXCount -v=always -n -s -f example.gpx
```

Note: Using SAXCount in this way will guarantee full validation with namespace processing, schema processing and full schema constraint checking but it will not check the use of schema extensions.

#### Validation using Online Tools

Free online validation tools also exist where you can copy/paste XML data and the associated schema for validation:

One of the better ones is the XML Validator at [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html) which supports online XSD files, although it does not handle [301](https://en.wikipedia.org/wiki/HTTP_301) redirects. This can be worked around by specifying the actual URL of the XSD file, typically HTTPS.

Note: Use of online tools will typically guarantee full validation against the GPX schema but they will not always check the use of extensions. Online tools often won't verify the `xsi:schemaLocation` attribute of the GPX file so errors may go unnoticed (e.g. Garmin specify the wrong URL for the XSD). You should try some invalid use of extensions to determine what is being validated.



### GPX Header

The root element in the GPX file is `<gpx>` is quite crucial and as it makes validation against the GPX schema possible.

#### GPX 1.0

This is a valid `<gpx>` element for a GPX 1.0 file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0
                         https://www.topografix.com/GPX/1/0/gpx.xsd">
```

#### GPX 1.1

This is a valid `<gpx>` element for a GPX 1.1 file which is using the TrackPointExtension schema:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         https://www.topografix.com/GPX/1/1/gpx.xsd
                         http://www.garmin.com/xmlschemas/TrackPointExtension/v2
                         https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
```

The additional namespaces in a GPX 1.1 document are given a prefix (e.g. "gpxtpx" as above) but these may vary. For example, Garmin Connect typically uses "ns3", whereas other software often use "gpxtpx" for TrackPointExtension.



### Extensions

#### TrackPointExtension

Garmin's latest trackpoint extension is v2 (circa 2015). It introduced "speed", "course" and "bearing":

- TrackPointExtension v2 - http://www.garmin.com/xmlschemas/TrackPointExtension/v2 - [TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)

The original version of TrackPointExtension (circa 2009) is still being used by various pieces of software:

- TrackPointExtension v1 - http://www.garmin.com/xmlschemas/TrackPointExtension/v1 - [TrackPointExtensionv1.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd)



#### GpxExtensions

The following Garmin GPX extensions (circa 2006) have all been superseded by TrackPointExtension v1 + v2:

- GpxExtensions v3 - http://www.garmin.com/xmlschemas/GpxExtensions/v3 - [GpxExtensionsv3.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd)
- GpxExtensions v2 - http://www.garmin.com/xmlschemas/GpxExtensions/v2 - [GpxExtensionsv2.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv2.xsd)
- GpxExtensions v1 - removed from the web



#### ClueTrust

The extension by ClueTrust is also popular and sometimes used for the `<gpxdata:speed>` hack:

- GPXDATA - http://www.cluetrust.com/XML/GPXDATA/1/0 - [gpxdata10.xsd](https://www.cluetrust.com/Schemas/gpxdata10.xsd)



### Element Names

This should be obvious but the correct element names should always be used within the GPX file.

It's not uncommon to see a manufacturer use the wrong names; e.g. `<cog>` instead of `<course>` in GPX files produced by COROS.

The correct element names can be determined by checking the appropriate schema; [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) or [GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd)



### Element Order

This point is not so obvious but the order of elements is often important.

Search the GPX schema for `xsd:sequence` and you will see which elements must be in a specific order / sequence.

All elements within `<trkpt>` must adhere to the sequence specified in the schema:

- [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) - ele, time, course, speed ... sat, hdop, etc.
- [GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd) - ele, time ... sat, hdop, etc.

Note: It is the shared "wptType" of GPX 1.1 which resulted in "course" and "speed" being removed from the "trkpt" element.



### Course and Speed

If you are using GPX 1.0 then it is easy to include `<course>` and `<speed>`:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <course>157.19</course>
  <speed>0.5429</speed>
  <sat>6</sat>
  <hdop>1.4</hdop>
</trkpt>
```

If you are using GPX 1.1 then you probably need to use TrackPointExtension v2: 

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>60</gpxtpx:hr>
      <gpxtpx:speed>0.5429</gpxtpx:speed>
      <gpxtpx:course>157.19</gpxtpx:course>
    </gpxtpx:TrackPointExtension>
  </extensions>
</trkpt>
```

Under specific circumstances you may use `<gpxdata:speed>`, so long as the `gpxdata` namespace is properly defined:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <gpxdata:speed>0.5429</gpxdata:speed>
  </extensions>
</trkpt>
```

Full details about the subtleties of course and speed in GPX 1.1 files are covered in a separate [document](speed.md).



### Software Providers + Hardware Manufacturers

Individual pages describe the GPX compliancy issues specific to individual applications and devices:

- [COROS](issues/coros.md) - GPX 1.1 but needs fixes
- [Garmin](issues/garmin.md) - GPX 1.1 but needs fixes
- [GPSBabel](issues/gpsbabel.md) - GPX 1.0
- [GPSResults](issues/gpsresults.md) - GPX 1.0 but needs fixes
- [GpsarPro](issues/gpsar.md) aka GPSAR - GPX 1.0 but needs fixes
- [Waterspeed](issues/waterspeed.md) - GPX 1.1 but needs fixes
- [WindsportTracker](issues/windsport.md) aka WST - GPX 1.0 but needs fixes



The following applications and devices are GPX 1.0 compliant:

- [ESP-GPS](issues/esp-gps.md) - could use spaces for indentation
- [Motion](issues/motion.md) - could use spaces for indentation
- [RealSpeed](issues/realspeed.md) - although it does not include `<ele>`, `<course>`, `<speed>`, `<sat>` or `<hdop>`



The following applications are GPX 1.1 compliant:

- [Hoolan](issues/hoolan.md) - although it does not include `<ele>` or `<gpxtpx:course>`
- [Sailmon](issues/sailmon.md) - although it does not include `<ele>`, `<gpxtpx:speed>`, `<gpxtpx:course>`



There is a separate [page](issues/README.md) with a summary of all these applications and devices. 
