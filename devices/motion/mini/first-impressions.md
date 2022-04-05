## Motion Mini

### First Impressions

![mini](img/mini.jpg)



I'd like to do a proper in-depth  review but for now, I'll just jot down some of my initial thoughts and maybe do a more in-depth analysis at a later date.



### Usage

- Firmware update was quick and easy, simply by following the [instructions](https://www.motion-gps.com/motion/documentation.html) provided.
- Contactless charging is very convenient.
- Switching the unit on, checking battery levels and switching off is very easy.
- Downloading data via the built in webserver is quick and easy.
- Data quality looks to be excellent when analysed in [GPSResults](https://www.gps-speed.com/index.html) and [GPS Speedreader](https://ecwindfest.org/GPS/GPSSpeedreader.html).




### Track Data

#### File Format

The Motion Mini uses a proprietary binary format called [OAO](https://www.motion-gps.com/motion/documentation/oao-file-format.html) which was designed by Julien. The OAO format is more compact than UBX and places less burden on the recording device.

OAO files can be loaded into tools such as [GPSResults](https://www.gps-speed.com/index.html) and [GPS Speedreader](https://ecwindfest.org/GPS/GPSSpeedreader.html) or uploaded directly to [G3S](https://www.gps-speedsurfing.com/) via their web upload feature.



#### Satellites

The Motion Mini typically reported 16 to 18 usable satellites during all of my test sessions.

This was better than the 11 to 13 of the COROS APEX Pro and 6 to 9 of my Locosys GW-60. 



#### 10 Hz

This is the first 10 Hz device that I've owned but to my surprise, speed and location data looks to be less "noisy" than the 5 Hz devices that I've previously owned.

The Locosys GW-52 and GW-60 were useful devices for direct comparisons; 5 Hz vs 10 Hz.



#### sAcc

The u-blox GPS chips generate a speed accuracy metric (sAcc) which is similar to [SDOP](https://nujournal.net/estimating-accuracy-of-gps-doppler-speed-measurement-using-speed-dilution-of-precision-sdop-parameter/) from the [Locosys](../../locosys/README.md) devices since the [GT-31](../../locosys/gt-31/README.md).

sAcc is extremely consistent on the Motion Mini, far more so than SDOP on any of the Locosys devices. This suggests that speed accuracy is also more consistent than the Locosys devices.



#### Doppler vs Positional

The Motion Mini has far better positional data than any other device that I have evaluated.

Whilst Doppler speeds should be used in preference to speeds calculated from position data it is worth noting that Doppler and non-Doppler speeds are much closer than on any of the GPS devices from Locosys, COROS, Garmin, etc.

The total time and distance reported by the Motion Mini are also closer than any other GPS device that I have tested. Static testing of the Motion Mini suggests that positional data is exceptionally accurate.




## Summary

The Motion Mini is an amazing little device and I can't recommend it highly enough!

After many years using the Locosys GT-11, GT-31, GW-52, GW-60 and COROS APEX Pro this is by far the best quality GPS logger that I have owned.



Pros:

- The device feels solid and is well sealed to ensure it remains waterproof.
- The adjustable strap is comfortable and keeps the unit in place on your arm.
  - This helps to ensure the GPS is always pointing upwards for best possible reception.
- Exceptionally high quality data; better than the GT-31, GW-52 and GW-60.
  - Now that I've seen how good this data is I'll always wear this device on the water!
- The 10 Hz data appears to be better quality than the 5 Hz data from Locosys devices.
- Decent battery life which will last me several sessions before a recharge.
- Nice price - £90 as a UK purchaser.

Cons:

- The lack of a display means you can't check your speeds during a session.
  - This is not a genuine issue as the device is not designed for this purpose.
  - There is an LCD model with a display if you want to check your speeds whilst sailing.
- Connecting to the WiFi of the Motion does mean you will temporarily lose your internet.
  - This is really not a biggie. I just download my tracks then switch back to regular WiFi.
- My mobile phone (Samsung Galaxy S7) cannot access the Motion's built-in webserver.
  - I will investigate further... checking session results from my phone would be nice.
- Wireless charger showed early signs of melting so I replaced it with an [Anker](https://www.amazon.co.uk/dp/B07THHQMHM/) charger.
  - Julien is now aware and is looking to source an alternative wireless charger.

