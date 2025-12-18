## Location APIs

The following APIs include accuracy information.

A 68% confidence level (i.e. 1-sigma) is explicitly mentioned in the Android documentation and in the Apple documentation.



### Android

Accuracy information can be found in the [Location](https://developer.android.com/reference/android/location/Location) class.

#### [getAccuracy()](https://developer.android.com/reference/android/location/Location#getAccuracy())

​	Returns the estimated horizontal accuracy radius in meters of this location at the 68th percentile confidence level.

​	Added in Android 1.0 (Sep 2008)

#### [getVerticalAccuracyMeters()](https://developer.android.com/reference/android/location/Location#getVerticalAccuracyMeters())

​	Returns the estimated altitude accuracy in meters of this location at the 68th percentile confidence level.

​	Added in Android 8.0 (Aug 2017)

#### [getMslAltitudeAccuracyMeters()](https://developer.android.com/reference/android/location/Location#getMslAltitudeAccuracyMeters())

​	Returns the estimated Mean Sea Level altitude accuracy in meters of this location at the 68th percentile confidence level.

​	This means that there is 68% chance that the true Mean Sea Level altitude of this location falls within `getMslAltitudeMeters()` +/- this uncertainty.

​	Added in Android 14.0 (Q3 2023)

#### [getSpeedAccuracyMetersPerSecond()](https://developer.android.com/reference/android/location/Location#getSpeedAccuracyMetersPerSecond())

​	Returns the estimated speed accuracy in meters per second of this location at the 68th percentile confidence level.

​	Added in Android 8.0 (Aug 2017)

#### [getBearingAccuracyDegrees()](https://developer.android.com/reference/android/location/Location#getBearingAccuracyDegrees())

​	Returns the estimated bearing accuracy in degrees of this location at the 68th percentile confidence level.

​	Note: The word "bearing" is used instead of "course". It's incorrect to use the word bearing.

​	Added in Android 8.0 (Aug 2017)



### Apple

Accuracy information can be found in the [CLLocation](https://developer.apple.com/documentation/corelocation/cllocation) class.

The Apple documentation says that locations with an accuracy >=50 meters should filtered out when creating [workout routes](https://developer.apple.com/documentation/healthkit/workouts_and_activity_rings/creating_a_workout_route#2955567):

> Because raw Core Location data can contain a significant amount of noise, your app needs to filter out any inaccurate locations before adding them to the route builder. Don't add any locations whose accuracy is greater than 50 meters.



#### [horizontalAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/1423599-horizontalaccuracy)

​	The radius of uncertainty for the location, measured in meters.

​	Added in iOS 2.0 (Jul 2008) and watchOS 2.0 (Sep 2015)

#### [verticalAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/1423550-verticalaccuracy)

​	The validity of the altitude values, and their estimated uncertainty, measured in meters.

​	A positive `verticalAccuracy` value represents an uncertainty that’s approximately 68 percent, or one standard deviation, above and below the altitude values.

​	Added in iOS 2.0 (Jul 2008) and watchOS 2.0 (Sep 2015)

#### [speedAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/3524340-speedaccuracy)

​	The accuracy of the speed value, measured in meters per second.

​	Added in iOS 10.0 (Sep 2016) and watchOS 3.0 (Sep 2016)

#### [courseAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/3524338-courseaccuracy)

​	The accuracy of the course value (compass heading), measured in degrees.

​	Added in iOS 13.4 (2020) and watchOS 6.2 (Mar 2020)

