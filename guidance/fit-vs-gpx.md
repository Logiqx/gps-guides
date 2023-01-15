## General Guidance

### FIT vs GPX

Prior to reading this section you will need to understand the significance of Doppler-derived speeds. A separate article provides a quick [overview](doppler-speed.md) of why Doppler-derived speeds are preferrable to speeds derived from positional data.

With a prior understanding of the differences between Doppler-derived speed and speed derived from positional data we can compare the [GPX](https://en.wikipedia.org/wiki/GPS_Exchange_Format) and [FIT](https://developer.garmin.com/fit/protocol/) formats. When exporting tracks for speed analysis, always choose the FIT file format in preference to GPX:

- FIT files from sports watches will always include the speed estimate of the GNSS chip (typically Doppler-derived) in addition to positional data. This is the most accurate speed estimate the GNSS receiver is able to produce and it shouldn't be discarded.
- COROS include some additional data in their FIT exports, enabling further run verification for [GP3S](https://www.gps-speedsurfing.com/); e.g. number of satellites, COG (course over ground) and [HDOP](https://en.wikipedia.org/wiki/Dilution_of_precision_(navigation)). These are used by GP3S (GPS-Speedsurfing.com) to filter out unreliable results.
- GPX files from the majority of watch manufacturers (e.g. COROS, Garmin and Suunto) rarely contain the Doppler-derived speed so GP3S analysis will be forced to use derivations from positional data. They are thus prone to various inaccuracies and spikes; sometimes small, sometimes large!



#### GP3S Sessions

Rankings on [GP3S](https://www.gps-speedsurfing.com/) highlight any sessions posted using non-Doppler speeds by showing a yellow icon on the rankings pages, instead of the green icon of [approved](https://www.gps-speedsurfing.com/default.aspx?mnu=item&item=GPSInfo) devices. If you see a COROS user with yellow icons against their sessions they are almost certainly uploading GPX data.

You should always use the FIT format when uploading GPS tracks from a sports watch to GP3S; whether you have COROS, Garmin, Suunto or any other brand that supports FIT. Failure to use the FIT file means discarding the Doppler-derived speed estimates during the session.

If you can't directly upload the FIT file (GPSAR is one example) you can convert the FIT to GPX using [GPSBabel](https://www.gpsbabel.org/) to retain the Doppler-derived speed estimates. Using GPSBabel to do file conversions isn't ideal though because even that will sometimes derive speed from positional data.



#### Summary

If FIT exports are available for your smart / sports watch then then you should not not use the GPX exports. COROS, Garmin, Suunto and Timex all provide FIT exports so GP3S uploads from those devices should all use the FIT exports.

COROS users uploading FIT data will have a green icon next to their session, whereas Garmin and Suunto users will still see a yellow icon. However, it is still very important for Garmin and Suunto users to upload FIT files (instead of GPX) for the reasons described in this article.

A small number of apps such as Waterspeed (Apple) and WindsportTracker (Android) do include the Doppler-derived speed in their GPX exports. Although issues will still be present in the data from those devices / apps but they will be far less prone to errors / spikes than speeds derived from positional data.

