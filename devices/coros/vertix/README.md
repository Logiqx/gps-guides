## COROS VERTIX

![vertix](img/vertix.png)



Details about the [VERTIX](https://coros.com/vertix) can be found on the COROS website.

GPS-Speedsurfing.com (GP3S) and COROS worked together to develop a tailor made workout mode. This includes additional data for session verification and automatic uploading to GP3S. Further details can be found on the GP3S [website](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=coros).

The VERTIX is basically a more rugged version of the [APEX Pro](../apex-pro/README.md) with 50% more battery life and a higher waterproof rating; 150m vs 100m.



### Specifications

| Item          | Details                                                      |
| ------------- | ------------------------------------------------------------ |
| Logging       | 1Hz                                                          |
| Memory        | [200 hours](https://support.coros.com/hc/en-us/articles/360044993811-How-much-memory-do-COROS-watches-have) |
| Battery       | 45 days (non-GPS) / 60 hours (GPS)                           |
| Charging      | Custom USB cable                                             |
| Download      | Custom USB cable + COROS app                                 |
| Auto Upload   | [Yes](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=HowAddSession) |
| Best Format   | [FIT](https://developer.garmin.com/fit/protocol/)            |
| Other Formats | [GPX](https://en.wikipedia.org/wiki/GPS_Exchange_Format)     |
| GPS chipset   | [Sony](https://www.sony-semicon.co.jp/e/products/lsi/gps/product.html) - probably the CXD5603GF |



### Data Issues

Since the VERTIX shares the same Sony GPS chip and [firmware](https://mobile.coros.com/release) as the [APEX Pro](../apex-pro/README.md), I fully expect the VERTIX to have the same data issues.

I have written a separate article, summarising the observable [data issues](../apex-pro/data-issues.md) on the APEX Pro with links to further details and analysis. The data issues can be summarised as follows:

- Repeated speeds are not uncommon in the data (e.g. exactly the same speed for 5 or 6 seconds) and I've even seen speeds repeated for as long as 12 or 13 seconds.
- The resolution of Doppler speed data is only to within 5cm/s. This is 5 times lower than devices from Locosys and 50 times lower than devices such as the Motion.



### Tips

- Set up the device correctly prior to speed sailing. 
  - I thoroughly recommend using the [guide](https://drive.google.com/file/d/1YQbuPNeTJ3ivgykGI4qOz2yzMxxHmD9B/view?usp%3Dsharing) by [Ingolf van Oostveen](https://surf-center.com/nl/ingolf).
  - Use the [auto-sync]((https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=HowAddSession)) feature on GP3S so that sessions can be posted quickly and easily.
- When exporting tracks for analysis, always choose the [FIT](https://developer.garmin.com/fit/protocol/) file format over [GPX](https://en.wikipedia.org/wiki/GPS_Exchange_Format).
  - FIT files from sports watches tend to include Doppler speed in addition to latitude and longitude. FIT files also include metrics such as heart rate, temperature, etc.
  - COROS have also added some useful GPS information to the FIT data, enabling run verification for GP3S; Satellites, COG, HDOP.
  - GPX files contain latitude and longitude but not Doppler speed. Speeds calculated from positional data are less accurate than Doppler speeds and prone to "spikes".
- Avoid using GPS modes including GLONASS.
  - "GPS, Beidou, Galileo, QZSS" works well for most of Europe, including the UK.
- The feature to start / stop recording on your GoPro (or similar) could be really handy.
- Learn how to mark your current position, just in case of unfortunate incidents...
  - For example, if you lose your foil or GoPro, quickly mark your position!
  - Whilst in windsurf mode, hold down the back/lap button and select "save location".
- It is worth noting that tracks appear to be stored on the COROS servers, not within the COROS app on your phone.
  - During a remote walk with no mobile reception, I couldn't see any of my past APEX Pro sessions on my phone.


