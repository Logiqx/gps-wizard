## Gybe Analysis

Author: Michael George

Date created: 22 Nov 2025

Last updated: 8 Nov 2026



### Introduction

Gybing is fun for windsurfers of all ages and abilities, yet extremely technical and highly worthy of GPS analysis.

- Intermediate windsurfers will often aspire to coming out of their gybes planing, which means maintaining a speed above 8 knots.
- Advanced windsurfers want to minimise the speed lost during the gybe, and enter / exit their gybes at ever increasing speeds.

The difference between a good and bad gybe is essentially the exit speed, and reducing the time it takes to get back up to speed. We already have [alpha racing](../../alpha-racing/README.md) but that has the requirement to return to within 50 meters of the starting location.

What would be ideal is to have a collection of gybe metrics that can be used to rate individual gybes, even if they do not qualify for an alpha.  This document has been created to jot down a few thoughts about the measurement of gybes and tacks.



### Example Gybes

This section shows what good and bad gybes look like using real GPS data. The examples show the most important 200 meters worth of GPS data in green, which will subsequently form the basis for gybe analysis.

The first example is a good windfoil gybe, entering at 25 kts and never dropping below 15 kts. The gybe was fully foiling and the speed of the final data point was slightly over 20 kts.

![example-bad](img/example-good.png)

The second example shows a windfoil gybe which was initiated at 20 kts but dropping off the foil, and then chugging at 4 kts. Whilst the entry looks nice and smooth the slow exit speeds make it a bad gybe.

![example-bad](img/example-bad.png)

It can easily be seen how the data points for the gybe exit are bunched up due to the slow speeds, and thus making it a bad gybe.



### Fundamentals

Prior to calculating any gybe metrics it is necessary to decide which data points constitute each gybe.

One relatively simple approach would be to consider all of the possible mid-points for the gybe. An accumulated distance of 100 meters prior to the mid-point dictates the start point, and accumulated distance of 100 meters after to mid-point dictates the end point.

The straight-line distance between the start point and end point can be calculated for every possible mid-point. Theoretically, the "best choice" of mid-point for the gybe will be the one with the shortest distance between the start and end points.

The goal is to see a comparable entry (100 meters ) and exit (100 meters). The example below illustrates how the shortest possible grey line will result in the best possible mid-point, just by considering the preceding 100 meters and following 100 meters.

![data-points](img/data-points.png)



### Additional Criteria

After trialling the earlies gybe concepts on speedsurf.app some addition constraints were introduced:

- The entry speed must be at least 12 knots
- The straight-line distance between start and end points must not exceed 100 m
- The COG of the start and end points must differ by at least 120 degrees

Once implemented the gybe scoring became far more reliable, but still vulnerable to some watch data.



### Metrics

Once the mid-point of a gybe has been established it is easy to calculate a variety of useful metrics.

#### Simple Metrics

- 1 second averages
  - entry speed - 1 second average
  - exit speed - 1 second average
  - min speed - slowest 1 second average
- Longer averages
  - entry speed - 100 meters
  - exit speed - 100 meters
  - average speed - 200 meters
- Durations
  - entry duration - 100 meters
  - exit duration - 100 meters
  - total duration - 200 meters

Note: 1 second averages will improve the results from 5 Hz + 10 Hz devices.



#### Percentages

The speed metrics described above can also be used to produce percentage metrics.

- efficiency (%) = exit speed (100 meters) / entry speed (100 meters)
  - This should be capped at 100% to to prevent riders from gaming the system

- retained speed (%) = minimum speed (1 second average) / entry speed (1 second average)
  - This metric can never exceed 100%
  

The remainder of this proposal uses efficiency (%), and ignores min speed (%).




#### Scores

Gybe scores can be calculated using a combination of the average speed, efficiency (%), and min speed.

- score = (average speed * efficiency * 5) + (min speed * 5)
  - e.g. 20 kts * 0.90 * 5 + 10 kts * 5 = score of 140
  - e.g. 15 kts * 1.00 * 5 + 10 kts * 5 = score of 125

The goal is to ensure that a near-perfect 20 kts gybe produces a better score than a perfect 15 kts gybe.

The best scores will therefore be based on the combination of average speed, efficiency and min speed.

The very top scores possible on a windsurfer are likely to be around 200 or perhaps slightly higher.



### Considerations

#### Fundamentals

The fundamentals (e.g. calculation of start / end / mid-points) have been somewhat simplified.

Gybe detection also needs to consider course over ground (COG) for the entry and exit, not just accumulated distances.

#### Doppler-derived Speeds

Doppler-derived speeds should be used for all speed calculations and accumulated distances.

This is consistent with everything else in the speedsailing world, since it is the most accurate measurement.

#### Distance Calculations

Distance calculations should use the latitude + longitude values, just like the alpha racing algorithms.

Several algorithms exist, but optimisations for [proximity detection](../../alpha-racing/README.md#proximity-detection) in alpha racing can also be applied.

#### Activity Profiles

Regardless of how gybe metrics are calculated, they can only ever be as good as the underlying GPS data.

It is important that the device is recording unfiltered Doppler-derived speeds, and not using activity-specific filtering.

#### Watch Issues

Some watches will flatter riders, because they do not report the true drops in speed.

Gybe scores may have to be regarded as "fun" metrics, and different watches may be incomparable.


#### Tacks

All of the ideas and metrics described in this document can also be applied to tacks.

The logic really isn't any different, just the initial distinction of tacks and gybes.



### Waterspeed

How these ideas could be applied to Waterspeed is discussed in a separate document, accessible via this [link](waterspeed.md).



### Summary

This document describes some basic principles for gybe (and tack) analysis.

Getting the fundamentals right is really important, such as determining the start point, mid point, and end point.

Calculating the metrics is then relatively straightforward, allowing gybe scores to be produced for rankings, etc.
