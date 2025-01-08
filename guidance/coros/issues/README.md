![GP3S Logo](../img/COROS_Wearables_Logo.png)



## Known Issues

### Firmware

There were several COROS firmware issues during 2024 which have already discussed, but just as a reminder:

- APEX Pro + VERTIX
  - [3.0309.0](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0309.0/install.html), 3.0408.0 and 3.0409.0 were good versions, so keep them installed.
  - DO NOT upgrade to 3.0508.0
- APEX 2 + APEX 2 Pro
  - 3.0708.0 onwards are known to be good versions.
  - DO NOT use 3.04xx.0, 3.05xx.0
- VERTIX 2
  - 3.0308.0 was the last working public firmware, so keep it installed or upgrade to [3.0708.1113](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0708.1113/install.html) beta.
  - DO NOT use 3.04xx.0, 3.05xx.0, 3.07xx.0
- VERTIX 2S
  - There is yet to be a reliable public firmware for the VERTIX 2S, except [3.0708.1113](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0708.1113/install.html) beta.
  - DO NOT upgrade to 3.07xx.0

The firmware issues of 2024 have all been [documented](https://logiqx.github.io/gps-details/devices/coros/firmware/) and reported to COROS.



### Watch Display

There are a number of niggly display bugs that you may notice during a speedsurfing session:

- New record alerts sometimes say the wrong thing, like "2s" instead of "5 x 10s".
- Run detection does not understand turns (gybe or tack), so you can sail for hours and only do one run!
- The algorithm that calculates alphas on the watch does not work correctly, quite different to GP3S.



### Data Exports

There are some known recording issues:

- Newer watches such as the APEX 2 Pro, APEX 2 Pro and VERTIX 2 can record the GNSS data in a way that leads to [fantasy alphas](https://logiqx.github.io/gps-details/devices/coros/alpha/) on GP3S.



## Next Page

[Summary](../README.md#summary)
