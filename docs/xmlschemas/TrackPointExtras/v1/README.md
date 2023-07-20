## TrackPointExtras

#### Summary

This schema defines Logiqx extensions to be used with the [GPX 1.1](http://www.topografix.com/GPX/1/1/gpx.xsd) schema.

The root element defined by this schema is intended to be used as a child element of the "extensions" elements in the trkpt element in the GPX 1.1 schema. 



#### Background

GPS / GNSS chipsets from a number of manufacturers provide position and speed accuracy estimates; SiRF, u-blox, Broadcom, Quectel, etc.

This data is typically available via proprietary NMEA sentences (e.g. `$PGLOR,...,LSQ`) or binary protocols (e.g. SiRF and UBX).

The estimated location and speed accuracy information is also accessible via the Android and Apple location [APIs](../../../apis/location.md), summarised in the linked document.

However, GPX 1.1 provides no standard mechanism to store the accuracy estimates (or Doppler-derived course and speed), hence these GPX extensions.



#### Decisions + Rationale

Element names have been intentionally kept as short as possible to avoid too much bloat of the GPX:

- The elements `<course>` and `<speed>`  have been carried forward from XML 1.0, also matching the names in Garmin's [TrackpointExtensionv2](https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd).
- Estimated "accuracy" elements have been given short names - e.g. `<hacc>` is the "horizontal accuracy" estimate.

These short names are closely related to the names used by u-blox (e.g. "hAcc" for horizontal accuracy estimate) and Quectel ("HErr" for horizontal error estimate) in their GNSS chipset documentation.

The accuracy estimates have been named concisely (e.g. `<hacc>` and `<vacc>`) and use entirely lower case names, much like the elements `<hdop>`, `<vdop>`, and `<pdop>` in GPX 1.0 and 1.1.

The word "accuracy" was chosen over "error" because it is used by common APIs (e.g. Android and Apple) and by GPS / GNSS chipset manufacturers such as u-blox. Some chipset manufacturers use the word "error" but for items that essentially represent the same thing; RMS or 68% confidence.



#### Elements

The following elements are all available in this schema. Course and speed have been made mandatory because of their importance:

| Name   | Description                                                  |
| ------ | ------------------------------------------------------------ |
| course | Course over ground (COG), sometimes (incorrectly) referred to as heading or bearing.<br />COG is the actual direction of travel relative to due north.<br />Course was available in GPX 1.0 but (possibly inadvertently) removed in GPX 1.1. |
| speed  | Horizontal speed, often referred to as speed over ground (SOG).<br />Typically derived from the Doppler observable and more accurate than position-derived speeds.<br />Speed was available in GPX 1.0 but (possibly inadvertently) removed in GPX 1.1. |
| vspeed | Vertical speed, sometimes referred to as climb rate or rate of climb (ROC).<br />Only available from some GPS / GNSS chipsets (e.g. SiRF in their binary output). |
| hacc   | Horizontal accuracy estimate, sometimes referred to as horizontal [position] error.<br />Typically the estimated horizontal accuracy of this location at the 68th percentile confidence level. |
| vacc   | Vertical accuracy estimate, sometimes referred to as vertical [position] error or altitude error.<br />Typically the estimated vertical accuracy of this location at the 68th percentile confidence level. |
| cacc   | Course accuracy estimate, sometimes (incorrectly) referred to as heading / bearing accuracy (or error).<br />Typically the estimated course accuracy at the 68th percentile confidence level. |
| sacc   | Horizontal speed accuracy estimate, sometimes referred to as horizontal speed / velocity error.<br />Typically the estimated horizontal speed (SOG) accuracy at the 68th percentile confidence level. |
| vsacc  | Vertical speed accuracy estimate, sometimes referred to as vertical speed / velocity error.<br />Typically the estimated vertical speed (ROC) accuracy at the 68th percentile confidence level. |



#### Usage

GPX 1.1 compliant files should begin with something like the following:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="GPS Wizard"
     version="1.1"
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:tpe="http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtras/v1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1
                         http://www.topografix.com/GPX/1/1/gpx.xsd
                         http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtras/v1
                         http://logiqx.github.io/gps-wizard/xmlschemas/TrackPointExtrasV1.xsd">
```

An example track point:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <sat>6</sat>
  <hdop>1.4</hdop>
  <extensions>
    <tpe:TrackPointExtras>
      <tpe:course>157.19</tpe:course>
      <tpe:speed>0.5429</tpe:speed>
      <tpe:hacc>2.0</tpe:hacc>
      <tpe:vacc>4.0</tpe:vacc>
      <tpe:cacc>5.0</tpe:cacc>
      <tpe:sacc>0.5</tpe:sacc>
    </tpe:TrackPointExtras>
  </extensions>
</trkpt>
```