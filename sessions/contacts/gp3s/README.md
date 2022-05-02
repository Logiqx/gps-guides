## GP3S Tracks - WIP

### 20220212-fenix-7

Observed the FIT file only contains enhanced_speed so can't be loaded into GPSResults 6.185.

Fenix 7 has a speed resolution of 10 mm/s, same as the Fenix 5.

Includes a 1Hz track from a Motion as well.



### 20220207-vertix-2

Speed sailing track with VERTIX 2. Clearly doesn't have the VERTEX precision issue.



### 20211205-vertix-1+2 

VERTIX device has a resolution of 50 mm/s, equivalent to 0.1 knots.

Also worth looking at differences between 10s runs, being sure  to match up the run times.



### 20211128-vertix-2

VERTIX 2 had a resolution of 5 mm/s, equivalent to 0.01 knots.



### 20211126-various

Track test; APEX Pro, GW-60, Motion Mini + LCD, VERTIX 2.



### 20210808-apex-pro

APEX Pro device has a resolution of 50 mm/s, equivalent to 0.1 knots.

There are repeated values evident in the data. For example:

- 500m #4 ends with lots of 29.395 knot readings.
- 500m #6 has a lot of 31.296 and shortly after it at 11:15:55 there are lots of 4.795.



#### Doppler vs Positional

Used top 20 runs over 250m to compare Doppler and non-Doppler results:

- Non-Doppler was 0.19 knots faster on average.
- Non-Doppler ranged from -0.14 to 0.40 knots different.



### Track Data

You can find all of the tracks on [GitHub](https://github.com/Logiqx/gps-guides) under sessions/contacts/gp3s/tracks.

