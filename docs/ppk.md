## Post Processing Kinematics - WIP

 rtk post processing - Google Search
 https://www.google.com/search?ie=UTF-8&client=ms-android-samsung-rev2&source=android-browser&q=rtk+post+processing

 Precise Post Processing (PPP) - RTK F9P Positioning Solutions
 https://drotek.gitbook.io/rtk-f9p-positioning-solutions/tutorials/precise-post-processing-ppp

 GitHub - bentodvictor/rtklib-post-processing-guide
 https://github.com/bentodvictor/rtklib-post-processing-guide

 PPK vs RTK: A look at RTKLIB for post-processing solutions | rtklibexplorer
 https://rtklibexplorer.wordpress.com/2017/08/21/ppk-vs-rtk-a-look-at-rtklib-for-post-processing-solutions/

 GNSS Data Post-Processing | NovAtel
 https://novatel.com/an-introduction-to-gnss/chapter-5-resolving-errors/gnss-data-post-processing



### RTKLIB

- https://rtklib.com/
- https://github.com/tomojitakasu/RTKLIB



### u-blox

Recording raw data:

- [Google Search](https://www.google.com/search?ie=UTF-8&client=ms-android-samsung-rev2&source=android-browser&q=rscording+raw+data+ublox+8)

- [Full raw data is only available on specific GNSS receivers ](https://www.u-blox.com/en/technologies/gnss-raw-data)



3 modules can record raw data and support RTK as well:

- [NEO-M8P modules](https://www.u-blox.com/en/product/neo-m8p-series)
  -  ublox neo m8p ppk - [Google Search](https://www.google.com/search?q=ublox+neo+m8p+ppk)
  - Can I use M8P for PPK and get the raw data in RINEX format - NEO-M8P RTK - [Community forums](https://community.drotek.com/t/can-i-use-m8p-for-ppk-and-get-the-raw-data-in-rinex-format/2817)

- [ZED-F9P module](https://www.u-blox.com/en/product/zed-f9p-module) approx £175
  - Investigation - [Behavior of Low-Cost Receivers in Base-Rover Configuration](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9002666/)
    - Reference stations obtained standard deviations always lower than 1 cm horizontally, but of the order of 4 cm in altitude.
    - Car-test 1 was carried out on an extra-urban road, characterized by variable orographic conditions (from flat to mountainous). A total of approximately 64 km were covered. Post-processed RMSE<sub>H</sub> and RMSE<sub>V</sub> were 5.7 mm and 17.4 mm, respectively. The percentage of fixed positions was 7% higher for the u-blox than the RTKLib solution. This figure correlated with the number of satellites used in the solution, which in RTKLib was always lower than in the ZED-F9P. In contrast, the planimetric precision achieved by RTKLib was significantly higher than that of ZED-F9P, while the elevation precision was equivalent.
    - Car-test 2 was conducted on an urban route with a variable track that passed from streets bordered by tall buildings to free streets. The route was approximately 25 km long. Post-processed RMSE<sub>H</sub> and RMSE<sub>V</sub> were 4 mm and 10.7 mm, respectively. Again, the percentage of fixed positions was more than 6% higher for the u-blox than that of the RTKLib solution, and the planimetric precision achieved by RTKLib was significantly higher than that of ZED-F9P.

  - My thoughts
    - RMSE<sub>H</sub> between 4.0mm and 5.7mm (let's call it 6mm) suggests that the ZED-F9P + RTKLib could well be accurate enough for the WSSRC.
    - At 50 knots this would result in a possible error of 0.0012 knots, assuming 499.988m travelled (i.e. 500m -  12mm) is treated as 500m.
    - Windsurfing is a lot jerkier than a car. The effects of vibration / jerky motion are unknown but then again, sky view is typically a lot better.
    - It would be possible to create a receiver based on the u-blox ZED-F9P with parts costing between no more than £250 pounds.
    - RTKLib is free and can be used to do the post-processing, converting raw satellite data to lat + lon coordinates accurate to within 1cm.

- [ZED-F9R module](https://www.u-blox.com/en/product/zed-f9r-module)

