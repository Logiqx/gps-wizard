## Waterspeed Tacks & Jibes

I created a generic [document](README.md) describing some useful metrics for jibe analysis.

This new document captures some thoughts that relate specifically to Waterspeed.



### Individual Jibes

Individual jibes currently show the following metrics:

- Average Speed
- Entry Speed
- Exit Speed
- Disparity (%) = 1 - Exit Speed / Entry Speed

![waterspeed-gybe](img/waterspeed-gybe.jpg)

Aside from identifying more appropriate start / end points, the following additional metrics would be very useful:

- Min Speed
- Retained Speed (%) = Min Speed / Entry Speed
- Score (integer) = Average Speed * Retained Speed (%) * 10

n.b. Min Speed and Retained Speed are the key jibe metrics reported by [GpsarPro](https://gpsactionreplay.free.fr/) and [GPS Speedreader](https://github.com/prichterich/GPS-Speedreader).



### Session Summary

The session summary currently includes the four metrics highlighted in red.

![waterspeed-session](img/waterspeed-session.jpg)

In addition to the number of jibes and % missed, it would be useful to see the following stats:

- Best Jibe Speed - already available and uses the average speed of the jibe
- Best Min Speed
- Best Retained Speed (%)
- Best Jibe Score

The concept of the best 5 gybes is also appealing to people in the Waterspeed group chat.

- 5 x Jibe Speed
- 5 x Min Speed
- 5 x Retained Speed (%)
- 5 x Jibe Score

These four metrics can all be used to rank sessions, based on different aspects of jibing.

The current metric "Average Jibe Speed" isn't particularly useful for windsurfing, perhaps not winging either?

The "best 5" metrics could replace the "Average Jibe Speed", and less sensitive to patchy / inconsistent winds.



### Tacking

Everything discussed above also applies to tacking since all of the metrics are equally useful.

The additional stats would make the Tacks & Jibes section rather cluttered, so probably worth splitting them apart.

This just illustrates the idea with the current stats, not showing the stats proposed earlier in this document.

![waterspeed-split](img/waterspeed-split.jpg)