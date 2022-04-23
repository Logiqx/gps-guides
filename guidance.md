## General Guidance

### Choosing a Device

In the last few years the quality of consumer GPS devices has improved a lot. For that reason [GP3S](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) decided to accept non-verified devices for the so called "fun rankings" and day-to-day use. GP3S have concluded that many standard consumer devices are very suitable for normal day-to-day use and for the average session can be a nice alternative for many windsurfers. 

The concept of "verified" devices was introduced by GP3S back in 2009, solely for the purpose of officially recognised [records](https://www.gps-speedsurfing.com/default.aspx?mnu=forum&forum=193) following very specific [rules](https://www.gps-speedsurfing.com/media/uploadimages/GPS_record_Rules%20VA1%202009-09-01.pdf), including the requirement for two approved GPS units. Records attempts must be pre-announced in the GP3S forum, require witnesses + additional evidence and individual ratification by the World GPS Surfing Record Committee.  

To encourage wider participation in GPS speedsurfing it is perfectly acceptable for people to use modern day GPS devices from the likes of Garmin and Suunto to post sessions to the "fun rankings" of GP3S, including the various "events" hosted on the site. It is important that the track should be properly analysed for upload to GP3S, rather than relying upon the on-screen display.

The following should be considered as minimum requirements when taking part in GP3S events:

- **1 Hz** logging is a minimum requirement. "Smart" logging is often the default setting and is not sufficient for speed sailing.
- **Doppler** derived speed **must** be logged at a minimum of 1 Hz. This will often necessitate the .FIT format instead of .GPX.
- If requested, tracks should be provided to event organisers. Unverified sessions are subject to removal from event rankings.

A list of recommended devices can be found on [GP3S](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) and more detailed information is also available on this [site](devices/README.md).



### Doppler Speed

You may have heard the term "Doppler Speed" and wondered what it is and why it is important when speed sailing?

GPS devices calculate their position and their speed using two entirely different approaches:

- In principle, calculating position (latitude, longitude and altitude) is a matter of triangulation, based on the time taken for signals to travel from the satellites to the receiver. You may have seen running / cycling tracks that do not follow the road and even go through neighboring buildings. This happens because the calculation of position is somewhat prone to errors caused by atmospheric conditions, delayed / reflected signals (known as multipath) and more besides.
- Speed is calculated completely independently from the estimated position and uses the observed [doppler shift](https://en.wikipedia.org/wiki/Doppler_effect) (change of frequency) caused by the relative motions of the GPS satellites and the GPS receiver. Doppler speed is far more accurate and reliable than positional data because it is less prone to errors caused by atmospheric conditions, delayed / reflected signals, etc.

Doppler speeds recorded during a session are <u>always</u> far more accurate and reliable than speeds that are subsequently calculated from the positional data in software.

The example below is from a Garmin Fenix 5, showing the Doppler speed in red and speed calculated from positional data in yellow. The non-Doppler data shows a peak of 40 knots whilst the Doppler data shows just 33 knots. Another GPS was also being worn at the time and confirmed that 33 knots was indeed correct.

To summarise, Doppler speeds should <u>always</u> be used in preference to non-Doppler speeds!

![img](sessions/contacts/mark/img/fenix-5-spike.png)





### FIT vs GPX

Now everyone has an understanding of the differences between Doppler speed and speed calculated from positional data we can compare the [GPX](https://en.wikipedia.org/wiki/GPS_Exchange_Format) and [FIT](https://developer.garmin.com/fit/protocol/) formats.

When exporting tracks for analysis, <u>always</u> choose the FIT file format over GPX.

- FIT files from sports watches are designed to include the Doppler speed in addition to location (latitude and longitude). FIT files also include other interesting performance metrics such as heart rate, temperature, etc.
- COROS have also added some important information to the FIT data, enabling run verification for [GP3S](https://www.gps-speedsurfing.com/); Number of satellites, COG (course over ground) and [HDOP](https://en.wikipedia.org/wiki/Dilution_of_precision_(navigation)).
- GPX files <u>only</u> contain latitude and longitude. They do not contain the Doppler speed so any analysis can only use speeds calculated from the positional data and will thus be prone to being inaccurate; sometimes slightly, sometimes wildly!

Rankings on [GP3S](https://www.gps-speedsurfing.com/) highlight any sessions posted using non-Doppler speeds by showing a yellow icon on the rankings pages, instead of the green icon of [approved](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) devices.

You should <u>always</u> use the FIT format when uploading GPS tracks from a sports watch; whether you have COROS, Garmin, Suunto, Polar or any other brand.

Never use the GPX format unless it is the only option available!

