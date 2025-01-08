![GP3S Logo](../img/COROS_Wearables_Logo.png)



## Data Analysis

You've already set up your watch correctly and have recorded a session using the speedsurfing activity?

The speedsurfing activity provides some nice feedback during the session, so you will already have a good idea of your results.

Once you are off the water, your watch will send all of the data to your phone where it can be reviewed in the COROS app.

If you've linked your COROS account to GPS-Speedsurfing, Hoolan or Waterspeed then the session will also be uploaded to those sites automatically.



### Exporting Activities

If you haven't linked your COROS account to GPS-Speedsurfing, Hoolan or Waterspeed then you may need to manually export your data.

The most important point is to export as a FIT file, not GPX. GPX is fine for route planning and navigation, but not speed analysis.

In a nutshell, GPX still doesn't have an agreed way to exchange [Doppler speeds]((https://medium.com/@mikeg888/the-importance-of-doppler-b886b14bb65d)) which is highly undesirable and thoroughly [documented](https://logiqx.github.io/gps-wizard/gpx/).

You can export the FIT file by logging in to the COROS Training Hub on your computer and exporting the data.

![export-fit](img/export-fit.png)

You can also export the FIT file from within the phone app. You can download the file, or send it to people via e-mail, Messenger, WhatsApp, etc.

![export-app](img/export-app-highlighted.jpg)

A couple of final notes:

- Large spikes will often be filtered by COROS and somewhat lessened in data exports.
  - Personally, I'd prefer for the original data to be exported, allowing the downstream processing to handle it accordingly.
- You should avoid the temptation to convert from FIT to GPX using tools such as GPSBabel.
  - The conversion process can introduce artificial speeds (even spikes) and highly undesirable.



### Laptop Analysis

I would encourage you to have a look at your sessions on a laptop, giving you some insight into your sailing and to keep an eye on the performance of your watch.

This is particularly important with unapproved devices such as the PACE 2 or PACE 3, because you can remove any obvious spikes.

These are the best applications for speed analysis, listed in alphabetical order:

- [GpsarPro](http://gpsactionreplay.free.fr/index.php?menu=2) by Yann Mathet - 60 day trial, Windows + Mac
- [GPSResults](https://www.gps-speed.com/download_e.html) by Manfred Fuchs - 30 day trial, Windows
- [GPS Speedreader](https://github.com/prichterich/GPS-Speedreader/) by Peter Richterich - unrestricted, Windows + Mac



### Importing Activities

If you haven't linked your COROS account to GPS-Speedsurfing, Hoolan or Waterspeed then you may need to manually import your data.

The most important point is to import a FIT file from your watch, not GPX. This was discussed earlier in the section "Exporting Activities".

I would be happy to recommend uploading your FIT to GPS-Speedsurfing because it knows how to process your speeds correctly.

Some of the other platforms will often mis-report your speeds though:

- Waterspeed is currently unable to import FIT files and ignores the Doppler speeds in GPX files produced by COROS.
- Strava can import FIT files but it ignores the Doppler speeds and thus prone to over-reporting and spikes.
- SportsTrackLive ignores the Doppler speeds and thus prone to over-reporting and spikes.
- Relive is also popular, but I have not tried it and cannot comment on whether it handles speeds correctly.



## Next Page

[Known issues](../issues/README.md)
