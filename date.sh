#!/bin/bash

# Initial epoch (pass as argument or default to current time)
epoch=${1:-$(date +%s)}

# Get timezone and other static components once
tz=$(date -r "$epoch" +"%Z")
weekday=$(date -r "$epoch" +"%a")
month=$(date -r "$epoch" +"%b")
year=$(date -r "$epoch" +"%Y")

# Loop forever
while true; do
    # Format day, hour, minute, second using the epoch
    day=$(date -r "$epoch" +"%-d")
    hrs=$(date -r "$epoch" +"%H")
    mins=$(date -r "$epoch" +"%M")
    secs=$(date -r "$epoch" +"%S")

    # Build datetime variable using previously fetched static values
    datetime="$weekday $month-$day $hrs:$mins:$secs $tz $year"

    # Display the datetime

    # Save to date.txt
    echo "$datetime" > date.txt

    # Increment epoch by 1 second
    epoch=$((epoch + 1))

    # Wait 1 second
    sleep 1
done
