## GPX Improvements

Over the past few months, I've spent a lot of time focused on the GPX format.

I've been studying its usage by different devices / apps and working on enhancements for GPX 1.1.

There are multiple reasons for these activities:

1) Ensure the Doppler speed is always available for results and rankings, not just positional data
2) Remove the need for people to know what formats are / aren't suitable for results and rankings
3) Ensure GPX is suitable for current and future devices - watches, phones, proprietary loggers, etc
4) Ensure GPX is capable of storing accuracy estimates like SDOP / SDOS (SiRF) and sAcc (u-blox)

The remainder of this discussion will cover some topics that relate to the above points.



### Doppler Speed

The technically inclined will recognise the importance of Doppler-derived speeds and why they are so much more reliable than speeds derived from positional data. Results from positional data can often be very misleading; especially 2 seconds, 10 seconds, 100 meters and 250 meters.

Unfortunately the guys who created GPX 1.0 and GPX 1.1 accidentally removed speed and course from GPX 1.1. It's easy to see how the mistake occurred, but it is still very unfortunate as it still has consequences today. The main issue is that modern apps which provide GPX 1.1 exports typically omit the Doppler speed data.

The good news is that there is a legitimate way to include speed (and course) in GPX 1.1 files nowadays, and I have documented this topic for device / app developers:

- [https://logiqx.github.io/gps-wizard/gpx/](https://logiqx.github.io/gps-wizard/gpx/)
- [https://logiqx.github.io/gps-wizard/gpx/speed.html](https://logiqx.github.io/gps-wizard/gpx/speed.html)

At the bottom of the first page you will also find links to a lot of common apps / devices and what they should do to achieve this goal.



### Ease of Use

I've lost count of how many times I've had to explained Doppler vs positional speeds to people on the beach, but TBH the average user should not need to even know about this stuff.

IMO people should be able to record a session and upload to GP3S without falling for the possible pitfalls, thus making it almost impossible to intentionally or unintentionally boost their results by using non-Doppler speeds.

I believe this is possible with just a little bit of effort from GPX producers, and the consumers such as GPSResults and GpsarPro.



### Current / Future Devices

I've been contacting device / app developers to try to encourage them to read and write files that are GPX 1.0 / GPX 1.1 compliant.

If apps use GPX 1.0 / GPX 1.1 in the correct manner then they will all be compatible with each other and Doppler speeds will never be discarded. I've summarised numerous apps relating to the speedsurfing community on this page:

- [https://logiqx.github.io/gps-wizard/gpx/issues/](https://logiqx.github.io/gps-wizard/gpx/issues/)

As far as reading GPX files goes, I've documented how to read all variations of Doppler speed stored in GPX files:

- [https://logiqx.github.io/gps-wizard/gpx/advice.html](https://logiqx.github.io/gps-wizard/gpx/advice.html)

This is all very easy to implement, and it would be very beneficial if GPSResults and GpsarPro support what I've documented.



### Accuracy

Apple's CLLocation class and the Android's Location API both support accuracy estimates. I won't go into a lot of detail here but I will write a quick summary.

Speed accuracy is what we care about most, but horizontal and vertical accuracy estimates also have their uses. I am working towards getting these supported in the GPX format as an official extension.

Once these can be included in GPX files (officially, not some hack just for our community) we'll have a GPX format that is well suited to smart watches, phones and proprietary devices such as Sailmon / Vakaros and other future devices.



### Compression

GPX files can be quite large but another one of the proposals in the GPX forum is to define a compressed GPX files (aka GPZ files), akin to KMZ files which are compressed KML files.

I'm pretty sure this will become an officially endorsed part of the GPX standard and the resultant files are even smaller than SBN, SBP, OAO, GPY, etc. Once the official extensions are nearing completion, I think the GPZ format will gain more traction.

Having official support for Doppler speed, accuracy estimates and compression the GPX / GPZ format makes it extremely attractive to many activities, not just speedsurfing.

Apps will be able to provide GPZ extracts, or direct integration with GP3S using the GPZ format instead of FIT or legacy binary formats. GPZ will be better suited than either FIT or any of the existing binary formats imho.



### Finally

Ok, that's just a quick summary of the GPX format and how it can be enhanced to suit the needs of the speedsailing community. I'm chipping away at these activities and although it won't happen overnight, I am confident of progress over coming months.

The activities are all taking place in the GPX developers forum at [https://groups.io/g/gpx](https://groups.io/g/gpx)

There was initially some resistance to unfreezing the GPX format after 20 years of inactivity, but plenty of people are now onboard with these proposals (and other improvements) to enhance the GPX format for modern devices.