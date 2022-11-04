## GPS Exchange Format (GPX)

### Introduction

[GPX](https://www.topografix.com/gpx.asp), or GPS Exchange Format, is an XML schema created by Topografix as a common GPS data format for software applications. GPX comes in two main flavors with schema defining the structure and content; [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) and [GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd).

Proper use of the GPX format and compliance with the official schema are essential if attributes such as speed are to be used by popular applications such as [GPSResults](https://www.gps-speed.com/) and [GpsarPro](http://www.gpsactionreplay.com/). This is particularly important because speed calculations from positional data alone are highly suspectable to errors.

A separate page discussing ["Doppler speed"](speed.md) in GPX files provides a brief overview about why it is so important that the "doppler speed" originally calculated by the GPS receiver is recorded correctly. If not recorded correctly in the GPX file, subsequent speed analysis may be forced to perform calculations using the positional data which is highly susceptible to spurious speeds, AKA "spikes".



### GPX 1.0

[GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) was released in 2002 and is still suitable for the majority of GPS-Speedsurfing applications.

The GPX 1.0 schema includes support for "speed" (e.g. "doppler speed") and "course" (course over ground), unlike vanilla GPX 1.1.

[GpsarPro](http://www.gpsactionreplay.com/), [GPSResults](https://www.gps-speed.com/) and [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/) all support GPX 1.0, including the `<speed>` and `<course>` elements.



### GPX 1.1

[GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd) was released on 9 August 2004 and improved upon the GPX 1.0 standard, introducing support for extensions.

Sadly, GPX 1.1 removed "speed" and "course". This may have been an oversight or perhaps their significance was not appreciated at the time.

It was not until around 2015 when Garmin finally re-introduced "speed" and "course" in version 2 of their [TrackPointExtension](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd) schema.



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

The root element in the GPX file will is `<gpx>` and it is important that this is correctly populated for the validation against a schema to be possible.

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

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:tpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd
        http://www.garmin.com/xmlschemas/TrackPointExtension/v2 http://www.garmin.com/xmlschemas/TrackPointExtensionv2.xsd">
```

The additional namespaces in a GPX 1.1 document are given an prefix (e.g. "tpx" as above) and may vary from one provider to another:

- Garmin tend to use ns3: `xmlns:ns3="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"`
- Other providers often use gpxtpx: `xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"`

All software that can read GPX 1.1 files using the TrackPointExtension schema (or other extension schema) should be careful not rely upon / expect the use of a specific prefix.



### Extensions

The following Garmin GPX extensions (circa 2006) have now been superseded:

- GpxExtensions v2 - [http://www.garmin.com/xmlschemas/GpxExtensions/v2](http://www.garmin.com/xmlschemas/GpxExtensions/v2) + [GpxExtensionsv2.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv2.xsd)
- GpxExtensions v3 - [http://www.garmin.com/xmlschemas/GpxExtensions/v3](http://www.garmin.com/xmlschemas/GpxExtensions/v3) + [GpxExtensionsv3.xsd](https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd)

The following Garmin trackpoint extension (circa 2009) has also been superseded:

- TrackPointExtension v1 - [http://www.garmin.com/xmlschemas/TrackPointExtension/v1](http://www.garmin.com/xmlschemas/TrackPointExtension/v1) +  [TrackPointExtensionv1.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd)

The latest Garmin trackpoint extension is v2 (circa 2015). It added "speed", "course" and "bearing" to v1:

- TrackPointExtension v2 - [http://www.garmin.com/xmlschemas/TrackPointExtension/v2](http://www.garmin.com/xmlschemas/TrackPointExtension/v2) + [TrackPointExtensionv2.xsd](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)

Note: TrackPointExtension v2 is the only "legitimate" way to include "speed" and "course" in a GPX 1.1 file.

Other useful Garmin extensions include:

- TrackStatsExtension - [http://www.garmin.com/xmlschemas/TrackStatsExtension/v1](http://www.garmin.com/xmlschemas/TrackStatsExtension/v1)



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



### Speed

If you are using GPX 1.0 then it is easy to include "speed" and "course".

If you are using GPX 1.1 then you need to use v2 of the trackpoint extension and maybe the "gpxdata:speed" hack.

Full details about the complexities of including speed in a GPX 1.1 file are covered in a dedicated [page](speed.md).



### Software Providers + Hardware Manufacturers

Individual pages list the GPX issues specific to individual software providers and hardware manufacturers:

- [COROS](issues/coros.md)
- [Garmin](issues/garmin.md)
- [GPSBabel](issues/gpsbabel.md)
- [GPSResults](issues/gpsresults.md)
- [GPSAR](issues/gpsar.md) aka GpsarPro
- [Waterspeed](issues/waterspeed.md) - WIP



The following software providers and hardware manufacturers are fine:

- [Motion](issues/motion.md)
- [RealSpeed](issues/realspeed.md)
