### Typical values

GPSTest forum - https://groups.google.com/g/gpstest_android

- EHPE / hAcc medians:
  - GT-11 (SiRF Star II) = 2.52
  - GT-31 (SiRF Star III) = 0.72, comparable to u-blox
  - Motion (u-blox M8) = 0.776, comparable to SiRF Star III
  - Apple Watch Series 5 = 4.0 (maybe doubled to give 2-sigma)
  - Apple Watches (others) = 4.75 (maybe doubled to give 2-sigma)
- EVPE / vAcc medians:
  - GT-11 (SiRF Star II) = 4.48 (factor 1.77)
  - GT-31 (SiRF Star III) = 1.03 (factor = 1.431), comparable to u-blox
  - Motion (u-blox M8) = 1.137 (factor = 1.465), comparable to SiRF Star III
  - Apple Watch Series 5 = TBC
  - Apple Watches (others) = TBC
- EHVE / vAcc medians (remember these are m/s, rather than knots):
  - GT-31 (SiRF Star III) = 0.14 m/s (0.27 knots), comparable to u-blox.
    - FILTER = 2 knots
  - GW-52 (SiRF Star IV) = 0.06, ~0.1 (0.19 knots) when moving
  - GW-60  (SiRF Star IV) = 0.22. Low when not moving, ~0.25 when moving (overhand), ~0.55 m/s (1.07 knots) when moving (underhand).
    - FILTER = 2 knots (1 Hz) or  4 knots (5 Hz).
  - Motion (u-blox M8) = 0.172 m/s (0.33 knots), comparable to SiRF Star III.
    - FILTER = 1.2 knots (regardless of frequency).
  - Apple Watch Series 5 = ~0.3 (maybe not doubled)
  - Apple Watches (others) = ~1.1 - 1.2 (maybe 0.5 m/s  doubled to give 2-sigma), comparable to 2 x SiRF Star IV in GW-60 when moving)

