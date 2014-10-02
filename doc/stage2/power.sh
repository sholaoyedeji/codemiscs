#! /usr/bin/env bash

while acpi | grep -q "Discharging"
do
	while acpi | grep -q "Discharging"
	do
		tonize sharp
		festival --tts <<< "Juan Manuel: Battery Discharging!"
		sleep 1
		acpi
	done

	tonize beep
	festival --tts <<< "Computer Powered Now, Juan Manuel! Thanks!"
done

# Juan Manuel Borges Caño, 2014-09-15 (Monday 15 September 2014)
