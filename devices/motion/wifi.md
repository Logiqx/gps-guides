## Motion WiFi Tips

### Background

The Motion LCD and Mini have a built-in webserver to download tracks, review speeds, etc.

Firmware 3106 (and newer) provides three basic methods via which the built-in webserver can be accessed:

1. The Motion can create its own WiFi for devices such as phones, tablets or laptops.
2. The Motion can be connected to an existing WiFi such as a home or public network.
3. The Motion can be connected to a mobile hotspot.

I'll briefly explain how these options work and then describe a workaround which may be used with problematic mobile devices.



### Method 1

Connect your computer / tablet / phone to the Motion's WiFi and access the built-in webserver using one of the following URLs:

- http://192.168.0.1/
- http://motion-xxx/ where xxx is the numerical ID of the Motion



This method works fine for all of my laptops (Windows 11) and old tablet (iPad gen 3) but not my phone (Samsung Galaxy S7).



### Method 2

Connect your Motion to an existing WiFi and access the built-in webserver using the following URL:

- http://motion-xxx/ where xxx is the numerical ID of the Motion



This method works fine for all of my laptops (Windows 11) and old tablet (iPad gen 3) but not my phone (Samsung Galaxy S7).



### Method 3

Connect your Motion to your mobile hotspot and access the built-in webserver using the following URL:

- http://motion-xxx/ where xxx is the numerical ID of the Motion



This method works fine for all of my laptops (Windows 11) and old tablet (iPad gen 3) but not my phone (Samsung Galaxy S7).



### Workaround

You may have noticed that none of the methods described above work with my phone!

However, I've discovered a workaround that allows the built-in webserver to be accessed from my mobile phone.

This is only possible with Motion firmware 3106 (and newer) which introduced connection to regular WiFi networks.



#### Step 1 - Switch on the mobile hotspot on the phone.

![img](img/01.jpg)



#### Step 2 - Connect the Motion to the hotspot by switching on the Motion and then pressing the main button 3 times.

This requires prior configuration of the Motion; i.e. SSID + password of the mobile hotspot.

![img](img/02.jpg)



#### Step 3 - Click on the connected device (e.g. motion-470) to see further details.

![img](img/03.jpg)



#### Step 4 - Make a note of the IP address which will likely begin with 192.168.

![img](img/04.jpg)



#### Step 5 - Type the Motion's IP address into the browser on your phone.

Hopefully this will now be showing the built-in website of the Motion.

![img](img/05.jpg)



#### Step 6 - At the bottom of the page you will see useful information such as battery charge.

![img](img/06.jpg)



#### Step 7 - The list of sessions can be viewed by clicking on "Logs" at the top of the page.

![img](img/07.jpg)



#### Step 8 - When clicking on a session date / time you can then download the OAO file, ready for uploading to [GPS-Speedsurfing.com](https://www.gps-speedsurfing.com/).

If you do download the track then you can upload it directly to the GP3S website from your phone.

![img](img/08.jpg)



#### Step 9 - You can also see a selection of the speed results, corresponding to the categories on [GPS Team Challenge](https://www.gpsteamchallenge.com.au/).

There are 6 categories in total; 2 seconds, 10 seconds, 500 meters, 1852 meters, alpha 500m and 1 hour:

![img](img/09.jpg)



### Wrap Up

I've not gone into any detail about how to set up the Motion itself but I think this workaround could prove useful to some people.

My mobile phone simply cannot access the built-in webserver using the standard methods but the workaround has done the trick.

The workaround identifies the IP address of the Motion (assigned by the mobile hotspot of the phone) and accessing that IP address.

Good luck...