## Proposal for GPX

### Quick Introduction

This proposal is to add some useful GPS / GNSS data items to the GPX standard; e.g. "course", "speed", accuracy estimates and device information.

I've tried to be quite thorough in this article so that the benefits of this additional data are clearly apparent. Apologies for the rather lengthy document.

What is included:

- This is solely about useful data originating from the GPS / GNSS chips in modern consumer devices, phones and wearables.

What is NOT included:

- This is not about data originating from other sensors (e.g. accelerometers, electronic compasses, heart rate monitors, thermometers, etc).
- This is unrelated to any previous proposal(s) to incorporate existing extensions into the GPX standard (e.g. heart rate, temperature, etc).

Interoperability / compatibility of the proposal with existing software and GPX 1.0 / GPX 1.1 files is of the utmost importance:

- The inclusion of "course" and "speed" are entirely consistent / compatible with GPX 1.0.
- The other data items (e.g. accuracy estimates) have been added in such a way as to ensure forwards and backwards compatibility with GPX 1.1.
- There is no obligation for companies to change existing products or software, but they have the option to adopt the new features very easily.



### Overview of GPS / GNSS

It is perhaps worth quickly summarising the inner workings of a GPS / GNSS receiver in order for the significance of course and speed to be appreciated.

The GPS / GNSS chipset is essentially responsible for producing a PVT (position + velocity + time) solution at regular intervals. This is typically once every second but sometimes more frequently (e.g. 5 Hz, 10 Hz, 20 Hz or 25 Hz).

The overall process can be summarised as two separate steps:

1. Determination of raw "observables" for each satellite. This occurs during the initial signal acquisition and during the subsequent tracking:
   - **Pseudo-range** corresponds to the distance from the receiver antenna to the satellite antenna, including receiver and satellite clock offsets and other biases.
   - **Carrier phase** is a measurement of the beat frequency between the received carrier of the satellite signal and a receiver-generated reference frequency.
   - **Doppler shift** is the change in frequency for the receiver antenna moving relative to the satellite antenna.
2. Determination of a PVT solution from the raw "observables" obtained during the first step:
   - **Position and time** are derived primarily from the **pseudo-range** observables via [trilateration](https://en.wikipedia.org/wiki/Trilateration).
   - **Course** over ground (COG) and **speed** over ground (SOG) are derived from a 3D velocity, (typically) derived from the **doppler shift** observables.

The important point to highlight is that GPS / GNSS chipsets do not calculate velocity / speed from the positional data. In essence, position and velocity are calculated independently and speeds derived from the doppler shift observables are far more accurate / robust than speeds derived from positional data.



#### References

These links are just to get people started:

- GNSS observables
  - [GNS-SDR](https://gnss-sdr.org/docs/sp-blocks/observables/) - An open-source Global Navigation Satellite Systems software-defined receiver.
  - [European Space Agency (ESA)](https://gssc.esa.int/navipedia/index.php/GNSS_Basic_Observables) - The reference for Global Navigation Satellite Systems.
- Derivation of velocity / speed
  - [InsideGNSS](https://insidegnss.com/wp-content/uploads/2018/01/marapr15-SOLUTIONS.pdf) - How does a GNSS receiver estimate velocity? Mar / Apr 2015.
  - [Evaluation of the performance of GNSS-based velocity estimation algorithms](https://satellite-navigation.springeropen.com/articles/10.1186/s43020-022-00080-4) - Ji Li et al. 2022.
