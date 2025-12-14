## Downsampling and Decimation

Author: Michael George

Date created: 14 Dec 2025



### Overview

Participants in the speed sailing community have been using 5 Hz and 10 Hz GPS loggers for more than 10 years. One of the benefits is the higher sampling rate leads to more robust results, so long as a moving average is applied to the results.

The de-facto measure for "top speed" is the 2 second average, essentially averaging 10 data points from a 5 Hz logger, or 20 data points from a 10 Hz logger. The errors affecting individual readings typically cancel out, even within a period as short as 2 seconds.

When it comes to exporting 1 Hz there are some important factors to be considered. The current practice of [downsampling](https://en.wikipedia.org/wiki/Downsampling_(signal_processing)) means keeping every 5th sample of the 5 Hz data, or 10th sample of 10 Hz data. This can cause unintended consequences downstream, which this page discusses.



### Example 1 - Windsurfing

#### Recorded Speeds

The image below shows some data from an [ESP-GPS](https://www.seabreeze.com.au/forums/Windsurfing/Gps/Another-DIY-GPS-logger-approach) recording at 10 Hz. The speeds calculated from observable Doppler-shifts and positional changes happen to be very similar. A couple of possible reasons include the [u-blox](https://www.u-blox.com/en/positioning-chips-and-modules) chipset using carrier smoothing for its [pseudo-range](https://en.wikipedia.org/wiki/Pseudorange) observables, and the use of a [Kalman filter](https://en.wikipedia.org/wiki/Kalman_filter) which uses speed to estimate position.

Regardless of the underlying reasons for the similarities, it should be noted that the data also suggests the windsurfer is speeding up and slowing down by 2 or 3 kts every 0.1 seconds. This clearly doesn't represent the true nature of the board speed, so this data should be considered as [noisy](https://en.wikipedia.org/wiki/Noisy_data).

![1-dd-vs-pd-speed.png](img/1-dd-vs-pd-speed.png)



#### 2 Second Average

Calculating a 2 second moving average gives a very good idea of the true speed of the windsurfer at any point in time. The image below shows the raw 10 Hz data and a 2 second average, centred to improve the clarity. The value of the 2 second average can be taken at any point in time and gives a very reliable measure of the true speed, essentially filtering out the irrelevancies / noise.

![2-raw-vs-2s.png](img/2-raw-vs-2s.png)



#### Downsampling

If this data were to be [downsampled](https://en.wikipedia.org/wiki/Downsampling_(signal_processing)) (only keeping every 10th sample) then it should be noted that the ability to calculate a reliable 2 second average is lost. The image below shows the original 2 second averages in blue and possible 2 second averages from the 1 Hz data in orange.

![3-10hz-vs-1hz.png](img/3-10hz-vs-1hz.png)


If the errors in these 2 second results are calculated then it can be seen that they are sometimes in excess of 0.6 m/s, which is over 1.2 knots. This is obviously problematic since a user taking a 1 Hz GPX file and importing into platforms such as Waterspeed will see misleading results.

![4-downsampling-errors.png](img/4-downsampling-errors.png)



#### Decimation

In digital signal processing the process known as [decimation](https://dspguru.com/dsp/faqs/multirate/decimation/) involves some low-pass filtering, prior to the decimation. Whilst a low-pass filter typically applies to the [frequency domain](https://en.wikipedia.org/wiki/Frequency_domain) but for this particular use-case we can simply filter in the [time domain](https://en.wikipedia.org/wiki/Time_domain) using a 1 second moving average.

![5-moving-average.png](img/5-moving-average.png)


The benefit of using a 1 second moving average is that all any subsequent calculation of a 2 second average from the 1 Hz data will be identical to the original 10 Hz data. The 1.2 kts increase seen earlier simply cannot occur, so an innocent use of 1 Hz GPX files will not give a speed advantage.

![6-2-secs-comparison.png](img/6-2-secs-comparison.png)



### Example 2 - Walking

In another article, I discussed the concept of [aliasing](https://logiqx.github.io/gps-details/general/aliasing/) when recording at 1 Hz on some GPS loggers, including the Motion and ESP-GPS. The image below shows 5 Hz data and 1 Hz data during a short walk, and the aliasing present in the 1 Hz data is very apparent. Whilst the 5 Hz data can be used to determine a relatively accurate walking speed the 1 Hz data is almost useless, due to the presence of aliasing.

![7-walking.png](img/7-walking.png)




Whilst the original 5 Hz measurements are likely a good representation of the arm speed, filtering is required prior to downsampling. In this instance, even a 1 second moving average provides a much more realistic measure of instantaneous speed, and thus useful prior to downsampling.

![8-walking-5hz.png](img/8-walking-5hz.png)


Plotting all of the calculated 1 second averages shows something that is likely to be far more useful, when the original data contains irrelevant arm movements or measurement errors.

![9-walking-1hz.png](img/9-walking-1hz.png)



### Conclusions

The production of 1 Hz data through the use of downsampling alone is problematic when it comes to the analysis of speeds and calculation of measures such as "max 2 seconds". It is highly advisable that conversions from 5 Hz / 10 Hz data to 1 Hz data implement suitable filtering, prior to downsampling. Ideally this would include devices such as the Motion, ESP and LISA when the produce GPX exports containing 1 Hz data.

The simplest approach is to simply use a 1 second moving average. The efficacy of this simple approach was demonstrated earlier in this document and speeds calculated from the 1 Hz GPX will never exceed the original 5 Hz / 10 Hz data. A simple trailing moving average should be implemented (not centred moving average), since speeds from a trailing average will be best-aligned with position-derived speeds in the 1 Hz data.



### Next Steps

Discussions about this topic with key stakeholders and the various developers. Sadly there is no development on the Motion so it is unlikely that will be modified in the near future, but the ESP and LISA would both benefit from these ideas. There are people who have recently built an ESP for themselves and intending to post it to the Waterspeed app. It would be beneficial for the GPX export to use a 1 Hz moving average, prior to downsampling.
