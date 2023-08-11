## Location APIs

The following APIs include accuracy information.



### Android

Accuracy information can be found in the [Location](https://developer.android.com/reference/android/location/Location) class.

#### [getAccuracy()](https://developer.android.com/reference/android/location/Location#getAccuracy())

​	Returns the estimated horizontal accuracy radius in meters of this location at the 68th percentile confidence level.

​    Added in Android 8.0

#### [getBearingAccuracyDegrees()](https://developer.android.com/reference/android/location/Location#getBearingAccuracyDegrees())

​	Returns the estimated bearing accuracy in degrees of this location at the 68th percentile confidence level.

​	Note: The word "bearing" is used instead of "course". It's incorrect to use the word bearing.

​    Added in Android 8.0

#### [getSpeedAccuracyMetersPerSecond()](https://developer.android.com/reference/android/location/Location#getSpeedAccuracyMetersPerSecond())

​	Returns the estimated speed accuracy in meters per second of this location at the 68th percentile confidence level.

​    Added in Android 8.0

#### [getVerticalAccuracyMeters()](https://developer.android.com/reference/android/location/Location#getVerticalAccuracyMeters())

​	Returns the estimated altitude accuracy in meters of this location at the 68th percentile confidence level.

​    Added in Android 8.0



### Apple

Accuracy information can be found in the [CLLocation](https://developer.apple.com/documentation/corelocation/cllocation) class.

#### [horizontalAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/1423599-horizontalaccuracy)

​	The radius of uncertainty for the location, measured in meters.

#### [verticalAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/1423550-verticalaccuracy)

​	The validity of the altitude values, and their estimated uncertainty, measured in meters.

#### [speedAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/3524340-speedaccuracy)

​	The accuracy of the speed value, measured in meters per second.

#### [courseAccuracy](https://developer.apple.com/documentation/corelocation/cllocation/3524338-courseaccuracy)

​	The accuracy of the course value (compass heading), measured in degrees.

