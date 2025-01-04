![GP3S Logo](../img/COROS_Wearables_Logo.png)



## Watch Usage

### Wearing the Watch

Sadly we don't live in an ideal world where your GPS is either working, or not working. GPS errors vary by orders of magnitude and speeds being displayed does not mean the GPS / GNSS receiver is either working or accurate.

How you wear your GPS receiver can significantly impact the accuracy and reliability of the data being recorded, but you can minimise the risk of errors by following these principles:

- Do not just stick your GPS device down your wetsuit, use an aqua-pack on your arm.
- Wear the GPS device over your wetsuit, or fold back your neoprene sleeve.
- When speed sailing, wear your watch on your back hand to ensure it is facing upwards.

I was guilty of denying these were actually relevant when I started speedsurfing, but nowadays I recognise their importance. Maybe I'll document it properly at some time!



### Recording an Activity

**FIRMWARE AND SETTINGS**

Ensure you are using an appropriate firmware:

- APEX / VERTIX
  - Use [3.0309.0](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0309.0/install.html), 3.0408.0 or 3.0409.0
  - Avoid 3.0508.0
- APEX 2 + APEX 2 Pro
  - Use 3.0706.0 or newer
  - Avoid 3.0408.0, 3.0409.0, 3.0508.0 and 3.0510.0
- VERTIX 2
  - Use 3.0308.0 or [3.0708.1113](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0708.1113/install.html) beta
  - Avoid 3.0408.0, 3.0409.0, 3.0508.0, 3.0510.0, 3.0708.0 and 3.0709.0
- VERTIX 2S
  - Use [3.0708.1113](https://logiqx.github.io/gps-details/devices/coros/firmware/3.0708.1113/install.html) beta
  - Avoid 3.0408.0, 3.0409.0, 3.0508.0, 3.0510.0, 3.0708.0 and 3.0709.0


Ensure you are using the correct watch settings:

- It should be using multiple systems, not standard GPS.
- It should have latest GPS data, which speeds up the initial signal acquisition.



**ACTIVITY MODE**

The next topic is how different activity modes use different data sources, filtering and smoothing. The implementation of each activity is unique to the watch manufacturer and I've chosen the "custom" activity for illustrative purposes.

The image below compares speeds from an APEX 2 Pro (red) and PACE 3 (green) against a 5 Hz Motion GPS (blue). The terrible accuracy from the watches is very clear, and entirely due to use of the "custom" activity. It is unsuitable for windsurfing / wingfoiling / kitesurfing!

![custom-actity](img/custom-activity.png)



This article will not describe all of the COROS activities (out of scope), but VERTIX 2 spikes are typically associated with windsurfing mode + standard GPS.



**IMPORTANT**

- Use the speedsurfing activity for the best possible accuracy.
  - Do NOT use the windsurfing activity which is [non-Doppler](https://medium.com/@mikeg888/the-importance-of-doppler-b886b14bb65d).
- Use the GPS cardio activity on watches such as the APEX, PACE 2 or PACE 3.
  - Do not use the “custom” activities as the data is absolutely terrible!




### Additional Tips

To ensure the crown dial and buttons do not seize up:

- Regularly clean the watch body as described by [COROS](https://support.coros.com/hc/en-us/articles/4407431266836-COROS-Watches-Maintenance-and-Cleaning-Tips).

Handy everyday tips:

- The backlight can provide some illumination in complete darkness.
- Find my phone + find my watch can be super-useful when misplaced.

Additional tips and features:

- You can control your action camera from some of the COROS watches.
  - GoPro - COROS help on [control](https://support.coros.com/hc/en-us/articles/4411031553044-How-to-control-GoPro-Cameras) + article by [GoPro](https://gopro.com/en/gb/news/open-gopro-coros).
  - Insta360 - COROS help on [control](https://support.coros.com/hc/en-us/articles/4406181409300-How-to-control-Insta360-from-your-COROS-watch) + [data overlay](https://support.coros.com/hc/en-us/articles/28945366751764-Insta360-Data-Overlay).
- Learn to save your location, just in case you lose something in the sea!
  - \- You can then return to the same spot with a mask + snorkel, or a diver.



## Next Page

[Data analysis](../analysis/README.md)

- Reviewing results, exporting activities, importing activities

