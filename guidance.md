## General Guidance

### Doppler Speed

You may have heard the term "Doppler Speed" and wondered what it is and why it is important when speed sailing?

GPS devices calculate their position and their speed using two entirely different approaches:

- In principle, calculating position (latitude, longitude and altitude) is a matter of triangulation, based on the time taken for signals to travel from the satellites to the receiver. You may have seen running / cycling tracks that do not follow the road and even go through neighbouring buildings. This happens because the calculation of position is somewhat prone to errors caused by atmospheric conditions, delayed / reflected signals (known as multipath) and more besides.
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

