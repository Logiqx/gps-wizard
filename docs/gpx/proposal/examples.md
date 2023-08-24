## Proposal for GPX

### Examples of GPX 1.1.1

An example trackpoint including course, speed and accuracy estimates:

```xml
<trkpt lat="50.5710623" lon="-2.4563484">
  <ele>7.90</ele>
  <time>2022-04-11T10:16:01Z</time>
  <course>157.19</course>
  <speed>0.543</speed>
  <hacc>2.0</hacc>
  <vacc>4.0</vacc>
  <cacc>5.0</cacc>
  <sacc>0.5</sacc>
</trkpt>
```

The new `<src>` element of GPX 1.1.1 is a "mixed" type to provide forwards and backwards compatibility with GPX 1.1.

Example of a custom-built GPS logger using a Beitian BE-280 / u-blox M10:


```xml
<trk>
  <src>
    ESP-GPS
    <hardware>
      <manufacturer>Beitain</manufacturer>
      <product>BE-280</product>
      <name>K888 ESP</name>
    </hardware>
    <software>
      <application>ESP-GPS</application>
      <link href="https://github.com/RP6conrad/ESP-GPS-Logger" />
      <version>5.75</version>
    </software>
  </src>
  <trkseg>...</trkseg>
</trk>
```

Example third party phone / watch app:

```xml
<trk>
  <src>
    Samsung Galaxy A53
    <hardware>
      <manufacturer>Samsung</manufacturer>
      <product>Galaxy A53</product>
      <model>SM-A536BZKNEUB</model>
      <serial>ABCDE9ABC9X</serial>
      <name>Mike's A53</name>
      <version>android13-5.10.136</version>
    </hardware>
    <software>
      <developer>barbeauDev</developer>
      <application>GPSTest</application>
      <link href="https://github.com/barbeau/gpstest">
        <text>GitHub</text>
      </link>
      <link href="https://play.google.com/store/apps/details?id=com.android.gpstest">
        <text>Google Play</text>
      </link>
      <link href="https://f-droid.org/packages/com.android.gpstest.osmdroid/">
        <text>F-Droid</text>
      </link>
      <version>3.10.3</version>
    </software>
  </src>
  <trkseg>...</trkseg>
</trk>
```

