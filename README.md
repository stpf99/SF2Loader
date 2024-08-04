run this for replacing  my personal setup file your custom one after  setuping session for fluidsynth (with jack driver in "qjackctl") and midi device (midi keyboard/s for example):

      aj-snapshot /opt/sf2loader/connection.xml

for ARCH Linux run arch script for auto install:

      prepareandinstall_ArchLinux_main.sh

if port for webserver is not open:

Za pomocą firewalld:

Upewnij się, że firewalld jest zainstalowany i uruchomiony:

    sudo pacman -S firewalld
    sudo systemctl enable firewalld
    sudo systemctl start firewalld

Otwórz port 5000 dla ruchu przychodzącego:

    sudo firewall-cmd --permanent --add-port=5000/tcp
    sudo firewall-cmd --permanent --add-port=5000/udp

Otwórz port 5000 dla ruchu wychodzącego:
W firewalld ruch wychodzący jest domyślnie dozwolony. Jeśli jednak masz specyficzne reguły blokujące ruch wychodzący, dodaj następujące polecenia:

    sudo firewall-cmd --permanent --zone=trusted --add-port=5000/tcp
    sudo firewall-cmd --permanent --zone=trusted --add-port=5000/udp

Zastosuj zmiany:

    sudo firewall-cmd --reload

Sprawdzenie otwartych portów

Aby sprawdzić, czy port 5000 jest otwarty i nasłuchuje, możesz użyć narzędzi takich jak netstat lub ss:

    sudo ss -tuln | grep 5000

To pokaże, czy port jest otwarty i który proces go nasłuchuje.
  
  
enable and start systemd services if needed:


      systemctl --user daemon-reload

      systemctl --user enable sf2loader.service

      systemctl --user enable jack_session.service

      systemctl --user start sf2loader.service

      systemctl --user start jack_session.service


  <img width="964" alt="screen" src="https://github.com/stpf99/SF2Loader/blob/12447302433bc8e8bfea74be4c2a7e419dd29f0e/screen.jpg">



