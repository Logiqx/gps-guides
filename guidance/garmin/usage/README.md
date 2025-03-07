![GP3S Logo](../img/Garmin_logo_2006.png)



## Watch Usage

Sadly we don't live in a simple world where your GPS is either working, or not working. GPS errors vary in magnitude and the presence of a speed on the display does not mean the watch is operating correctly, or whether it is accurate.

The unfortunate downside of only considering max speeds is their susceptibility to errors. For example, during a routine test session my APEX Pro recently reported a max of [37.88](https://www.facebook.com/michael.george.545/posts/10220672656646659) knots when I was wingfoiling, instead of the actual 23 knots!

Aside from the quality of the GNSS chipset and antenna inside your watch, how you use your the watch will influence the quality + accuracy of its results. Settings have already been discussed, so this section will focus on general usage.



### Wearing the Watch

How you wear your GPS watch can significantly impact the accuracy and reliability of the data being recorded. Fortunately, you can reduce the likelihood of errors by following some simple advice.

The basic goal is to ensure that your watch has a clear view of the sky for as much of the time as possible, especially during speed runs:

- Do not stuff your GPS down your wetsuit, inside your buoyancy aid, or inside a backpack. This can result in a complete loss of data during some (or all) of the session and will very likely impact the accuracy.
- Try to wear the GPS device over your wetsuit / rash vest, or at least fold back your sleeve. The watch only has a tiny antenna and if you cover it in wet neoprene / lycra the signal can be degraded, affecting the accuracy.
- When speed sailing, wearing your watch on your back hand will ensure that it is facing upwards. Alternatively, wear it underneath your wrist on your front hand, so that it is facing upwards when sailing with an underhand grip.

These points may seem nitpicky, but they really do make a difference to the overall performance of GPS watches. Whilst evaluating various Garmin watches, we saw poor quality data as a result of watches underneath neoprene.



### Recording an Activity

#### Firmware and Settings

Simply ensure that you are using the latest firmware version that is available by opening the Garmin Connect application on your phone, opening "System" and selecting "Software Update".

Ensure you are using the correct watch settings:

- Airoha chipset
  - All Systems + Multi-Band, or All Systems
- Sony or MediaTek chipset
  - GPS + Galileo is preferable to GPS + GLONASS



#### Activity Mode

It is important to note that different activity modes implement their own unique filtering and smoothing. The implementation of each activity is unique to the watch manufacturer and this page shows the stand up paddleboarding activity of Garmin for illustrative purposes.

The image below compares speeds from a Forerunner 255 (red), vívoactive 3 (green), and vívoactive 4 (magenta) against a 5 Hz [Motion](https://www.motion-gps.com/) GPS (blue). The poor accuracy from all of the watches is very clear, and entirely due to use of the stand up paddleboarding activity with its heavy filtering / smoothing.

![activity-sup](img/activity-sup.png)

Contrast this to a mode without any significant filtering / smoothing of arm movements on the same watches. Aside from a small delay the Garmin watches are much closer to the Motion GPS (blue), especially the Forerunner 255 (red).

![activity-sup](img/activity-wsurf.png)



Practically every single Garmin activity profile has been tested on multiple watches, but in the interests of brevity:

- Suitable activity profiles:
  - Windsurfing
  - Kiteboarding
  - Other
- Unsuitable activity profiles:
  - Stand Up Paddleboarding
  - Surfing
  - Sailing
  - Boating
  - ... and running, hiking, walking, etc.

One of the benefits of using an app such as [APPro](https://apps.garmin.com/apps/9567700b-6587-44be-9708-879bfc844791) is that it will automatically select a suitable activity mode, and appropriate GNSS setting(s).



### Additional Tips

To ensure the watch buttons do not seize up:

- Occasionally rinse / soak the watch in fresh water.

Handy everyday tips:

- Tide information is available on some watches - e.g. [fēnix 7](https://www8.garmin.com/manuals/webhelp/GUID-C001C335-A8EC-4A41-AB0E-BAC434259F92/EN-US/GUID-B46ED9C3-8DED-41B5-B0C5-1707D9A56522.html), [epix (gen 2)](https://www8.garmin.com/manuals/webhelp/GUID-E5C62F3F-DCE3-4197-8CA5-E419B2A55D12/EN-US/GUID-B46ED9C3-8DED-41B5-B0C5-1707D9A56522.html), and [Instinct 3](https://www8.garmin.com/manuals/webhelp/GUID-2DA54DF8-8084-40ED-954F-EDA09C13B47F/EN-US/GUID-3DB3FF64-F943-4D96-8334-C9C7764FE85E.html).
- The flashlight that is built into the more rugged watches is extremely handy!
- [Find my phone](https://support.garmin.com/en-GB/?faq=mE1Jmwvzd84s9YuDqa3GB7) + [find my device](https://support.garmin.com/en-GB/?faq=L7pODPT7jN3oMXe1xg1Ks8) can be super-useful when they are misplaced.

Additional tips:

- Ignore "max speed" which is prone to measurement errors / noise.
  - Instead, use max 2 secs to gauge your top speed, but take it with a pinch of salt.
  - You can always use the max 10s / 100m / 250m as a simple sanity check.
- Learn to save your location by pressing the light button to open the controls menu.
  - This could be useful if you lose something at sea, perhaps if your foil breaks!
  - You can then return to the same spot with a mask + snorkel, or a diver.
- Consider adding a [hot key](https://support.garmin.com/en-GB/?faq=jbZhv8loj14TUvcW4l2Le9) to quickly enable / disable the touch screen.
  - For example, START (top-right) + DOWN (bottom-left) to toggle the touch screen.





## Next Page

[Data analysis](../analysis/README.md)

- Reviewing results, exporting activities, importing activities

