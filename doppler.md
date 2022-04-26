## Doppler vs Positional - WIP

### Introduction

Positional, Doppler, Kalman, etc.

Track smoothing in the GT-31:

- TrkSmoothMode: disabled



### COG and SOG

SiRF reference

u-box reference

Most GPS chips output COG and SOG in the NMEA sentences RMC and VTG.



### Protocols

#### NMEA

Most GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant.

The following common NMEA sentences provide useful data for speed sailing:

- **GLL** - Geographic Position - Latitude/Longitude
  - Includes **latitude**, **longitude**, **time** (UTC)
- **GSA** - GPS DOP and active satellites (e.g. $GNGSA)
  - Includes **fix type**, **satellite IDs**, **PDOP, HDOP, VDOP**
- **GSV** - Satellites in view
  Includes **sats** (0-99)
- **RMC** - Recommended Minimum Navigation Information 
  - Includes **COG** and **SOG**
- **VTG** - Track made good and Ground speed (e.g. $GPVTG)
  - Includes **COG** and **SOG**



Less common sentence also includes the following:

- **GBS** - GPS Satellite Fault Detection
  - Expected 1-sigma **error** in latitude, longitude and altitude (meters)

- **GGA** - Global Positioning System Fix Data
  - Includes **latitude**, **longitude**, **fix** (2d / 3d), **sats** (0-99), **HDOP**
- **GNS** - Fix data (e.g. $GPGNS)
  - Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**
- **ZDA** - GNSS Time & Date
  - Includes **time** and date (**UTC**)



MediaTek have several [proprietary sentences](http://ozzmaker.com/wp-content/uploads/2016/08/M10478-M10578-NMEA_Sentence_Output.pdf), including one similar to GBS:

- **EPE** – Accuracy estimate sentence
  - **Horizontal accuracy estimate** (m) xx.xx
  - **Vertical accuracy estimate** (m) xx.xx



#### SiRF

TODO

- SiRF Star II - GT-11
- SiRF Star III - GT-31

SDOP + VSDOP (GT-31), SDOS (GW-52 / GW-60)



#### u-blox

TODO

sAcc, etc.



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
  - includes two interesting responses from "Joseph Noci 1", regarding the SiRF chipset and Doppler speeds.
  - Joseph mentions spending many years developing autopilot and flight control systems for Military drones.
