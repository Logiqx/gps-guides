## Locosys GW-60

![apex-pro](img/gw-60.jpg)



The GW-60 was released in early 2017. Details [GW-60](https://www.locosystech.com/en/product/GPS-Doppler-Watch-GW-60/gps-watch-gw-60.html) can still be found on the Locosys website.

In many ways it is comparable to the [GW-52](../gw-52/README.md) but it has the added convenience of being a wrist watch. It also has slightly better functionality for reviewing speed results during and after the session.

Convenient as it was to have a wrist watch, the GW-60 was prone to water ingress and operating it via the buttons during a session ultimately lead to its demise!



### Observations

- [SDOP](https://nujournal.net/estimating-accuracy-of-gps-doppler-speed-measurement-using-speed-dilution-of-precision-sdop-parameter/) on the GW-60 is typically higher than on the [GW-52](../gw-52/README.md), possibly due to the smaller antenna and poorer shielding.
- Beware the effect of underhand grip as it increases error levels; evident due to higher SDOP.



### Tips

- Although an option exists in the GW60Util, do not convert the SBP files to GPX format.
  - The SBP format contains all of the important GPS error information!
- You would be well advised not to press any buttons during a session.
  - Water ingress will eventually destroy the GW-60!



### Specifications

| Item                                                       | Details                                                      |
| ---------------------------------------------------------- | ------------------------------------------------------------ |
| Logging                                                    | 1 Hz or 5 Hz                                                 |
| Memory                                                     | ~35h @ 1 Hz or ~7h @ 5 Hz                                    |
| Battery                                                    | ~5 hours @ 5 Hz                                              |
| Charging                                                   | Custom USB cable                                             |
| Download                                                   | Custom USB cable + GW60Util                                  |
| Best Format                                                | SiRF binary, packed (SBP)                                    |
| Other Formats                                              | n/a                                                          |
| GPS chipset                                                | probably the [SiRFstar IV](https://www.qualcomm.com/products/application/automotive/positioning-solutions/sirfstar-iv-4e) |
| Additional Logging                                         | Sats, HDOP, SDOS                                             |
| Approved for [GP3S](https://www.gps-speedsurfing.com/)     | [Yes](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=gw60) |
| Approved for [GPSTC](https://www.gpsteamchallenge.com.au/) | [Yes](https://www.gpsteamchallenge.com.au/pages/rules)       |
