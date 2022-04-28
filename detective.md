## Locosys Detective Work!

### Introduction

It is reasonably well known that the Locosys GT-11 used the SiRFstar II and Locosys GT-31 used the SiRFstar III.

What isn't so clear is what GPS chip was used in the GW-52 and GW-60; perhaps the SiRFstar IV or something like MediaTek MT3318?

It has been [mentioned](https://www.seabreeze.com.au/forums/Windsurfing/Gps/Speed-Accuracy?page=4#27) on the Seabreeze forum that the GW-52 and GW-60 firmware both contain plain-text references to MediaTek frames and this has lead to a belief that the GW-52 and GW-60 are using a chip such as the MT3318.

However, the possibility of a MediaTek chip being used in the GW-52 and GW-60 creates further questions:

- Wasn't SDOP on the GT-31 proprietary to SiRF?
- Why was it renamed to SDOS on the GW-52 / GW-60, are SDOP and SDOS the same thing?
- How did MediaTek reproduce SDOP in their chip or is SDOS something different?
- How comparable are SDOP (GT-31), SDOS (GW-52 + GW-60) and sAcc (u-blox)? What do they each represent?



### Approach

I decided to look into this from a number of angles:

- Studying the timeline of the GT-31, GW-52, GW-60 and numerous GPS modules from Locosys, plus the actual GPS chips from SiRF and MediaTek.
- Features of the likely GPS chips were researched, including the SiRFstar IV and all of the Locosysy GPS modules that used it between 2010 and 2021. 
- I've looked at the data sheets of GPS modules from the many OEMs using the GPS / GNSS chips from SiRF and MediaTek. 
- I've studied all of the relevant [NMEA commands](nmea.md) available from each chip and hunted for anything resembling a speed accuracy estimate.
- I've looked at the firmware of the GT-31, GW-52 and GW-60 to see what clues they contain.



### Findings

The MediaTek references in the GW-52 and GW-60 firmware are actually strong evidence that a MediaTek GPS chip is **not** being used by those devices!

This will sound like an odd statement right now, and it was also a surprise to me, but I'll explain how I reached my conclusion!

In all likelihood the GW-52 and GW-60 probably use the SiRFstar IV. Whilst they could contain the SiRFstar V it would be rather unnecessary.

The remainder of this document will describes my analysis and various findings in more detail.



### Accuracy Estimates

#### SiRFDrive  + SiRFNavIII

EHPE, EVPE and EHVE have also been well documented since an early SiRF binary protocol document, produced by NAVMAN in [2004](pdf/sirf/SiRF_Binary_Protocol_1.x_2004_02.pdf).

The SiRF binary protocol document from 2009 describes them for message ID 41 (geodetic navigation data) as follows:

| Name                                | Bytes | Description                                      |
| ----------------------------------- | ----- | ------------------------------------------------ |
| Estimated Horizontal Position Error | 4 U   | EHPE in meters x 10<sup>2</sup>                  |
| Estimated Vertical Position Error   | 4 U   | EVPE in meters x 10<sup>2</sup>                  |
| Estimated Time Error                | 4 U   | ETE in seconds x 10<sup>2</sup> (SiRFDRive only) |
| Estimated Horizontal Velocity Error | 2 U   | EHVE in m/s x 10<sup>2</sup> (SiRFDRive only)    |

It is worth mentioning that EHPE, EVPE, ETE and EHVE are also described in the SiRF demo [user guide](pdf/sirf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) from June 2007.

A proprietary SiRF output sentence called **$PSRFEPE** also provides accuracy estimates:

| Field | Description                         | Units   |
| ----- | ----------------------------------- | ------- |
| HDOP  | Horizontal Dilution of Precision    | -       |
| EHPE  | Estimated Horizontal Position Error | m       |
| EVPE  | Estimated Vertical Position Error   | m       |
| EHVE  | Estimated Velocity Error            | m/s     |
| EHE   | Estimated Heading Error             | degrees |

The proprietary $PSRFEPE is available from the SiRFstar IV and SiRFstar V, but in the GW-52 and GW-60 this isn't actually significant because they will be reading message ID 41 (geodetic navigation data) using the SiRF binary protocol.

Note: The SiRF binary protocol outputs ETE (but not EHE) whereas the Erinome-I [documentation]((pdf/sirf/Erinome-I_User_Manual_rev1.7.pdf)) describing $PSRFEPE includes EHE. The one socket protocol interface control [document](pdf/sirf/One_Socket_Protocol_Interface_Control_Document_2009.pdf) from 2009 mentions EHE in the "DR NAV Status Output Message" but EHE is not included in the output of message ID 41.



### Examining Firmware

Examining the firmware was a simple matter of looking at the plain text via the "strings" command on Linux.

I started with the GW-52 and GW-60, before moving on to the GT-31.



#### GW-52 + GW-60

The following NMEA codes were found in the GW-52 and GW-60 firmware.

These sentences are enough to provide everything needed for standard logging; everything except SDOP:

- GPRMC - Recommended Minimum Navigation Information
- GPGSV - Satellites in view
- GPGSA - GPS DOP and active satellites
- GPGGA - Global Positioning System Fix Data
- PLSEPE - Locosys (PLS) Estimated Positional Error
- PLSV - Locosys (PLS)

Several Mediatek commands were also present in the GW-52 and GW-60 firmware:

- $PMTK605*31 - Query the firmware release information. 
- $PMTK103*30 - Cold Restart: Don't use Time, Position, Almanac / Ephemeris data. 
- $PMTK253,0,115200*01 - Set data output format and baud rate for current port.

None of the Mediatek commands to change the [fix and output rate](https://github.com/adafruit/Adafruit_GPS/issues/22) (1 Hz or 5 Hz) are present in the GW-52 and GW-60 firmware:

- $PMTK220,1000*1F - Set NMEA port update rate to 1Hz
- $PMTK220, 200*2C - Set NMEA port update rate to 5Hz
- $PMTK300,1000,0,0,0,0*1C - Set rate of position fixing activity to 1 Hz
- $PMTK300,200,0,0,0,0*2F - Set rate of position fixing activity to 5 Hz

Summary:

- There are enough NMEA commands to log standard data but they do not include anything suitable for SDOP / SDOS.
- There is no way to switch a MediaTek chip between 1 Hz and 5 Hz logging using the commands in the firmware.



The GW-52 and GW-60 firmware both contain quite a lot of debugging messages. Test code clearly isn't being removed at compile time.

It's also interesting to note that the GW-52 includes an internal name of "GW31" where the GW-60 has an internal name of "GW60".



#### GT-31

The GT-31 firmware is actually ASCII-encoded so it needs to be decoded prior to looking for plain text.

After determining how the file had been encoded (thankfully, very simple), decoding was done on Linux with the following commands:

```
grep ^S315 GT31_FW_V1.4B0803T | sed 's/^S315........//;s/..$//' | tr -d "\n\r" | xxd -r -p | strings >GT31.txt
```

Format strings for common NMEA sentences were spotted. The format strings all relate to the memory card logging of the GT-31:

- $GPGGA - Global Positioning System Fix Data
- $GPGLL - Geographic Position - Latitude/Longitude
- $GPGSA - GPS DOP and active satellites
- $GPGSV - Satellites in view
- $GPRMC - Recommended Minimum Navigation Information
- $GPVTG - Track made good and Ground speed
- $GPZDA - GNSS Time & Date

A few possible NMEA commands were also spotted, possibly for initializing the SiRFstar III or debugging:

- $PLSC - Locosys xxx?
- $PLSR - Locosys restart?
- $PSRF - SiRF prefix

The firmware included a lot of obvious debugging messages and it was noted that there was a reference to SiRFDRive.

You may recall seeing EHVE in m/s x 10<sup>2</sup> (SiRFDRive only) in message ID 41 (geodetic navigation data) of the SiRF binary protocol.

There were no references to either MediaTek, MTK or $PMTK are in the firmware.

Significantly there were NMEA prefixes listed either, suggesting use of the SiRF binary protocol.





### Refresher

Let's remind ourselves of some basic facts about the GT-31:

- The SiRF binary format included EHVE (Estimated Horizontal Velocity Error) in m/s x 10<sup>2</sup> for SiRFDRive since at least 2004.
- The SiRFstar III was released in 2005 with support for SiRFDRive.
- The GT-31 used the SiRFstar III chip and was the first device to provide SDOP (speed dilution of precision).
- It seems pretty reasonable to conclude that the GT-31 was using EHVE (Estimated Horizontal Velocity Error) but it was called SDOP.

Let's remind ourselves of some basic facts about the GW-52 and GW-60:

- They both provide logging at 1 Hz or 5 Hz and data is stored in the SiRF binary format.
- They both provide SDOS (standard deviation of speed), as it is named in the Locosys brochures.
- They both appear to know about standard NMEA sentences which is enough for basic logging; including COG, HDOP, sats, etc.
- They both contain a small selection of $PMTK commands to initialize / restart a MediaTek GPS / GNSS chip.
- MediaTek error estimates would have to be in $PMTK sentences. but there is no evidence of anything in the firmware.
- Neither the GW-52 or GW-60 has the ability to receive error estimates from a MediaTek chip.
- Neither device has ability to instruct a MediaTek GPS / GNSS chip to switch between 1 Hz and 5 Hz.

Whilst these facts don't prove that the GW-52 and GW-60 use a SiRF chip, they do indicate that they do not use a MediaTek chip.

The presence of MediaTek commands suggests they can use a MediaTek chip, but their inability to receive error estimates or toggle 1 Hz / 5 Hz suggests they don't ship with MediaTek.



### Hypothesis

The GT-11, GT-31, GW-52 and GW-60 are obviously products in their own right but they can also be regarded as test platforms for Locosys GPS modules.

Between 2010 and 2021, Locosysy were producing a number of GPS modules based on SiRF and MediaTek chips.

I suspect that the GW-52 and GW-60 were designed to work with SiRF and MediaTek chips, but released with SiRF. thus retaining SDOP / SDOS.



### Possibilities

#### GW-52

Looking at the Locosys GPS modules between 2010 and 2021, only the S4-1513 series supported 5Hz and could easily have been used in the GW-52.

- Rom based - S4-1513-2R
- Flash based - S4-1513, S4-1513-2E

It would seem most likely the GW-52 would have used the S4-1513 (flash) due to the lower power usage, compared against the S4-1513-2X models.

The GW-52 won't have used the S4-0606 or S4-1612 ranges, because despite using SiRFstar IV they were 1 Hz (according to the Locosys product sheets).

Table 5.2-8 of the S4-1513 [datasheet](pdf/locosys/s4-1513_datasheet_v1.1.pdf) shows "undefined" where EPE (request for $PSRFEPE) would reside, possibly to hide the SiRFDrive capability?

If you match that table up with the relevant section in the SiRF binary protocol reference you'll see that everything else matches perfectly.



#### GW-60

The GW-60 won't have used a GPS module due size considerations but it could easily have used the internal components of the S4-1513 module. The SiRFstar IV chip is only 3.5 x 3.2 x 0.6 mm.

This would mean that both the GW-52 and GW-60 could both be using the SiRFstarIV but renaming EHVE to SDOS. The reason for the naming is unclear, perhaps to obfuscate the fact that SiRFDrive features are being used in other devices or maybe just because it looks similar SDOP.

As an aside, SDOP should never really have been called "speed dilution of precision" because it is not actually a dilution of precision metric!



### Summary

The anecdotal evidence of the MediaTek references actually disprove the use of a MediaTek chip. I've also yet to find any mention of speed error estimates for any MediaTek chips. The closest I have found is positional estimates (horizontal, vertical, latitude, longitude and altitude) on the MT3333.

I suspect the MTK references are just hangovers from development and testing. All of the NMEA commands are in plain sight but they are all standard commands and do not provide error estimates. The NMEA commands to switch between 1 Hz and 5 Hz logging are also absent from the GW-52 and GW-60.

Two good reasons to suspect that Locosys used the SiRFstar IV:

- The Locosys S4-1513 used the SiRFstar IV chip which includes 5 Hz logging.
  - It's technology would likely be ideal for the GW-31 / GW-52.
- Locosys were actively selling the S4-1513 range of GPS modules throughout the period that the GW-52 and GW-60 were available.
  - Even if the S4-1513 module itself were not used in the GW-52, Locosys expertise of the SiRFstar IV could be applied to the GW-52.
- SiRF IV supports SiRFdrive and thus EHVE, measured in cm/s just like SDOP / SDOS.
  - Retaining SDOP, albeit with the name SDOS was a major selling point in the marketing brochures.

I feel that in all probability, Locosys used the SiRFstar IV in the GW-52 and GW-60.

The SiRFstar IV provides the key features of the GW-52 and GW-60; 1 Hz + 5 Hz logging and estimation of speed errors with a resolution of 1 cm/s. 



### Final Note

The acceptance of using the SiRF IV chips also removes other topics of debate such as what the SDOP / SDOS values represent if they came from a MediaTek chip. Topics such as how the proprietary SiRF error estimates got into the MediaTek chip or whether they devised their own method of estimation are mute points.

The GW-52 spec refers to SDOS and says "typical accuracy of 10s average speed measurement: ~3 cm/s, 99.7% certainty". This suggests to me that that SDOS is based on 3σ (3 standard deviations). This is consistent with the findings of Tom Chalko in 2009. It is also worth noting that the u-blox sAcc measure is almost certainly based on 1σ due to similar u-blox metrics being specified as 1 standard deviation.



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
    - [Erinome-I User Manual rev1.7](pdf/sirf/Erinome-I_User_Manual_rev1.7.pdf) - based on SiRFstar V it details the SiRF specific NMEA message $PSRFEPE
    - [GSD4e NMEA Manual May 2010](pdf/sirf/GSD4e_NMEA_Manual.pdf) - document relating to the SiRFstar IV includes no details about $PSRFEPE
  - SiRF Demo
    - [SiRF Demo User Guide 1.5 Jun 2007](pdf/sirf/SiRF_Demo_User_Guide_1.5_2007_06.pdf) - table 3-6 details EHPE, EVPE, ETE, EHVE but no mentioned of EHE
  - Research papers
    - [Speed Dilution of Precision](pdf/sirf/Speed_Dilution_of_Precision.pdf) - paper by Tom Chalko in 2009
    - [Decoding of SiRF Binary Protocol](pdf/sirf/Decoding_of_SiRF_Binary_Protocol.pdf) - paper from 2011
- MediaTek
  - [MT3333_Platform_NMEA_Message_Specification_V1.07](pdf/mediatek/MT3333_Platform_NMEA_Message_Specification_V1.07.pdf) - no mention of the proprietary EPE message
  - [M10478-M10578-NMEA_Sentence_Output](pdf/mediatek/M10478-M10578-NMEA_Sentence_Output.pdf) - details the proprietary EPE message of the MT3333
  - [Data_Sheet_M10478-A3](pdf/mediatek/Data_Sheet_M10478-A3.pdf) - confirms MT3333 and 10 Hz
  - [Data_Sheet_M10578-A3](pdf/mediatek/Data_Sheet_M10578-A3.pdf) - confirms MT3333 and 10 Hz
- u-blox
  - [u-blox 7 Receiver Description Including Protocol Specification](pdf/ublox/u-blox7-V14_ReceiverDescriptionProtocolSpec_Public.pdf)
  - [u-blox 8 / M8 Receiver Description Including Protocol Specification](pdf/ublox/u-blox8-M8_ReceiverDescrProtSpec_UBX-13003221.pdf)
