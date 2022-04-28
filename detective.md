## Detective Work - WIP

### Introduction

SiRFstar IV or MediaTek MT3318?

Speculation leads to more questions - SDOP, SDOS.

Links to Seabreeze.



Timeline, features of SiRFstar IV and Locosysy GPS modules.

TLDR - I strongly believe the GW-52 and GW-60 use the SiRFstar IV. They could use the SiRFstar V but that would be unnecessary given their features.



Data sheets trawled.

SiRF binary message 41 has remained unchanged in all available documents

- SiRF Binary Protocol Reference Manual published by NAVMAN in Feb 2004
- 

Table 2-8 Switch To NMEA Protocol – Message ID 129

- EPE



### SiRFDrive

Error estimates included in SiRF binary data.

SiRF demo.

The PSRFEPE output sentences was added later and is mentioned in the SiRF reference manual.

**PSRFEPE** – Accuracy estimate sentence

- **HDOP** - Horizontal Dilution of Precision
- **EHPE** - Estimated Horizontal Position Error (meters)

- **EVPE** - Estimated Vertical Position Error (meters)
- **EHVE** - Estimated Velocity Error (m/s)
- **EHE** - Estimated Heading Error (degrees)

TODO - screenshot from SiRF reference

SiRFstar III, SiRFstar IV and SiRFstar V all support SiRFDrive and thus can generate the error estimates.



#### GT-31

Hex to ASCII:

```
grep ^S315 GT31_FW_V1.4B0803T | sed 's/^S315........//;s/..$//' | tr -d "\n\r" | xxd -r -p | strings >GT31.txt
```

NMEA sentences present. These all appear in the memory card logging options:

- $GPGGA 
- $GPGLL
- $GPGSA 
- $GPGSV
- $GPRMC
- $GPVTG
- $GPZDA - additional to Star III spec?

Additional NMEA sentences, presumably also for initializing the GPS chip:

- $PLSC - Locosys xxx?
- $PLSR - Locosys restart?
- $PSRF - SiRF prefix

Includes lots of debugging messages and has a reference to SiRFDRive.

No references to MediaTek or MTK are in the firmware.



#### GW-52 + GW-60

GW-52 spec refers to SDOS and says "typical accuracy of 10s average speed measurement: ~3 cm/s,
99.7% certainty". This suggests to me that that SDOS relates to 3σ, so 3 standard deviations.

As an aside, it's interesting to note that the GW-52 includes an internal name of GW-31.

NMEA commands in the GW-52 and GW-60 provide everything needed for standard logging:

- GPRMC - Recommended Minimum Navigation Information
- GPGSV - Satellites in view
- GPGSA - GPS DOP and active satellites
- GPGGA - Global Positioning System Fix Data
- PLSEPE - Locosys (PLS) Estimated Positional Error
- PLSV - Locosys (PLS)

Mediatek commands present in the firmware:

- $PMTK605*31 - Query the firmware release information. 
- $PMTK103*30 - Cold Restart: Don't use Time, Position, Almanac / Ephemeris data. 
- $PMTK253,0,115200*01 - Set data output format and baud rate for current port.

