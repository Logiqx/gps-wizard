## GPS Exchange Format (GPX)

### Introduction

[GPX](https://www.topografix.com/gpx.asp), or GPS Exchange Format, is an XML schema created by Topografix as a common GPS data format for software applications. GPX comes in two main flavors with schema defining the structure and content; [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) and [GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd).

Proper use of the GPX format and compliance with the official schema are essential if attributes such as speed are to be used by popular applications such as [GPSResults](https://www.gps-speed.com/) and [GpsarPro](http://www.gpsactionreplay.com/). This is particularly important because speed calculations from positional data alone are highly suspectable to errors.

A separate page discussing ["Doppler speed"](speed.md) in GPX files provides a brief overview about why it is so important that the "doppler speed" originally calculated by the GNSS chip is recorded correctly. If not recorded correctly in the GPX file, subsequent speed analysis may be forced to perform calculations using the positional data which is highly susceptible to spurious speeds, AKA "spikes".



### GPX 1.0

[GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) was released in 2002 and is still suitable for the majority of GPS-Speedsurfing applications.

The GPX 1.0 schema includes support for "course" (course over ground) and "speed" (e.g. "doppler speed"):

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

[GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd) was released on 9 August 2004 and improved upon the GPX 1.0 standard, introducing support for extensions.

Sadly, GPX 1.1 removed "speed" and "course". This may have been an oversight or perhaps their significance was not appreciated at the time.

It was not until around 2015 when Garmin finally re-introduced "speed" and "course" in version 2 of their [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema.

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

Note: The example above also includes `<gpxtpx:hr>` (heartrate) to illustrate how that would be included.

In July 2023, I created the [TrackPointExtras](../xmlschemas/TrackPointExtras/v1/README.md) schema for use with GPX 1.1, adding "course", "speed" and accuracy estimates:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <tpx:extras>
      <tpx:course>157.19</tpx:course>
      <tpx:speed>0.5429</tpx:speed>
      <tpx:hacc>2.0</tpx:hacc>
      <tpx:vacc>4.0</tpx:vacc>
      <tpx:cacc>5.0</tpx:cacc>
      <tpx:sacc>0.5</tpx:sacc>
    </tpx:extras>
  </extensions>
</trkpt>
```



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

- XML Validator at [freeformatter.com](https://www.freeformatter.com/xml-validator-xsd.html)
- XML Validator at [liquid-technologies.com](https://www.liquid-technologies.com/online-xsd-validator)

Note: Using these online tools will typically guarantee full validation with namespace processing, schema processing and full schema constraint checking but they will not check the use of extension schema. The online tools won't verify the xsi:schemaLocation attribute of the GPX file so any errors in that may go unnoticed (e.g. Garmin specify the wrong URL for the XSD).



### GPX Header

The root element in the GPX file is `<gpx>` and it is important that this is correctly populated for the validation against a schema to be possible.

#### GPX 1.0

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
```

#### GPX 1.1

GPX 1.1 using the TrackPointExtension schema:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd
        http://www.garmin.com/xmlschemas/TrackPointExtension/v2 http://www.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
```

The additional namespaces in a GPX 1.1 document are given a prefix (e.g. "gpxtpx" as above) but these may vary. For example, Garmin sometimes uses "ns3" and sometimes uses "gpxtpx" for TrackPointExtension.

GPX 1.1 using the TrackPointExtras schema is a necessity if speed accuracy estimates are to be included:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:tpx="http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtras/v1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         http://www.topografix.com/GPX/1/1/gpx.xsd
                         http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtras/v1
                         http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtrasV1.xsd">
```

All software that can read GPX 1.1 files using the TrackPointExtension or TrackPointExtras schemas should be careful not rely upon / expect the use of a specific prefix.



### Extensions

The following Garmin GPX extensions (circa 2006) have now been superseded by TrackPointExtension v1 + v2:

- GpxExtensions v2 - [http://www.garmin.com/xmlschemas/GpxExtensions/v2](http://www.garmin.com/xmlschemas/GpxExtensions/v2) + [GpxExtensionsv2.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv2.xsd)
- GpxExtensions v3 - [http://www.garmin.com/xmlschemas/GpxExtensions/v3](http://www.garmin.com/xmlschemas/GpxExtensions/v3) + [GpxExtensionsv3.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd)

The following Garmin trackpoint extension (circa 2009) has also been superseded by TrackPointExtension v2:

- TrackPointExtension v1 - [http://www.garmin.com/xmlschemas/TrackPointExtension/v1](http://www.garmin.com/xmlschemas/TrackPointExtension/v1) +  [TrackPointExtensionv1.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd)

The latest Garmin trackpoint extension is v2 (circa 2015). It added "speed", "course" and "bearing" to TrackPointExtension v1:

- TrackPointExtension v2 - [http://www.garmin.com/xmlschemas/TrackPointExtension/v2](http://www.garmin.com/xmlschemas/TrackPointExtension/v2) + [TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)

Note: TrackPointExtension v2 is the only "legitimate" way to include "speed" and "course" in a GPX 1.1 file.

Other useful Garmin extensions include:

- TrackStatsExtension - [http://www.garmin.com/xmlschemas/TrackStatsExtension/v1](http://www.garmin.com/xmlschemas/TrackStatsExtension/v1)

The TrackPointExtras schema was created in July 2023. It added "speed", "course" and elements for the various accuracy estimates:

- TrackPointExtras v1 - [https://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtras/v1/](https://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtras/v1/) + [TrackPointExtrasV1.xsd](http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtrasV1.xsd)



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

If you are using GPX 1.0 then it is easy to include course and speed:

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

If you are using GPX 1.1 then you need to use TrackPointExtension v2: 

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

Alternatively, you can use TrackPointExtras v1:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <tpx:extras>
      <tpx:course>157.19</tpx:course>
      <tpx:speed>0.5429</tpx:speed>
    </tpx:extras>
  </extensions>
</trkpt>
```

Full details about the subtleties of course and speed in a GPX 1.1 file are covered in a separate [page](speed.md).



### Software Providers + Hardware Manufacturers

Individual pages describe the GPX compliancy issues specific to individual software providers and hardware manufacturers:

- [COROS](issues/coros.md)
- [Garmin](issues/garmin.md)
- [GPSBabel](issues/gpsbabel.md)
- [GPSResults](issues/gpsresults.md)
- [GPSAR](issues/gpsar.md) aka GpsarPro
- [Waterspeed](issues/waterspeed.md) - WIP



The following software providers and hardware manufacturers are GPX 1.0 compliant:

- [Motion](issues/motion.md)
- [RealSpeed](issues/realspeed.md)
