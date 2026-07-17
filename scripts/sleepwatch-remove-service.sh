# remove service
echo "Poster-watcher removal"
echo "----------------------"
echo
if [ "$EUID" -ne 0 ]; then
   echo "Must run with sudo. Restarting script as super user"
   echo
   sudo $0
else
   sudo systemctl stop cineboard-watcher.service
   sudo rm /etc/systemd/system/cineboard-watcher.service
   echo "cineboard-watcher.service removed"
   sudo systemctl daemon-reload
fi
