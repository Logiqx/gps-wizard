## GPX Proposal

### Garmin Testing

This document summarises  the behavior of BaseCamp and MapSource when importing / loading GPX files:

- BaseCamp and MapSource will only import / load files referencing the GPX 1.0 or 1.1 namespaces.
  - i.e. `xmlns="http://www.topografix.com/GPX/1/0"` or `xmlns="http://www.topografix.com/GPX/1/1"`

- BaseCamp is very relaxed when importing GPX 1.0 files, but very strict when importing GPX 1.1 files.
  - The relaxed GPX 1.0 import of BaseCamp can be used as a simple workaround for files conforming to GPX 1.1.1 / 1.2 / 2.0.

- MapSource is equally strict for GPX 1.0 and GPX 1.1 files. It is however an old product that was last updated in October 2010.
  - GPX 1.1.1 / 1.2 / 2.0 files would need to be converted to GPX 1.0 or 1.1 using a tool such as GPSBabel.




### Garmin BaseCamp

These findings are based on modification to a fairly simple  GPX file, tweaking the `<gpx>` attributes and the contents of a single`<trkpt>` element.

To summarise:

- BaseCamp appears to have two GPX loaders, one is very relaxed and one is very strict.
  - BaseCamp is very relaxed when importing GPX 1.0 files, but it is very strict when importing GPX 1.1 files.

- `xmlns` must be either `"http://www.topografix.com/GPX/1/0"` or `"http://www.topografix.com/GPX/1/1"`
  - GPX 1.0
    - `version` is ignored when `xmlns="http://www.topografix.com/GPX/1/0"`
    - GPX 1.0 elements can appear in any order
    - Additional elements can be placed almost anywhere in the GPX files, without them being declared in XSD files
  - GPX 1.1
    - `version` must be `"1.1"` when `xmlns="http://www.topografix.com/GPX/1/1"`
    - GPX 1.1 elements must appear in the order specified by the XSD
    - Additional elements cannot be placed anywhere in the GPX files, without them being part of the GPX 1.1 standard
    - The content of `<extensions>` can be pretty much anything, since the extension schema(s) are ignored
- `xmlns:extension` doesn't need to refer to a valid location
- `xsi:schemaLocation` is completely ignored, even if it refers to a valid URL for the schema(s)
- Restrictions are always enforced - e.g. `<fix>` only allows values of `none`, `2d`, `3d`, `dgps`, or `pps`
  - This means that it's not possible to extend them for things like `float`, `rtk`, `dr` as has been [suggested](fix-type.md).

- Despite these issues, there may be a possible workaround, described at the end of this document.



#### GPX 1.0

The GPX 1.0 validator is not particularly strict.

It allows the following misdemeanors in GPX 1.0 files:

- Version can be a value other than 1.0
- GPX 1.0 elements can appear in any order
- Undefined elements can be included - e.g. `<metadata>`,`<tbc>` and `<extensions>` in the example below

This file is not GPX 1.0 compliant, but it can be successfully imported into BaseCamp:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<gpx 
version="1.9"
creator="Some App"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns="http://www.topografix.com/GPX/1/0"
xmlns:ns3="http://www.tbc.com/xmlschemas/TrackPointExtension/TBC"
xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.tbc.com/xmlschemas/GPX/TBC">
  <metadata>
    <time>2022-10-29T12:55:24.000Z</time>
  </metadata>
  <trk>
    <name>Waterspeed Activity 450bce8c-04cc-4dfc-8360-a55aade3f1c8</name>
    <trkseg>
      <trkpt lat="50.5712812557" lon="-2.4565191617">
        <ele>0</ele>
        <time>2022-10-29T12:55:52.000Z</time>
        <tbc>???</tbc>
        <fix>2d</fix>
        <extensions>
          <ns3:TrackPointExtension>
            <ns3:tbc>74</ns3:tbc>
          </ns3:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```

Issues in the example above include:

- `<gpx>`
  - `version="1.9"`, instead of `"1.0"`
  - `xmlns:ns3` refers to a schema without a location
  - `xsi:schemaLocation` refers to an invalid XSD and does not declare the schema for xmlns:ns3
- `<metadata>` element is not valid, certainly not in that location
- `<tbc>` element is not valid, certainly not in that location

Notes:

- Changing `<fix>` to anything other than the supported values results in an import error - e.g. `<fix>rtk</fix>`.



#### GPX 1.1

The GPX 1.1 validator is much stricter than for GPX 1.0.

It does not allow misdemeanors that are possible in GPX 1.0 files:

- Version cannot be any value other than 1.1
- GPX 1.1 elements must appear in the order specified by the XSD
- Undefined elements cannot be included - e.g. `<tbc>`

This file is not quite GPX 1.1 compliant (namespace / schema location issues), but can be successfully imported into BaseCamp:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<gpx 
version="1.1"
creator="Some App"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns="http://www.topografix.com/GPX/1/1"
xmlns:ns3="http://www.tbc.com/xmlschemas/TrackPointExtension/TBC"
xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.tbc.com/xmlschemas/GPX/TBC">
  <metadata>
    <time>2022-10-29T12:55:24.000Z</time>
  </metadata>
  <trk>
    <name>Waterspeed Activity 450bce8c-04cc-4dfc-8360-a55aade3f1c8</name>
    <trkseg>
      <trkpt lat="50.5712812557" lon="-2.4565191617">
        <ele>0</ele>
        <time>2022-10-29T12:55:52.000Z</time>
        <fix>2d</fix>
        <extensions>
          <ns3:TrackPointExtension>
            <ns3:tbc>74</ns3:tbc>
          </ns3:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```

