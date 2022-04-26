## Testing Approach

The following approach is used to quickly assess the accuracy of a GPS device by comparing it against a GPS device with known behavior; e.g. GT-31 / GW-52, GW-60 or Motion.

For the most part, comparisons of speeds across multiple devices is based solely on the Doppler-derived speeds in the FIT vs OAO / SBN / SBP.

Speeds derived from positional data have already been discounted, so GPX files should be used with extreme caution.

This approach to testing is typically used to quickly evaluate Garmin tracks from my [contacts](contacts/README.md).



### GPS Speedreader

GPS Speedreader allows multiple tracks to be overlaid in a single graph.

1. Visually inspect the overlaid speed graphs of the devices, looking for discrepancies. 

All significant observations should be documented.



### GPSResults

Comparison of results is done using GPSResults; two separate windows, side by side.

1) Visually inspect the combined non-Doppler speed graph with Doppler showing.
   This step often suggests that the Doppler-speeds really are Doppler-derived.
2) Toggle all filters on / off and look for obvious spikes in the 1s non-Doppler speeds.
   If found, confirm that non-Doppler spikes are absent from the Doppler results.
3) Toggle all on / off filters and look for obvious spikes in the 1s Doppler speeds.
   I have yet to see any significant spikes in the Doppler speeds on Garmin watches.
4) Compare the top 5 speeds in each of the following categories; 2s, 10s, 250m, 500m.
   Be sure to match up the times of the runs as they may not be in the same order.

All significant observations should be documented.
