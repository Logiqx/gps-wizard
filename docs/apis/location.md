## Location APIs

The following APIs include accuracy information.



### Android

Accuracy information can be found in the [Location](https://developer.android.com/reference/android/location/Location) class.

#### [getAccuracy()](https://developer.android.com/reference/android/location/Location#getAccuracy())

​	Returns the estimated horizontal accuracy radius in meters of this location at the 68th percentile confidence level.

​    Added in Android 1.0 (Sep 2008)

#### [getBearingAccuracyDegrees()](https://developer.android.com/reference/android/location/Location#getBearingAccuracyDegrees())

​	Returns the estimated bearing accuracy in degrees of this location at the 68th percentile confidence level.

​	Note: The word "bearing" is used instead of "course". It's incorrect to use the word bearing.

​    Added in Android 8.0 (Aug 2017)

#### [getSpeedAccuracyMetersPerSecond()](https://developer.android.com/reference/android/location/Location#getSpeedAccuracyMetersPerSecond())

​	Returns the estimated speed accuracy in meters per second of this location at the 68th percentile confidence level.

​    Added in Android 8.0 (Aug 2017)

#### [getVerticalAccuracyMeters()](https://developer.android.com/reference/android/location/Location#getVerticalAccuracyMeters())

​	Returns the estimated altitude accuracy in meters of this location at the 68th percentile confidence level.

​    Added in Android 8.0 (Aug 2017)



### Apple

Accuracy information can be found in the [CLLocation](https://developer.apple.com/documentation/corelocation/cllocation) class.

#### [horizontalAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/1423599-horizontalaccuracy)

​	The radius of uncertainty for the location, measured in meters.

​    Added in iOS 2.0 (Jul 2008) and watchOS 2.0 (Sep 2015)

#### [verticalAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/1423550-verticalaccuracy)

​	The validity of the altitude values, and their estimated uncertainty, measured in meters.

​    Added in iOS 2.0 (Jul 2008) and watchOS 2.0 (Sep 2015)

#### [speedAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/3524340-speedaccuracy)

​	The accuracy of the speed value, measured in meters per second.

​    Added in iOS 10.0 (Sep 2016) and watchOS 3.0 (Sep 2016)

#### [courseAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/3524338-courseaccuracy)

​	The accuracy of the course value (compass heading), measured in degrees.

​    Added in iOS 13.4 (2020) and watchOS 6.2 (2020)

