#!/bin/bash

# Tworzenie katalogu na pliki usługi
sudo mkdir -p /opt/sf2loader
sudo chown -R $(whoami):$(whoami) /opt/sf2loader
sudo chmod -R u+rw /opt/sf2loader

# Kopiowanie plików do katalogu /opt/sf2loader
sudo cp -r SF2_loader.py web_server.py jack_session.sh connection.xml templates/ sf2/ /opt/sf2loader/

# Nadawanie uprawnień do wykonywania skryptu jack_session.sh
sudo chmod +x /opt/sf2loader/jack_session.sh
sudo chmod +x /opt/sf2loader/web_server.py
# Kopiowanie pliku jednostki systemd do katalogu systemowego
mkdir -p ~/.config/systemd/user
cp *.service ~/.config/systemd/user/

# Przeładowanie konfiguracji systemd
systemctl --user daemon-reload
ln -s /usr/share/soundfonts/*.sf2 /opt/sf2loader/sf2/
# Włączenie usługi do automatycznego uruchamiania przy starcie systemu
systemctl --user enable sf2loader.service
systemctl --user enable jack_session.service
# Uruchomienie usługi
systemctl --user start sf2loader.service
systemctl --user start jack_session.service

