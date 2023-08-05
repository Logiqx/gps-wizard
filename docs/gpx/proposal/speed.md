## Proposal for GPX

### Doppler-derived Speed

The image below shows a kitesurfing track from an Apple Watch SE. It illustrates the difference between speeds (m/s) derived from positional data (cSpd, blue) vs the Doppler-derived speeds (dSpd, red). There has been no filtering or post-processing applied to any of the data and the spikes in the position-derived speeds (cSpd, blue) are very apparent. Doppler-derived speeds will typically be far more robust / resilient than position-derived speeds and they are far less susceptible to large spikes.

![apple-se-kiting.png](apple-se-kiting.png)



The high accuracy of Doppler-derived speeds from GNSS receivers has been known to the [GPS Speedsurfing](https://www.gps-speedsurfing.com/) community for a long time.

A couple of articles were written in 2007 whilst initially studying the speeds produced by the [Locosys](https://www.locosystech.com/en/product/gps-handheld-data-logger-gt-31.html) GT-11 (SiRF Star II chipset):

- [High accuracy speed measurement using GPS](https://studylib.net/doc/18795194/high-accuracy-speed-measurement-using-gps) by Tom Chalko PhD
- [Handheld-GPS based Speed-Measurements](https://web.archive.org/web/20120531035620/http://www.gps-results.com/GPS_Speed.pdf) by Manfred Fuchs PhD

Official times / speeds of world record attempts at the annual [Luderitz Speed Challenge](https://luderitz-speed.com/) use video timing. However, GPS / GNSS times from custom devices such as the [Motion GPS](https://www.motion-gps.com/) are typically +/- 0.05 knots of the official video-timed results over the 500m course.

It's worth noting that the majority of the speedsurfing community use custom devices (e.g. [Motion GPS](https://www.motion-gps.com/)) which output their data in a binary format, including the speed and speed accuracy estimate. However, with the advent of 3rd party apps for smart phones and watches it makes a lot of sense for the Doppler-derived speeds and the various accuracy estimates to be included in "standard" GPX files.



### Speed in Sport

A number of sports and activities already benefit from the Doppler-derived speeds output by GPS / GNSS receivers.

- Speedsailing - custom devices (e.g. [Motion GPS](https://www.motion-gps.com/)) and watch / phone apps (e.g. [Waterspeed](https://waterspeedapp.com/) and [WindsportTracker](https://www.windsporttracker.com/))
- Regatta racing - custom devices (e.g. [Sailmon](https://sailmon.com/) or [Vakaros](https://vakaros.com/)) which are used for live tracking (e.g. world championships, olympics, etc)
- Sky diving - custom devices (e.g. [Flysight](https://www.flysight.ca/)) for glide statistics, etc.
- Motorsport - custom devices (e.g. [Dragy](https://dragymotorsports.co.uk/), [VBOX Sport](https://www.vboxmotorsport.co.uk/index.php/en/vbox-sport), [P-GEAR](https://pgearmotorsports.com/)) for things like 1/4 mile times and 0-60 mph times.
- Land speed records - onboard speedometer (e.g. [Bloodhound SSC](https://www.bloodhoundlsr.com/) which uses a custom version of the [Motion GPS](https://www.motion-gps.com/))

The devices listed above will export the Doppler-derived speeds (and accuracy estimates) when using their proprietary binary formats, or CSV files. Since there is no "standard" way to record speeds in GPX 1.1 compliant files, it often leads to useful data items being discarded or lost when using GPX files.

It should be noted that numerous other sports can potentially benefit from Doppler-derived speeds from phone and watch apps. For example:

- Kitesurfing
- Wingfoiling
- Cycling
- Skiing
- Snowboarding

The speed output by a GPS / GNSS receiver is slightly less useful when worn on a wrist that is constantly "swinging" (e.g. walking, running, SUP, etc).

