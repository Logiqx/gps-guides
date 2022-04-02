## Motion Mini - WIP

### Quick Evaluation

Card capacity and sailing time? 8GB, ~1.75MB per hour so >4,500 hours. Several years!

[u-blox 8](https://www.u-blox.com/en/product/ubx-g8020-chip) - TBC



### Setup

#### Firmware

Start device in safe mode to install the latest firmware as described in the [documentation.](https://www.motion-gps.com/motion/documentation.html)




#### Charging

Contactless was melting Bought Anker from Amazon



### Usage

Single button and LED to start

Arm strap is good and ensures GPS remains pointing upwards



### Memory

Just under 2MB per hour




## Track Data

### File Content

Proprietary binary format called [OAO](https://www.motion-gps.com/motion/documentation/oao-file-format.html) was invented by Julien. It's more compact than UBX and places less burden on the recording device.

Propieratry .oao is better than .gpx

- .gpx contains longitude + latitude + speed + COG + elevation
- .gpx is only 1Hz, lacking HDOP and satellite count is not recognised by GPSResults
- .oao supports up to 10Hz, adds satellite counts, HDOP and SDOP



### Frequency

- COROS APEX Pro is 1 Hz

- Higher frequency units show higher acceleration.
  - 10Hz Motion Mini > 5Hz GW-60 > 1Hz COROS APEX Pro
  - GPS Results 6.173 PC / 5.63 Mac changed maximum acceleration for 10Hz units to 10m/s².
- Higher frequencies have distances (m) closer to intended - e.g. 500.3m vs 503.8m.

Note that higher frequency logs take significantly longer to process in GPSResults - **TBC 6.185**




### Accuracy

#### Satellites

- GW-60; 6 to 9
- APEX Pro; 11 to 13
- Motion Mini; 16 to 18

n.b. It is unlikely that all of them will are used concurrently




#### sAcc

m/s for "Speed accuracy estimate" in NAV-VELECEF messages, according to the ublox7 specs

sAcc is generally very consistent and usually suggests +/- 0.5 knots.

sAcc > 1 should be regarded as bad data.



#### Doppler vs Positional

Weird spikes on COROS APEX Pro non-doppler.

Green overlay is much worse over 500m for COROS APEX Pro.

Motion Mini has much better positional speeds than COROS APEX Pro.

Total time and distance most similar on Motion Mini



## Observations

BST effect which is not evident on GT-31, GW-60, COROS APEX Pro

Doppler and non-Doppler results very similar; maybe due to use of accelerometer?




## Summary

Pros:

- Feels solid with a good strap which keeps the GPS in place.
  - It is glued shut to ensure it is waterproof.
- High quality data; better than the GT-31, GW-52 and GW-60.
- Decent battery life.
- Low cost - 90 EUR.

Cons:

- No display for on-the-water feeddback but that is a feature of this device.

