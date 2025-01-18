![GP3S Logo](../img/COROS_Wearables_Logo.png)



## Watch Setup

### Firmware

The firmware version is of particular importance with the COROS watches. You can check which version you have installed on the watch itself.

System -> More Settings -> Device Info -> Software

![firmware](img/firmware.jpg)



**IMPORTANT** - recent firmware releases have been detrimental to the accuracy / reliability of COROS watches. Those issues are being worked on right now!

- APEX Pro + VERTIX
  - 3.0309.0, 3.0408.0 and 3.0409.0 were good versions, so keep them installed.
  - DO NOT upgrade to 3.0508.0
- APEX 2 + APEX 2 Pro
  - 3.0708.0 onwards are known to be good versions.
  - DO NOT use 3.04xx.0, 3.05xx.0
- VERTIX 2 + VERTIX 2S
  - 3.0808.0 onwards are known to be good versions.
  - DO NOT use 3.04xx.0, 3.05xx.0, 3.07xx.0

The firmware issues of 2024 have all been [documented](https://logiqx.github.io/gps-details/devices/coros/firmware/) and reported to COROS.



You can also check the firmware version from within the COROS application, but be wary of the available upgrades!

![apex-pro-fw](img/apex-pro-fw.png)



**TOP TIPS**

- If you have 3.0508.0 on your APEX Pro or VERTIX you should downgrade to [3.0309.0](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0309.0/install.html).
- If you have 3.04xx.0 or 3.05xx.0 on your APEX 2 or APEX 2 Pro then you should upgrade to the latest firmware.
- If you have 3.04xx.0, 3.05xx.0, 3.07xx.0 on VERTIX 2 or VERTIX 2S then you should upgrade to the latest firmware.

Note: You should re-check your GPS / GNSS settings after every firmware update because they have a tendency to revert back to standard GPS.



### Watch Settings

#### Satellite Settings

The GPS / GNSS mode has far more impact than you might think. The default mode of standard GPS gives longer battery life, which is great for ultra-running or endurance-cycling, but far more likely to report erroneous speeds.

The worst errors that I have seen from the Airoha-based watches have occurred when using the standard GPS mode. It's therefore important that you use the most appropriate multi-GNSS setting on your watch.

If you have one of the older Sony-based watches then you should choose one of the modes which uses multiple systems, and not just standard GPS. Personally, I use GPS + BeiDou + Galileo + QZSS.

System -> More Settings -> Satellite Systems -> Mode

![satellites](img/satellites.jpg)



#### Automatic Date and Time

The time of day on COROS watches can start to drift quite quickly, but this can be avoided by ensuring [auto-sync](https://support.coros.com/hc/en-us/articles/5859961688212-The-watch-is-not-displaying-the-correct-time) is switched on. The time will then be kept up-to-date by the COROS app.

Your COROS will set the time to match your phone, but be sure that your phone is using the date and time provided by the network. On Android phones this option is called "automatic date and time", but "set automatically" is also available on the iPhone.

System -> More Settings -> Date / Time -> Auto Sync

![auto-sync](img/auto-sync.jpg)



#### Touch Screen

Some watches have a touch screen which can behave erratically during watersport activities. This can be disabled in the system settings.

System -> More Settings

- Touch Screen = map only



#### Other Settings

These are some other settings that you might wish to change:

- System -> Activity Interface
  - Auto Scroll = off / on, depending on personal preference
- System -> Wi-Fi
  - Add for manual sync, and faster downloads of maps + newer firmware
- System -> More Settings
  - Gesture Backlight = off, avoiding the bright light when sleeping!
- System -> More Settings -> Auto Lock
  - Standby Mode = hold to unlock, since it is easier than using the dial
  - Activity Mode = hold to unlock, since it is easier than using the dial



#### Activity Settings

Prior to starting the activity you can also change the following settings:

- Speed into a Run
  - 12 knots or 22 km/h
- Speed Units
  - knots or km/h
- Activity Alert
  - New Record Alert = on



Within the COROS app you can also configure the speedsurfing activity:

- Activity data pages
  - Set according to personal preference(s)
- Button settings
  - Set according to personal preference(s)
- Activity alert
  - New Record Alert = on



#### Finally

- The COROS settings are clearly described in the [guide](https://drive.google.com/file/d/1YQbuPNeTJ3ivgykGI4qOz2yzMxxHmD9B/view?usp%3Dsharing) by Ingolf van Oostveen.
- You should re-check your GPS / GNSS settings after every firmware update!



### Watch Apps

COROS watches do not benefit from third party applications, like Apple or Garmin watches.

If you have a watch that includes speedsurfing and windsurfing activities, you should use the speedsurfing activity.

If you are using an APEX, PACE 2, PACE 3 or PACE Pro then GPS cardio is probably your best bet. You should avoid custom activities.

Activity modes will be discussed in the section "Recording an Activity".



## Next Page

[Linking accounts](../accounts/README.md)

- GP3S, Hoolan, Waterspeed, Strava, Relive

