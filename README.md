# Phone2Pi
App to send data from iPhone to Raspberry Pi using an MQTT broker.
# Raspberry Pi Setup
## Setting a Hostname
Because this MQTT broker is served over wifi, we need a way to access the pi. An IP will work temporarily, but it may change without us knowing, which would cause problems. Instead, lets set up a static hostname for the Raspberry pi.
First, lets get to the Pi's configuration menu with this command:
```
sudo raspi-config
```
Next, go to system options, and then finally down to hostname. This will allow you to input a custom hostname for the raspberry pi that we will use to connect to it through the app. REMEBER YOUR HOSTNAME!
## Installing Libraries
We will be utilizing the Mosquitto and paho-mqtt libraries for the broker on the Pi's side.
First let's make sure the Pi is up to date.
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
```
Next let's install the Mosquitto client. This will allow is to run MQTT commands right from the terminal for testing.
```
sudo apt-get install mosquitto mosquitto-clients
```
Let's make sure mosquitto is up and running, and allow it to run in the background when Pi is booted.
```
systemctl is-active mosquitto
sudo systemctl enable mosquitto.service
```
Finally, let's install the paho-mqtt library. This will allow is to make the Pi a subscriber the the MQTT channel the app serves up.
```
sudo apt-get install python3-pip
sudo pip3 install paho-mqtt
```
# MQTT Subscriber Script
