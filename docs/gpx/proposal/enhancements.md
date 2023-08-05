## Proposal for GPX


### Enhancements to GPX 1.1

Shortly after drafting the [TrackPointExtras](../../xmlschemas/tpx/1/0/README.md) schema, I started to contemplate whether it should actually become part of the GPX standard.

This proposal is pretty simple, basically to incorporate the extensions from the [TrackPointExtras](../../xmlschemas/tpx/1/0/README.md) schema into the existing GPX 1.1 schema:

- Re-introduce `<course>` and `<speed>`, fully compatible with GPX 1.0.
- Introduce the accuracy estimates provided by numerous GPS / GNSS chipsets and [location](../../apis/location.md) services (e.g. [Apple](https://developer.apple.com/documentation/corelocation/cllocation) and [Android](https://developer.android.com/reference/android/location/Location)).
- Additional source information;  e.g. `<manufacturer>`, `<product>`, `<serial>`, and `<version>` in  `<device>` elements.
- There is a reasonable argument for calling this GPX 1.1.1 as it is a small release in it's own right that does not replace well established extensions.
- There are absolutely no breaking changes / compatibility issues with GPX 1.1.



### Example Schema for GPX 1.1.1

I have created an example schema for discussion purposes:

- The example schema is available on [GitHub](https://github.com/Logiqx/gps-wizard/blob/main/docs/xmlschemas/gpx/proposal.xsd) but as stated, it is simply a proposal and should not be used for anything other than general discussion.
- The proposal incorporates the [TrackPointExtras](../../xmlschemas/tpx/1/0/README.md) into GPX 1.1, with slimmed down comments in keeping with the existing GPX 1.1 schema.

After further discussion on the [GPX developers forum](https://groups.io/g/gpx) (and subsequent tweaking of the proposal), the GPX 1.1.1 schema would also benefit from consistent use of whitespace, which is currently a mix of tabs and spaces.

