## Downsampling and Decimation

Author: Michael George

Date created: 14 Dec 2025



### Overview

Participants in the speed sailing community have been using 5 Hz and 10 Hz GPS loggers for more than 10 years. One of the benefits of the higher sampling rates is that they lead to more robust speed results, so long as a moving average is applied to the data.

The de-facto measure for "top speed" is the 2 second average, essentially averaging 10 data points from a 5 Hz logger, or 20 data points from a 10 Hz logger. The errors affecting individual readings typically cancel out, even within a period as short as 2 seconds.

When converting to 1 Hz there are some important factors to be considered. The current practice of [downsampling](https://en.wikipedia.org/wiki/Downsampling_(signal_processing)) retains every 5th sample of the 5 Hz data, or 10th sample of 10 Hz data. This can cause unintended consequences downstream, which will be discussed.



### Example 1 - Windsurfing

#### Recorded Speeds

The image below shows some data from an [ESP-GPS](https://www.seabreeze.com.au/forums/Windsurfing/Gps/Another-DIY-GPS-logger-approach) recording at 10 Hz. The speeds calculated from observable Doppler-shifts and positional changes happen to be very similar. A couple of possible reasons include the [u-blox](https://www.u-blox.com/en/positioning-chips-and-modules) chipset using carrier smoothing for its [pseudo-range](https://en.wikipedia.org/wiki/Pseudorange) observables, and the use of a [Kalman filter](https://en.wikipedia.org/wiki/Kalman_filter) which likely uses speed when predicting the next position.

Regardless of the precise reasons for the similarities between the Doppler-derived and position-derived speeds, it should be noted that the example also suggests the windsurfer is speeding up and slowing down by 2 or 3 kts every 0.1 seconds. These rapid changes clearly don't represent the true nature of the board speed, and the 10 Hz data can be considered to be [noisy](https://en.wikipedia.org/wiki/Noisy_data).

![1-dd-vs-pd-speed.png](img/1-dd-vs-pd-speed.png)



#### 2 Second Average

Calculating a 2 second moving average gives a very good idea of the true speed of the windsurfer at any point in time. The image below shows the raw 10 Hz data (blue) and a 2 second average (orange), centred to improve the clarity. The value of the 2 second average can be taken at any point in time and gives a reliable indication of the true speed, essentially filtering out the irrelevancies in the 10 Hz data.

![2-raw-vs-2s.png](img/2-raw-vs-2s.png)



#### Downsampling

If the 10 Hz data is [downsampled](https://en.wikipedia.org/wiki/Downsampling_(signal_processing)) to 1 Hz (keeping every 10th sample) then it should be noted that the ability to subsequently calculate a reliable 2 second average is lost. The image below compares the original 2 second averages from the 10 Hz data (blue) and possible 2 second averages from the 1 Hz data (orange). It is clear that the 1 Hz data cannot produce 2 second averages that are the same as the 10 Hz data.

![3-10hz-vs-1hz.png](img/3-10hz-vs-1hz.png)


The image below shows the discrepancies in 2 second averages (10 Hz vs 1 Hz), which are sometimes in excess of 0.6 m/s which is over 1.2 knots. This will be problematic if a user subsequently imports the 1 Hz data (e.g. GPX file) into a platform such as Waterspeed, thus producing misleading results.

![4-downsampling-errors.png](img/4-downsampling-errors.png)



#### Decimation

In digital signal processing there is a process known as [decimation](https://dspguru.com/dsp/faqs/multirate/decimation/) which implements a low-pass filter, prior to downsampling. Whilst a low-pass filter such as a [brick-wall filter](https://en.wikipedia.org/wiki/Sinc_filter) applies to the [frequency domain](https://en.wikipedia.org/wiki/Frequency_domain) it is also possible to use a 1 second moving average as a low-pass filter in the [time domain](https://en.wikipedia.org/wiki/Time_domain).

![5-moving-average.png](img/5-moving-average.png)


The benefit of using a 1 second moving average is that all subsequent calculations (e.g. 2 second averages) will exactly match the original data. The 1.2 kts increase seen earlier simply cannot occur, so naïve use of 1 Hz GPX files will not produce erroneous results. It is just that there is only one data point available every second, instead of the original 10 data points per second.

![6-2-secs-comparison.png](img/6-2-secs-comparison.png)



### Example 2 - Walking

A previous article discussed the concept of [aliasing](https://logiqx.github.io/gps-details/general/aliasing/) which can be present in 1 Hz recordings from some GPS loggers, including the Motion and ESP-GPS. The chart below shows 5 Hz data (blue) and 1 Hz data (red) during a short walk. Pace / walking speed can easily be estimated using the 5 Hz data and 1 second moving average, but the 1 Hz data is practically useless due to the nature of the aliasing.

This may seem unrelated to windsurfing, but it can be useful when trying to determine whether a device is prone to aliasing, and for creating data to replicate (or exceed) the maximum acceleration possible on a windsurfer. A separate article will discuss the nuances of acceleration in the context of 5 Hz and 10 Hz data. Within the scope of this document, reliable 1 Hz data is the primary focus.

![7-walking.png](img/7-walking.png)




The original 5 Hz measurements (orange) may be a good representation of the arm speed, but suitable filtering is required prior to downsampling. In this particular scenario, even a simple 1 second moving average (blue) provides a reasonable estimate of the instantaneous speed of the walker.

![8-walking-5hz.png](img/8-walking-5hz.png)


Whilst the original 5 Hz data provides some insights into the actual arm movements (but potentially includes measurement errors as well), some form of filtering / smoothing clearly needs to be done, prior to downsampling. Calculating 1 second averages prior to downsampling improves any subsequent analysis, since the 1 Hz data will not contain irrelevancies and aliasing artefacts.

![9-walking-1hz.png](img/9-walking-1hz.png)



### Conclusions

The production of 1 Hz data through downsampling alone can be problematic, certainly for subsequent speed analysis and measures such as "max 2 seconds". It is highly advisable that conversions to 1 Hz implement some kind of filter, prior to the downsampling. This is applicable to popular GPS devices such as the Motion, ESP and LISA when they produce GPX exports containing 1 Hz data.

The easiest option is a simple 1 second moving average. The efficacy of such a filter was demonstrated earlier and speed results calculated from the 1 Hz data will never exceed the original 5 Hz / 10 Hz data. A trailing moving average should be implemented (not centred moving average), since the speeds from the trailing average will be best-aligned with position-derived speeds in the 1 Hz data.



### Next Steps

Discuss this topic with key stakeholders and the various developers; software and hardware. Sadly there is no active development on the Motion, so it is highly unlikely that it will be modified in the near future, but both the ESP and LISA would benefit from these ideas.

There are people who have recently built an ESP GPS and intending to upload the GPX files to the Waterspeed app. In this context, it would be best if the 1 Hz GPX files of the ESP (and LISA) were to implement 1 second moving averages, prior to the downsampling.

