![GP3S Logo](../img/Garmin_logo_2006.png)



## Known Issues

### Firmware

The first Garmin watches to use the Airoha chipset were released by Garmin in 2022, but there was a firmware issue affecting the speed data. The issue was fixed some time prior to 2024, but its not clear when the fix was rolled out.




### Watch Display

Using an app such as [APPro](https://apps.garmin.com/apps/9567700b-6587-44be-9708-879bfc844791) will ensure that you are presented with data that is as good as your watch can produce and will be consistent with GPS-Speedsurfing.

Please ignore the "max speed" which on the Airoha-based watches is a single measurement that relates to a few tens of milliseconds. It will almost always be overstating your speeds and you should be looking at the 2 secs.

Even the 2 seconds measurement can exaggerate a little, so use 10s / 100m / 250m as a sanity check. If the max 2 seconds is more than a knot faster than your best 100 meters then it may well be exaggerating.




### Data Exports

The FIT files from Garmin devices (and especially with APPro) contain some additional data which is useful for diagnostic purposes. When exporting data from Garmin Connect, you should always use FIT files as described on the [analysis](../analysis/README.md) page.

The GPX files produced by Garmin do not include the [Doppler-derived speeds]((https://medium.com/@mikeg888/the-importance-of-doppler-b886b14bb65d)) calculated by the GNSS chipset, making them highly undesirable. You should therefore avoid exporting GPX files from Garmin Connect for any kind of speed analysis.





## Next Page

[Summary](../README.md#summary)
