## Proposal for GPX


### Enhancements to GPX 1.1

Shortly after drafting the [TrackPointExtras](../../xmlschemas/tpx/1/0/README.md) schema, I started to contemplate whether it should actually become part of the GPX standard.

It is very easy for a developer to overlook the importance of Doppler-derived speed provided by GPS / GNSS chips, since it is not part of the GPX 1.1 standard. The natural inclination is to assume that speed can be regenerated from the positional data. However, this assumption doesn't hold true because position and speed are calculated independently.

This proposal is pretty simple, basically to incorporate the extensions from the [TrackPointExtras](../../xmlschemas/tpx/1/0/README.md) schema into the existing GPX 1.1 schema:

- Re-introduce `<course>` and `<speed>`, fully compatible with GPX 1.0.
- Introduce the accuracy estimates provided by numerous GPS / GNSS chipsets and [location](../../apis/location.md) services (e.g. Apple and Android). **\***
- Additional source information;  e.g. `<manufacturer>`, `<product>`, `<serial>`, and `<version>` in  `<device>` elements.
- There is a reasonable argument for calling this GPX 1.1.1 as there are absolutely no breaking changes / compatibility issues with GPX 1.1.

**\*** - what the accuracy estimates actually represent and their applications is outside of the scope of this document. Suffice to say, they typically represent the likely error (+/-) in terms or RMS, or 1-sigma / 68% (and sometimes, 3-sigma / 99.7%). They are device dependent, hence the additional `<src>` source information in this proposal.



### Example Schema for GPX 1.1.1

I have created an example schema for discussion purposes:

- The example schema is available on [GitHub](https://github.com/Logiqx/gps-wizard/blob/main/docs/xmlschemas/gpx/proposal.xsd) but as stated, it is simply a proposal and should not be used for anything other than general discussion.
- The proposal incorporates the [TrackPointExtras](../../xmlschemas/tpx/1/0/README.md) into GPX 1.1, with slimmed down comments in keeping with the existing GPX 1.1 schema.

After further discussion on the [GPX developers forum](https://groups.io/g/gpx) (and subsequent tweaking of the proposal), the GPX 1.1.1 schema would also benefit from consistent use of whitespace, which is currently a mix of tabs and spaces.

