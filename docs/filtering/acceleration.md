## Acceleration - WIP

### 5Hz and 10Hz - Acceleration

TODO - I am yet to write this topic up!



### Existing Filters

|                                        | GPSResults         | GPS Speedreader    | GpsarPro |
| -------------------------------------- | ------------------ | ------------------ | -------- |
| max. acceleration @ 1 Hz               | 4 m/s<sup>2</sup>  | 4 m/s<sup>2</sup>  | ?        |
| max. acceleration @ 5 Hz               | 8 m/s<sup>2</sup>  | 8 m/s<sup>2</sup>  | ?        |
| max. acceleration @ 10 Hz <sup>1</sup> | 10 m/s<sup>2</sup> | 16 m/s<sup>2</sup> | ?        |

<sup>1</sup> - The max acceleration for 10 Hz devices was increased from 8 m/s<sup>2</sup> to 10 m/s<sup>2</sup> in GPSResults v6.173.



#### Notes

Max. acceleration was originally 3 m/s² but was updated to 5 m/s² in the GP3S rules v9.0 A2 on 1 Jan 2012.

- GPSResults and GPS Speedreader actually implement 4 m/s² for 1 Hz devices.
- The [rules](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=BasicRules) on GP3S were only updated to show 5 m/s² in late 2015 / early 2016.



### Frequency

- Higher frequency units show higher acceleration.
  - 10 Hz Motion > 5 Hz GW-60 > 1 Hz COROS
  - GPS Results 6.173 PC / 5.63 Mac changed maximum acceleration for 10 Hz units to 10 m/s².
- Higher frequencies have distances (m) closer to intended - e.g. 500.3m vs 503.8m.

Note that higher frequency logs take significantly longer to process in GPSResults - **TBC 6.185**

