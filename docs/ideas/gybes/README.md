## Gybe Analysis

Author: Michael George

Date created: 22 Nov 2025



### Introduction

Gybing is fun for windsurfers of all ages and abilities, yet extremely technical and highly worthy of GPS analysis.

- Intermediate windsurfers will often aspire to coming out of their gybes planing, which means maintaining a speed above 8 or 10 kts.
- Advanced windsurfers will be wanting to minimise the speed lost during the gybe, and enter / exit their gybes at ever increasing speeds.

The difference between a good and bad gybe is essentially the exit speed, and reducing the time it takes to get back up to speed. We already have [alpha racing](../../alpha-racing/README.md) but that has the requirement to return to within 50 meters of the starting location.

What would be ideal is to have a collection of gybe metrics that can be used to rate individual gybes.  This document has been created to jot down a few thoughts about how gybes (and tacks) can be measured reliably.



### Example Gybes

This section shows what good and bad gybes look like using real GPS data. The examples show the most important 200 meters worth of GPS data in green, which will subsequently form the basis for gybe metrics.

The first example is a good windfoil gybe, entering at 25 kts and never dropping below 15 kts. The gybe was fully foiling and the speed of the final data point was slightly over 20 kts.

![example-bad](img/example-good.png)

The second example shows a windfoil gybe which was initiated at 20 kts but dropped off the foil, and ended up chugging at 4 kts. Whilst the entry looks nice and smooth the slow exit speeds make it a bad gybe.

![example-bad](img/example-bad.png)

It can easily be seen how the data points for the gybe exit are bunched up, due to the slow speeds (around 4 kts) and thus a bad gybe.



### Fundamentals

Prior to performing any calculations it is necessary to decide which data points should constitute each gybe.

One relatively simple approach would be to consider all of the possible mid-points within a gybe. An accumulated distance of 100 meters prior to the mid-point point dictates the start point, and accumulated distance of 100 meters after to mid-point dictates the end point.

The distance between the start point and end point can be calculated for every possible mid-point. Theoretically, the "best choice" of mid-point for each gybe will be the one with the shortest distance between the start and end points.

The goal is to see a well-balanced 100 meters entry and 100 meters exit. The example below illustrates how the shortest possible grey line will result in an appropriate choice of mid-point, considering the prior 100 meters and next 100 meters of movement.

![data-points](img/data-points.png)



### Metrics

Once the mid-point of a gybe has been established it will be straightforward to calculate a variety of useful metrics.

#### Simple Metrics

- Point speeds
  - Entry speed - start point
  - Exit speed - end point
  - Minimum speed - slowest point
- Average speeds
  - Entry speed - 100 meters
  - Exit speed - 100 meters
  - Overall speed - 200 meters
- Durations
  - Entry duration - 100 meters
  - Exit duration - 100 meters
  - Overall duration - 200 meters



#### Percentages

The speed metrics described above can also be used to produce percentage metrics.

- Exit % = Exit speed (100 meters) / entry speed (100 meters)
  - This can potentially exceed 100% but that is very hard to achieve!

- Min % = Minimum speed (point) / entry speed (point)
  - This can never exceed 100% and reflects how much speed is retained
  




#### Scores

Overall scores can be calculated by combining the average speed (200 meters) and min percentage metric.

- Score = overall speed (200 meters) * min % * 100
  - 20 kts overall speed * 0.6 * 100 = score of 1200
  - 15 kts overall speed * 0.8 * 100 = score of 1200

Higher speeds have the potential for higher scores, but they can be beaten by slower gybes that are better executed.

The ultimate goal is to minimise speed loss and maximise the speed throughout the gybe for the best possible score.



### Considerations

#### Activity Profiles

Regardless of what metrics are calculated, gybe rankings can only ever be as good as the underlying GPS data.

It is important that the device is recording unfiltered Doppler-derived speeds, and not using activity-specific filtering.


#### Tacks

All of the ideas and metrics described in this document can also be applied to tacks.

The logic really isn't any different, just the initial distinction of tacks and gybes.



### Summary

This document describes some ideas for gybe analysis, but without going to the effort of testing a prototype.

Getting the fundamentals right is really important, such as determining the start point, mid point, and end points.

Calculating the metrics is then a straightforward matter, allowing gybe scores to be produced for rankings, etc.
