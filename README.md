aj-snapshot connection.xml     /// run this for replacing  my personal setup file your custom once after  setuping session for fluidsynth (with jack driver in "qjackctl") and midi device (midi keyboard for example)

for ARCH Linux rum arch script for auto install //NOT TESTED ON FRESH INSTALL


if port for webserver is not open:

  sudo iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
  
  sudo iptables -A INPUT -p udp --dport 5000 -j ACCEPT

