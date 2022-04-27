## Doppler vs Positional - WIP

### Introduction

Positional vs Doppler.

Kalman (GPS chip) + smoothing (watch).

Kalman filtering in the SiRFstar III chipset uses a combination of both position fixes and the doppler shift, mainly depending upon the strength of the satellite signals. Smoothing then occurs in devices produced by Garmin, etc.

Speeds are best on the Locosys GT-31 when track smoothing is disabled in the SiRF3 chipset navigation parameters. See appendix by Tom Chalko.



### SOG and COG

SiRF reference

u-box reference

Most GPS chips output SOG and COG in the NMEA sentences RMC and VTG.



### Protocols

#### NMEA

Pretty much all GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant.



The following are common NMEA sentences:

- **GGA** - Global Positioning System Fix Data (e.g. $GPGGA)
  - Includes **time** (UTC), **latitude**, **longitude**, **fix** (2d / 3d), **sats** (0-99), **HDOP**
- **GLL** - Geographic Position - Latitude/Longitude (e.g. $GNGLL)
  - Includes **time** (UTC), **latitude and **longitude**
- **GSA** - GPS DOP and active satellites (e.g. $GNGSA)
  - Includes **fix type**, **satellite IDs**, **PDOP, HDOP, VDOP**
- **GSV** - Satellites in view (e.g. $GPGSV)
  - Includes **sats** (0-99)
  
- **RMC** - Recommended Minimum Navigation Information (e.g. $GNRMC or $GPRMC)
  - Includes **time** (UTC), **latitude**, **longitude**, **SOG** and **COG**
- **VTG** - Track made good and Ground speed (e.g. $GNVTG or $GPVTG)
  - Includes **SOG** and **COG**



Less common sentence include the following:

- **GBS** - GPS Satellite Fault Detection
  - Includes **time** (UTC) and expected 1-sigma **errors** in latitude, longitude and altitude (meters)

- **GNS** - Fix data (e.g. $GNGNS or $GPGNS)
  - Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**
- **ZDA** - GNSS Time & Date (e.g. $GNZDA)
  - Includes **time** and date (**UTC**)



