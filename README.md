aj-snapshot connection.xml     /// run this for replacing  my personal setup file your custom one after  setuping session for fluidsynth (with jack driver in "qjackctl") and midi device (midi keyboard for example)

for ARCH Linux run arch script for auto install //NOT TESTED ON FRESH INSTALL


if port for webserver is not open:

  sudo iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
  
  sudo iptables -A INPUT -p udp --dport 5000 -j ACCEPT


  # Przeładowanie konfiguracji systemd
  
systemctl --user daemon-reload

# Włączenie usługi do automatycznego uruchamiania przy starcie systemu

systemctl --user enable sf2loader.service

systemctl --user enable jack_session.service

# Uruchomienie usługi

systemctl --user start sf2loader.service

systemctl --user start jack_session.service

