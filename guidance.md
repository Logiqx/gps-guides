## General Guidance

### Choosing a Device

In the last few years the quality of consumer GPS devices has improved a lot. For that reason [GP3S](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) decided to accept non-verified devices for the so called "fun rankings" and day-to-day use. GP3S have concluded that many standard consumer devices are very suitable for normal day-to-day use and for the average session can be a nice alternative for many windsurfers. 

The concept of "verified" devices was introduced by GP3S back in 2009, solely for the purpose of officially recognised [records](https://www.gps-speedsurfing.com/default.aspx?mnu=forum&forum=193) following very specific [rules](https://www.gps-speedsurfing.com/media/uploadimages/GPS_record_Rules%20VA1%202009-09-01.pdf), including the requirement for two approved GPS units. Records attempts must be pre-announced in the GP3S forum, require witnesses + additional evidence and individual ratification by the World GPS Surfing Record Committee.  

To encourage wider participation in GPS speedsurfing events it makes a lot of sense to allow the use of most modern consumer GPS devices from the likes of Garmin and Suunto; both for the "fun rankings" and the various "events" hosted on GP3S. However, it is important that the tracks are properly analysed, rather than relying upon speeds displayed on the watch itself.

The following should be considered the minimum device requirements when posting to GP3S and any events:

- **1 Hz** logging is a minimum requirement. "Smart" logging is often the default setting and is not sufficient for speed sailing.
- **Doppler**-derived speed must also be logged at a minimum of 1 Hz. This will often necessitate the .FIT format instead of .GPX.
- On request, original tracks should be provided to the event organisers. Non-ratified sessions may be removed from the rankings.

A list of recommended devices can be found on [GP3S](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) and more detailed information is also available on this [site](devices/README.md).

Mobile phones are **NOT** recommended for any kind of speed sailing because the quality / reliability of the GPS data is hugely variable.



### Doppler Speed

You may have heard the term "Doppler Speed" and wondered what it is and why it is important when speed sailing?

GPS devices calculate their position and their speed using two entirely different approaches:

- In principle, calculating position (latitude, longitude and altitude) is a matter of triangulation, based on the time taken for signals to travel from the satellites to the receiver. You may have seen running / cycling tracks that do not follow the road and even go through neighboring buildings. This happens because the calculation of position is somewhat prone to errors caused by atmospheric conditions, delayed / reflected signals (known as multipath) and more besides.
- Speed is calculated completely independently from the estimated position and uses the observed [doppler shift](https://en.wikipedia.org/wiki/Doppler_effect) (change of frequency) caused by the relative motions of the GPS satellites and the GPS receiver. Doppler-derived speed is far more accurate and reliable than positional data because it is less prone to errors caused by atmospheric conditions, delayed / reflected signals, etc.

It should also be noted that the above explanation is a huge oversimplification of what really happens inside GPS chips. In reality, both of the approaches described above actually necessitate the use of a [Kalman filter](https://en.wikipedia.org/wiki/Kalman_filter) within the GPS chip. The Kalman filter is essentially an iterative mathematical process to produce the most likely estimate of the true values from "[noisy](https://en.wikipedia.org/wiki/Noisy_data)" sensor data. This involves making predictions using manufacturer-specific, proprietary mathematical models (although they will all make use of the laws of motion) and refinement of those predictions using the available sensor readings / derivations and estimates of the probable levels of uncertainty.

TLDR; GPS chips actually produce estimates of position and speed based on proprietary models and predictions, not just simple sensor readings based on the time taken for signals to travel from the satellite to the receiver. However, Doppler-derived speed estimates are <u>always</u> far more accurate and reliable than speeds that are have been derived from the positional estimates. To summarise, Doppler-derived estimated speeds should <u>always</u> be used in preference to the non-Doppler speeds derived from positional data.

The screenshot below is from a Garmin Fenix 5, showing the Doppler-derived speed in red and speed calculated from positional data in yellow. The non-Doppler data shows a peak of 40 knots whilst the Doppler data shows just 33 knots. Another GPS was also being worn at the time and confirmed that 33 knots was indeed correct.

![img](sessions/contacts/newm/img/fenix-5-spike.png)





### FIT vs GPX

Now everyone has an understanding of the differences between Doppler-derived speed and speed derived from positional data we can compare the [GPX](https://en.wikipedia.org/wiki/GPS_Exchange_Format) and [FIT](https://developer.garmin.com/fit/protocol/) formats.

When exporting tracks for analysis, <u>always</u> choose the FIT file format over GPX.

- FIT files from sports watches are designed to include the Doppler-derived speed estimate in addition to location (latitude and longitude). FIT files also include other interesting performance metrics such as heart rate, temperature, etc.
- COROS have also added some important information to the FIT data, enabling run verification for [GP3S](https://www.gps-speedsurfing.com/); Number of satellites, COG (course over ground) and [HDOP](https://en.wikipedia.org/wiki/Dilution_of_precision_(navigation)).
- GPX files from the majority of manufacturers (e.g. Garmin and Suunto) usually <u>only</u> contain latitude and longitude. They rarely (if ever) contain the Doppler-derived speed so any analysis can only use speeds calculated from the positional data and are thus prone to being inaccurate; sometimes slightly, sometimes wildly!

Rankings on [GP3S](https://www.gps-speedsurfing.com/) highlight any sessions posted using non-Doppler speeds by showing a yellow icon on the rankings pages, instead of the green icon of [approved](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) devices.

You should <u>always</u> try to use the FIT format when uploading GPS tracks from a sports watch; whether you have COROS, Garmin, Suunto or any other brand. If you can't upload the FIT file then convert it to GPX using [GPSBabel](https://www.gpsbabel.org/) to retain the Doppler-derived speed estimates.

Never use the native GPX exports from smart watches unless it is the only option available!



### Additional Data

All of the GPS devices approved for GP3S record attempts record the following additional data items:

- Doppler-derived speed - AKA "Doppler speed"
- COG - course over ground
- Satellite count
- HDOP - "horizontal dilution of precision" indicates the positional accuracy

Locosys GT-31, GW-52 and GW-60 also include the following item:

- SDOP - "speed dilution of precision" describes the potential inaccuracy of Doppler derived speeds. GT-31
- SDOS - "standard deviation of speed" describes the potential inaccuracy of Doppler derived speeds. GW-52 and GW-60.

Devices using a u-blox GNSS receiver (e.g. Motion, Gyro1, ESP-GPS) include the following item:

- sAcc - "speed accuracy" describes the potential inaccuracy of Doppler derived speeds.

All of the above items allow results to be reviewed and validated so that speeds can either be adjusted or invalid runs eliminated.



Note: Modern GPS devices from Garmin and Suunto also include the Doppler-derived speed, but only when exporting to the .FIT format.
