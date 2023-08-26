## GPX Proposal

### Garmin Testing

This document summarises  the behavior of Garmin's applications when importing GPX files

It is very much work in progress, and is being written on-the-fly.



### Garmin BaseCamp

These findings are based on modification to a fairly simple  GPX file, tweaking the `<gpx>` attributes and the contents of a single`<trkpt>` element.

To summarise:

- BaseCamp is pretty lax when importing GPX 1.0 files, but it is strict when importing GPX 1.1 files.
- `xmlns` must be either `"http://www.topografix.com/GPX/1/0"` or `"http://www.topografix.com/GPX/1/1"`
  - GPX 1.0
    - `version` is ignored when `xmlns="http://www.topografix.com/GPX/1/0"`
    - Additional elements can be placed almost anywhere in the GPX files, without them being declared in XSD files
  - GPX 1.1
    - `version` must be `"1.1"` when `xmlns="http://www.topografix.com/GPX/1/1"`
    - Additional elements cannot be placed anywhere in the GPX files, without them being part of the GPX 1.1 standard
    - The content of `<extensions>` can be pretty much anything, since the extension schema(s) are ignored
- `xmlns:something` doesn't need to refer to a valid location
- `xsi:schemaLocation` is completely ignored, even if it refers to a valid URL for the schema(s)
- Restrictions are always enforced - e.g. `<fix>` only allows values of `none`, `2d`, `3d`, `dgps`, or `pps`
  - This means that it's not possible to extend them for things like `float`, `rtk`, `dr` as has been [suggested](fix-type.md).

- Despite these issues, there may be a possible workaround, described at the end of this document.



#### GPX 1.0

The GPX 1.0 validator is not particularly strict.

It allows the following misdemeanors in GPX 1.0 files:

- Version can be a value other than 1.0
- Undefined elements can be included - e.g. `<metadata>` and `<tbc>`

This file is not GPX 1.0 compliant, but it can be successfully imported into BaseCamp:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<gpx 
version="1.9"
creator="Waterspeed"
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

- Version cannot be a value other than 1.1
- Undefined elements cannot be included - e.g. `<tbc>`

This file is GPX 1.1 compliant, and can be successfully imported into BaseCamp:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<gpx 
version="1.1"
creator="Waterspeed"
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
- `<tbc>` element in the GPX 1.0 example had to be removed in the GPX 1.1 file

Notes:

- Changing `<fix>` to anything other than the supported values results in an import error - e.g. `<fix>rtk</fix>`.



### GPX 1.1.1 / 1.2 / 2.0

BaseCamp will only import GPX files when  `xmlns` is `"http://www.topografix.com/GPX/1/0"` or `"http://www.topografix.com/GPX/1/1"`.

This is problematic because you can't refer to enhanced versions of the GPX standard:

- `xmlns="http://www.topografix.com/GPX/1/1/1"`
- `xmlns="http://www.topografix.com/GPX/1/2"`
- `xmlns="http://www.topografix.com/GPX/2/0"`

There is a potential workaround to load newer versions of GPX files into BaseCamp :

- `xmlns="http://www.topografix.com/GPX/1/0"` allows for pretty much any XML elements, in any order!
  - This is obviously a horribly ugly hack, but this one-liner would allow GPX 1.1.1 / 1.2 / 2.0 files to be imported into BaseCamp.
  - The GPX version number could still be set as appropriate - e.g. `version="1.1.1"`, it would just be the `xmlns` that would be misleading.
  - `xsi:schemaLocation` can specify the correct location(s) of any XSD file(s) - both the core GPX schema and any extensions.

The workaround is a little ugly, but longer term Garmin could perhaps change their products to use the GPX 1.0 loader when another namespace is encountered - e.g. `xmlns="http://www.topografix.com/GPX/1/1/1"`.
