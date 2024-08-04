

for ARCH Linux run arch script for auto install:

      prepareandinstall_ArchLinux_main.sh

if port for webserver is not open:

      sudo iptables -A OUTPUT -p tcp --dport 5000 -j ACCEPT
      sudo iptables -A OUTPUT -p udp --dport 5000 -j ACCEPT
      sudo iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
      sudo iptables -A INPUT -p udp --dport 5000 -j ACCEPT

      sudo iptables-save | sudo tee /etc/iptables/iptables.rules

      systemctl restart iptables


run this for replacing  my personal setup file your custom one after  setuping session for fluidsynth (with jack driver in "qjackctl") and midi device (midi keyboard/s for example):

      aj-snapshot /opt/sf2loader/connection.xml      
  
enable and start systemd services if needed:


      systemctl --user daemon-reload

      systemctl --user enable sf2loader.service

      systemctl --user enable jack_session.service

      >> systemctl --user restart sf2loader.service <<

      systemctl --user restart jack_session.service 


  <img width="399" alt="screen" src="https://github.com/stpf99/SF2Loader/blob/12447302433bc8e8bfea74be4c2a7e419dd29f0e/screen.jpg">