Issues in the example above include:

- `<gpx>`
  - `xmlns:ns3` refers to a schema without a location
  - `xsi:schemaLocation` refers to an invalid XSD and does not declare the schema for xmlns:ns3

Notes:

- `<tbc>` element in the GPX 1.0 example had to be removed in the GPX 1.1 file.
- Changing `<fix>` to anything other than the supported values results in an import error - e.g. `<fix>rtk</fix>`.



#### GPX 1.1.1 / 1.2 / 2.0

BaseCamp will only import GPX files when  `xmlns` is `"http://www.topografix.com/GPX/1/0"` or `"http://www.topografix.com/GPX/1/1"`.

This is problematic because you can't refer to future versions of the GPX standard, even with a suitable `xsi:schemaLocation` defined:

- `xmlns="http://www.topografix.com/GPX/1/1/1"`
- `xmlns="http://www.topografix.com/GPX/1/2"`
- `xmlns="http://www.topografix.com/GPX/2/0"`

However, there is a simple workaround to load newer versions of GPX files into BaseCamp :

- `xmlns="http://www.topografix.com/GPX/1/0"` allows for pretty much any XML elements, in any order!
  - This is obviously a horribly ugly hack, but this one-liner would allow GPX 1.1.1 / 1.2 / 2.0 files to be imported into BaseCamp.
  - `<speed>` and `<course>` could potentially be utilised by the Garmin software, since they are in the same place as GPX 1.0.
  - The GPX version number could still be set as appropriate - e.g. `version="1.1.1"`, it would just be the `xmlns` that would be misleading.
  - `xsi:schemaLocation` can specify the correct location(s) of any XSD file(s) - both the core GPX schema and any extensions.

The workaround is a little ugly but in the medium-term, Garmin could perhaps tweak their products to use the "relaxed" GPX 1.0 loader when another namespace (or version) is encountered - e.g. `xmlns="http://www.topografix.com/GPX/1/1/1"`.



### Garmin MapSource

#### GPX 1.0

The GPX 1.0 loader of MapSource is much stricter than the GPX 1.0 import of BaseCamp.

The loader does not allow the misdemeanors that are allowed by BaseCamp:

- Version cannot be any value other than 1.0
- GPX 1.0 elements must appear in the order specified by the XSD
- Undefined elements cannot be included

