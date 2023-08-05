## Proposal for GPX

### History of GPX 1.1

GPX 1.0 was released in 2002 as a light-weight XML data format for the interchange of GPS data.

GPX 1.1 was released on 9 August 2004 and improved upon the existing GPX 1.0 standard. Notable changes were the introduction of `<extensions>` and a number of existing elements that were previously under `<gpx>` that were tweaked and moved into the `<metadata>` element.

Waypoints, routes and tracks were largely unchanged in GPX 1.1, aside from `<url>` elements being replaced by `<link>` elements and the introduction of `<extensions>`. However, `<course>` and `<speed>` were inadvertently dropped from the `<trkpt>` elements.

The majority of software that can import GPX 1.0 files can also import GPX 1.1 files since they are so similar. If `<course>` and `<speed>` are included in GPX 1.1 files they are typically recognised by software that already supports them in GPX 1.0 files.



### GPX 1.1 Extensions

#### Garmin Extensions

Garmin have released a number of extension schemas for GPX 1.1 over the years, initially including "GpxExtensions" (see [v2](https://www8.garmin.com/xmlschemas/GpxExtensionsv2.xsd) and [v3](https://www8.garmin.com/xmlschemas/GpxExtensionsv3.xsd)).

The GpxExtensions schema was subsequently split up into separate extensions, e.g. TrackPointExtension (see [v1](https://www8.garmin.com/xmlschemas/TrackPointExtensionv1.xsd) and [v2](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd)).

It is notable that TrackPointExtension v2 (circa 2015) introduced `<speed>`, `<course>` and `<bearing>`, providing a "proper" way to include course and speed in GPX 1.1 files.

Sadly, adoption of TrackPointExtension v2 for `<course>` and `<speed>`  in GPX 1.1 files is not evident for the big brands (e.g. Garmin, Suunto, COROS) or within 3rd party apps for smartphones and smartwatches.

#### TrackPointExtras (TPX)

The [TPX](../../xmlschemas/tpx/1/0/README.md) schema was created in July 2023, primarily for sports and activities that depend upon course, speed and accuracy estimates (see [v1.0](../../xmlschemas/tpx10.xsd)).

The extension schema includes `<course>`, `<speed>`, `<roc>` (rate of climb), plus various accuracy estimates for use within `<trkpt>` `<extensions>`.

It also includes additional `<src>` information for the `<device>` such as `<manufacturer>`, `<product>`, `<serial>`, `<version>`, etc.



### Issues with GPX 1.1 and Extensions

One of the issues with the use of extensions for common elements such as `<course>` and `<speed>` is the lack of consistency:

- Most applications do not include `<course>` and `<speed>` in their GPX exports. This includes big brands and 3d party app developers.
- Some applications include `<course>` and `<speed>` in the `<trkpt>` elements (not `<extensions>`) which is helpful, but it is not GPX 1.1 compliant.
- Some applications make use of `<extensions>` but often refer to non-existent or undeclared schemas / namespaces - e.g. `<gpxdata:speed>`
- Few (if any) applications use Garmin's TrackPointExtension V2 schema to include `<course>` and `<speed>` in GPX 1.1 files.
- To add further confusion, some apps generate multiple variations of GPX files such as [Waterspeed](https://waterspeedapp.com/) which currently offers 4 different GPX exports!

I wrote about the [GPX format](../README.md) and provided further details about [speed in GPX files](../speed.md) earlier in 2023, whilst investigating GPX compatibility issues affecting the speedsurfing community.


