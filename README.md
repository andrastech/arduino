Goal is to turn on an Ariston AC from obenhab2 panel using MQTT

Installed openhab2 from https://docs.openhab.org/
Installed mosquitto from https://mosquitto.org/

Hardware is arduino nano and esp8266, an IR led emitter and a RGB led.

Result:
 Android phone with (HABPanelViewer installed from market) connects to Openhab2.
 User pushes ON, COOL, HEAT or OFF button.
 Openhab2, using MQTT, sends message to ESP.
 ESP, using serial, sends message to NANO.
 NANO emits IR command, then replies to ESP, which in turn replies to Openhab2 with status.