MediaTek have some [proprietary sentences](http://ozzmaker.com/wp-content/uploads/2016/08/M10478-M10578-NMEA_Sentence_Output.pdf), including the following:

- **EPE** – Accuracy estimate sentence
  - **Horizontal accuracy estimate** (m) xx.xx
  - **Vertical accuracy estimate** (m) xx.xx
- **GST** - GNSS Pseudorange Error Statistics, including:
  - **Standard deviation of latitude error** (m) x.x (max 5 characters)
  - **Standard deviation of longitude error** (m) x.x x.x (max 5 characters)
  - **Standard deviation of altitude error** (m) x.x x.x (max 5 characters)




SiRF also have a proprietary sentence in the SiRFstar IV and V:

- **PSRFEPE** – Accuracy estimate sentence
  - **HDOP** - Horizontal Dilution of Precision
  - **EHPE** - Estimated Horizontal Position Error (meters)
  
  - **EVPE** - Estimated Vertical Position Error (meters)
  - **EHVE** - Estimated Velocity Error (m/s)
  - **EHE** - Estimated Heading Error (degrees)





Support for the various sentences:

|                    |                                           | SiRF<br />Star III | SiRF<br />Star IV | SiRF<br />Star V | MediaTek<br />MT3318 | MediaTek<br />MTK3333 | Sony<br />CXD5603GF | Airoha<br />AG3335M |
| :----------------: | ----------------------------------------- | :----------------: | :---------------: | :--------------: | :------------------: | :-------------------: | :-----------------: | :-----------------: |
| PSRFEPE (SiRF EPE) | time, HDOP, EHPE, EVPE, EHVE, EHE         |         -          |        Yes        |       Yes        |          -           |           -           |          -          |                     |
|        GBS         | time, 1-sigma errors for lat + long + alt |         -          |         -         |        -         |          -           |           -           |          -          |                     |
|      **GGA**       | time, lat, long, sats, HDOP               |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |         Yes         |                     |
|        GLL         | time, lat, long                           |        Yes         |        Yes        |       Yes        |         Yes          |           -           |         Yes         |                     |
|        GNS         | time, lat, long, sats, HDOP               |         -          |         -         |       Yes        |          -           |           -           |         Yes         |                     |
|        GSA         | sats, PDOP, HDOP, VDOP                    |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |         Yes         |                     |
|        GSV         | sats                                      |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |         Yes         |                     |
|      **RMC**       | time, lat, long, SOG, COG                 |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |         Yes         |                     |
|        VTG         | SOG, COG                                  |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |         Yes         |                     |
|        ZDA         | time                                      |         -          |        Yes        |       Yes        |          -           |           -           |         Yes         |                     |

Note: GPSBabel only outputs GPGGA and GPRMC (highlighted) when processing SBP and SBN files.



#### SiRF

A brief summary:

- SiRFstar II was the first chip to provide Doppler speed and was used in the Locosys GT-11.
- SiRFstar  III was used in the Locosys GT-31. It updates the tracking of doppler shift [10 times per second](http://greenhulk.net/forums/showthread.php?t=259199) internally.
- SiRFstar IV has a much improved Doppler shift algorithm internally, is faster to compute the Kalman filter variables, and can provide data from the chipset at 5 times per second. The SiRFstar IV chipset also at 100 ms, and the Kalman filter outputs every 200 ms.
- SiRFstar V added GLONASS capability alongside GPS for more precise positions. It also processes data internally faster.



SDOP:

- SDOP + VSDOP (GT-31), SDOS (GW-52 / GW-60). Suspect these are both EHVE from the PSRFEPE message.

- EPE message available from [Star IV](https://mikrokontroler.pl/wp-content/uploads/pliki/L50_GPS_Protocol_V1%200_Preliminary_20110727.pdf) - section 3.2.2. Also table 2-8 in One Socket Protocol Interface Control Document from 2009. Comment for EPE message:
  - In SiRFNavIII software, this field is reserved for SiRF's proprietary $PSRFEPE message. Otherwise it is unused
- EHVE is also mentioned in the SiRFDemo User Guide.
- Erinome-I uses SiRFstar V and definitely supports PSRFEPE.



Data sheets

- [Qualcomm](https://www.qualcomm.com/products/application/automotive/positioning-solutions/SiRFstar-iv-4e?classification=Data+Sheet#Documentation)
  - [SiRFstar V](https://www.qualcomm.com/products/application/automotive/positioning-solutions/sirfstar-v-5ea) supports SiRFDRive™ dead-reckoning technology as does SiRFstar III. Can assume SiRF 4 also supports it.
  - [SiRFstar IV](https://www.qualcomm.com/products/application/automotive/positioning-solutions/sirfstar-iv-4e) doesn't mention it but is targeted at automotive industry




History

- SiRFstar III was available in at least [2007](https://www.geospatialworld.net/news/sirfstariii-to-drive-industry/).
- EHPE, EVPE, EHVE and ETE were all mentioned in SiRFDemo User Guide 1.5 in June 2007.
- PSRFEPE message was not included in message ID 129 (switch to NMEA) in v2.3 SiRF documentation - Dec 2007.
- PSRFEPE was added to message ID 129 (switch to NMEA) in v2.4 SiRF documentation, along with ZDA - Dec 2008.
  - Was PSRFEPE already supported in the SiRFstar III and activated via a firmware update within the GT-31?
- SiRFstar IV was release in 2009 and it supported PSRFEPE.
- **Locosys S4-1513** was released in 2010, using SiRFstar IV and it had a 5 Hz update rate.
  - Message 7 is not defined but it is placed where PSRFEPE would go, relative to ZDA which was also added. See Table 5.2-8 Messages.
  - Product page in [2011](https://web.archive.org/web/20111208154333/http://www.locosystech.com/product.php?zln=en&id=62) says 5Hz and mentions marine navigation.
  - Other modules also existed in 2012 which used the SiRFstar IV
    - See [WayBackMachine](https://web.archive.org/web/20120418013107/http://www.locosystech.com/product.php?zln=en&id=68)
    - n.b. S4-1612 and S4-1613 are only 1 Hz
  - Many of them still existed in [2014](https://web.archive.org/web/20140926104614/http://www.locosystech.com:80/product.php?zln=en&id=68)
    - S4-0606, S4-1513-xx, S4-1612-xx, S4-1613-xx, S5-1010-2R
  - A bunch of them existed in [2016](https://web.archive.org/web/20160528205831/http://www.locosystech.com/product.php?zln=en&id=68)
  - Sep [2017](https://web.archive.org/web/20170922115854/http://www.locosystech.com/en/category/GPS-Module/GPS-Module.html)
    - [ROM based](https://web.archive.org/web/20170922232054/http://www.locosystech.com/en/category/GPS-ROM-Base/GPS-ROM-Base.html) - S4-0606, **S4-1513-2R**, S4-1612-2R
    - [flash based](https://web.archive.org/web/20170922230417/http://www.locosystech.com/en/category/GPS-Flash-Base/GPS-Flash-Base.html) - **S4-1513**, **S4-1513-2E**, S4-1612-2E, S4-1613
  - LOCOSYS S4-1513-2R still listed in [2019](https://web.archive.org/web/20191218151108/https://www.locosystech.com/en/product/index.html);
    - ROM based - S4-0606, **S4-1513-2R**, S4-1612-2R
      - Oddly, not on 2017 page - S5-1010-2R, S5-0707-2R
    - flash based - **S4-1513**, **S4-1513-2E**, S4-1612-2E, S4-1613
- SiRFstar V was launched in 2012 and it supports PSRFEPE, mentioned in ERINOME-I documentation.
- GW-52 was released in 2015. Would seem likely it used the Locosys S4-1613. Why MediaTek - what frame references?
- PSRFEPE message was introduced to [gpsd](https://github.com/ukyg9e5r6k7gubiekd6/gpsd) in [March 2019](https://github.com/ukyg9e5r6k7gubiekd6/gpsd/blob/master/driver_nmea0183.c). Comment in the code says "SiRF won't say if these are 1-sigma or what".



2019 website:

> LOCOSYS S4-1513-2R GPS module features high sensitivity, low power and ultra small form factor. This GPS module's functionality uses the state of the art SiRF GSD4e chip and it provides you with superior sensitivity and performance even in urban canyon and dense foliage environment. Optional Built-in EEPROM realizes SiRF CGEE (Client Generated Extended Ephemeris) function that predicts satellite positions for up to 3 days and delivers CGEE-start time of less than 15 seconds under most conditions, without any network assistance. Besides, MicroPowerMode allows GPS module to stay in a hot-start condition nearly continuously while consuming very little power.



#### u-blox

TODO - sAcc, etc.



### Smart Watches

#### COROS

The COROS APEX Pro and VERTIX use the Sony CXD5603GF.

The CXD5603GF outputs several standard NMEA messages; GGA, GLL, GNS, GSA, GSV, RMC, VTG and ZDA.

Sats, HDOP and COG are "developer fields" included in the FIT files exported by the APEX Pro and VERTIX.

These items are almost certainly obtained from common NMEA sentences:

- Speed and COG almost certainly come from RMC messages, possibly VTG.
- HDOP could come from GGA, GNS or GSA messages.



#### Garmin Fenix 3 + 5

The Garmin Fenix 3 and 5 use the MediaTek MTK3333.

The MTK3333 outputs several standard NMEA messages; GGA, GSA, GSV, RMC and VTG.

There is every reason to believe that reported "speed" is actually SOG from RMC messages, possibly VTG.

TODO - Screenshots



#### Garmin Fenix 6

The Garmin Fenix 6 uses the Sony CXD5603GF.

There is every reason to believe that reported "speed" is actually SOG from RMC messages, possibly VTG.

TODO - Screenshots



### References

- [GPS as a low-speed Speedometer](https://www.model-engineer.co.uk/forums/postings.asp?th=175442&p=2)
  - Includes two interesting responses from "Joseph Noci 1", regarding the SiRF chipset and Doppler speeds.
  - Joseph mentions spending many years developing autopilot and flight control systems for Military drones.
