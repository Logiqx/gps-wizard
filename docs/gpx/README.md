## GPS Exchange Format (GPX)

### Introduction

GPX, or GPS Exchange Format, is an XML schema designed as a common GPS data format for software applications GPX comes in two main flavors with schema defining the structure and content; [GPX 1.0](https://www.topografix.com/GPX/1/0/gpx.xsd) and [GPX 1.1](https://www.topografix.com/GPX/1/1/gpx.xsd).

Proper use of the GPX format and compliance with the official schema are essential if data such as speed are to be recognised by popular applications such as [GPSResults](https://www.gps-speed.com/) and [GpsarPro](http://www.gpsactionreplay.com/). This is particularly important because calculating speed from positional data alone is highly suspectable to errors.

An entire section about ["Doppler speed"](speed.md) has been written to provide a brief overview about why it is so important that the the speed originally calculated by the GPS receiver is recorded correctly. If not recorded correctly, subsequent speed analysis may be forced to use the positional data which is highly susceptible to spurious results, AKA "spikes".


