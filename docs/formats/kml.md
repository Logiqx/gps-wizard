## KML - Keyhole Markup Language

The KML format is one of the supported output formats of GPS Wizard.

KML only contains the latitude and longitude of track points but they will retain the underlying precision; typically 7 decimal places.

This is mainly intended for anyone who wishes to display GPS tracks in Google Earth, etc.

I also considered using the [FastKML](https://medium.com/@wwaryan/the-definite-only-guide-to-fastkml-58b8e19b8454) library but in the end, just wrote some custom writer code using lxml.



### Relationship to GPX

The significance of `<trkseg>` elements is clarified in the GPX schema:

> A Track Segment holds a list of Track Points which are logically connected in order. To represent a single GPS track where GPS reception was lost, or the GPS receiver was turned off, start a new Track Segment for each continuous span of track data.

So, individual `<trkseg>` elements should be converted to individual `<LineString>` elements when saving a [GPX](gpx.md) track in KML format.

This therefore necessitates the use of a `<MultiGeometry>` element in the `<Placemark>` element(s) of the KML.



### TODO

Support for the following:

- [MultiGeometry](https://developers.google.com/kml/documentation/kmlreference#multigeometry)
  - Individual `<LineString>` for each `<trkseg>` within a GPX file, etc.
- [Folder](https://developers.google.com/kml/documentation/kmlreference#folder)
  - Support for hierarchies of combined tracks; year, month, etc.
- [LookAt](https://developers.google.com/kml/documentation/kmlreference#lookat)
  - Initial view when multiple tracks have been combined.
