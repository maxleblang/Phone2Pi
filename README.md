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
We need to create a subscriber python script that allows the Pi to connect to the MQTT broker the app is serving up. This will allow the Pi to receieve and process data coming from your phone.
## Import Libraries
First, we need to import our MQTT library. We will import it as mqtt so that it's easier to call
```python
import paho.mqtt.client as mqtt
```
## Setup MQTT Variables
Next, we need to set up some variables to feed into our MQTT client object: clientName and serverAddress. You can make the clientName whatever you want, but make sure the **serverAddress is whatever you made the Pi's hostname!** I made my Pi's hostname pibot in the first part, so that's what I will set serverAddress to be.
```python
clientName = "P2P"
serverAdrress = "pibot"
```
Finally let's feed our variables into a client object called mqttClient.
```python
mqttClient = mqtt.Client(clientName, True, None, mqtt.MQTTv31)
```
For more documentation on paho-maqtt, and what the client object does visit [this link.](https://pypi.org/project/paho-mqtt/)
## Subscribing to Broker and Decoding data
In order to receive and process data from the app, we need to set up two calling functions: on_connect and on_message.
First, let's make our Pi subscribe to the client the app creates when it connects to internet. The app publishes data over a MQTT channel called **p2p**.
```python
mqttClient.on_connect = mqttClient.subscribe("p2p")
```
Next, we need to decode the incoming message from the app into usable data. For this, we'll create a function called messageDecoder that processes the data. Any additional data processing and usage can also be done in this function, but for now, we're just going ot have it print our message. We will attach this function to the on_message function
```python
def messageDecoder(client, userdata, msg):
  message = msg.payload.decode(encoding='UTF-8')
  print(message)

mqttClient.on_message = messageDecoder
```
## Connect to MQTT server
Now that the subscriber client is fully setup, all we need to do is connect to the server and loop forever to always receive data from the app. The common port to use on MQTT is 1883, but make sure the port you input here is the same one you input on the home screen of the app. I would reccomend not changing this though.
```python
mqttClient.connect(serverAddress,port=1883,keepalive=60)
mqttClient.loop_forever()
```
And voila! All you need to do now is connect to the Pi throught the app using the hostname you set up at the start and start sending data to the Pi! Each input on the app has a different name, and the app prefaces each piece of data sent with the input that sent it. Here's a list of the inputs on the app, and their names:
* The first slider is S1
* The second slider is S2
* Each button title is also its name (B1-B4)
* The text field is T1
