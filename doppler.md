## Doppler vs Positional - WIP

### Introduction

Positional vs Doppler.

Kalman (GPS chip) + smoothing (watch).

Kalman filtering in the SirfSTAR III chipset uses a combination of both position fixes and the doppler shift, mainly depending upon the strength of the satellite signals. Smoothing then occurs in devices produced by Garmin, etc.

Speeds are best on the Locosys GT-31 when track smoothing is disabled in the SiRF3 chipset navigation parameters. See appendix by Tom Chalko.



### COG and SOG

SiRF reference

u-box reference

Most GPS chips output COG and SOG in the NMEA sentences RMC and VTG.



### Protocols

#### NMEA

Most GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant.

The following common NMEA sentences provide useful data for speed sailing:

- **GLL** - Geographic Position - Latitude/Longitude (e.g. $GNGLL)
  - Includes **latitude**, **longitude**, **time** (UTC)
- **GSA** - GPS DOP and active satellites (e.g. $GNGSA)
  - Includes **fix type**, **satellite IDs**, **PDOP, HDOP, VDOP**
- **GSV** - Satellites in view (e.g. $GPGSV)
  - Includes **sats** (0-99)
  
- **RMC** - Recommended Minimum Navigation Information (e.g. $GNRMC)
  - Includes **COG** and **SOG**
- **VTG** - Track made good and Ground speed (e.g. $GPVTG or $GNVTG)
  - Includes **COG** and **SOG**



Less common sentence also includes the following:

- **GBS** - GPS Satellite Fault Detection
  - Expected 1-sigma **error** in latitude, longitude and altitude (meters)

- **GGA** - Global Positioning System Fix Data (e.g. $GPGGA)
  - Includes **latitude**, **longitude**, **fix** (2d / 3d), **sats** (0-99), **HDOP**
- **GNS** - Fix data (e.g. $GPGNS or $GNGNS)
  - Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**
- **ZDA** - GNSS Time & Date (e.g. $GNZDA)
  - Includes **time** and date (**UTC**)



MediaTek have several [proprietary sentences](http://ozzmaker.com/wp-content/uploads/2016/08/M10478-M10578-NMEA_Sentence_Output.pdf), including one similar to GBS:

- **EPE** – Accuracy estimate sentence
  - **Horizontal accuracy estimate** (m) xx.xx
  - **Vertical accuracy estimate** (m) xx.xx



SiRF also have proprietary sentences, at least in the SirfSTAR V, including this one similar to GBS:

- **EPE** – Accuracy estimate sentence

  - **HDOP** - Horizontal Dilution of Precision
  - **EHPE** - Estimated Horizontal Position Error (meters)

  - **EVPE** - Estimated Vertical Position Error (meters)
  - **EHVE** - Estimated Velocity Error (m/s)
  - **EHE** - Estimated Heading Error (degrees)



#### SiRF

SirfSTAR II was the first chip to provide Doppler speed and was used in the Locosys GT-11.

SirfSTAR  III was used in the Locosys GT-31. It updates the tracking of doppler shift [10 times per second](http://greenhulk.net/forums/showthread.php?t=259199) internally.

SirfSTAR IV has a much improved Doppler shift algorithm internally, is faster to compute the Kalman filter variables, and can provide data from the chipset at 5 times per second. The SirfSTAR IV chipset also at 100 ms, and the Kalman filter outputs every 200 ms.

SirfSTAR V added GLONASS capability alongside GPS for more precise positions. It also processes data internally faster.

TODO - SDOP + VSDOP (GT-31), SDOS (GW-52 / GW-60)



#### u-blox

TODO - sAcc, etc.



### Smart Watches

#### COROS

Sats, HDOP and COG have been added to the FIT files of COROS watches.

These are readily available from standard NMEA sentences supported by the Sony chip.

Speed and COG almost certainly come from the RMC or VTG messages.



#### Garmin Fenix

The Garmin Fenix 3 and 5 use the MediaTek MTK3333.

There is every reason to believe that "speed" is the SOG from RMC or VTG messages.

TODO - Screenshots



### References

- [GPS as a low-speed Speedometer](https://www.model-engineer.co.uk/forums/postings.asp?th=175442&p=2)
  - Includes two interesting responses from "Joseph Noci 1", regarding the SiRF chipset and Doppler speeds.
  - Joseph mentions spending many years developing autopilot and flight control systems for Military drones.
