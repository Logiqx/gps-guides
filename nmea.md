## NMEA

### Introduction

Pretty much all GPS chipsets are [NMEA-0183](https://gpsd.gitlab.io/gpsd/NMEA.html) compliant which is a simple text based protocol.

You can find an [overview](https://receiverhelp.trimble.com/alloy-gnss/en-us/NMEA-0183messages_MessageOverview.html) of NMEA-0183 messages on the Trimble website.

Full details about the NMEA-0183 standard itself can be found on the NMEA [website](https://www.nmea.org/content/STANDARDS/NMEA_0183_Standard).



### Common Sentences

The following are the most common NMEA sentences output by GPS / GNSS chips:

- **GGA** - Global Positioning System Fix Data (e.g. $GPGGA or $GNGGA)
  - Includes **time** (UTC), **latitude**, **longitude**, **fix** (2d / 3d), **sats** (0-99), **HDOP**
- **GLL** - Geographic Position - Latitude/Longitude (e.g. $GPGLL or $GNGLL)
  - Includes **time** (UTC), **latitude and **longitude**
- **GSA** - GPS DOP and active satellites (e.g. $GPGSA or $GNGSA)
  - Includes **fix type**, **satellite IDs**, **PDOP, HDOP, VDOP**
- **GSV** - Satellites in view (e.g. $GPGSV or $GNGSV)
  - Includes **sats** (0-99)
  
- **RMC** - Recommended Minimum Navigation Information (e.g. $GPRMC or $GNRMC)
  - Includes **time** (UTC), **latitude**, **longitude**, **SOG** and **COG**
- **VTG** - Track made good and Ground speed (e.g. $GPVTG or $GNVTG)
  - Includes **SOG** and **COG**



### Less Common Sentences

Less common sentences include the following:

- **GBS** - GPS Satellite Fault Detection (e.g. $GPGBS or $GNGBS)
  - Includes **time** (UTC) and expected 1-sigma **errors** in latitude, longitude and altitude (meters)

- **GNS** - Fix data (e.g. $GPGNS or $GNGNS)
  - Includes **time** (UTC), **latitude**, **longitude**, **sats** (0-99) and **HDOP**
- **ZDA** - GNSS Time & Date (e.g. $GPZDA or $GNZDA)
  - Includes **time** and date (**UTC**)



### Proprietary Sentences

#### SiRF NMEA

Message ID 129 is used to switch the serial port from binary to NMEA protocol and specify the message output rates.

Specifying the EPE message rate via message ID 129 will enable the proprietary $PSRFEPE.

A proprietary SiRF output sentence called **$PSRFEPE** provides accuracy estimates:

| Field | Description                         | Units   |
| ----- | ----------------------------------- | ------- |
| HDOP  | Horizontal Dilution of Precision    | -       |
| EHPE  | Estimated Horizontal Position Error | m       |
| EVPE  | Estimated Vertical Position Error   | m       |
| EHVE  | Estimated Velocity Error            | m/s     |
| EHE   | Estimated Heading Error             | degrees |

The proprietary $PSRFEPE sentence is documented by [Erinome-I](pdf/sirf/Erinome-I_User_Manual_rev1.7.pdf) and was subtly documented, almost hidden away in the [SiRF Binary Protocol](pdf/sirf/SiRF_Binary_Protocol_2.4_2008_11.pdf) 2.4 of Nov 2008 and onwards. Support for the PSRFEPE sentence was also added to the [gpsd](https://github.com/ukyg9e5r6k7gubiekd6/gpsd) library in [March 2019](https://github.com/ukyg9e5r6k7gubiekd6/gpsd/blob/master/driver_nmea0183.c).

$PSRFEPE has clearly been documented for SiRFNavIII since at least Nov 2008 and has been documented as being available in the  [SiRFstar IV](https://mikrokontroler.pl/wp-content/uploads/pliki/L50_GPS_Protocol_V1%200_Preliminary_20110727.pdf).



#### SiRF Binary Protocol

EHPE, EVPE and EHVE have also been well documented since an early SiRF binary protocol document, produced by NAVMAN in [2004](pdf/sirf/SiRF_Binary_Protocol_1.x_2004_02.pdf).

The SiRF binary protocol document from 2009 describes them for message ID 41 (geodetic navigation data) as follows:

| Name                                | Bytes | Description                                      |
| ----------------------------------- | ----- | ------------------------------------------------ |
| Estimated Horizontal Position Error | 4 U   | EHPE in meters x 10<sup>2</sup>                  |
| Estimated Vertical Position Error   | 4 U   | EVPE in meters x 10<sup>2</sup>                  |
| Estimated Time Error                | 4 U   | ETE in seconds x 10<sup>2</sup> (SiRFDRive only) |
| Estimated Horizontal Velocity Error | 2 U   | EHVE in m/s x 10<sup>2</sup> (SiRFDRive only)    |

It is worth mentioning that EHPE, EVPE, ETE and EHVE are also described in the SiRF demo [user guide](pdf/sirf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) from June 2007.

Note: The SiRF binary protocol outputs ETE (but not EHE) whereas the Erinome-I [documentation]((pdf/sirf/Erinome-I_User_Manual_rev1.7.pdf)) describing $PSRFEPE includes EHE. The one socket protocol interface control [document](pdf/sirf/One_Socket_Protocol_Interface_Control_Document_2009.pdf) from 2009 mentions EHE in the "DR NAV Status Output Message" but EHE is not included in the output of message ID 41.



#### MediaTek

The MediaTek MT3333 has some [proprietary sentences](pdf/mediatek/M10478-M10578-NMEA_Sentence_Output.pdf), including the following accuracy / error estimates.

**EPE** – Accuracy estimate

| Description                  | Units | Format |
| ---------------------------- | ----- | ------ |
| Horizontal accuracy estimate | m     | xx.xx  |
| Vertical accuracy estimate   | m     | xx.xx  |

**GST** - GNSS Pseudo-range Error Statistics:

| Description                               | Units | Format                 |
| ----------------------------------------- | ----- | ---------------------- |
| Standard deviation of **latitude error**  | m     | x.x - max 5 characters |
| Standard deviation of **longitude error** | m     | x.x - max 5 characters |
| Standard deviation of **altitude error**  | m     | x.x - max 5 characters |




### Summary

Popular GPS / GNSS chips output a number of standard NMEA sentences:

|          |                                           | SiRF<br />Star III | SiRF<br />Star IV | SiRF<br />Star V | MediaTek<br />MT3318 | MediaTek<br />MTK3333 |        Sony<br />CXD5603GF        |  Airoha<br />AG3335M  |
| :------: | ----------------------------------------- | :----------------: | :---------------: | :--------------: | :------------------: | :-------------------: | :-------------------------------: | :-------------------: |
|          | devices                                   |       GT-31        | GW-52<br />GW-60  |        -         |                      |      Fenix 3 + 5      | Fenix 6<br />APEX Pro<br />VERTIX | Fenix 7<br />VERTIX 2 |
|   GBS    | time, 1-sigma errors for lat + long + alt |         -          |         -         |        -         |          -           |           -           |                 -                 |           -           |
| **GGA**  | time, lat, long, sats, HDOP               |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |                Yes                |          Yes          |
|   GLL    | time, lat, long                           |        Yes         |        Yes        |       Yes        |         Yes          |           -           |                Yes                |          Yes          |
|   GNS    | time, lat, long, sats, HDOP               |         -          |         -         |       Yes        |          -           |           -           |                Yes                |           -           |
| **GSA**  | sats, PDOP, HDOP, VDOP                    |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |                Yes                |          Yes          |
| **GSV**  | sats                                      |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |                Yes                |          Yes          |
| **RMC**  | time, lat, long, SOG, COG                 |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |                Yes                |          Yes          |
|   VTG    | SOG, COG                                  |        Yes         |        Yes        |       Yes        |         Yes          |          Yes          |                Yes                |          Yes          |
|   ZDA    | time                                      |       (Yes)        |        Yes        |       Yes        |          -           |           -           |                Yes                |          Yes          |
| $PSRFEPE | time, HDOP, EHPE, EVPE, EHVE, EHE         |         -          |        TBC        |       Yes        |          -           |           -           |                 -                 |           -           |

Notes:

- Locosys GT-31 firmware can output GGA, GLL, GSA, GSV, RMC, VTG and ZDA.
- Locosys GW-52 firmware can only read GPGGA, GPGSA, GPGSV and GPRMC sentences of a MediaTek chip.
- GPSBabel only outputs GPGGA and GPRMC when processing SBP and SBN files.