This file is not quite GPX 1.0 compliant (namespace / schema location issues), but can be successfully imported into MapSource:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<gpx 
version="1.0"
creator="Some App"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns="http://www.topografix.com/GPX/1/0"
xmlns:ns3="http://www.tbc.com/xmlschemas/TrackPointExtension/TBC"
xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.tbc.com/xmlschemas/GPX/TBC">
  <trk>
    <name>Waterspeed Activity 450bce8c-04cc-4dfc-8360-a55aade3f1c8</name>
    <trkseg>
      <trkpt lat="50.5712812557" lon="-2.4565191617">
        <ele>0</ele>
        <time>2022-10-29T12:55:52.000Z</time>
        <fix>2d</fix>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```

Issues in the example above include:

- `<gpx>`
  - `xmlns:ns3` refers to a schema without a location
  - `xsi:schemaLocation` refers to an invalid XSD and does not declare the schema for xmlns:ns3

Notes:

- `<metadata>`, `<tbc>` and `<extensions>` elements in the BaseCamp example had to be removed from this GPX 1.1 file.
- Changing `<fix>` to anything other than the supported values results in an import error - e.g. `<fix>rtk</fix>`.



#### GPX 1.1

The GPX 1.1 loader in MapSource is just as strict as the GPX 1.0 loader.

It does not allow misdemeanors that are allowed by BaseCamp in GPX 1.0 files:

- Version cannot be any value other than 1.1
- GPX 1.1 elements must appear in the order specified by the XSD
- Undefined elements cannot be included - e.g. `<tbc>`

This file is not quite GPX 1.1 compliant (namespace / schema location issues), but can be successfully imported into MapSource:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<gpx 
version="1.1"
creator="Some App"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns="http://www.topografix.com/GPX/1/1"
xmlns:ns3="http://www.tbc.com/xmlschemas/TrackPointExtension/TBC"
xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.tbc.com/xmlschemas/GPX/TBC">
  <metadata>
    <time>2022-10-29T12:55:24.000Z</time>
  </metadata>
  <trk>
    <name>Waterspeed Activity 450bce8c-04cc-4dfc-8360-a55aade3f1c8</name>
    <trkseg>
      <trkpt lat="50.5712812557" lon="-2.4565191617">
        <ele>0</ele>
        <time>2022-10-29T12:55:52.000Z</time>
        <fix>2d</fix>
        <extensions>
          <ns3:TrackPointExtension>
            <ns3:tbc>74</ns3:tbc>
          </ns3:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>
```

Issues in the example above include:

- `<gpx>`
  - `xmlns:ns3` refers to a schema without a location
  - `xsi:schemaLocation` refers to an invalid XSD and does not declare the schema for xmlns:ns3

Notes:

- Changing `<fix>` to anything other than the supported values results in an import error - e.g. `<fix>rtk</fix>`.



#### GPX 1.1.1 / 1.2 / 2.0

MapSource will only import GPX files when  `xmlns` is `"http://www.topografix.com/GPX/1/0"` or `"http://www.topografix.com/GPX/1/1"`.

This is problematic because you can't refer to future versions of the GPX standard, even with a suitable `xsi:schemaLocation` defined:

- `xmlns="http://www.topografix.com/GPX/1/1/1"`
- `xmlns="http://www.topografix.com/GPX/1/2"`
- `xmlns="http://www.topografix.com/GPX/2/0"`

At this time, I cannot see a workaround, other than converting newer formats to GPX 1.0 or 1.1 using a tool such as GPSBabel.

It should also be noted that MapSource is no longer supported by Garmin and has been [superseded](https://wiki.openstreetmap.org/wiki/MapSource) by BaseCamp.

The final version of MapSource was version [6.16.3](https://www8.garmin.com/support/download_details.jsp?id=209) in October 2010.



### Quick Recap

- BaseCamp and MapSource will only import / load files referencing the GPX 1.0 or 1.1 namespaces.
  - i.e. `xmlns="http://www.topografix.com/GPX/1/0"` or `xmlns="http://www.topografix.com/GPX/1/1"`

- BaseCamp is very relaxed when importing GPX 1.0 files, but very strict when importing GPX 1.1 files.
  - The relaxed GPX 1.0 import of BaseCamp can be used as a simple workaround for files conforming to GPX 1.1.1 / 1.2 / 2.0.
- MapSource is equally strict for GPX 1.0 and GPX 1.1 files. It is however an old product that was last updated in October 2010.
  - GPX 1.1.1 / 1.2 / 2.0 files would need to be converted to GPX 1.0 or 1.1 using a tool such as GPSBabel.



### GPX 1.1.1 / 1.2 / 2.0

Files conforming to GPX 1.1.1 would be expected to have a valid GPX header:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Some App"
     version="1.1.1"
     xmlns="http://www.topografix.com/GPX/1/1/1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1/1 http://www.topografix.com/GPX/1/1/1/gpx.xsd">
```

Note: Garmin software ignores `xsi:schemaLocation` but it is good practice to include it in the GPX file.

GPX 1.1.1 files can easily be loaded into BaseCamp, simply by changing the `xmlns` attribute to reference GPX 1.0:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Some Appd"
     version="1.1.1"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1/1 http://www.topografix.com/GPX/1/1/1/gpx.xsd">
```

Whilst this may be wrong, it is a simple way to load a GPX 1.1.1 / 1.2 / 2.0 file into BaseCamp without any further modifications.

In the future, Garmin can potentially support `xmlns="http://www.topografix.com/GPX/1/1/1"` simply by using their "relaxed" GPX import.