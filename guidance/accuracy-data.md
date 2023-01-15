## Accuracy Data

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

All of the above items allow GP3S results to be validated / reviewed and invalid runs can be eliminated.



Note: Sports watches from the likes of COROS, Garmin and Suunto also include the Doppler-derived speed, but only when exporting to the .FIT format. A separate [page](fit-vs-gpx.md) describes the differences between FIT and GPX.
