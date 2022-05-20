## FIT - Flexible and Interoperable Data Transfer

### Introduction

The Flexible and Interoperable Data Transfer (FIT) protocol is designed specifically for the storing and sharing of data that originates from sport, fitness and health devices. The FIT protocol defines a set of data storage templates (FIT messages) that can be used to store information such as user profiles, activity data, courses, and workouts. It is specifically designed to be compact, interoperable and extensible.

Files from different manufacturer (and even for some different products) are all slightly different and this can cause problems for software trying to load the FIT file. This document provides a summary of these differences in the data frames.

The official developer [page](https://developer.garmin.com/fit/overview/) is quite a useful resource for anyone requiring a detailed understanding of the FIT protocol.



### Data Frames

There are a few useful data frames, providing device information:

- device_info
  - serial_number
  - manufacturer
  - product / garmin_product
  - product_name
  - software_version

- file_id
  - serial_number
  - manufacturer
  - product / garmin_product
  - product_name

- record
  - timestamp
  - position_lat
  - position_long
  - distance
  - altitude / enhanced_altitude
  - speed / enhanced_speed
  - ... plus various other fields


Note: The enhanced_altitude and enhanced_speed are just 32-bit versions of altitude and speed which are 16-bit, thus capable of storing larger numbers.



#### device_info

The device information frames appear to be standard for all devices from a particular brand.

Garmin files always contain many device_info frames but the ones that are relevant all contain a serial number.


|                   | COROS                              | Garmin                                 |
| :-----------------: | :----------------------------------: | :--------------------------------------: |
| serial_number | - | Yes |
| manufacturer | 294                              | 1                                   |
| product_name | COROS APEX Pro | - |
| garmin_product | - | Yes |
| software_version | - | Yes |

Notes:

- COROS does not record the serial number or software version at this time; May 2022.
- Suunto and Timex do not provide a "device_info" frame.



#### file_id

The file identification frame appears to be standard for all devices from a particular brand.

The table below provides a single file_id example for each brand:


|                |     COROS      |    Garmin    |       Suunto        |       Timex       |
| :------------: | :------------: | :----------: | :-----------------: | :---------------: |
|                | e.g. APEX Pro  | e.g. Fenix 5 |     e.g. Ambit3     |   e.g. Ironman    |
| serial_number  |       -        |  3949903342  |          -          |    4294967295     |
|  manufacturer  |      294       |      1       |         23          |        16         |
|    product     |      841       |      -       |         23          |        87         |
|  product_name  | COROS APEX Pro |      -       | Suunto Ambit3 Sport | Timex Ironman GPS |
| garmin_product |       -        |     2697     |          -          |         -         |

Notes:

- Garmin does not store a readable product name but it can be looked up using the serial number on the [support site](https://support.garmin.com/en-US/ql/?focus=topics).
- COROS and Suunto do not record serial numbers at this time.



#### record

The record frames are the most important content of the FIT files.

Each brand (and sometimes model) will contain slightly different data which is illustrated in the table below:

|                   | COROS                              | Garmin                                 | Garmin               | Suunto              | Timex                |
| :-----------------: | :----------------------------------: | :--------------------------------------: | :--------------------: | :-------------------: | :--------------------: |
|                   | APEX Pro<br />VERTIX<br />VERTIX 2 | Fenix 3<br />Fenix 5<br />Vivoactive 3 | Fenix 6<br />Fenix 7 | Ambit3 | Ironman |
| timestamp         | Yes                                | Yes                                    | Yes                  | Yes                 | Yes |
| position_lat      | Yes                                | Yes                                    | Yes                  | Yes                 | Yes |
| position_long     | Yes                                | Yes                                    | Yes                  | Yes                 | Yes |
| altitude          | -                                  | Yes                                    | -                    | Yes <sup>2</sup> | Yes |
| enhanced_altitude <sup>0</sup> | -                                  | Yes                                    | Yes                  | Yes <sup>2</sup> | Yes |
| distance          | Yes                                | Yes                                    | Yes                  | Yes <sup>2</sup> | Yes <sup>3</sup> |
| speed             | Yes                                | Yes                                    | -                    | Yes <sup>2</sup> | Yes <sup>3</sup> |
| enhanced_speed <sup>0</sup> | Yes                                | Yes                                    | Yes                  | Yes <sup>2</sup> | Yes <sup>3</sup> |
| vertical_speed    | -                                  | -                                      | -                    | Yes <sup>2</sup> | - |
| Sat               | Yes <sup>1</sup>                   | -                                      | -                    | -                   | - |
| hdop              | Yes <sup>1</sup>                   | -                                      | -                    | -                   | - |
| cog               | Yes <sup>1</sup>                   | -                                      | -                    | -                   | - |

<sup>0</sup> The enhanced_altitude and enhanced_speed are just 32-bit versions of altitude and speed which are 16-bit, thus capable of storing larger numbers.

<sup>1</sup> The APEX Pro, VERTIX and VERTIX 2 use "[developer fields](https://developer.garmin.com/fit/cookbook/developer-data/)" to record Satellites, HDOP and COG.

<sup>2</sup> The Ambit 3 will sometimes record individual frames containing just timestamp, position_lat and position_long.

<sup>3</sup> The Ironman records multiple frames with the same timestamp. These frames must therefore be combined for subsequent analysis.