Mediatek commands to change the [fix and output rate](https://github.com/adafruit/Adafruit_GPS/issues/22) are NOT present in the firmware:

- $PMTK220,1000*1F - Set NMEA port update rate to 1Hz
- $PMTK220, 200*2C - Set NMEA port update rate to 5Hz
- $PMTK300,1000,0,0,0,0*1C - Set rate of position fixing activity to 1 Hz
- $PMTK300,200,0,0,0,0*2F - Set rate of position fixing activity to 5 Hz



There are enough NMEA commands to log standard data but they do not include SDOP / SDOS.

There is also no way to switch the GPS chip between 1 Hz and 5 Hz logging.



### Hypothesis

GT-11, GT-31, GW-52 and GW-60 are not only products in their own right but a test platform for their GPS modules.

Between 2010 and 2021 Locosys had numerous GPS modules using SiRF and Mediatek chipsets.

The S4-1513 series supported 5Hz and could easily have been used in the GW-52.

- Rom based - S4-1513-2R
- Flash based - S4-1513, S4-1513-2E

It would most likely have been the S4-1513 due to the lower power usage versus the S4-1513-2X models.

t won't have been the S4-0606 or S4-1612 ranges because they were 1 Hz, according to their product sheets.

Table Table 5.2-8 has a mysterous "undefined" where PSRFEPE would be placed.

TODO - add screenshot of SiRF manual and this table



The GW-60 won't have used an actual GPS module but it could have used the internal components of the S4-1513 series.



I suspect the MTK references are just hangovers from testing. All of the NMEA commands are in plain sight but they are all standard commands and do not provide error estimates. The NMEA commands to switch between 1 Hz and 5 Hz logging are also absent.



So, back to the simplest explanation, Locosys likely used the SiRFstar IV:

- They were actively selling the S4-1513 range of GPS modules
- SiRF IV supports the error data from SiRFdrive



### Summary

The anecdotal evidence of the MediaTek references actually disprove the use of a MediaTek chip. We are therefore left to conclude that in all probability, Locosys used the SiRFstar IV in the GW-52 and GW-60. The SiRFstar IV has all of the features of the GW-52 and GW-60; 1 Hz + 5 Hz logging and estimation of speed errors with a resolution of 1 cm/s. 

The acceptance of using the SiRF IV chips also removes other topics of debate such as what the SDOP / SDOS values represent if they came from a MediaTek chip. Topics such as how the proprietary SiRF error estimates got into the MediaTek chip or whether they devised their own method of estimation are mute points.

The GW-52 product specification hints at the SDOS measure using 3σ which is consistent with the findings of Tom Chalko. It is worth noting that the u-blox measure is almost certainly based on 1σ due to other similar metrics using 1 standard deviation.



### References

- Locosys
  - Marketing materials
    - [GW-52 specifications v1.2](pdf/locosys/GW-52_spec_v1.2.pdf) - mentioned SDOS and 99.7% certainty
    - [GW-60 product details](pdf/locosys/GW60_EDM.pdf) - mentioned SDOS and 99.7% certainty
    - [LOCOSYSTECH product brochure](pdf/locosys/LOCOSYSTECH_DM.pdf) - includes details of the S4-1513 range of GPS modules
  - GPS module data sheets
    - [S4-0606 datasheet v1.2](pdf/locosys/s4-0606_datasheet_v1.2.pdf) - 1 Hz update rate
    - [S4-1513 datasheet v1.1](pdf/locosys/s4-1513_datasheet_v1.1.pdf) - up to 5 Hz update rate
    - [S4-1612 datasheet v1.4](pdf/locosys/s4-1612_datasheet_v1.4.pdf) - 1 Hz update rate
    - [S4-1613 datasheet v1.4](pdf/locosys/s4-1613_datasheet_v1.4.pdf) - 1 Hz update rate
- SiRF
  - Marketing materials
    - [SiRFstar III product insert](pdf/sirf/GSC3LP_Product_Insert.pdf) - supports SiRFDrive
  - Binary protocol descriptions
    - [One Socket Protocol Interface Control Document 2009](pdf/sirf/One_Socket_Protocol_Interface_Control_Document_2009.pdf) - includes SiRF binary protocol from Sep 2009
    - [SiRF Binary Protocol 2.4 Nov 2008](pdf/sirf/SiRF_Binary_Protocol_2.4_2008_11.pdf) - EPE is included in message 129 (switch To NMEA protocol)
    - [SiRF Binary Protocol 2.3 Dec 2007](pdf/sirf/SiRF_Binary_Protocol_2.3_2007_12.pdf) - EPE is not included in message 129
    - [SiRF Binary Protocol 1.x Feb 2004](pdf/sirf/SiRF_Binary_Protocol_1.x_2004_02.pdf) - EPE is not included in message 129
  - NMEA protocol descriptions
    - [Erinome-I User Manual rev1.7](pdf/sirf/Erinome-I_User_Manual_rev1.7.pdf) - based on SiRFstar V it details the SiRF specific NMEA message $PSRFEPE; UTC, HDOP, EHPE, EVPE, EHVE, EHE.
    - [GSD4e NMEA Manual May 2010](pdf/sirf/GSD4e_NMEA_Manual.pdf) - filename relating to the SiRFstar IV includes no details about the NMEA message $PSRFEPE
  - SiRF Demo
    - [SiRF Demo User Guide 1.5 Jun 2007](pdf/sirf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) - table 3-6 details EHPE, EVPE, ETE, EHVE but no mentioned of EHE
  - Research papers
    - [Speed Dilution of Precision](pdf/sirf/Speed_Dilution_of_Precision.pdf) - paper by Tom Chalko in 2009
    - [Decoding of SiRF Binary Protocol](pdf/sirf/Decoding_of_SiRF_Binary_Protocol.pdf) - paper from 2011
- u-blox
  - [u-blox 7 Receiver Description Including Protocol Specification](pdf/ublox/u-blox7-V14_ReceiverDescriptionProtocolSpec_Public.pdf)
  - [u-blox 8 / M8 Receiver Description Including Protocol Specification](pdf/ublox/u-blox8-M8_ReceiverDescrProtSpec_UBX-13003221.pdf)
